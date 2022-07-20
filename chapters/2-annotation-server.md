# Annotation Server

The Annotation Server is PharMe's data providing backend. The data it provides
consists of two main groups of information:

1. Drugs -- users should be able to search for and find any drug
   they want to consult PharMe about; regardless of whether there actually are
   any \glsa{pgx} findings for this drug.
2. \Glspl{guideline} - for drugs that do have \glsa{pgx} findings, users should
   be presented with
     a) simplified information that is comprehensible for them and
     b) more detailed and complete information they can show to their doctor.

\noindent To provide information on drugs (1.), we use a database called
\gls{drugbank}, which is one of the world's most used resources for drug
information [@wishart_drugbank_2018]. Using their academic license, we can
download an XML file from \gls{drugbank} that contains all the information we
use from them. Additionally, \glsa{pgx} experts annotate drugs that have
\gls{pgx} relevance with descriptive texts that are comprehensible for patients.

\Gls{guideline} information (2.) is first fetched from the public \gls{api} of
the \glsa{cpic} (\gls{cpic}). \gls{cpic} provides "peer-reviewed, updated,
evidence-based, freely accessible \glspl{guideline} for drug/gene-pairs"
[@relling_cpic_2011] targeted at professionals in the field. This data is used
in the case of 2.b) and directed at doctors. For 2.a), we again rely on the
\glsa{pgx} experts working with us to annotate \gls{cpic} \glspl{guideline} with
patient-friendly wording.

All the data the Annotation Server is able to provide in its current
implementation is English.

## Technical overview

The Annotation Server is a web application built with NestJS, "a framework for
building efficient, scalable [...] server-side applications" with support for
TypeScript [@kamil_mysliwiec_nestjs_nodate], the programming language the
majority of PharMe's backend is built with. For storage of data, the Annotation
Server relies on PostgreSQL, "the world's most advanced open source relational
database" [@the_postgresql_global_development_group_postgresql_2022] and TypeORM
[@typeorm_typeorm_nodate] to interact with PostgreSQL from the NestJS
application.

The Annotation Server provides POST endpoints that trigger loading the data it
uses from \gls{cpic} and \gls{drugbank}. Before loading is initialized, all
previously existing data is deleted from its database.

There are three main modules to the Annotation Server: `medications`,
`phenotypes` and `guidelines`. Figure \ref{er-diagram} shows a simplified
ER-Diagram of the database structure corresponding with these modules.

![Simplified ER-diagram of Annotation Server
database\label{er-diagram}](images/as-database.pdf)

The `medications` module is responsible for all data regarding drugs. It stores
this data by maintaining a drug table in the Annotation Server's database. This
table is initialized by loading and saving all relevant data from the
\gls{drugbank} XML file. This data consists of drug names, descriptions,
synonyms and \glspl{rxcui}, which are unique identifiers given by the National
Library of Medicine's standardized drug nomenclature RxNorm [@liu_rxnorm_2005]
Once the drug table is initialized, the Annotation Server provides GET endpoints
to retrieve information for one or multiple drugs along with the option of
applying filters.

The `phenotypes` module maintains all the phenotypes \gls{cpic} offers
guidelines for in its phenotype table. These phenotypes are defined by a gene
symbol such as *CYP2D6* and the effect variants with this phenotype have on the
gene, i.e. a gene result such as *Normal metabolizer*. Aside from these
identifying properties, some additional data \gls{cpic} provides about
phenotypes is also stored. The `phenotypes` module exposes no dedicated
endpoints as it is only used in relation to the `guidelines` module. The loading
of phenotype data from \gls{cpic}'s \gls{api} is invoked by the `guidelines`
module when it initializes its own data.

The `guidelines` module keeps \glspl{guideline} in relation to phenotypes and
drugs in its guidelines table. This data is initialized by loading all of
\gls{cpic}'s guidelines from its \gls{api}. The relations to corresponding drugs
are created based on the \gls{rxcui} \gls{cpic} provides with their guidelines.
Since inconsistencies in assigned \glspl{rxcui} between \gls{cpic} and
\gls{drugbank} may occur, or drugs referenced by \gls{cpic} may be missing from
\gls{drugbank}, these errors are tracked in a separate `GuidelineError` table to
be resolved by the maintainer. The `guidelines` module provides GET endpoints to
retrieve guidelines and is connected to the `medications` module to allow
fetching guidelines along with the drugs they describe.

Both the `medications` and `guidelines` modules expose PATCH endpoints to
annotate the additional patient-oriented data provided by the \glsa{pgx}
experts. These \glspl{annotation} consist of

- a drug class and an \gls{indication} for drugs and
- an \gls{implication}, explaining the effect a phenotype has on an individual's
  response to a drug, a \gls{recommendation}, giving a suggestion based on the
  \gls{implication}'s consequences, and a \gls{warnl}, expressing the severity
  of the \gls{recommendation} as one of three tiers, for \glspl{guideline}.

\noindent In the Annotation Server's current implementation, the \glsa{pgx}
experts provide this data through a shared online Google Sheet. On request, the
Annotation Server automatically downloads and processes this Google Sheet to
annotate all data that matches the existing external data. Here, matching data
is determined by the drug names, gene symbols and gene results the \glsa{pgx}
experts manually write into the Google Sheet being equal to the analogous data
from \gls{cpic} and \gls{drugbank} stored on the Annotation Server. Errors
resulting from mismatches are, again, stored as `GuidelineError`s.

## Data administration process and shortcomings \label{as-eval}

The implementation of the Annotation Server relies on two parties to
initialize its data and keep it up-to-date:

- **A curating party** with sufficient \gls{pgx} expertise to curate
  patient-oriented \glspl{annotation} from data they manually research from
  sources such as \gls{cpic}. This party manually writes their
  \glspl{annotation} into the Google Sheet, initially without any feedback
  regarding if and how well they match the Annotation Server's existing data
  from external sources.
- **A maintaining party** with sufficient technical knowledge to invoke the
  requests to fetch data from external sources and the Google
  Sheet. This party also oversees the before mentioned `GuidelineErrors` and
  acts accordingly, which usually results in notifying the curating party to
  make necessary adjustments.

\noindent This separation leads to some difficulties in operating the Annotation
Server and creates an overhead of communication between the two parties.

Users experience a downtime of the service during the process of updating data.
Therefore, updating of data should occur only when new \gls{cpic} or
\gls{drugbank} data is available or when the curating party has modified the
Google Sheet. Triggering the process is therefore always initiated by the
curating party, who however can't trigger it themselves and have to notify the
maintaining party to do it.

The Google Sheet is a one-way interface to the Annotation Server, yet it is the
curating party's only interface other than communication with the maintaining
party. Since the Sheet is set up completely manually, it is subject to human
error, such as misspelling of a drug's name, which leads to a mismatch with the
Annotation Server's existing data upon import. These human errors of the
curating party have to then be detected by the maintaining party, who have to
notify the curating party to resolve them, only for the maintaining party to
trigger a reload that, again, leads to downtime users will experience. This
communication-heavy process needs to be repeated until all errors are resolved.

During our development phase, we were working as the maintaining party whilst
the curating party was formed by \gls{pgx} expert Dr. Aniwaa Owusu Obeng, who
tasked two of her students with curating \glspl{annotation} for roughly 100
drug-gene pairs and oversaw the process herself. According to Dr. Owusu Obeng,
her students spent two days curating these \glspl{annotation} which equated to
around 25 to 30 hours of work for the initial curation process, without
accounting for the subsequent feedback loop. A significant part of the time
spent during this process was to research data from \gls{cpic} -- the same data
the Annotation Server had already stored and that the manually curated data
later had to match with again.

PharMe is desired to support additional languages besides English, e.g. German
for testing conducted by HPI in Germany and Spanish for testing by the Icahn
  School of Medicine at Mount Sinai in New York, where it is also necessary to
  target the Hispanic population. To extend PharMe to support multiple languages
  in the future, the discussed process would most likely need to be repeated
  with multiple curating parties and multiple Google Sheets, which would further
  increase complexity of the process of data administration.

# Annotation Server

As the data providing backend, the Annotation Server is one of PharMe's core
components. With how we have conceptualized PharMe's patient-oriented frontend,
the smartphone application, the Annotation Server needs to provide two main
groups of information:

1. Drugs - users should be able to search for and find any drug
   they want to consult PharMe about; independent of whether there actually are
   any \glsa{pgx} findings for this drug.
2. \Glspl{guideline} - for drugs that do have \glsa{pgx} findings, users should
   be presented with
     a) simplified information that is comprehensible for them and
     b) more detailed and complete information they can show to their doctor.

\noindent To provide information on drugs (1.), we use the academic license to a
database called \gls{drugbank}. \gls{drugbank} is one of the world's most used
resources for drug information [@wishart_drugbank_2018]. \gls{drugbank} has
provided us with a large XML file that contains all the information we use from
them, namely drugs' names, descriptions, synonyms and their \glspl{rxcui}:
unique identifiers given by the National Library of Medicine's standardized drug
nomenclature RxNorm [@liu_rxnorm_2005]. Additionally, the \glsa{pgx} experts
working with us annotate drugs that have \gls{pgx} relevance with descriptive
texts made to be easily comprehensible for patients.

\Gls{guideline} information (2.) is first fetched from the public \gls{api} of
the \glsa{cpic} (\gls{cpic}). \gls{cpic} provides "peer-reviewed, updated,
evidence-based, freely accessible \glspl{guideline} for drug/gene-pairs"
[@relling_cpic_2011] targeted at professionals in the field. This data is used
in the case of 2.b) and directed at doctors. For 2.a), we again rely on the
\glsa{pgx} experts working with us to annotate \gls{cpic}'s \glspl{guideline}
with patient-friendly wording.

## Technical overview

The Annotation Server is a web application made with the framework NestJS, which
is widely known for its efficiency, scalability and full support of TypeScript
[@kamil_mysliwiec_nestjs_2022] - the programming language the majority of
PharMe's backend is built with. For storage of data, the Annotation Server
relies on the reliable and performant relational database PostgreSQL
[@the_postgresql_global_development_group_postgresql_2022] and the object
relational mapping TypeORM to integrate PostgreSQL into the NestJS application.

There are three main modules to the Annotation Server: `medications`,
`phenotypes` and `guidelines`.

The `medications` module is responsible for all data regarding drugs. It stores
this data by maintaining a drug repository in the Annotation Server's database.
This repository is initialized by loading and saving all relevant data from
\gls{drugbank}'s XML file upon invocation of a POST endpoint the module
provides. To simplify processing this large XML file's data, it is first
transformed JSON format with the help of a Python script. The JSON format makes
it easier for the TypeScript-based web application to process the data. Once the
drug repository is initialized, the Annotation Server provides GET endpoints to
retrieve information for one or multiple drugs along with the option of applying
filters.

The `phenotypes` module maintains all the phenotypes \gls{cpic} offers
guidelines for in its phenotype repository. These phenotypes are defined by a
gene symbol such as *CYP2D6* and the effect variants with this phenotype have
on the gene, i.e. a gene result such as *Normal metabolizer*. Aside from these
identifying properties, some additional data \gls{cpic} provides about
phenotypes is also stored. The `phenotypes` module exposes no dedicated
endpoints as it is only used in relation to the `guidelines` module. The loading
of the phenotype repository's data from \gls{cpic}'s \gls{api} is invoked by the
`guidelines` module when it initializes its own data.

The `guidelines` module keeps \glspl{guideline} in relation to phenotypes and
drugs in its guidelines repository. This repository's data is initialized by
invoking the POST endpoint the module provides, which triggers loading all of
\gls{cpic}'s guidelines from its \gls{api}. Since inconsistencies between
\gls{cpic} and \gls{drugbank} may occur, matching errors are tracked in a
separate `GuidelineError` repository to be resolved by the maintainer. The
`guidelines` module provides GET endpoints to retrieve guidelines and is
connected to the `medications` module to allow fetching guidelines along with
the drugs they describe.

![Simplified ER-diagram of Annotation Server
database\label{er-diagram}](images/as-database.pdf)

Both the `medications` and `guidelines` modules expose PATCH endpoints to
annotate additional data provided by the \glsa{pgx} experts working with us.
These \glspl{annotation} are made to be easily comprehensible for patients, i.e.
people without professional medical education, and consist of

- a drug class and an \gls{indication} for drugs and
- an \gls{implication}, explaining the effect a phenotype has on an individual's
  response to a drug, a \gls{recommendation}, giving a suggestion based on the
  \gls{implication}'s consequences, and a \gls{warnl}, expressing the severity
  of the \gls{recommendation} as one of three tiers, for \glspl{guideline}.

\noindent With how the Annotation Server has been set up by us within the
context of our team-based project, the \glsa{pgx} experts provide this data
through a shared online Google Sheet. On request, the Annotation Server
automatically downloads and processes this Google Sheet to annotate all data
that matches the existing external data.

See figure \ref{er-diagram} for a simplified overview of the Annotation Server's
database and its sources.

## Evaluation & Discussion \label{as-eval}

The illustrated implementation of the Annotation Server relies on two parties to
initialize its data and keep it up-to-date:

- **A curating party** with sufficient \gls{pgx} expertise to curate
  patient-oriented \glspl{annotation} from data they manually research from
  sources such as \gls{cpic}. This party manually writes their
  \glspl{annotation} into the Google Sheet, initially without any feedback of if
  and how well they match the Annotation Server's existing external data.
- **A maintaining party** with sufficient technical knowledge to invoke the
  requests that trigger fetching data from external sources and the Google
  Sheet. This party also oversees the before mentioned `GuidelineErrors` and
  acts accordingly, which usually results in notifying the curating party to
  make necessary adjustments.

\noindent This separation leads to some difficulties in the Annotation Server's
operation and creates an overhead of communication between the two parties.

Initial loading or reloading (updating) of data should occur when and only when
new \gls{cpic} or \gls{drugbank} data is available or when the curating party
has modified the Google Sheet, since there is a downtime users will experience
during this process. Triggering the process is therefore always initiated by the
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
spent during this process was to research of data from \gls{cpic} - the same
data the Annotation Server already had stored and that later had to match the
manually curated data with again.

Should PharMe be extended to support multiple languages in the future, this
process would most likely need to be repeated with multiple curating parties.

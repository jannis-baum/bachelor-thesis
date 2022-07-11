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

\noindent To provide information on drugs (1.), we use the academic license of a
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
[@noauthor_nestjs_2022] - the programming language the majority of PharMe's
backend is built with. For storage of data, the Annotation Server relies on the
reliable and perfomant relational database PostgreSQL
[@noauthor_postgresql_2022] and the object relational mapping TypeORM to
integrate PostgreSQL into the NestJS application.

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
retrieve information for one or multiple drugs along with functionality to apply
specified filters.

The `phenotypes` module maintains all the phenotypes \gls{cpic} offers
guidelines for in its phenotype repository. These phenotypes are defined by a
*gene symbol* such as `CYP2D6` and the effect variants with this phenotype have
on the gene, i.e. a *gene result* such as `Normal metabolizer`. Aside from these
identifying properties, some additional data \gls{cpic} provides about
phenotypes is also stored. The `phenotypes` module exposes no dedicated
endpoints as it is only used in relation to the `guidelines` module. The initial
loading of the phenotype repository's data from \gls{cpic}'s \gls{api} is
invoked by the `guidelines` module when it initializes its own data.

The `guidelines` module keeps \glspl{guideline} in relation to phenotypes and
drugs in its guidelines repository. This repository's data is initialized by
invoking a POST endpoint the module provides which triggers loading all of
\gls{cpic}'s guidelines from its \gls{api}. Since inconsistencies between
\gls{cpic} and \gls{drugbank} may occur, matching errors are tracked in a
separate error repository to be resolved by the maintainer. The `guidelines`
module provides GET endpoints to retrieve guidelines and is connected to the
`medications` module to allow fetching drugs along with their respective
guidelines.

Both the `medications` and `guidelines` modules expose PATCH endpoints to
annotate additional data provided by the \glsa{pgx} experts working with us.
These annotations are made to be easily comprehensible for patients, i.e. people
without professional medical education, and consist of

- a drug class and an \gls{indication} for drugs and
- an \gls{implication}, explaining the effect a phenotype has on an individual's
  response to a drug, as well as a \gls{recommendation}, giving a suggestion
  based on the \gls{implication}'s consequences for \glspl{guideline}.

\noindent With how the Annotation Server has been set up by us within the
context of our team-based project, the \glsa{pgx} experts provide this data
through a shared online Google Sheet. On request, the Annotation Server
automatically downloads and processes this Google Sheet to annotate all data
that matches the existing external data.

## Remaining issues

- Curation of guidelines is high effort (e.g. $2 ~\textrm{people} \cdot 2
  ~\textrm{days} / 100 ~\textrm{drug-gene pairs}$)
- Matching manually curated data with API data from CPIC and \gls{drugbank} is
  difficult
  - doesn't always work, errors that can't be fixed automatically do occur
- There is a need for humans to supervise this process more than simply
  supplying guidelines through a one-way interface (e.g. a Google Sheet)
- The manual work of curating guidelines has lots of room to be made more
  efficient
- Desire for automation is strong from the pharmacists' / curators' side
  ($\to$ consultation with Aniwaa)

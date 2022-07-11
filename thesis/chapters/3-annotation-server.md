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
working with us annotate drugs that have \glsa{pgx} relevance with a short and
concise drug class and \gls{indication} made to be easily comprehensible for
patients.

\Gls{guideline} information (2.) is first fetched from the public \gls{api} of
the \glsa{cpic} (\gls{cpic}). \gls{cpic} provides "peer-reviewed, updated,
evidence-based, freely accessible \glspl{guideline} for drug/gene-pairs"
[@relling_cpic_2011] targeted at professionals in the field. This data is used
in the case of 2.b) and directed at doctors. For 2.a), we again rely on the
\glsa{pgx} experts working with us to annotate \gls{cpic}'s \glspl{guideline}
with patient-friendly wording.

## Technical overview

- Tech stack
- Rough architecture
  - Introduce different sub-modules and their roles
  - Flow to build our database

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

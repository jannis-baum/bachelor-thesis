# Annotation Server

As the data providing backend, the Annotation Server is one of PharMe's core
components. With how we have conceptualized PharMe's patient-oriented frontend,
<!-- Why is it important that it is a core component? Rather state the main
functionality in the main sentence :) -->
<!-- Instead of saying “with how we concetzualized…” you can just say that it
provides data; more on point and less confusing :) -->
the smartphone application, the Annotation Server needs to provide two main
groups of information:

1. Drugs - users should be able to search for and find any drug
<!-- Would rather use en-dash again -->
   they want to consult PharMe about; independent of whether there actually are
<!-- Not sure whether "independent" has the correct connotation or should be used
as "independently"; to circumvent this, maybe use "regardless" -->
   any \glsa{pgx} findings for this drug.
2. \Glspl{guideline} - for drugs that do have \glsa{pgx} findings, users should
   be presented with
     a) simplified information that is comprehensible for them and
     b) more detailed and complete information they can show to their doctor.

\noindent To provide information on drugs (1.), we use the academic license to a
<!-- Would state the academic license detail later -->
database called \gls{drugbank}. \gls{drugbank} is one of the world's most used
resources for drug information [@wishart_drugbank_2018]. \gls{drugbank} has
<!-- Here I would state that with an academic license DrugBank provides... (not 
provided us, as they do this in general) -->
provided us with a large XML file that contains all the information we use from
<!-- Is it already important that the file is large? Would state this below when
you deescribe how you handle it (and quantify how large) -->
them, namely drugs' names, descriptions, synonyms and their \glspl{rxcui}:
<!-- "drug" also works instead of "drugs'" ;) -->
<!-- Would not use a colon here, rather continue the sentence with "..., which are
..." (currently I am getting the impression after the colon you talking about all
information from the XML) -->
<!-- Actually, you can leave out most information here; I would rather state the
details below when you explain the modules and the content -->
unique identifiers given by the National Library of Medicine's standardized drug
nomenclature RxNorm [@liu_rxnorm_2005]. Additionally, the \glsa{pgx} experts
working with us annotate drugs that have \gls{pgx} relevance with descriptive
texts made to be easily comprehensible for patients.
<!-- Same as before, would paraphrase the "working with us"; also this whole
sentence is a bit difficult to understand, maybe restructuring would help (e.g., it
was not directly clear to me what "made to be easy" refers to) -->


\Gls{guideline} information (2.) is first fetched from the public \gls{api} of
the \glsa{cpic} (\gls{cpic}). \gls{cpic} provides "peer-reviewed, updated,
evidence-based, freely accessible \glspl{guideline} for drug/gene-pairs"
[@relling_cpic_2011] targeted at professionals in the field. This data is used
in the case of 2.b) and directed at doctors. For 2.a), we again rely on the
\glsa{pgx} experts working with us to annotate \gls{cpic}'s \glspl{guideline}
<!-- Just CPIC (instead of genitive)? -->
with patient-friendly wording.
<!-- Would re-structure this paragraph a bit to first state what you fetch, then
shortly why you need to transform and what needs to be transformed -->

## Technical overview

The Annotation Server is a web application made with the framework NestJS, which
<!-- built with? -->
is widely known for its efficiency, scalability and full support of TypeScript
<!-- Is it widely known? Would rather cite directly from their documentation or
website :) -->
[@kamil_mysliwiec_nestjs_2022] - the programming language the majority of
PharMe's backend is built with. For storage of data, the Annotation Server
relies on the reliable and performant relational database PostgreSQL
<!-- Similar to before; would rather cite directly from their documentation or
website -->
[@the_postgresql_global_development_group_postgresql_2022] and the object
<!-- This reference is not formatted correctly; for institutions as authors, set
curly braces around the name to make sure it is not treated as first and lastname -->
relational mapping TypeORM to integrate PostgreSQL into the NestJS application.
<!-- Is TypeORM a NestJS or PostgreSQL tool? Otherwise, please give a source and also
non-technically shortly explain ORM -->

There are three main modules to the Annotation Server: `medications`,
`phenotypes` and `guidelines`.
<!-- I like your use of code formatting! :) -->
<!-- I would reference and include your figure here already and explain the 
attributes and relations between the modules in the regarding text beleow -->

The `medications` module is responsible for all data regarding drugs. It stores
this data by maintaining a drug repository in the Annotation Server's database.
This repository is initialized by loading and saving all relevant data from
<!-- Why repository and not table? -->
\gls{drugbank}'s XML file upon invocation of a POST endpoint the module
<!-- Would not use genitive here, rather “the DrugBank XML” – I would give this
recommendation in general, so I will not highlight it every time from now on ;) -->
<!-- Would put the information about the POST trigger before the loading; would it
make sense to have the API documentation in the Appendix? -->
<!-- Also, did you state before that the Annotation Server provides a REST API?
This should be stated with the technology you use -->
provides. To simplify processing this large XML file's data, it is first
<!-- Here, I would state the problem first (from reading Benjamin's thesis I think
it is related to Node.JS not being able to handle large XML?) and state how large
the file is, e.g., in GB -->
<!-- Also, I do not think you need the "file's" genitive here ;) -->
transformed JSON format with the help of a Python script. The JSON format makes
it easier for the TypeScript-based web application to process the data. Once the
<!-- The "makes it easier" part would be clear implicitly when you state the problem
before -->
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
<!-- Would place this after explaining guidelines -->

The `guidelines` module keeps \glspl{guideline} in relation to phenotypes and
drugs in its guidelines repository. This repository's data is initialized by
invoking the POST endpoint the module provides, which triggers loading all of
\gls{cpic}'s guidelines from its \gls{api}. Since inconsistencies between
\gls{cpic} and \gls{drugbank} may occur, matching errors are tracked in a
separate `GuidelineError` repository to be resolved by the maintainer. The
<!-- Why are guideline errors not included in the figure? Aren't these quite
important for your work? What are matching errors? Below it rather seems these
are errors between external and curated content? Maybe have an own paragraph for
these errors? -->
`guidelines` module provides GET endpoints to retrieve guidelines and is
connected to the `medications` module to allow fetching guidelines along with
<!-- Connected by what? Maybe also clarifies matching errors -->
the drugs they describe.
<!-- Are medicaitons and guidelines initialized separately? Does one need to be
initialized first? -->

![Simplified ER-diagram of Annotation Server
database\label{er-diagram}](images/as-database.pdf)
<!-- Always reference display items in text before showing them -->

Both the `medications` and `guidelines` modules expose PATCH endpoints to
annotate additional data provided by the \glsa{pgx} experts working with us.
<!-- Would again (and probably alsways) leave out the "working with us" ;) -->
<!-- Also, I would explain this directly in the beginning (where I commented that
I would put the picture there); the details, which parts are annotated, I would
explain in the regardin module text -->
These \glspl{annotation} are made to be easily comprehensible for patients, i.e.
people without professional medical education, and consist of
<!-- That they are "made to be comprehensible..." was stated before, you do not
need to put it here (also, I do not really like this formulation because you could
leave it out and just say "are")  -->

- a drug class and an \gls{indication} for drugs and
<!-- drug class vs drugclass (figure) -->
- an \gls{implication}, explaining the effect a phenotype has on an individual's
  response to a drug, a \gls{recommendation}, giving a suggestion based on the
  \gls{implication}'s consequences, and a \gls{warnl}, expressing the severity
  of the \gls{recommendation} as one of three tiers, for \glspl{guideline}.

\noindent With how the Annotation Server has been set up by us within the
<!-- I don't really like the "with how" formulation, it is really difficult to
understand  what this refers to -->
<!-- You can just say that in the current implementation the curated information
is provided by PGx experst via a shared Google Sheet? -->
<!-- One note regarding "current implementation" – please add a tag to the repo
and reference the repo somewhere where you see fit in the text; the tag describes
the code version at time of writing :) -->
context of our team-based project, the \glsa{pgx} experts provide this data
through a shared online Google Sheet. On request, the Annotation Server
automatically downloads and processes this Google Sheet to annotate all data
that matches the existing external data.
<!-- Matches based on what? -->

See figure \ref{er-diagram} for a simplified overview of the Annotation Server's
database and its sources.
<!-- Would place this where you list the models -->

## Evaluation and discussion \label{as-eval}
<!-- This is not really an evaluation and discussion; it gives a lot of information
about the curation process itself, I would maybe separate this in a separate chapter
and then summmarize the problems in a chapter called something like "Shortcomings" -->

The implementation of the Annotation Server relies on two parties to
initialize its data and keep it up-to-date:

- **A curating party** with sufficient \gls{pgx} expertise to curate
  patient-oriented \glspl{annotation} from data they manually research from
  sources such as \gls{cpic}. This party manually writes their
  \glspl{annotation} into the Google Sheet, initially without any feedback of if
  and how well they match the Annotation Server's existing external data.
  <!-- "of if and how" > "regarding if and how" -->
  <!-- External data from where? Maybe rather write data based on external sources? -->
- **A maintaining party** with sufficient technical knowledge to invoke the
  requests that trigger fetching data from external sources and the Google
  <!-- "that trigger fetching" > "to fetch" -->
  Sheet. This party also oversees the before mentioned `GuidelineErrors` and
  acts accordingly, which usually results in notifying the curating party to
  make necessary adjustments.

\noindent This separation leads to some difficulties in the Annotation Server's
operation and creates an overhead of communication between the two parties.
<!-- Another example to reformulate genitives: "in operating the Annotaion Server
and ..." -->

Initial loading or reloading (updating) of data should occur when and only when
<!-- Use reloadig or updating but stick with one term -->
<!-- "when and only when" > "only when" -->
new \gls{cpic} or \gls{drugbank} data is available or when the curating party
has modified the Google Sheet, since there is a downtime users will experience
<!-- Would put the "downtime" in front of the sentence and continue with something
like "therefore, updating of data..." (initial loading is not really relevant here,
is it?) -->
during this process. Triggering the process is therefore always initiated by the
curating party, who however can't trigger it themselves and have to notify the
maintaining party to do it.
<!-- The curating party does not know about changes in the databases, does it? -->

The Google Sheet is a one-way interface to the Annotation Server, yet it is the
curating party's only interface other than communication with the maintaining
party. Since the Sheet is set up completely manually, it is subject to human
<!-- Is the first sentence important? -->
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
<!-- en-dash instead of dash, please :) (in general) -->
data the Annotation Server already had stored and that later had to match the
manually curated data with again.

Should PharMe be extended to support multiple languages in the future, this
process would most likely need to be repeated with multiple curating parties.
<!-- This comes out of nowhere; would maybe introduce in the implementation
description that you only implemented English so far; in the shortcomings you
could add that more languages would be good (e.g., we are German, Spanish for
Hispanic population, etc.) -->

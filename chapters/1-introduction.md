# Introduction

Pharmacogenetics and \glspl{pgx} (\glsa{pgx}), the studies of how individuals
respond to drugs based on their personal genetics, have been an ongoing research
topic since the 1950s [@scott_personalizing_2011]. With significant advances in
genotyping and genome sequencing technologies, findings in the field of
\glsa{pgx} have been rapidly increasing in both numbers as well as evidence,
most notably over the last 20 years. Yet, despite the prevalence of applicable
\glsa{pgx} related research that could help prevent severe adverse drug
reactions, adoption in real-world treatment of patients has been slow
[@scott_personalizing_2011].

With the goal of accelerating the adoption of \glsa{pgx} into treatment of
patients, we have worked on the service and research project *PharMe* in a team
of eight students from Hasso Plattner Institute at Prof. Böttinger's chair
Digital Health - Personalized Medicine. The implementation of PharMe I will be
referring to in this thesis can be found in its GitHub repository[^repo].

[^repo]: [https://github.com/hpi-dhc/PharMe/tree/673c469](https://github.com/hpi-dhc/PharMe/tree/673c469)

PharMe is directed specifically at patients, i.e. people without professional
medical education, and aims to (1) be an educational resource by introducing its
users to the existence and relevance of \glsa{pgx} and (2) provide individuals
that already have genotyping or genome sequencing results with access to latest
\glsa{pgx} research personalized to them through an app on their own smartphone.

To facilitate the latter, the app needs to retrieve a collection of readily
available data given by multiple sources and display it to its users. The
cumulation and provision of this data is the main task of our backend system,
the Annotation Server.

Aside from data the Annotation Server fetches from preexisting \glspl{api} of
external medical organizations that is directed at field professionals, it needs
to provide guidelines that are comprehensible to patients. These guidelines are
created by \glsa{pgx} experts at the Icahn School of Medicine at Mount Sinai who
manually curate them.

In the current implementation of the Annotation Server as we have built it in
shared effort, some problems have remained:

- The data the Annotation Server fetches from external sources has to be matched
  into a common database. Inconsistencies between sources can lead to
  mismatches, which creates a need for human supervision.
- The \glsa{pgx} experts need an efficient way to research, curate and
  administer the guidelines they provide without relying on communication with
  the Annotation Server's technical maintainers. The guidelines they administer
  in turn also need to be matched with the external data.
- There is no infrastructure to provide guidelines in multiple languages.

\noindent To attend these problems, I propose, implement and test a new
component to the PharMe system in this thesis: the Annotation Interface. The
Annotation Interface is a web application directed at \glsa{pgx} experts and
aims to facilitate the process of researching, curating and administering
patient-oriented, multi-language \glsa{pgx} information.

In this thesis, I give an overview of the Annotation Server's implementation.
After explaining the before mentioned problems in more detail, I propose,
implement and test the Annotation Interface as a solution to these problems.
Finally, I discuss future work on administration of information for PharMe based
on the presented findings.

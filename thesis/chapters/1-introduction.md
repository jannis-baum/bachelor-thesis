# Introduction

Pharmacogenetics, the study of how individuals respond to drugs based on their
personal makeup of specific genes, has been an ongoing research topic since the
1950s. This study was later joined by \glspl{pgx}, which, instead of focusing
only on specific genes, considers the genome as a whole
[@scott_personalizing_2011]. Since the difference between these two fields is
not relevant to this thesis' research topic, I will be using \glspl{pgx},
abbreviated as \glsa{pgx}, as a general term for both fields.

With significant advances in genotyping and genome sequencing technologies,
findings in the field of \glsa{pgx} have been rapidly increasing in both numbers
as well as evidence, most notably over the last 20 years. Yet, despite the
prevalence of applicable \glsa{pgx} related research that could help prevent
severe adverse drug reactions, adoption in real-world treatment of patients has
been slow [@scott_personalizing_2011].

With the goal of accelerating the adoption of \glsa{pgx} into general
physicians' consulting rooms, I have worked on a service and research project
coined PharMe in a team with seven other students from Hasso Plattner Institute
at Prof. Böttinger's chair Digital Health - Personalized Medicine.

\bigskip \noindent PharMe is directed specifically at patients and aims to

1. be an educational resource by introducing users to the existence and
   relevance of \glsa{pgx} and
2. provide individuals that already have genotyping or genome sequencing results
   with access to latest \glsa{pgx} research personalized to them through an app
   on their own smartphone.

\noindent To facilitate the latter, we have implemented a backend system, the
Annotation Server, as the provider of data the smartphone application displays
for users.  The Annotation Server's main task is to cumulate data from multiple
  sources and process it to make it readily available to be retrieved by the
  app.

Aside from data the Annotation Server fetches from preexisting \glspl{api} of
external medical organizations, it needs to provide guidelines that are
comprehensible to users without professional medical education, such as
patients; PharMe's primary target group. To provide these guidelines, we work
with \glsa{pgx} experts from the Icahn School of Medicine at Mount Sinai who
manually curate them.

With how we have built the Annotation Server, some unresolved issues have
arisen. The data the Annotation Server fetches from external sources has to be
matched into a common database, which can fail in ways that can't be resolved
automatically. This creates a need for human supervision. On top of this, the
\glsa{pgx} experts need an efficient way to curate and administer the guidelines
they provide, and these in turn also have to be matched with the external data.

\bigskip In this thesis, I will give an overview of the Annotation Server we
have built in shared effort over the course of our project. After explaining the
before mentioned issues in more detail, I will propose, implement and test a
solution towards easing the process of curating and administering
patient-oriented \glsa{pgx} guideline data. Aside from attempting to solve this
issue, the presented solution will also look into how PharMe's guidelines can be
provided with multi-language support in a sustainable and efficient manner the
future.

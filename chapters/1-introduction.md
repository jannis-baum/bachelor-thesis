# Introduction

Pharmacogenetics, the study of how individuals respond to drugs based on their
personal makeup of specific genes, has been an ongoing research topic since the
1950s. This study was later joined by \glspl{pgx}, which, instead of focusing
<!-- You already need a source after the first sentence -->
only on specific genes, considers the genome as a whole
[@scott_personalizing_2011]. Since the difference between these two fields is
not relevant to this thesis' research topic, I will be using \glspl{pgx},
abbreviated as \glsa{pgx}, as a general term for both fields.
<!-- Would not state this here (yet), this “breaks the tension” a bit – is it this
important to differenciate? -->
<!-- Also, you use a lot of genitive in your writing; this could sometimes be shorter
(see "not relevant to this thesis' research topic" – could just be "... this thesis").
Also, I would not use too much genitive because it makes the text a bit more complex. -->

With significant advances in genotyping and genome sequencing technologies,
findings in the field of \glsa{pgx} have been rapidly increasing in both numbers
as well as evidence, most notably over the last 20 years. Yet, despite the
prevalence of applicable \glsa{pgx} related research that could help prevent
severe adverse drug reactions, adoption in real-world treatment of patients has
been slow [@scott_personalizing_2011].

With the goal of accelerating the adoption of \glsa{pgx} into general
physicians' consulting rooms, I have worked on a service and research project
<!-- Also adoption of patients/users/... (however you want to call them)? -->
coined PharMe in a team with seven other students from Hasso Plattner Institute
at Prof. Böttinger's chair Digital Health - Personalized Medicine.
<!-- Regarding I/we: I would use "I" only when you describe your own work regarding
the Annotation Interface, in this case I would rephrase and use "we -->
<!-- Also, "coined" sounds a bit too journalistic; would rather rephrase and use
something like "the PharMe project -->

\bigskip \noindent PharMe is directed specifically at patients and aims to

1. be an educational resource by introducing users to the existence and
   relevance of \glsa{pgx} and
2. provide individuals that already have genotyping or genome sequencing results
   with access to latest \glsa{pgx} research personalized to them through an app
   on their own smartphone.

<!-- In general, I like using enumeations to highlight important parts; however,
I would not highlight this part so much, rather your problem statement below.
Here, you could write it inline, e.g., "... and aims to  (1) be an ..." -->

\noindent To facilitate the latter, we have implemented a backend system, the
Annotation Server, as the provider of data the smartphone application displays
for users.  The Annotation Server's main task is to cumulate data from multiple
  sources and process it to make it readily available to be retrieved by the
  app.
<!-- I would rather put first what data is needed "to facilitate the latter", 
then state that you implemented the Annotation Server for this and what it does -->
<!-- BTW, here I like you genitive usage :) -->

Aside from data the Annotation Server fetches from preexisting \glspl{api} of
external medical organizations, it needs to provide guidelines that are
comprehensible to users without professional medical education, such as
patients; PharMe's primary target group. To provide these guidelines, we work
<!-- Would rather make clear that patients (or what the best term for your main
user group is) are the main target group before, when you describe PharMe -->
<!-- In general, I would rather use an en-dash (– or -- in LaTeX) here, I
would rather expect a full sentence to follow a semicolon -->
with \glsa{pgx} experts from the Icahn School of Medicine at Mount Sinai who
manually curate them.
<!-- Regarding working with experts: I would rather frame it like "guidelines
were created by experts from ..." – "working with" sounds a bit too professional,
at least this is my feeling ^^ -->

With how we have built the Annotation Server, some unresolved issues have
arisen. The data the Annotation Server fetches from external sources has to be
<!-- This first sentence is unnecessary complex (and also sounds quite negative);
I would propose to rather use something like "In the current implementation..." and
"the following problems remain:" and THEN you can use the enumeration for the
problems :D -->
matched into a common database, which can fail in ways that can't be resolved
<!-- Do not use short forms such as "can't" (contractions) in scientific writing -->
automatically. This creates a need for human supervision. On top of this, the
\glsa{pgx} experts need an efficient way to curate and administer the guidelines
they provide, and these in turn also have to be matched with the external data.

<!-- Here, one senetence is missing about how you are going to solve the problems
(with the Annotatoin Interface) -->

\bigskip In this thesis, I will give an overview of the Annotation Server we
have built in shared effort over the course of our project. After explaining the
before mentioned issues in more detail, I will propose, implement and test a
solution towards facilitating the process of curating and administering
patient-oriented \glsa{pgx} guideline data. Aside from attempting to solve this
issue, the presented solution will also look into how PharMe's guidelines can be
provided with multi-language support in a sustainable and efficient manner the
future.

<!-- The outline can be much shortler, mainly naming the chapter names or numbers,
only with a small explanation what is included -->
<!-- Instead if using future here, rather use present tense (not "I will give" but
"I give") -->
<!-- Also, you should include the multi-language support in the problems, not in
the outline -->
<!-- Regarding genitive use: can't you just say "PharMe guidelines"? -->

## Conceptualization \label{ch-concept}

On its surface, the concept I have devised for the Annotation Interface closes
<!-- Why only on its surface? -->
<!-- In general, I would  not speak of "my concept" here but rather a bit more
neurtally of "the concept -->
the gap between the curating party and the Annotation Server by providing the
missing infrastructure to allow them to create, view, update and delete their
<!-- Who does "them" refer to? -->
\glspl{annotation} live on the Annotation Server through a web interface. This
moves the curated \glspl{annotation} from being external data on a Google Sheet
to becoming internal data that is inherently created on top of the data from
external sources. The discussed problem of matching manually curated
\glspl{annotation} with external data from \gls{cpic} and \gls{drugbank}
therefore effectively disappears.
<!-- This first part is already discussion; really only desecribe the concept
in this chapter -->
<!-- I fear you have to revise this part quite a lot; mainly, I would take the
display items you show and really explain your core concepts and features you
envision, if implemented or not (and describe not really what they solve, this
is rather discussion) -->

The problem of matching data between external sources, i.e. matching
\gls{cpic}'s guidelines with \gls{drugbank}'s drugs, does persist, however it is
not susceptible to human error from PharMe's side and the resulting matching
errors can be shown directly to the curating party through the Annotation
Interface instead of first going through a second involved party.
<!-- A lot of genitives in this paragraph :P -->

With the Annotation Interface displaying the Annotation Server's data, my
concept also includes showing the data that is already stored from \gls{cpic}
and linking to their additional resources. Having this information accessible
right alongside the \glspl{annotation} the curating party manages has the
potential to reduce the time they have to spend on research making the overall
process more efficient.

The second major feature of my concept for the Annotation Interface revolves
around modularizing \glspl{annotation}. I have discussed this idea with Dr.
Aniwaa Owusu Obeng, an expert in the field of \glspl{pgx}, who has shown high
enthusiasm for the concept.
<!-- This is already testing (what Aniwaa said) or discussion (which features
Aniwaa supports and therefore which are most important and helpful) -->

This modularization is achieved by strictly limiting the creation of
\glspl{annotation} to combinations of \glspl{brick}: predefined textual
prototypes or templates that adjust to the \gls{annotation} they are used in by
<!-- The addition "they are used in by replacing placeholders with data matching
the given \gls{annotation}" does not sound right; the sentence sounds like it
should be finished before, maybe put this information in a new sentence?-->
replacing placeholders with data matching the given \gls{annotation}. One such
\gls{brick} might be

> `#drug.name` may not be the right medication for you.

\noindent where `#drug.name` will be replaced with the name of the drug the
\glsa{brick} is annotating. Constraining \glspl{annotation} to be made up of
combinations of \glspl{brick} brings an array of benefits.
<!-- The paragraphs explaining how the modularization is achieved well explain
the concept, this is a  good example of what belongs in this chapter :) -->

Having a finite number of options in creating \gls{annotation} texts ensures
consistency between \glspl{annotation} without needing to copy and paste text or
risking human errors such as misspelling. This is particularly relevant when
there is more than one person curating \glspl{annotation}.  The limited options
also make the curation process more straightforward once the initial
\glspl{brick} have been defined which has the potential to reduce time
requirements.
<!-- Rather discussion again -->

The full body of \gls{annotation} texts being made up of a finite number of
<!-- Why "full body of"? -->
\glspl{brick} also simplifies support for multiple languages. A language expert
can be consulted once to translate all \glsa{brick}s into the respective
language. With \glsa{brick}s defined in this language, the full body of
\gls{annotation} texts is consequently also translated and the curating party
can create and update \glspl{annotation} for this language without having to
know it themselves; simply by creating them in their own language.
<!-- Would only shortly explain the concept of annotating bricks with languages
(or how you envisioned it); the part that is simpler by using Text Bricks is
also rather discussion -->

![Conceptualized suggestion of \glspl{brick} based on \gls{cpic} guideline
[@lee_clinical_2022] \label{nlp-mockup}](images/nlp-mockup.pdf)
<!-- I would say you do not need the reference to Lee et al. here; you state
already that it is the CPIC guideline -->
<!-- The figure should appear after its mention in the text; would do this early
in the next paragraph to explain your envisioned flow with help of the picture -->
<!-- Also, I do not entirely understand the picture; add to the caption what is
shown on the left and what on the right -->
<!-- Maybe it also is difficult to understand because I am missing a figure showing
how this normally looks (without the NLP feature); would maybe make sense anyways in
the text above -->

Finally, my concept proposes employing techniques of natural language processing
for the picking of suitable \glspl{brick} based on the corresponding \gls{cpic}
<!-- Only "picking suitable", not "the picking of suitable" -->
<!-- Would it maybe be more clear to say "transforming CPIC to text bricks"? -->
guidelines. With a model trained to infer matching \glspl{brick} based on external
<!-- "to" instead of "based on"? Or remove "matching"? -->
<!-- Would put the aim (making suggestions) first -->
guidelines, curation time requirements can be reduced further by providing the
curators with automated suggestions. This reduces their task to accepting or
editing suggestions. Figure \ref{nlp-mockup} shows a mock-up of a user interface
with the natural language processing model's suggestion of trained \glspl{brick}
based on a \gls{cpic} guideline. In this example, the user clicks on the first
\gls{brick} to get a visual explanation of why it was suggested.

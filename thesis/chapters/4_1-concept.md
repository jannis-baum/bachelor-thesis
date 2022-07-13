## Conceptualization

On its surface, the concept I have devised for the Annotation Interface closes
the gap between the curating party and the Annotation Server by providing the
missing infrastructure to allow them to create, view, update and delete their
annotations live on the Annotation Server through a web interface. This moves
the curated annotations from being external data on a Google Sheet to becoming
internal data that is inherently created on top of the data from external
sources. The discussed problem of matching manually curated annotations with
external data from \gls{cpic} and \gls{drugbank} therefore effectively
disappears.

The problem of matching data between external sources, i.e. matching
\gls{cpic}'s guidelines with \gls{drugbank}'s drugs, does persist, however it is
not susceptible to human error from PharMe's side and the resulting matching
errors can be shown directly to the curating party through the Annotation
Interface instead of first going through a second involved party.

With the Annotation Interface displaying the Annotation Server's data, my
concept also includes showing the data that is already stored from \gls{cpic}
and linking to their additional resources. Having this information accessible
right alongside the annotations the curating party manages has the potential to
reduce the time they have to spend on research making the overall process more
efficient.

The second major feature of my concept for the Annotation Interface revolves
around modularizing annotations. I have discussed this idea with Dr. Aniwaa
Owusu Obeng, an expert in the field of \glspl{pgx}, who has shown high
enthusiasm for the concept.

This modularization is achieved by strictly limiting the creation of annotations
to combinations of Text Bricks: predefined textual prototypes or templates that
adjust to the annotation they are used in by replacing placeholders with data
matching the given annotation. One such Text Brick might be

> `#drug.name` may not be the right medication for you.

\noindent where `#drug.name` will be replaced with the name of the drug the
Brick is annotating. Constraining annotations to be made up of combinations of
Text Bricks brings an array of benefits.

Having a finite number of options in creating annotation texts ensures
consistency between annotations without needing to copy and paste text or
risking human errors such as misspelling. This is particularly relevant when
there is more than one person curating annotations.  The limited options also
make the curation process more straightforward once the initial Text Bricks have
been defined which has the potential to reduce time requirements.

The full body of annotation texts being made up of a finite number of Text
Bricks also simplifies support for multiple languages. A language expert can be
consulted once to translate all Bricks into the respective language. With Bricks
defined in this language, the full body of annotation texts is consequently also
translated and the curating party can create and update annotations for this
language without having to know it themselves; simply by creating them in their
own language.

![Conceptualized suggestion of Text Bricks based on \gls{cpic} guideline
[@lee_clinical_2022] \label{nlp-mockup}](images/nlp-mockup.pdf)

Finally, my concept proposes employing techniques of natural language processing
for the picking of suitable Text Bricks based on the corresponding \gls{cpic}
guidelines. With a model trained to infer matching Text Bricks based on external
guidelines, curation time requirements can be reduced further by providing the
curators with automated suggestions. This reduces their task to accepting or
editing suggestions. Figure \ref{nlp-mockup} shows a mock-up of a user interface
with the natural language processing model's suggestion of trained Text Bricks
based on a \gls{cpic} guideline. In this example, the user clicks on the first
Text Brick to get a visual explanation of why it was suggested.
# Annotation Interface

Concerning the main research aim of this thesis, I will propose, implement and
test a new component of the PharMe system: the Annotation Interface. With the
Annotation Interface I will attempt to solve the issues discussed in chapter
\ref{as-eval} by improving the overall experience and efficiency of the process
of curating annotations and maintaining the Annotation Server's data.

The core idea of the Annotation Interface is to give full control over data to
the curating party, eliminating the communication overhead and the need for a
second party involved in maintenance of data. On top of this, I will
conceptualize and partly implement automation into the curating party's research
and curation process to further increase efficiency. Finally, I will implement
an approach towards operating PharMe with support for multiple languages by
modularizing annotations.

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
[@lee_clinical_2022] \label{nlp-mockup}](output.pdf)

Finally, my concept proposes employing techniques of natural language processing
for the picking of suitable Text Bricks based on the corresponding \gls{cpic}
guidelines. With a model trained to infer matching Text Bricks based on external
guidelines, curation time requirements can be reduced further by providing the
curators with automated suggestions. This reduces their task to accepting or
editing suggestions. Figure \ref{nlp-mockup} shows a mock-up of a user interface
with the natural language processing model's suggestion of trained Text Bricks
based on a \gls{cpic} guideline. In this example, the user clicks on the first
Text Brick to get a visual explanation of why it was suggested.

## Implementation

In consultation with Dr. Aniwaa Owusu Obeng I prioritized the presented
concept's features and implemented a minimal viable version of the Annotation
Interface in the context of this thesis.

To keep separation of concerns and between our group project and my thesis
project, the Annotation Interface is implemented as its own web application that
is distinct from the Annotation Server. Like the Annotation Server, it uses
TypeScript as its main programming language, but relies on a different
technology stack due to its different requirements.

The Annotation Interface is built using Next.js, a framework for creating web
applications based on the frontend JavaScript library React. To store Text
Bricks and the annotations they make up, the Annotation Interface has its own
MongoDB document database and uses the library Mongoose for object modeling.

### Usage flow and technical overview

- walk through how curator would use it
- give parallel architectural overview

### Data structure

- models, responsibilities
  - mongoose discriminators on Annotations
- how models are mapped to AS database entities

### Abstraction & extensibility

- Brick resolving client & server-side and from various resolvers
- reusable Annotation components
- walk through how one could implement a new type of Annotation

## Testing with an expert

- setup: video call
  - introduction to anni
  - me clicking what she tells me to click to simulate usage test without
    deployment
  - worked through 4 "real" scenarios to get comprehensive feedback and have
    aniwaa get to know anni
- indicate her statements (stumpf)
  - overall perceived as "very user-friendly" and "great annotation tool"
  - learned the UI quickly and without confusion
  - liked displayed CPIC data ("avoids using two screen i.e. CPIC and anni")
    - would be cool to include DPWG guidelines as well
  - question about updating individual CPIC guidelines
  - Bricks
    - comparison with Epic's templates and SmartPhrases
    - should get names/keys, maybe even just numbers (curators will memorize
      them with time)
    - need search bar for annotation and Brick editing
  - in production setting
    - revision history (e.g. for when there is a complaint about data from a
      specific day)
    - staging
    - reviewing changes, have to be approved by other curator(s) before upload
    - summary pages, i.e. "This is what it'll look like in the app"

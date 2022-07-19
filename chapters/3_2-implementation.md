## Implementation

In consultation with Dr. Aniwaa Owusu Obeng I prioritized the presented
concept's features and implemented a minimal viable version of the Annotation
Interface in the context of this thesis.
<!-- Would put into separate sentences: "In the scope of this thesis I implemented
a minimal viable version of the conceptualized Annotation Interface. The included
features were selected in consultation with ..." -->
<!-- Which are the features included? -->

To keep separation of concerns and between our group project and my thesis
project, the Annotation Interface is implemented as its own web application that
<!-- Are there no other reasons? E.g., different reequirements, as you write below?
Would focus on this and elaborate a bit. -->
<!-- The line of argumentation in the Discussion regarding this is much more clear
to me; maybe you can state this already in the Annotation Server chapter and refer
to it here? -->
<!-- However, would rather argue that this could be useful in other contexts also
and therefore it might sense to have it as a separate component? -->
<!-- (I will think about it further and add comments in the Discussion :P) -->
is distinct from the Annotation Server. Like the Annotation Server, it uses
TypeScript as its main programming language, but relies on a different
technology stack due to its different requirements.

The Annotation Interface is built using Next.js, a framework for creating web
applications based on the frontend JavaScript library React. It has primarily
<!-- Next.js is really close to NestJS, I had to scroll back to see where the
difference is ^^ -->
been tested using Apple's web browser Safari on macOS, and, in it's minimal
implementation, does not strive to provide responsiveness for small screens.
<!-- Would make this two sentences; "its" not "it's" (this is it is!). With
which screen did you test it? -->
<!-- Also, I would add the testing part below the tech-description (first
describe MongoDB) -->

To store \glspl{brick} and the \glspl{annotation} they make up, the Annotation
Interface has its own MongoDB document database and uses the library Mongoose
for object modeling.
<!-- We don't know yet that text bricks make up annotations (without a database
model description); just say you using it? Why document database and not
related? Maybe this also helps to explain why it makes sense to have this as a
separate service -->

### Usage flow and technical overview

The Annotation Interface's implementation can be found in PharMe's GitHub
<!-- Useless genitive(s) :P -->
repository[^repo] under the root directory `annotation-interface`. All mentions
of source code files will assume this directory as their base.
<!-- Please add a label and add to repo URL that points to the code version you
are describing; actually, I would refernce the repo much earlier,
before talking about the annotation server, maybe when introducing PharMe -->
<!-- Would a folder structure figure help here to explain the structure? Otherwise,
the explanation of files below is a bit difficult to understand (if you think it makes
sense, the structure should contain all files you reference in the text; maybe place
in appendix, if not enough space left) -->

[^repo]: [github.com/hpi-dhc/PharMe](https://github.com/hpi-dhc/PharMe)

The Annotation Interface is made up of three main groups of web pages: *Home*,
<!-- "three web pages"? -->
<!-- When following with "which" you cannot use a colon, rather use a comma -->
*Annotations* and *Bricks*, which are accessible through a navigation bar on the
left side of the interface. Navigation between these groups is handled by the
<!-- Can you add a screenshot or mockup with placeholders of the parts you describe
below before referring to this? Otherwise it is difficult to imagine. Could also to
help understand the following general explanations. -->
<!-- Also, I would put the navigation content into a separate paragraph (like your
explanation of the description below) -->
`Layout` React component defined in `components/common/Layout.tsx`. The `Layout`
component wraps all pages of the Annotation Interface and automatically builds
the navigation bar, highlights the currently active page group and manages
persistent state within and between page groups with the help of React Contexts
defined in the `contexts` directory. This automation is based on regular
expressions that are matched against the pages' routes and is defined by
`tabDefinitions` in the same file making it easily adjustable and extensible in
case more pages or page groups are added.

All main pages of the Annotation Interface include a small description in the
<!-- Why "small"? Rather "short"? Also, I think it should be "on top of the
page" -->
top of the page giving general information or hints about what this page does.
These descriptions are meant to speed up the user's process getting familiar
with the interface and with PharMe's terminology.

#### *Home* page group

Upon first opening the Annotation Interface, the user is presented with an
overview of the status of the Annotation Server's external data, i.e. data from
\gls{cpic} and \gls{drugbank}, on the *Home* page. This overview includes
<!-- Would add the screenshot here -->
information on when the data has most recently been updated.  The dates for
these updates are retrieved from the Annotation Server through the Annotation
Interface's \gls{api} and with the cache control technique
<!-- "through the API" is quite clear I would say, you can leave this out;
shortly explain stale-while-revalidate -->
stale-while-revalidate [@nottingham_http_2010]. Using this technique, the dates
are revalidated to be kept up-to-date with the Annotation Server in case changes
occur.

Aside from checking when the last update has occurred, the user has the option
to trigger a new update, which sends the necessary request to the Annotation
Server. Since triggering the update essentially resets all data on the
<!-- Why "Since"? Just "Triggering"? And why "essentially"? Can leave out?
Would make resetting and patching two sentences. -->
Annotation Server, the Annotation Interface afterwards uses the Annotation
Server's described PATCH \gls{api} to (re-)upload all of the \glspl{annotation}
curated and stored here.
<!-- Why (re-), just say "upload"; leave out "described"; is it a PATCH API or just
a routes/methods? You can just say "all present Annotations" instead making it more
complex, should be clear implicitly what is meant :) -->
<!-- What happens in case of errors (potentially introduced  by updates)? -->

Before the buttons to trigger updates become visible, the interface's
visual design radically changes by having a dark themed overlay placed on top of
its usual light theme. This aims to regain the user's active attention and
signal that they can now make modifications to the live data on the Annotation
Server, which may affect users. The dark themed overlay is used in all parts of
the Annotation Interface that have the ability to make such modifications.
Figure \ref{anni-home} shows the Annotation Interface's *Home* page along with
the dark themed overlay that allows to trigger data updates.
<!-- I like that you change themes! -->
<!-- Why does the data on the Annotation Server need to be replaced? Couldn't you
have a copy of the new data first, resolve errors, and then push? (Not entirely sure
whether this is a problem at all, just wondering) -->

![The Annotation Interface's *Home* page
\label{anni-home}](images/anni-home.png)
<!-- Why can't you fetch DrugBank separately, only all or CPIC? -->

#### *Bricks* page group

By navigating to the *Bricks* page group, the user can view, create, modify and
delete \glspl{brick} in multiple languages. The initially visible \glsa{brick}
<!-- Would also show screenshot here -->
overview offers filtering by the \glsa{brick}s' category, and setting the
language they are displayed in. The category filter and selected display
language states are stored using the before mentioned React Contexts provided
through the `Layout` component and are thereby persistent across navigation
within the *Bricks* page group.

When clicking on an existing \glsa{brick} to edit it, and when adding a new one,
the user can define translations for the \glsa{brick} by writing into a text
field. Alongside of free text, \glsa{brick}s feature placeholders: textual
components that adjust to the \gls{annotation} the \glsa{brick} is used in, such
as the respective drug's name. To facilitate working with placeholders when
<!-- Just "drug"; this whole flow is hard to understand without a figure -->
editing or creating \glsa{brick}s, the text fields used here feature automatic
completion, suggestion, and highlighting of placeholders; similar to what one
might expect from modern code editors: Valid placeholders within the
<!-- Why "one might expect", they actually provide this; also, please refrerence
and place the figure earlier to enhance understanding :)  -->
\glsa{brick} are highlighted with an underline, and a menu listing matching
placeholders is displayed right under the user's cursor when detecting it is
within the context of a placeholder or the user is about to add one. The menu is
navigable with the arrow keys, and the selected option can be picked using the
return key.

Figure \ref{anni-brick} shows a \glsa{brick}'s English translation being edited
with placeholders. The finished version of this \gls{brick} might, for example,
be resolved to

> As a CYP2C9 normal metabolizer you can use clopidogrel at standard doses.
<!-- Would add this information also to the figure caption; would not put this as
a quote but rather inline in italics; would give the information below before
stating the resulting phrase -->

\noindent when used in the context of a guideline for the drug *clopidogrel* and
the gene *CYP2C9* with the result *normal metabolizer*.

![Editing a \glsa{brick} with placeholders
\label{anni-brick}](images/anni-brick.png)

The highlighting, automatic completion, and suggestion are implemented without
any additional external dependencies in the components `AutocompleteArea` and
`AutocompleteMenu` found in the `components/bricks` directory. The underlying
strategy is an HTML `<div>` element that is aligned, synchronized with and
placed underneath a transparent `<textarea>` element. The `<div>` element
<!-- The "aligned [to?], synchronized with..." part is a bit hard to follow;
maybe to "to" and an Oxford comma already help, but would think of rephrasing -->
provides highlighting and the completion menu as children, while the
`<textarea>` makes the text editable.
<!-- Can you mark in the figure which component if which HTML element? Is the
textarea the whole thing or just where placeholders are defined? -->

#### *Annotations* page group

The Annotation Interface's final page group, *Annotations*, provides the ability
to manage PharMe's internal patient-oriented \glspl{annotation} made out of
\glspl{brick}. Through this page group, the user is given access to all the data
present on the Annotation Server along with filtering options. The initial data
overview is split up into entries for drugs and entries for \glspl{guideline}.
The entries presented here are akin to the guidelines \gls{cpic} offers and the
drugs corresponding with them, and are shown with labels indicating which
entries are missing which types of \glspl{annotation}.
<!-- Would give a screenshot in the beginning again -->
<!-- BTW, I really like the screenshots you have so far, the text is also well
readable :) -->
<!-- I do not understand the last sentence; where are entries presented? Why akin
and not the same? Also, what do the labels do (maybe explain in separate sentence? -->

Supplementary to selecting the category *drugs* or *\glspl{guideline}*, the user
can choose to filter for entries that are missing \glspl{annotation} or entries
<!-- "that are missing \glspl{annotation}" > "with missing \glspl{annotation}" -->
that already have all patient-friendly \glspl{annotation} defined, i.e. are
<!-- Would switch the i.e. parts -->
fully curated. On top of this, there is a search bar to filter for entries
<!-- "On top of" > "In addition to" -->
<!-- Would write something like "curators can search for specific entries using
the search bar" -->
matching the search query. All filtering as well as the selected category are,
analogously to filtering states in the *Bricks* page group, stored using the
React Contexts provided through the `Layout` component, which makes them
persistent across navigation within the *Annotations* page group.
<!-- I don't entirely  get the "filtering" part; maybe state the reason first,
then the implementation. Also, would put the "as well as" in the end (after naming
the verb), otherwise the sentence gets confusing. Consider multiple sentences. -->

By clicking on one of the entries, the user is taken to a page detailing its
corresponding \glspl{annotation}, i.e. drug class and \gls{indication} for a
drug entry, and \gls{implication}, \gls{recommendation} and \gls{warnl} for a
\gls{guideline} entry. Detail pages for \glspl{guideline} additionally feature
the data \gls{cpic} provides for the corresponding drug-phenotype pairing as
well as a link to \gls{cpic}'s respective publication. This aims to streamline
the research and curation process.
<!-- Screenshot for this would also be nice :) -->

When pressing the button to edit an \gls{annotation}, the before mentioned dark
themed overlay is used again to signal that changes to data on the Annotation
Server can be made here. This overlay provides a drag-and-drop based interface
to modify, create or delete the given \gls{annotation} using the \glspl{brick}
defined for this type of \gls{annotation}. Figure \ref{anni-annotation} shows a
\gls{recommendation} \gls{annotation} being edited in the overlay by dragging a
second \glsa{brick} onto the \gls{annotation} canvas.
<!-- This is a well-timed figure mention and inclusion :) -->

![Editing a \gls{recommendation} \gls{annotation}
\label{anni-annotation}](images/anni-annotation.png)
<!-- I am not entirely sure what is done here exactly; what does the text above
the box mean, what is the box about and the "Defined Bricks"? Could shortly explain in
caption or in text -->

\noindent Saving an \gls{annotation} from this overlay calls the Annotation
Interface's \gls{api} which

- saves the \gls{annotation} in the Annotation Interface's database as a
  combination of references to saved \glspl{brick} and
- calls the Annotation Server's \gls{api} to save the text the \glsa{brick}s
  resolve to, visible above the \gls{annotation} canvas in figure
  \ref{anni-annotation}.
<!-- Would make this two sentences and no itemization -->

\noindent This enables live editing of Annotation Server data and keeps it
synchronized with the \glspl{annotation} stored on the Annotation Interface.

### Data structure

The Annotation Interface uses a MongoDB document database along with Mongoose
for object modeling in TypeScript. All documents the Annotation Interface stores
<!-- First sentence: redundant; please explain technologies shortly when naming
them in the text above (when you describe your technical setup) -->
  in the database are typed with the help of TypeScript interfaces that extend
  the base interface `IBaseModel` found in `database/helpers/types.ts`. This
  base interface provides an optional property `_id` that is used to reference
  documents in the database. The `_id` property is generically typed to be a
  Mongoose `ObjectId`, a `string` or `undefined`, which allows the same document
  interfaces to be used

- when a document is created or retrieved on server side, i.e. having an
  `ObjectId`,
- when a document is sent to the client side with a serializable `string`
  instead of an `ObjectId` as an `_id`, and
- when data for a new document is created on the client side, i.e. without an
  `_id`.
<!-- This whole explanation is a bit difficult to grasp without context;
would first explain the data structure (maybe with some suitable diagram, as the
ER diagram you included for the Annotation Server) -->

The Annotation Interface's database is used to store \glspl{brick} with support
for multiple languages, and \glspl{annotation} as combinations of references to
  \glsa{brick}s. The Mongoose models for all database documents are implemented
  in the `database/models` directory and use Mongoose's builtin techniques for
  validation.
<!-- This paragraph would make a good first paragraph, I think (in combination
with some figure explaining the structure, as mentioned above) -->

To ensure unambiguous matching, the \glspl{annotation} stored on the Annotation
Interface need to injectively map to data on the Annotation Server. This is
<!-- Why "injectively"? -->
achieved by storing the corresponding drug's \gls{rxcui} in the documents for
<!-- You could leave out "drug's" -->
all \glspl{annotation}, and respectively storing the corresponding gene symbol
and gene results for \gls{guideline} \glspl{annotation}.

The documents that describe \glspl{annotation} for drugs and guidelines are
modeled by `MedAnnotation` and `GuidelineAnnotation` respectively. These models
<!-- All models you name here should be part of a figure :) -->
inherit from `AbstractAnnotation` for their common properties and validation
functions.

Since this is a commonly used operation, both `MedAnnotation` and
<!-- Why "Since this is a commonly used operation"? Not clear what "this"
refers to and maybe can be left out? (Similarly below)-->
`GuidelineAnnotation` implement a static method that finds the document
matching with the given Annotation Server entity data. Aside from the discussed
properties that are necessary for this matching to be unique, `MedAnnotation`
models the properties `drugclass` and `indication`, and `GuidelineAnnotation`
models `implication` and `recommendation` as arrays of references to
`TextBrick`s for the \glsa{brick}-based \glspl{annotation}. These references are
again generically typed as `ObjectId`s or `strings` to be usable on both server
and client side. Additionally, `GuidelineAnnotation` models the three-tier
\gls{warnl}, the only non-\glsa{brick}-based \gls{annotation}, as a `string`
with three possible values.

Documents for \glspl{brick} are modeled by `TextBrick`. Each \glsa{brick}
document has an assigned `BrickUsage`, specifying what type of \gls{annotation}
it can be used in, as well as an array of translations defined by their language
and text.

The common operation of *resolving* a \glsa{brick}, i.e. filling its
placeholders with information for a specific \gls{annotation}, is implemented by
the `resolveBricks` function defined in `database/helpers/resolve-bricks.ts`.
This function takes an array of `TextBrick`s of any `_id` type, a target
language, and a generic source `BrickResolver`. The `BrickResolver` can be drug
or \gls{guideline} data from either the Annotation Interface or the Annotation
Server, and is used to fill out the `TextBrick`s' placeholders accordingly to
return their resolved texts. This function's flexibility makes it usable on both
client and server side, with any type of source resolving data and makes it
easily extensible for new placeholders as well as new types of resolving data.

Since finding `TextBrick`s and then resolving them is also a common operation,
the `TextBrick` model implements this as a static method by wrapping the
`resolveBricks` function.

<!-- This whole section is really hard to understand; in addition to the
diagram, an example or some basic code might help? (Especially with the different
typing?) -->

### Abstraction and extensibility

To illustrate some of the Annotation Interface's architectural abstraction and
its resulting extensibility and to give deeper insights into its code
base, I will use this section to walk through how
<!-- If you say "code base" I would add some code examples here -->

1. a new category of \glspl{brick} with new placeholders, and
2. the visual interface to display and edit a new type of \gls{annotation}
<!-- Would not put this into an enumeration, a bit confusing because you
do not understand the sentence without the following text -->
<!-- Also, you already highlight this with the subsection headings :) -->

\noindent could be implemented. These steps, along with adjustments to the
\gls{api} and database models analogous to what is already implemented, are what
would make up the requirements towards implementing a new type of
\gls{annotation} on the Annotation Interface.

#### \glspl{brick} and placeholders

The first step towards adding the new category of \glspl{brick} is handled by
<!-- "the new category" or "a new category"? -->
adding the new category's display name to the array of \glsa{brick} categories
(*usages*) in `common/constants.ts`. This will automatically enable the
`TextBrick` database model and corresponding \gls{api} to process the new
\glsa{brick}s, and adjust the interfaces in the *Bricks* page group to allow
filtering for the new category, as well as adding and editing \glspl{brick} that
use it.

The only aspect that is left to be handled now is defining what placeholders the
new \glsa{brick}s can use. This is achieved by adjusting the function
`placeholdersForBrick` found in `database/helpers/resolve-bricks.ts` to return
the possible placeholder strings accordingly. This file is also where new
placeholders that are resolved with new or existing types of source data can be
defined. To enable resolving placeholders from a new type of source data, its
type is added to the type union `BrickResolver` and its mapping to the
placeholders is defined in the function `getPlaceholders`.

With placeholders defined, the newly implemented \glspl{brick} can be created,
edited, used and resolved analogously to the existing ones.
<!-- I feel, some small code examples could help (or one block with omissions and
file names as comments) -->

#### Visual \gls{annotation} components

<!-- Would expect a short statement in the beginning what will be added (as in
the subsection before) -->
The interfaces that display an \gls{annotation}'s current value and provide the
editing overlay shown in figure \ref{anni-annotation} are built with multiple
levels of abstraction. This abstraction makes the underlying React components
reusable for flexible applications. All components referred to in this section
are implemented in the `components/annotations` directory.

The most abstract of these components is `AbstractAnnotation`. This
component is responsible for displaying an \gls{annotation}'s current value, or,
if appropriate, a label stating it is missing, as well as for implementing
  showing and hiding the editing overlay visible in \ref{anni-annotation}, and
  creating the overlay's basic structure. `AbstractAnnotation` provides a React
<!-- Please make at least two sentences from the second sentence ;) -->
  reference that enables its parent component to hide the overlay as well and
  places its own children on the overlay.

This component is used to implement the interface for a new type of
<!-- "is used" – only for such annotations not using bricks or also for those
using bricks (sounds like the first option) – gets a bit clearer in the next
part but there only is one more level of abstraction; maybe "is used directly"?
Also, might be more clear if you explain the other abstracation first and then
their usage  -->
\gls{annotation} that is not based on \glsa{brick}s, such as the existing
\gls{warnl} \gls{annotation} in `WarningLevelAnnotation.ts`.

The components for \gls{brick}-based \glspl{annotation} feature additional
levels of abstraction. `AbstractBrickAnnotation` component uses
`AbstractAnnotation` to implement the interface seen in \ref{anni-annotation} by
adding the drag-and-drop functionality based on information it is given about
the \glsa{brick}s to use. It also adds buttons to confirm or cancel changes
using a given callback function.

The next level of abstraction is implemented by the `BrickAnnotation` component,
which sets up `AbstractBrickAnnotation` based on given Annotation Server data
and an Annotation Interface \gls{api} endpoint, by making assumptions about the
structure of both. `BrickAnnotation` is the component used by the final
`MedAnnotation` and `GuidelineAnnotation` components, which are used to create
the interfaces for all other existing types of \glspl{annotation}.

Finally, the new type of \glsa{brick}-based \gls{annotation} is implemented
<!-- "the new type is" or "a new type can"? -->
using `BrickAnnotation` or `AbstractBrickAnnotation` depending on whether its
data structure and \gls{api} follow the assumptions made by `BrickAnnotation`.
<!-- Would repeat the path here; would also put this before actually explaining
the abstraction levels -->
<!-- As before, this is quite abstract, can you give (code) examples or a small
diagram explaining this? -->

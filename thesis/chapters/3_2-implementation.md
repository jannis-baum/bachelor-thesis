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
applications based on the frontend JavaScript library React. It has primarily
been tested using Apple's web browser Safari on macOS, and, in it's minimal
implementation, does not strive to provide responsiveness for small screens.

To store \glspl{brick} and the \glspl{annotation} they make up, the Annotation
Interface has its own MongoDB document database and uses the library Mongoose
for object modeling.

### Usage flow and technical overview

The Annotation Interface's implementation can be found in PharMe's GitHub
repository[^repo] under the root directory `annotation-interface`. All mentions
of source code files will assume this directory as their base.

[^repo]: [github.com/hpi-dhc/PharMe](https://github.com/hpi-dhc/PharMe)

The Annotation Interface is made up of three main groups of web pages: *Home*,
*Annotations* and *Bricks*, which are accessible through a navigation bar on the
left side of the interface. Navigation between these groups is handled by the
`Layout` React component defined in `components/common/Layout.tsx`. The `Layout`
component wraps all pages of the Annotation Interface and automatically builds
the navigation bar, highlights the currently active page group and manages
persistent state within and between page groups with the help of React Contexts
defined in the `contexts` directory. This automation is based on regular
expressions that are matched against the pages' routes and is defined by
`tabDefinitions` in the same file making it easily adjustable and extensible in
case more pages or page groups are added.

All main pages of the Annotation Interface include a small description in the
top of the page giving general information or hints about what this page does.
These descriptions are meant to speed up the user's process getting familiar
with the interface and with PharMe's terminology.

\bigskip \noindent Upon first opening the Annotation Interface, the user is
presented with an overview of the status of the Annotation Server's external
data, i.e. data from \gls{cpic} and \gls{drugbank}, on the *Home* page. This
overview includes information on when the data has most recently been updated.
The dates for these updates are retrieved from the Annotation Server through the
Annotation Interface's \gls{api} and with the cache control technique
stale-while-revalidate [@nottingham_http_2010]. Using this technique, the dates
are revalidated to be kept up-to-date with the Annotation Server in case changes
occur.

Aside from checking when the last update has occurred, the user has the option
to trigger a new update, which sends the necessary request to the Annotation
Server. Since triggering the update essentially resets all data on the
Annotation Server, the Annotation Interface afterwards uses the Annotation
Server's described PATCH \gls{api} to (re-)upload all of the \glspl{annotation}
curated and stored here.

Before the buttons to trigger updates become visible, the interface's
visual design radically changes by having a dark themed overlay placed on top of
its usual light theme. This aims to regain the user's active attention and
signal that they can now make modifications to the live data on the Annotation
Server, which may affect users. The dark themed overlay is used in all parts of
the Annotation Interface that have the ability to make such modifications.
Figure \ref{anni-home} shows the Annotation Interface's *Home* page along with
the dark themed overlay that allows to trigger data updates.

![The Annotation Interface's *Home* page
\label{anni-home}](images/anni-home.png)

\bigskip \noindent By navigating to the *Bricks* page group, the user can view,
create, modify and delete \glspl{brick} in multiple languages. The initially
visible \glsa{brick} overview offers filtering by the \glsa{brick}s' category,
and setting the language they are displayed in. The category filter and selected
display language states are stored using the before mentioned React Contexts
provided through the `Layout` component and are thereby persistent across
navigation within the *Bricks* page group.

When clicking on an existing \glsa{brick} to edit it, and when adding a new one,
the user can define translations for the \glsa{brick} by writing into a text
field. Alongside of free text, \glsa{brick}s feature placeholders: textual
components that adjust to the \gls{annotation} the \glsa{brick} is used in, such
as the respective drug's name. To facilitate working with placeholders when
editing or creating \glsa{brick}s, the text fields used here feature automatic
completion, suggestion, and highlighting of placeholders; similar to what one
might expect from modern code editors: Valid placeholders within the
\glsa{brick} are highlighted with an underline, and a menu listing matching
placeholders is displayed right under the user's cursor when detecting it is
within the context of a placeholder or the user is about to add one. The menu is
navigable with the arrow keys, and the selected option can be picked using the
return key.

Figure \ref{anni-brick} shows a \glsa{brick}'s English translation being edited
with placeholders. The finished version of this \gls{brick} might, for example,
be resolved to

> As a CYP2C9 normal metabolizer you can use clopidogrel at standard doses.

\noindent when used in the context of a guideline for the drug *clopidogrel* and
the gene *CYP2C9* with the result *normal metabolizer*.

![Editing a \glsa{brick} with placeholders
\label{anni-brick}](images/anni-brick.png)

The highlighting, automatic completion, and suggestion are implemented without
any additional external dependencies in the components `AutocompleteArea` and
`AutocompleteMenu` found in the `components/bricks` directory. The underlying
strategy is an HTML `<div>` element that is aligned, synchronized with and
placed underneath a transparent `<textarea>` element. The `<div>` element
provides highlighting and the completion menu as children, while the
`<textarea>` makes the text editable.

\bigskip \noindent The Annotation Interface's final page group, *Annotations*,
provides the ability to manage PharMe's internal patient-oriented
\glspl{annotation} made out of \glspl{brick}. Through this page group, the user
is given access to all the data present on the Annotation Server along with
filtering options. The initial data overview is split up into entries for drugs,
and entries for \glspl{guideline}. The entries presented here are akin to the
guidelines \gls{cpic} offers and the drugs corresponding with them, and are
shown with labels indicating which entries are missing which types of
\glspl{annotation}.

Supplementary to selecting the category *drugs* or *\glspl{guideline}*, the user
can choose to filter for entries that are missing \glspl{annotation} or entries
that already have all patient-friendly \glspl{annotation} defined, i.e. are
fully curated. On top of this, there is a search bar to filter for entries
matching the search query. All filtering as well as the selected category are,
analogously to filtering states in the *Bricks* page group, stored using the
React Contexts provided through the `Layout` component, which makes them
persistent across navigation within the *Annotations* page group.

By clicking on one of the entries, the user is taken to a page detailing its
corresponding \glspl{annotation}, i.e. drug class and \gls{indication} for a
drug entry, and \gls{implication}, \gls{recommendation} and \gls{warnl} for a
\gls{guideline} entry. Detail pages for \glspl{guideline} additionally feature
the data \gls{cpic} provides for the corresponding drug-phenotype pairing as
well as a link to \gls{cpic}'s respective publication. This aims to streamline
the research and curation process.

When pressing the button to edit an \gls{annotation}, the before mentioned dark
themed overlay is used again to signal that changes to data on the Annotation
Server can be made here. This overlay provides a drag-and-drop based interface
to modify, create or delete the given \gls{annotation} using the \glspl{brick}
defined for this type of \gls{annotation}. Figure \ref{anni-annotation} shows a
\gls{recommendation} \gls{annotation} being edited in the overlay by dragging a
second \glsa{brick} onto the \gls{annotation} canvas.

![Editing a \gls{recommendation} \gls{annotation}
\label{anni-annotation}](images/anni-annotation.png)

\noindent Saving an \gls{annotation} from this overlay calls the Annotation
Interface's \gls{api} which

- saves the \gls{annotation} in the Annotation Interface's database as a
  combination of references to saved \glspl{brick} and
- calls the Annotation Server's \gls{api} to save the text the \glsa{brick}s
  resolve to, visible above the \gls{annotation} canvas in figure
  \ref{anni-annotation}.

\noindent This enables live editing of Annotation Server data and keeps it
synchronized with the \glspl{annotation} stored on the Annotation Interface.

### Data structure

The Annotation Interface uses a MongoDB document database along with Mongoose
for object modeling in TypeScript. All documents the Annotation Interface stores
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

The Annotation Interface's database is used to store \glspl{brick} with support
for multiple languages, and \glspl{annotation} as combinations of references to
  \glsa{brick}s. The Mongoose models for all database documents are implemented
  in the `database/models` directory and use Mongoose's builtin techniques for
  validation.

To ensure unambiguous matching, the \glspl{annotation} stored on the Annotation
Interface need to injectively map to entities on the Annotation Server. This is
achieved by storing the corresponding drug's \gls{rxcui} in the documents for
all \glspl{annotation} and additionally storing the corresponding gene symbol
and gene results for \gls{guideline} \glspl{annotation}.

The documents that describe \glspl{annotation} for drugs and guidelines are
modeled by `MedAnnotation` and `GuidelineAnnotation` respectively. These models
inherit from `AbstractAnnotation` for their common properties and validation
functions.

Since this is a commonly used operation, both `MedAnnotation` as well
as `GuidelineAnnotation` implement a static method that finds the document
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

### Abstraction and extensibility

To showcase some of the Annotation Interface's architectual abstraction and the
resulting extensibility and to give deeper insights into its code base, I will
use this section to walk through how a new type of annotation could be
implemented.

- reusable Annotation components

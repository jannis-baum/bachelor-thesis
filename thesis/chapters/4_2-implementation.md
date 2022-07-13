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
data on the *Home* page, i.e. with data from \gls{cpic} and \gls{drugbank}. This
overview includes information on when the data has most recently been updated.
The dates for these updates are retrieved from the Annotation Server through the
Annotation Interface's \gls{api} and with the cache control technique
stale-while-revalidate [@nottingham_http_2010]. Using this technique, the dates
are revalidated to be kept up-to-date with the Annotation Server in case changes
occur.

Aside from checking when the last update has occurred, the user has the option
to trigger a new update, which sends the necessary request to the Annotation
Server. Before the buttons to trigger updates become visible, the interface's
design radically changes from a light to a dark theme. This aims to catch the
user's active attention and signal that they can now make modifications to the
live data on the Annotation Server, which may affect users.  This change in
design happens in all parts of the Annotation Interface that have the ability to
make such modifications. Figure \ref{anni-home} shows the Annotation Interface's
*Home* page along with the dark themed interface that allows to trigger data
updates.

![The Annotation Interface's *Home* page
\label{anni-home}](images/anni-home.png)

\bigskip \noindent By navigating to the *Bricks* page group, the user can view,
create, modify and delete \glspl{brick} in multiple languages. The initially
visible \glsa{brick} overview offers filtering by the \glsa{brick}s' category
and setting the language they are displayed in. The category filter and selected
display language states are stored using the before mentioned React Contexts
provided through the `Layout` component and are thereby persistent across
navigation within the *Bricks* page group.

When clicking on an existing \glsa{brick} to edit it and when adding a new one,
the user can define translations for the \glsa{brick} by writing into a text
field. Alongside of free text, \glsa{brick}s feature placeholders: textual
components that adjust to the \gls{annotation} the \glsa{brick} is used in, such
as the respective drug's name. To facilitate working with placeholders when
editing or creating \glsa{brick}s, the text fields used here feature automatic
completion, suggestion and highlighting of placeholders, similar to what one
might expect from modern code editors: Valid placeholders within the
\glsa{brick} are highlighted with an underline, and a menu listing matching
placeholders is displayed right under the user's cursor when detecting it is
within the context of a placeholder or the user is about to add one. The menu is
navigable with the arrow keys and the selected option can be picked using the
return key.

Figure \ref{anni-brick} shows a \glsa{brick}'s English translation being edited
with placeholders. The finished version of this \gls{brick} might, for example,
be resolved to

> As a CYP2C9 normal metabolizer you can use clopidogrel at standard doses.

\noindent when used in the context of a guideline for the drug *clopidogrel* and
the gene *CYP2C9* with the result *normal metabolizer*.

![Editing a \glsa{brick} with placeholders
\label{anni-brick}](images/anni-brick.png)

The highlighting, automatic completion and suggestion are implemented without
any additional external dependencies in the components `AutocompleteArea` and
`AutocompleteMenu` found in the `components/bricks` directory. The underlying
strategy is an HTML `<div>` element that is aligned, synchronized with and
placed underneath a transparent `<textarea>` element. The `<div>` element
provides highlighting and the completion menu as children, while the
`<textarea>` makes the text editable.

\bigskip \noindent The Annotation Interface's final page group, *Annotations*,
provides the user with the ability to manage PharMe's internal patient-oriented
\glspl{annotation} made out of \glspl{brick}. When first opening this page
group, the user is presented with all the data present on the Annotation Server
along with filtering options. Data is filtered by drugs, i.e. \glspl{annotation}
for the drug class and indications, and guidelines, i.e.

### Data structure

- models, responsibilities
  - mongoose discriminators on Annotations
- how models are mapped to AS database entities

### Abstraction and extensibility

To showcase some of the Annotation Interface's architectual abstraction and the
resulting extensibility and to give deeper insights into its code base, I will
use this section to walk through how a new type of annotation could be
implemented.

- Brick resolving client & server-side and from various resolvers
- reusable Annotation components
- walk through how one could implement a new type of Annotation

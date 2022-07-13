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

The Annotation Interface's implementation can be found in PharMe's GitHub
repository[^repo] under the root directory `annotation-interface`. All mentions of
source code files will assume this directory as their base.

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
`tabDefinitions` in the same file.

All main pages of the Annotation Interface include a small description in the
top of the page giving general information or hints about what this page does.
These descriptions are meant to speed up the user's process getting familiar
with the interface and with PharMe's terminology.

Upon first opening the Annotation Interface, the user is presented with an
overview of the status of the Annotation Server's external data on the *Home*
page, i.e. with data from \gls{cpic} and \gls{drugbank}. This overview includes
information on when the data has most recently been updated. The dates for these
updates are retrieved from the Annotation Server through the Annotation
Interface's \gls{api} and with the cache control technique
stale-while-revalidate [@nottingham_http_2010]. Using this technique, the dates
are revalidated to be kept up-to-date with the Annotation Server in case changes
occur.

![The Annotation Interface's *Home* page
\label{anni-home}](images/anni-home.png)

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

- walk through how curator would use it
- give parallel architectural overview

### Data structure

- models, responsibilities
  - mongoose discriminators on Annotations
- how models are mapped to AS database entities

### Abstraction and extensibility

- Brick resolving client & server-side and from various resolvers
- reusable Annotation components
- walk through how one could implement a new type of Annotation

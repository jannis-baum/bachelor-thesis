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

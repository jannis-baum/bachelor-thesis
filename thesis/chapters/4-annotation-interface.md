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
process further increasing efficiency. Finally, I will implement an approach
towards operating PharMe with support for multiple languages by modularizing
annotations.

## Conceptualization

- Infrastructure
  - CRUD interface to our backend for curated annotations
  - list of errors that have occurred during data collection
- Help for curation of of annotations
  - interface to (multiple?) external resources $\to$ reduce research time
  - modular Lego-like building of annotations $\to$ reduce writing time, support
    languages unknown to the curator
    - CRUD for multi-language text-components
    - visual UI to build annotation texts from components
    - components can have placeholders, e.g. `{{drug}}` is automatically
      replaced with the respective drug's name (Drugbank often has drug name
      translations)
  - NLP & automated annotation suggestions $\to$ reduce writing time even further
    - finding matching text components based on external resources can
      ultimately be automated, mention PGxCorpus paper
    - UI gets `accept` and `edit` buttons, curator is now mostly administrator

## Implementation

- proposal was priority list for project
- tech stack

### Usage flow and technical overview

- walk through how curator would use it
- give architectural overview

### Data structure

- models, responsibilities
  - mongoose discriminators on Annotations
- connections to server

### Abstraction & extensibility

- Brick resolving
- reusable Annotation components
- what to abstract more

## Testing with an expert

- setup (video call, me clicking through interface)
- evaluate her statements ("stumpf")

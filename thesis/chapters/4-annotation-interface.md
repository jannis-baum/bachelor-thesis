# Annotation Interface

![Homepage](images/anni-home.png)

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

# Bachelor thesis structure & content outline

## Abstract

> > <140 words, reflect main story, call attention, short & concise\
> Scope, Problem, Scope, Significance, Solution, Evaluation

## Introduction

> > first paragraph important; reader decides if wants to continue reading
>
> Introduce topic and define the terminology

- Rough PGx topic introduction
- General project introduction, big picture goals
  - empower patients with PGx knowledge

> Indicate focus of paper and research objectives

- Introduce annotation server as backend built in shared effort
  - source of app data
  - manually curated content
- Explain need for data administration, my objective for this thesis

> Last paragraph outlines structure

### Background

> > TODO: Ask Tamara about the scope of this part

## Main part

> > - Methods (setup, should enable reader to replicate study)
> > - Results (observations w/o explanations or comments)
> > - Discussion (interpretation, comment on results, connect to other research,
> >   state limitations, future work)

### Annotation server

- recap introduction, this is a component of PharMe service

#### Methods

- Why do we need it, what does it do for the service?
  - Connection of multiple data sources for different reasons (DrugBank, CPIC,
    our curated guidelines, TODO: should I mention Google Sheet here?)
- Rough architecture
  - Introduce different sub-modules and their roles
  - Flow to build our database
- Tech stack

#### Observations

- Curation of guidelines is high effort (e.g. $2 ~\textrm{people} \cdot 2
  ~\textrm{days} / 100 ~\textrm{drug-gene pairs}$)
- Matching manually curated data with API data from CPIC and Drugbank is
  difficult
  - doesn't always work, errors that can't be fixed automatically do occur

#### Discussion

- There is a need for humans to supervise this process more than simply
  supplying guidelines through a one-way interface (e.g. a Google Sheet)
- The manual work of curating guidelines has lots of room to be made more
  efficient

### Proposal of Guideline Tool

> > (TODO: find name for tool)

#### Big picture idea ('Methods')

- Infrastructure
  - CRUD interface to our backend for curated guidelines
  - list of errors that have occurred during data collection
- Help for curation of of guidelines
  - interface to (multiple?) external resources $\to$ reduce research time
  - modular Lego-like building of guidelines $\to$ reduce writing time, support
    languages unknown to the curator
    - CRUD for multi-language text-components
    - visual UI to build guideline texts from components
    - components can have placeholders, e.g. `{{drug}}` is automatically
      replaced with the respective drug's name (Drugbank often has drug name
      translations)
  - NLP & automated guideline suggestions $\to$ reduce writing time even further
    - finding matching text components based on external resources can
      ultimately be automated, mention PGxCorpus paper
    - UI gets `accept` and `edit` buttons, curator is now mostly administrator

#### Observations

- Desire for automation is strong from the pharmacists' / curators' side
  ($\to$ consultation with Aniwaa)
- Guideline Tool project is way out of scope for small bachelor thesis

#### Results

- list above is priority list for project

### Guideline Tool implementation

> > TBD

## Conclusion

> > - summary of findings, not of achievements
> > - make strong statements
> > - answer to research question (TODO: find research question)
> > - importance of discovery and future implications

- PGx is on the way to get closer to patients (also mention *All Of Us* project
  in the US)
- Guideline tool could be used in other patient-oriented PGx projects as well

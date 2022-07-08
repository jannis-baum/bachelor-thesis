# Bachelor thesis structure & content outline

## 1 | Abstract

> > <140 words, reflect main story, call attention, short & concise\
> Scope, Problem, Scope, Significance, Solution, Evaluation

## 2 | Introduction

> Introduce topic and define the terminology

- Rough PGx topic introduction
- General project introduction, big picture goals
  - empower patients with PGx knowledge

> Indicate focus of paper and research objectives

- Introduce Annotation Server as backend built in shared effort
  - source of app data
  - manually curated content
- Explain need for data administration
- My objective/research aim for this thesis: ease/improve process of curating
  and administrating data

> Last paragraph outlines structure

## 1 | Background

> CPIC, whatever is necessary to understand main part, phenotypes, write at the
> end
>
> > 1. Methods (setup, should enable reader to replicate study) \
> >    (Conceptualization)
> > 2. Results (observations w/o explanations or comments) \
> >    (Implementation)
> > 3. Discussion (interpretation, comment on results, connect to other
> >    research, state limitations, future work) \
> >    (Evaluation)

## 2 | Annotation Server

- recap introduction, this is a component of PharMe service
- Why do we need it, what does it do for the service?
  - Connection of multiple data sources for different reasons (DrugBank, CPIC,
    our curated guidelines from Google Sheet)

### 1 | Technical implementation

- Tech stack
- Rough architecture
  - Introduce different sub-modules and their roles
  - Flow to build our database

### 1 | Observations & Evaluation

- Curation of guidelines is high effort (e.g. $2 ~\textrm{people} \cdot 2
  ~\textrm{days} / 100 ~\textrm{drug-gene pairs}$)
- Matching manually curated data with API data from CPIC and Drugbank is
  difficult
  - doesn't always work, errors that can't be fixed automatically do occur
- There is a need for humans to supervise this process more than simply
  supplying guidelines through a one-way interface (e.g. a Google Sheet)
- The manual work of curating guidelines has lots of room to be made more
  efficient
- Desire for automation is strong from the pharmacists' / curators' side
  ($\to$ consultation with Aniwaa)

## 8 | Annotation Interface

### 2 | Conceptualization

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

### 5 | Implementation

- proposal was priority list for project
- tech stack

#### 2 | Usage flow and technical overview

- walk through how curator would use it
- give architectural overview

#### 1 | Data structure

- models, responsibilities
  - mongoose discriminators on Annotations
- connections to server

#### 1 | Abstraction & extensibility

- Brick resolving
- reusable Annotation components
- what to abstract more

### 1 | Testing with expert

- setup (video call, me clicking through interface)
- evaluate her statements ("stumpf")

## 1 | Discussion

- open issues
- handle missing (deleted) Bricks, missing translations
- support multiple languages in other parts of PharMe system
- touch on possibility to include NLP again
- feedback from aniwaa
- make connection with research aim and how it was met/what wasn't met

## 1 | Conclusion

> > - summary of findings, not of achievements
> > - make strong statements
> > - answer to research question (TODO: find research question)
> > - importance of discovery and future implications

- PGx is on the way to get closer to patients (also mention *All Of Us* project
  in the US)
- Annotation Interface could be used in other patient-oriented PGx projects as
  well, also other projects in general?
- connect back to research aim from introduction

# Annotation Server

- recap introduction, this is a component of PharMe service
- Why do we need it, what does it do for the service?
  - Connection of multiple data sources for different reasons (DrugBank, CPIC,
    our curated guidelines from Google Sheet)

## Technical implementation

- Tech stack
- Rough architecture
  - Introduce different sub-modules and their roles
  - Flow to build our database

## Remaining issues

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

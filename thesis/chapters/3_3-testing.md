## Testing with an expert

To test the Annotation Interface's usability and how it meets its goals of
improving the process of curating and researching \glspl{annotation} for PharMe,
I set up a second consultation with a \gls{pgx} expert. For this consultation I
talked to Dr. Aniwaa Owusu Obeng who I also interviewed for the Annotation
Interface's initial conceptualization and feature prioritization.

### Setup

The consultation was set up as a roughly hour-long video call and initially
accompanied by presentation slides. To start off, I gave a brief
(re-)introduction on what the Annotation Interface is and aims to accomplish,
and how it fits into the PharMe system.

The main part of the consultation revolved around use case testing. I chose to
have the expert use the Annotation Interface in real scenarios, rather than
merely presenting the application to them, to get more comprehensive feedback
and explore aspects that might otherwise have been missed.

Before introducing the testing scenarios, I explained the aims, focus and
process of the testing and asked the expert to

- think out loud and mention anything that is unclear, and
- focus on fundamental functionality over suggestions to improve the visual
  interface

\noindent during the testing process. Furthermore, I reminded them that the
testing is not meant to test them, but the Annotation Interface as an
application, to ensure a comfortable environment.

The testing consisted of the expert working through the following four scenarios
that I chose to reflect real use cases with increasing complexity and to
progressively disclose the Annotation Interface's features:

1. Check when \gls{cpic} \gls{guideline} have last been updated on the
   Annotation Server and update them.
2. Find the existing patient-friendly drug class \gls{annotation} for a specific
   drug.
3. Create a new \gls{recommendation} \gls{brick} that uses a placeholder.
4. Create an \gls{annotation} with the new \gls{brick}.

During and after the testing we discussed various aspects of the Annotation
Interface and how it might evolve in future versions.

### Results

- indicate her statements (stumpf):
  - overall perceived as "very user-friendly" and "great annotation tool"
  - learned the UI quickly and without confusion
  - liked displayed CPIC data ("avoids using two screen i.e. CPIC and anni")
    - would be cool to include DPWG guidelines as well
  - question about updating individual CPIC guidelines
  - Bricks
    - comparison with Epic's templates and SmartPhrases
    - should get names/keys, maybe even just numbers (curators will memorize
      them with time)
    - need search bar for annotation and Brick editing
  - in production setting
    - revision history (e.g. for when there is a complaint about data from a
      specific day)
    - staging
    - reviewing changes, have to be approved by other curator(s) before upload
    - summary pages, i.e. "This is what it'll look like in the app"

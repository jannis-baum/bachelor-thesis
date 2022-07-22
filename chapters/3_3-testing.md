## Testing with an expert \label{ch-testing}
<!-- Would maybe call this "Expert testing" -->

To test the Annotation Interface's usability and how it meets its goals of
improving the process of curating and researching \glspl{annotation} for PharMe,
I set up a second consultation with an expert of \gls{pgx}s. For this
<!-- It might not have gotten clear that you only had one interview with Aniwaa
before, maybe make this more clear in the Conceptualization part? Also, would
directly name "Dr. Owusu Obeng" here and leave out the second sentence -->
consultation, I again talked to Dr. Aniwaa Owusu Obeng, who I also interviewed
for the Annotation Interface's initial conceptualization and feature
  prioritization.

### Setup

The consultation was set up as a roughly hour-long video call and initially
<!-- On which date? Might not be super important, but is usually given; you
can also add this as the last sentence of this part (e.g., "The testing was
conducted on ...") -->
accompanied by presentation slides. To start off, I briefly reintroductioned
<!-- Can you provide the slides as Appendix? -->
what the Annotation Interface is and aims to accomplish, and explained how it
fits into the PharMe system.

The main part of the consultation revolved around use case testing. Instead of
merely presenting the application, I chose to have the expert use the
Annotation Interface in real scenarios to get more comprehensive feedback and
explore aspects that might otherwise have been missed.
<!-- Would switch the paragraph above and below; could start below with "Before
starting the testing..." and then you can directly explain the scenarios after the
paragraph above -->

Before introducing the testing scenarios, I explained the aims, focus and
process of the testing and asked the expert to

- think out loud and mention anything that is unclear, and
- focus on fundamental functionality, rather than suggestions to improve the
  visual interface
<!-- again, would try to formulate this inline (e.g., with "(1)...(2)") -->

\noindent during the testing process. In addition, I reminded them that the
testing is not meant to test them, but the Annotation Interface as an
application, to ensure a comfortable environment.

The testing consisted of the expert working through the following four scenarios
that I chose to reflect real use cases with increasing complexity and to
<!-- You already mentioned the "real use cases"; could shorten by saying "four
scencarios with increasing complexity, to progressively explore (?)..." -->
progressively disclose the Annotation Interface's features:

1. Check when \gls{cpic}'s \glspl{guideline} have last been updated on the
   Annotation Server and update them.
2. Find the existing patient-friendly drug class \gls{annotation} for a specific
   drug.
3. Create a new \gls{recommendation} \gls{brick} that uses a placeholder.
4. Create an \gls{annotation} with the new \gls{brick}.
<!-- Here, I really like the enumeration :) -->

During and after the testing we discussed various aspects of the Annotation
Interface and how it might evolve in future versions.

### Results

The \glsa{pgx} expert perceived the Annotation Interface as overall "very
user-friendly" and a "great annotation tool", and learned to use the interface
quickly and without apparent confusion. They mentioned liking the display of
\gls{cpic} data, explicitly stating this would avoid the discomfort of "having
to use two screens" in the curation and research process, i.e., one with the
<!-- Would be great to have a screenshot of this in the implementation part,
especially if it is such a good feature :) -->
annotation tool and one with the corresponding sources. In this context, the
expert also expressed it would be useful to additionally include findings from
sources other than \gls{cpic}, such as publications of the \glsa{dpwg}
(\gls{dpwg}), another resource for \gls{pgx} guidelines
[@pharmgkb_university_dpwg_nodate].
<!-- Same thing about institution names in source as author (as before) :) -->

On their first contact with \glspl{brick}, the expert quickly made me aware of
their perceived similarity between \glsa{brick}s and a system they were already
familiar with. This system is made by the company Epic and is, for example, used
<!-- Company and system are called Epic; might be confusing to name the company here,
would rather explain it as the electronic health record system -->
by physicians to create clinical notes based on so called *SmartPhrases*:
templates with placeholders for data such as a patient's information that are
automatically filled out with respect to the patient they are used for.
According to the expert, it is likely that a user of the Annotation Interface
would already be familiar with Epic's concept of templates.

Additionally, the expert mentioned they would like having a way of creating
names for \glspl{brick} or having an automatic identifying number assigned to
them for easier referencing, explaining that someone working with the Annotation
Interface will memorize the numbers over time. This reference could then be used
to efficiently find \glsa{brick}s when creating \glspl{annotation}.

While working with the interface to edit \glspl{annotation} (as depicted in
figure \ref{anni-annotation}), the expert remarked that a search bar should be
incorporated where the draggable \glspl{brick} are listed. They explained this
would to make it easier to find \glsa{brick}s by their content or the name or
number introduced above, saying that a search bar would be essential in keeping
the work flow efficient once a large number of \glsa{brick}s has been defined.

During the final part of the video call, the expert and I discussed various
features that would be needed if PharMe was to be taken into a real production
setting with real users. These features include:

- Seeing a log of what \gls{cpic} \glspl{guideline} have changed before updating
  them and having the option to update only specific guidelines.
  <!-- Ah, I guess this answers my "fetching and pushing" question from the
  part before, together with "staging and reviewing"! -->
- Keeping a revision history of all data that is presented to users. The expert
  emphasized the need for this by explaining the scenario of receiving a
  complaint about data from a specific day.
  <!-- Idea: Maybe also with reference to the guideline version used? -->
- Implementing staging and reviewing phases into the administration of
  \glspl{annotation}. This would allow for staged data to be reviewed by other
  curators before making it onto the live application where it is presented to
  users.
- Providing curators with a summary page of all data that will be presented to
  users.

Concluding our discussion, the expert emphasized the Annotation Interface's
value to the curation and research process of a service like PharMe, emphasizing
on its efficiency and support of multiple languages, and strongly encouraged its
further development.
<!-- NICE :D -->
<!-- In general, I really like this chapter and your summmary of feedback :) -->
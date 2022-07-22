## Expert testing \label{ch-testing}

To test the Annotation Interface's usability and how it meets its goals of
improving the process of curating, researching and administering
\glspl{annotation} for PharMe, I set up a consultation with Dr. Aniwaa Owusu
Obeng, an expert of \glspl{pgx}.

### Setup

The consultation was set up as a roughly hour-long video call and was initially
accompanied by presentation slides supporting the introduction and explanation
of the testing process. To start off, I briefly reintroduced what the Annotation
Interface is and aims to accomplish, and explained how it fits into the PharMe
system. The testing was conducted on July 12, 2022.

Before starting, I explained the aims, focus and process of the testing and
asked the expert to (1) think out loud and mention anything that is unclear, and
(2) focus on fundamental functionality, rather than suggestions to improve the
visual interface, during the testing process. In addition, I reminded them that
the testing is not meant to test them, but the Annotation Interface as an
application, to ensure a comfortable environment.

The main part of the consultation revolved around use case testing. Instead of
merely presenting the application, I chose to have the expert use the Annotation
Interface in real scenarios to get more comprehensive feedback and explore
aspects that might otherwise have been missed.

I chose the following scenarios for increasing complexity and to progressively
explore the Annotation Interface's features:

1. Check when \gls{cpic}'s \glspl{guideline} have last been updated on the
   Annotation Server and update them.
2. Find the existing patient-friendly drug class \gls{annotation} for a specific
   drug.
3. Create a new \gls{recommendation} \gls{brick} that uses a placeholder.
4. Create an \gls{annotation} with the new \gls{brick}.

During and after the testing we discussed various aspects of the Annotation
Interface and how it might evolve in future versions.

### Results

The \glsa{pgx} expert perceived the Annotation Interface as overall "very
user-friendly" and a "great annotation tool", and learned to use the interface
quickly and without apparent confusion. They mentioned liking the display of
\gls{cpic} data, explicitly stating this would avoid the discomfort of "having
to use two screens" in the curation and research process, i.e., one with the
annotation tool and one with the corresponding sources. In this context, the
expert also expressed it would be useful to additionally include findings from
sources other than \gls{cpic}, such as publications of the \glsa{dpwg}
(\gls{dpwg}), another resource for \gls{pgx} guidelines
[@pharmgkb_university_dpwg_nodate].

On their first contact with \glspl{brick}, the expert quickly made me aware of
their perceived similarity between \glsa{brick}s and a system they were already
familiar with. This system is made by the company *Epic*
[@epic_systems_corporation_epic_nodate] and is, for example, used by physicians
to create clinical notes based on so called *SmartPhrases*: templates with
placeholders for data such as a patient's information that are automatically
filled out with respect to the patient they are used for. According to the
expert, it is likely that a user of the Annotation Interface would already be
familiar with Epic's concept of templates.

Additionally, the expert mentioned they would like having a way of creating
names for \glspl{brick} or including an automatic identifying number assigned to
them for easier referencing, explaining that someone working with the Annotation
Interface will memorize the numbers over time. This reference could then be used
to efficiently find \glsa{brick}s when creating \glspl{annotation}.

While working with the interface to edit \glspl{annotation} (as depicted in
Figure \ref{anni-annotation}), the expert remarked that a search bar should be
incorporated where the draggable \glspl{brick} are listed. They explained this
would make it easier to find \glsa{brick}s by their content or the name or
number introduced above, saying that a search bar would be essential in keeping
the work flow efficient once a large number of \glsa{brick}s has been defined.

During the final part of the video call, the expert and I discussed various
features that would be needed if PharMe was to be taken into a clinical setting
with real users. These features include:

- Seeing a log of what \gls{cpic} \glspl{guideline} have changed before updating
  them and having the option to update only specific guidelines.
- Keeping a revision history of all data that is presented to users. The expert
  emphasized the need for this by explaining the scenario of receiving a
  complaint about data from a specific day.
- Implementing staging and reviewing phases into the administration of
  \glspl{annotation}. This would allow for staged data to be reviewed by other
  curators before making it onto the live application where it is presented to
  users.
- Providing curators with a summary page of all data that users will have access
  to.

Concluding our discussion, the expert emphasized the Annotation Interface's
value to the curation and research process of a service like PharMe, emphasizing
on its efficiency and support of multiple languages, and strongly encouraged its
further development.

# Discussion

The implemented Annotation Interface provides the missing infrastructure to
allow curators to administer the Annotation Server's external data as well as to
create, view, update and delete their \glspl{annotation} through a web
interface. This eliminates the need for both the Google Sheet and for a second
party involved in data administration and thereby solves the Annotation Server's
problem of high communication complexity.

With \glspl{annotation} inherently created on top of \gls{cpic} guidelines, the
problem of mismatches between them disappears. Additionally, since \gls{cpic}
guidelines are accessible to curators right in the Annotation Interface, the
time they have to spend on research is reduced, making the overall process more
efficient.

The modularity of \glspl{annotation} introduced by limiting them to be
combinations of \glspl{brick} brings multiple advantages.

Having a finite number of options in creating \gls{annotation} texts ensures
consistency between \glspl{annotation} without needing to copy and paste text or
risking human errors such as misspelling. This is particularly relevant when
there is more than one person curating \glspl{annotation}. The limited options
also make the curation process more straightforward once the initial
\glspl{brick} have been defined, which has further reduces time requirements.

All \gls{annotation} texts being made up of a finite number of \glspl{brick}
also simplifies future support for multiple languages. A language expert can be
consulted once to translate all \glsa{brick}s into the respective language. With
\glsa{brick}s defined in this language, all \glspl{annotation} are subsequently
also translated and the curating party can create and update \glspl{annotation}
for this language without having to know it themselves; simply by creating them
  in their own language.

Finally, the Annotation Interface has been implemented for modularity and
flexibility, making it provide relevant requirements towards maintainability and
extensibility for future use and development.

Given the above points, the Annotation Interface meets its aim of improving the
process of researching, curating and administering patient-oriented,
multilingual \glsa{pgx} information for experts, while solving the discussed
problems of the Annotation Server. These statements are supported by \glsa{pgx}
expert Dr. Aniwaa Owusu Obeng, who emphasized them in the conducted testing.

Beyond the scope of what I have implemented in the context of this thesis, there
is sizable room for further development of both the Annotation Interface, as
well as PharMe as a whole. The following sections will discuss topics for future
work and their priorities in different scenarios.

## Future work

A list of minor features and changes to implement next into the Annotation
Interface can be found within PharMe's GitHub issues labeled `P: Annotation
Interface`. This list includes, for example, the naming of and searching for
\glspl{brick} that was suggested by the expert while testing the application in
chapter \ref{ch-testing} as well as some items regarding configuration and
general robustness of the Annotation Interface. In the following, I will go into
detail about future work beyond these minor features and changes, i.e. features
to consider in implementing PharMe for more sophisticated testing or clinical
environments.

A major feature I conceptualized for the Annotation Interface in chapter
\ref{ch-concept} is to employ techniques of natural language processing, to
provide suggestions for which \glspl{brick} to use for an \gls{annotation} based
on data from an external source such as \gls{cpic}. This was outside of the
scope of this thesis, since creating the now existing infrastructure was
necessary first to make the automated suggestions viable and useful. Should
automated suggestions be implemented in the future, related work such as
PGxCorpus [@legrand_pgxcorpus_2020] may be useful to leverage for training the
underlying natural language processing model.

Regarding future work around the Annotation Interface's user experience, the
similarity between \glspl{brick} and Epic's *SmartPhrases* that was recognized
in chapter \ref{ch-testing} should be taken into consideration. Since
*SmartPhrases* are a tested concept that has already been implemented and is
being used in clinical settings, they may offer improved or additional solutions
to the similar problems the Annotation Interface aims to solve. Additionally, a
user who is already familiar with *SmartPhrases* may be able to more easily
learn the concept of \glsa{brick}s by being made aware of the similarity.

In PharMe's current implementation, the Annotation Server's data structure only
supports one language and the smartphone application's user interface is only
available in English. To have the infrastructure the Annotation Interface
provides towards supporting multiple languages contribute value to PharMe, these
other parts of the system need to be adjusted accordingly.

Moreover, PharMe currently leverages only one external \gls{pgx} resource. To
further assist the research process of curating \glspl{annotation}, implementing
additional sources such as \gls{dpwg} is another important feature for the
Annotation Interface as well as PharMe as a whole. With PharMe offering
additional data from more sources, the Annotation Interface also gains
additional value as the system that is used to manage possible conflicts or
inconsistencies between the sources.

Lastly, there is a gap in PharMe's functionality that needs to be bridged for it
to be usable in a clinical setting. Currently, all data modifications made
through the Annotation Interface immediately appear on the Annotation Server and
are thereby available for users. This is, as also brought up by the consulted
\glsa{pgx} expert, not viable in a clinical setting - especially for a health
service like PharMe. To avoid human error and provide the crucial layer of
certainty in correctness of the information that is presented to users, the
production-related features of staging and reviewing changes, keeping a revision
history of presented data and providing change logs for external data updates
are essential.

## Prioritization

The \glsa{pgx} expert I consulted to conceptualize, prioritize, and test
features of the Annotation Interface has expressed high interest in the feature
of employing natural language processing for further automation, yet prioritized
it lower than the other features I explained. These other features are
prioritized according to the setting PharMe is to be used in.

Should PharMe be used in more sophisticated user testing and studies, the
support for multiple languages is of highest priority. The most important
additional languages to support would be German for testing at HPI in Germany
and Spanish for testing at the Icahn School of Medicine at Mount Sinai in New
York where tests would also be conducted with Hispanic population.

To use PharMe in a clinical setting with users having independent and
unsupervised access to the data presented through the smartphone application,
the presented production-related features are of highest priority.

Implementing \gls{dpwg} or other \gls{pgx} resources as additional external data
has also been highly prioritized by the consulted \glsa{pgx} expert for any
usage setting, though this was regarded as less important than the discussed
setting-specific features.

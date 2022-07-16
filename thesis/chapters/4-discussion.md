# Discussion

According to \glsa{pgx} expert Dr. Aniwaa Owusu Obeng, the Annotation Interface
in its current state meets its research aim of facilitating the research and
curation process of patient-oriented \glspl{annotation} for PharMe. In addition,
it provides crucial infrastructure towards making PharMe sustainably available
in multiple languages. I have implemented the Annotation Interface for
modularity and flexibility, making it provide relevant requirements towards
maintainability and extensibility for future use and development.

Beyond the scope of what I have implemented in the context of this thesis, there
is sizable room for further development of both the Annotation Interface, as
well as PharMe as a whole. A list of the next minor features and changes to
implement into the Annotation Interface can be found within PharMe's GitHub
issues labeled `P: Annotation Interface`. This list, for example, includes the
naming of and searching for \glspl{brick} that was suggested by the expert while
testing the application in chapter \ref{ch-testing}. In the following, I will go
into detail about future work beyond these minor features and changes.

## Future work

A major feature I conceptualized for the Annotation Interface in chapter
\ref{ch-concept} is to employ techniques of natural language processing to
provide suggestions for which \glspl{brick} to use for an \gls{annotation} based
on data from an external source such as \gls{cpic}. This feature has been left
out of the scope of this thesis, since creating the now existing infrastructure
was necessary first to make the automated suggestions viable and useful. The
\glsa{pgx} expert I consulted to conceptualize, prioritize and test features of
the Annotation Interface has expressed high interest in this feature, yet
prioritized it lower than the other features I will explain hereafter. Should
automated suggestions be implemented in the future, related work such as
PGxCorpus [@legrand_pgxcorpus_2020] may be useful to leverage for training the
underlying natural language processing model.

Regarding future work around the Annotation Interface's user experience, the
similarity between \glspl{brick} and Epic's *SmartPhrases* that was recognized
in chapter \ref{ch-testing} should be taken into consideration. A user who is
already familiar with *SmartPhrases* may benefit from this similarity while
learning the Annotation Interface and its concepts.

With the current state of PharMe as a system, the infrastructure the Annotation
Interface provides towards supporting multiple languages does not yet contribute
value to PharMe, since it is only available in the creation and administration
of \glspl{brick}. Implementing the support of multiple languages into the other
parts of the PharMe system, and connecting them to what the Annotation Interface
already provides, is a feature highly prioritized by the consulted \glsa{pgx}
expert.

Similarly to how PharMe currently supports only one language, it leverages only
one external \gls{pgx} resource. To further assist the research process of
curating \glspl{annotation}, implementing additional sources such as \gls{dpwg}
is another high priority feature for the Annotation Interface as well as PharMe
as a system. With PharMe offering additional data from more sources, the
Annotation Interface also gains additional value as the system that is used to
manage possible conflicts or inconsistencies between the sources.

Lastly, as presented in the final section of chapter \ref{ch-testing}, there is
a gap in functionality that needs to be bridged before PharMe could be taken
into a real production setting with real users relying on it. Currently, all
data modifications made through the Annotation Interface immediately appear on
the Annotation Server and are thereby available for users. This is, as also
brought up by the consulted \glsa{pgx} expert, not viable in a production
setting - especially for a health service like PharMe. To avoid human error and
provide the crucial layer of certainty in correctness of the information that is
presented to users, the production-related features introduced in
\ref{ch-testing} are of highest priority if PharMe is to be taken into such a
setting.

## Boundary between Annotation Server and Interface

- anni and AS should ideally not be separate (was good in my case anyways)
- mention multi-language support, staging, additional sources

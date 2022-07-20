# Discussion

<!-- Would add a general discussion here regarding the problems you
identified in the beginning and how (well) you were able to solve them, before
leading over to the expert feedback; or you put these into separate sections
(also all parts regarding future work). Either way, you need a short overview
what sections the reader can expect in this chapter, I only expected future
work from this chapter introduction and was surprised that there was a section
after Future Work ^^ -->
<!-- You can also mention your extensible architechture already (as I see, the
last sentence of this paragraph); then lead over to future work from expert
feedback (just an idea) -->
According to \glsa{pgx} expert Dr. Aniwaa Owusu Obeng, the Annotation Interface
in its current state meets its research aim of facilitating the research and
<!-- Maybe "already meets" because there are some things that might be better?
Would directly follow up that for clinical use some extensions need to be
implemented -->
curation process of patient-oriented \glspl{annotation} for PharMe. In addition,
it provides crucial infrastructure towards making PharMe sustainably available
<!-- Maybe rather "the functionality" rather than "crucial infrastructure"? -->
in multiple languages. I have implemented the Annotation Interface for
modularity and flexibility, making it provide relevant requirements towards
maintainability and extensibility for future use and development.

Beyond the scope of what I have implemented in the context of this thesis, there
is sizable room for further development of both the Annotation Interface, as
well as PharMe as a whole. A list of minor features and changes to
implement next into the Annotation Interface can be found within PharMe's GitHub
issues labeled `P: Annotation Interface`. This list includes, for example, the
naming of and searching for \glspl{brick} that was suggested by the expert while
testing the application in chapter \ref{ch-testing}. In the following, I will go
into detail about future work beyond these minor features and changes.
<!-- Not sure if I would call them minor features, what do you mean by minor?
Would add all features you talked about in the thesis in text below (you can just
shortly list them); would add the issues explanation in the end of the next part
(together with the proposed priorization, maybe you can connect these parts) -->

## Future work

A major feature I conceptualized for the Annotation Interface in chapter
\ref{ch-concept} is to employ techniques of natural language processing, to
provide suggestions for which \glspl{brick} to use for an \gls{annotation} based
on data from an external source such as \gls{cpic}. This was
of the scope of this thesis, since creating the now existing infrastructure
was necessary first to make the automated suggestions viable and useful. The
\glsa{pgx} expert I consulted to conceptualize, prioritize, and test features of
the Annotation Interface has expressed high interest in this feature, yet
prioritized it lower than the other features I will explain hereafter. Should
<!-- Would first explain all future work and then add the priorization in the end,
otherwise it is difficult to remember -->
automated suggestions be implemented in the future, related work such as
PGxCorpus [@legrand_pgxcorpus_2020] may be useful to leverage for training the
underlying natural language processing model.
<!-- What about this one? (Might not fit though, I think I sent this to you before)
https://academic.oup.com/jamiaopen/article/5/2/ooac044/6594967 -->

Regarding future work around the Annotation Interface's user experience, the
similarity between \glspl{brick} and Epic's *SmartPhrases* that was recognized
in chapter \ref{ch-testing} should be taken into consideration. A user who is
already familiar with *SmartPhrases* may benefit from this similarity while
learning the Annotation Interface and its concepts.
<!-- Should be taken into consideration how exactly? You do not really state
what the Future Work would be here :) -->

With the current state of PharMe as a system, the infrastructure the Annotation
Interface provides towards supporting multiple languages does not yet contribute
value to PharMe, since it is only available in the creation and administration
of \glspl{brick}. Implementing the support of multiple languages into the other
parts of the PharMe system, and connecting them to what the Annotation Interface
already provides, is a feature highly prioritized by the consulted \glsa{pgx}
expert.
<!-- I do not fully understand this; you basically say it would need to also
translate PharMe's UI? It is a bit confusing, maybe start with the state of
PharMe (only English) in a first sentence -->
<!-- Also, did Aniwaa say why it is highly prioritized? -->

Moreover, PharMe currently leverages only
one external \gls{pgx} resource. To further assist the research process of
curating \glspl{annotation}, implementing additional sources such as \gls{dpwg}
is another high priority feature for the Annotation Interface as well as PharMe
as a whole. With PharMe offering additional data from more sources, the
Annotation Interface also gains additional value as the system that is used to
manage possible conflicts or inconsistencies between the sources.

Lastly, there is
a gap in functionality that needs to be bridged before PharMe could be taken
into a real production setting with real users relying on it. Currently, all
<!-- First sentence: rather say what needs to be implemented; e.g., "Lastly,
to be usable in a clinical setting, ..." -->
data modifications made through the Annotation Interface immediately appear on
the Annotation Server and are thereby available for users. This is, as also
brought up by the consulted \glsa{pgx} expert, not viable in a production
setting - especially for a health service like PharMe. To avoid human error and
provide the crucial layer of certainty in correctness of the information that is
presented to users, the production-related features explained in
<!-- List them again, do not reference the chapter -->
\ref{ch-testing} are of highest priority if PharMe is to be taken into such a
setting.

<!-- As I stated above, I would remove the priority statements from the paragraphs
above and add a paragraph here that summarizes the  priorities; maybe also connect
to the issues -->

## Boundary between Annotation Server and Interface

During our project, we worked on the Annotation Server throughout various
changes of requirements and of how PharMe provides its users with data.
Development of the Annotation Server began long before the need for human data
administration that the Annotation Interface now handles was recognized.
<!-- Too journalistic; be more on point -->

To preserve the team's existing knowledge about its architecture as well as the
Annotation Server's ability to work without the Annotation Interface, and to
allow myself to work independently for the context of this thesis, I developed
the Annotation Interface as a second and entirely distinct web application. This
enabled me to explore the various features and concepts I examined in this
thesis.
<!-- I do not get the "existing knowledge" part; also, couldn't you have forked the
Annotation Server and  implemented it there (if the answer is "no", this would
be a good argument)? "working independently" is rather a weak argument, would use
something technical (you mentioned different tech stacks?) or that it would make
sense in general to have it separate since it could be used in other use cases (if
this applies; would be interesting to discuss also! If it was a separate service,
could the below part be still achieved?) -->

Now that requirements and features for PharMe's data providing backend are much
more clear, I strongly encourage considering rebuilding the Annotation Server
<!-- What are these requirements that changed? Did you explain this? Are this the
problems you noted in the beginnin? -->
and Annotation Interface as one joint web application if PharMe is to be
developed further in the future. The argument for this becomes especially clear
when considering the features I discussed in the previous section. Implementing
<!-- It becomes not clear to me, to be honest ^^ with the sentence afterwards it
gets more clear; would put this first and be concrete about which features -->
them would, with the current boundary between the Annotation Server and
Interface, inherently lead to building the same concepts, such as the data
structure to support multiple languages, into both systems. I regard avoiding
the resulting repetition and complexity as vital in keeping maintainability and
extensibility of the system as a whole.

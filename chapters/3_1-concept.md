## Conceptualization \label{ch-concept}

The devised concept for the Annotation Interface closes the gap between the
curating party and the Annotation Server by providing the missing infrastructure
to allow curators to administer external data, as well as to create, view,
update and delete their \glspl{annotation} live on the Annotation Server through
a web interface. Additionally, external data such as \gls{cpic} guidelines that
curators use in their research are made accessible right in the same interfaces
that are used to create and maintain \glspl{annotation}.

The second major feature of the concept for the Annotation Interface revolves
around modularizing \glspl{annotation}. This modularization is achieved by
strictly limiting the creation of \glspl{annotation} to combinations of
\glspl{brick}: predefined textual components or templates that adjust to the
\gls{annotation} they are used in. One such \gls{brick} might be

> `#drug.name` may not be the right medication for you.

\noindent where `#drug.name` is a placeholder that will be resolved to the name
of the drug the \glsa{brick} is annotating. Aside from placeholders,
\glsa{brick}s offer an interface to define their texts in multiple languages,
allowing the same \glsa{brick}s to be used to create \glspl{annotation} for all
supported languages.

Finally, the concept proposes employing techniques of natural language
processing for picking suitable \glspl{brick} based on the corresponding
\gls{cpic} guidelines. A model trained to infer \glspl{brick} accordingly
presents curators with suggestions for which \glsa{brick}s to use in creating an
\gls{annotation}. Figure \ref{nlp-mockup} shows a mock-up of a user interface
with the natural language processing model's suggestion of trained \glspl{brick}
based on a \gls{cpic} guideline [@lee_clinical_2022]. In this example, the user
clicks on the first \gls{brick} to get a visual explanation of why it was
suggested.

![Conceptualized suggestion of \glspl{brick} based on \gls{cpic} guideline
(left) and visual explanation of why one of the \glspl{brick} was suggested
(right) \label{nlp-mockup}](images/nlp-mockup.pdf)

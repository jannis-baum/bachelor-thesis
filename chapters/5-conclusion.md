# Conclusion

This thesis explored how to support field experts in their process of
researching, curating and maintaining informative \gls{pgx} data, as well as how
to provide this data in multiple languages. The presented methods focus on the
service PharMe: a patient-oriented resource for \glsa{pgx} information.

Within this context, I explained PharMe's preexisting approach to data
administration and discussed the related complications, namely its high
communication complexity, susceptibility to human error, and inaccessibility to
the field experts responsible for it. Subsequently, I conceptualized,
implemented and tested the Annotation Interface as a method of solving these
complications while creating the fundamental infrastructure towards
multi-language support. I conducted this work in consultation with an expert in
the field of \glspl{pgx}.

In its presented state, the Annotation Interface fulfills its aim of
facilitating the research and curation process of patient-oriented information
for PharMe. This is primarily achieved by making data administration interactive
  and modularizing the information, which, while increasing its consistency,
  maintainability and curation efficiency, also lays the foundation for the
  desired multi-language support.

By testing the Annotation Interface with the consulted \glsa{pgx} expert, I have
verified its efficacy at meetings its research aim and gained further insights
into what capabilities for data administration would be crucial if PharMe was
taken into a production setting with real users relying on it. Finally, I
illustrated the focus and key aspects of future work on the Annotation Interface
and PharMe's data administration as a whole based on these insights and the
previously made findings.

To reliably and responsibly provide users with data through health-related
informative resources such as PharMe, the need for human supervision in data
administration is apparent. The Annotation Interface as a system and as its
broader concept provides an approach to attend this need for PharMe. The
findings I have made within the context of research for and around the
Annotation Interface comprise relevant insights towards establishing systems to
solve similar problems for other health-related informative resources.

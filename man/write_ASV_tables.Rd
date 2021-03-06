% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/write_ASV_tables.R
\name{write_ASV_tables}
\alias{write_ASV_tables}
\title{Write_ASV_tables}
\usage{
write_ASV_tables(asvtab, taxtab, outname, outdir = "./", samdat = 0)
}
\arguments{
\item{asvtab}{(Required) ASV table generated by DADA2}

\item{taxtab}{(Required) Taxonomy table generated by DADA2}

\item{outname}{(Required) Output base filename (without extension)}

\item{outdir}{(Optional) Output directory. Default="./"}

\item{samdat}{(Optional) Sample phenotype data}
}
\description{
Save outputs of BiMiCo preprocessing steps with consistent naming/file formats. Outputs ASV count matrix, fasta file of ASV sequences, taxonomy table and optionally phenodata.
}
\examples{
write_ASV_tables()
}
\keyword{dada2}
\keyword{processing}
\keyword{read}

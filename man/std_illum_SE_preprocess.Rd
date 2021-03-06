% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/standard_illum_SE_preprocessor.R
\name{std_illum_SE_preprocess}
\alias{std_illum_SE_preprocess}
\title{standard preprocessor for Illumina single-end reads in BiMiCo pipeline}
\usage{
std_illum_SE_preprocess(readfiles, outdir, trim_read_length = 0)
}
\arguments{
\item{readfiles}{(Required) Path to single-end Illumina demultiplexed fastq files}

\item{outdir}{(Required) String specifying output directory for processed files; will be created as subdirectory of input dir.}

\item{trim_read_length}{(Optional) max. length at which to truncate reads. Default = 0 (no truncating)}
}
\description{
UNDER CONSTRUCTION
}
\examples{
std_illum_SE_preprocess()
}
\keyword{dada2}
\keyword{processing}
\keyword{read}

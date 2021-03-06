## TODO: define optional args
#       reads file name not strictly "fastq"!
#       make chimera removal optional, set optional args

#' Create ASV table from filtered 454 reads
#'
#' Given a set of 454 sequencing reads pre-filtered by the 'std_454_preprocess' function, internally generates read error models and outputs chimera-filtered ASV table. ASV table contains ASVs in rows and samples in columns.
#' @param readfiles (Required) Path to 454 quality-filtered fastq files
#' @param mtthread (Required) Boolean, enables multithreading (not recommended in Rstudio)
#' @keywords read processing dada2
#' @export
#' @examples
#' std_454_ASVtab()


std_454_ASVtab <- function(readfiles, mtthread){


  # store filtered fastq file names
  ffqs <- sort(
    list.files(
      readfiles,
      full.names = TRUE
    )
  )

  # extract sample names
  samps <- sapply(
    strsplit(
      basename(ffqs),
      ".fastq"
      ),
    `[`,
    1
  )


# learn error rates: visualization of base calling error model generated for
# sequence classification step

err_fqs <- dada2::learnErrors(ffqs,
                              multithread=mtthread)

#plotErrors(err_fqs, nominalQ=TRUE)

# Merge identical fastq sequences

derp_fqs <- dada2::derepFastq(ffqs,
                              verbose=TRUE)

names(derp_fqs) <- samps

# Apply DADA inference

dada_fqs <- dada2::dada(derp_fqs,
                        err=err_fqs,
                        multithread=mtthread,
                        HOMOPOLYMER_GAP_PENALTY=-1,
                        BAND_SIZE=32,
                        selfConsist = FALSE)

# Create ASV table

asvs <- dada2::makeSequenceTable(dada_fqs)

# remove chimeric sequences

asvs.nochim <- dada2::removeBimeraDenovo(asvs,
                                  method="consensus",
                                  multithread=FALSE,
                                  verbose=TRUE)


return(t(asvs.nochim))


}

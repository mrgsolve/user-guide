
library(mrgsolve)
library(dplyr)
library(magrittr)
options(mrgsolve.soloc = "build")
knitr::opts_chunk$set(comment='.')
select <- dplyr::select
filter <- dplyr::filter
eng_mread <- function(options) {
  code <- options$code
  options$code <- NULL
  if(isTRUE(options$eval)) {
    stem <- options$stem
    file <- paste0(stem, ".cpp")
    path <- file.path("inline", file)
    writeLines(text = code, con = path)
    if(isTRUE(options$annot)) {
      annot <- paste0("// ", path)
      code <- c(annot, " ",  code)
    }
  }
  code <- paste0(code, collapse = "\n")
  options$class.source <- "mrgsolvecode"
  options$engine <- "c"
  knitr::engine_output(options, code, '')
}
knitr::knit_engines$set(mread = eng_mread )

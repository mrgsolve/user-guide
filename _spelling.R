library(spelling)

path <- list.files(pattern = "\\.qmd$")

ignore <- readLines("WORDLIST")

spell_check_files(path,ignore)

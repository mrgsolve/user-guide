library(spelling)

path <- list.files(pattern = "\\.qmd$")

ignore <- readLines("WORDLIST")

if(!dir.exists("spelling-rmd")) dir.create("spelling-rmd")

newfiles <- file.path("spelling-rmd", paste0(tools:::file_path_sans_ext(path), ".Rmd"))

x <- file.copy(path, newfiles, overwrite=TRUE)

spell_check_files(newfiles, ignore)

unlink("spelling-rmd", recursive=TRUE)


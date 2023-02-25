#Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(stringi)




# Data Import
citations<-stri_read_lines("../data/citations/citations.txt")
citations_txt<-citations_txt <- citations[citations != ""] #may be redo it later
paste(length(citations) - length(citations_txt))
paste(mean(nchar(citations_txt)))

#Data Cleaning
set.seed(1)
sample(citations_txt, 10)
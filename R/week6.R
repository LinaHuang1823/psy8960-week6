#Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(stringi)
library(dplyr)
library(stringr) 


# Data Import
citations<-stri_read_lines("../data/citations/citations.txt")
citations_txt<-citations_txt <- citations[citations != ""] #may be redo it later
paste(length(citations) - length(citations_txt))
paste(mean(nchar(citations_txt)))

#Data Cleaning
set.seed(1)
sample(citations_txt, 10)
citations_tbl <- tibble(line = as.integer(1:length(citations_txt)), cite = citations_txt)%>%
  mutate(cite = str_remove_all(cite, "[\'\"]"))%>%
  mutate(year = str_extract(cite, "\\b\\d{4}\\b"))%>%
  mutate(page_start = str_extract(cite, "\\b\\d+-"))%>% #need to edit later, no- involve 
  mutate(perf_ref = grepl("performance", cite, ignore.case = TRUE))%>%
  mutate(title = sub(".*\\(\\d{4}\\)\\s*\\.?\\s*([^\\.\\)]+)\\)?\\..*", "\\1", cite))%>% #need further edit
  mutate(first_author = str_extract(cite, "(?<=^|, )\\p{Lu}\\p{Ll}+, \\p{Lu}(?=\\.)"))
#need further edit
#mutate(first_author = str_extract(cite, "^[A-Za-z].*?, "))



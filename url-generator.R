### URL generator



example_URL <- "https://www.biblegateway.com/passage/?search=1+Cor+15%3A12-18&version=NIV"

books <- "1 Cor"
chapter <- "15"
verse_range <- "12%3A12-18"


url_generator <- function(book_name = NA,
                          chapter = NA,
                          begin_v = NA,
                          end_v = NA,
                          link_text = NA){
  paste0("<a href=","https://www.biblegateway.com/passage/?search=",
         gsub(" ", "+",book_name),
         "+",
         chapter,
         "%3A",
         begin_v,
         "-",
         end_v,
         ">",
         link_text,
         "</a>"
  )
}

url_generator("2 Corinthians",
              "4",
              "1",
              "2",
              "Meriel's Link")


gsub(" ", "+",book_name)
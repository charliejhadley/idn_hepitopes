fs_deposit_id <- 4015824
deposit_details <- fs_details(fs_deposit_id)

deposit_details <- unlist(deposit_details$files)
deposit_details <-
  data.frame(split(deposit_details, names(deposit_details)), stringsAsFactors = F)

figshare_data <- deposit_details %>%
  filter(name == "HepitopesdatabaseforFigshare.csv") %>%
  select(download_url) %>%
  .[[1]] %>%
  read_csv()

colnames(figshare_data) <- trimws(gsub("(; |[(]|)NS=not specified(|[)])|[(]NS = not specified[)]","",colnames(figshare_data)))

heliotope_df <- figshare_data
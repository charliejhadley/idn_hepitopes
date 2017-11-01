## =============================== License ========================================
## ================================================================================
## This work is distributed under the MIT license, included in the parent directory
## Copyright Owner: University of Oxford
## Date of Authorship: 2016
## Author: Martin John Hadley (orcid.org/0000-0002-3039-6849)
## Academic Contact: Mireia Borrell-Porta 
## Data Source: local file
## ================================================================================

library(DT)
library(shiny)
library("tidyverse")
library("rfigshare")

source("data-processing.R", local = TRUE)

initial_columns <-
  c(
    "HBV protein",
    "Optimal amino acid sequence(s)",
    "HLA restriction(s)",
    "Database",
    "Authors",
    "Title",
    "Journal",
    "Publication year",
    "DOI"
  )

# ## Reorder columns in dataframe by the initial_columns to ensure correct display in selectInput
heliotope_df <- heliotope_df[,order(match(colnames(heliotope_df), initial_columns))]

shinyServer(function(input, output) {
  
  output$HEPITOPES_selected_cols_UI <- renderUI({
    
    selectInput(
      "HEPITOPES_selected_cols",
      label = "Columns to show: ",
      choices = colnames(heliotope_df),
      selected = initial_columns,
      multiple = TRUE,
      width = "100%"
    )
  })
  
  output$HEPITOPES_datatable <- DT::renderDataTable({
    selected_columns <- input$HEPITOPES_selected_cols

    heliotope_df[, selected_columns]},
    rownames = FALSE,
    filter = 'top',
    selection = list(mode = "none"),
    escape = FALSE,
    extensions = c("Responsive","FixedHeader"),
    options = list("language" = list("sSearch" = "Filter:"), fixedHeader = list(header = TRUE))
  )
  
})
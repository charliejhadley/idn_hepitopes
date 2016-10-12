## =============================== License ========================================
## ================================================================================
## This work is distributed under the MIT license, included in the parent directory
## Copyright Owner: University of Oxford
## Date of Authorship: 2016
## Author: Martin John Hadley (orcid.org/0000-0002-3039-6849)
## Academic Contact: Mireia Borrell-Porta 
## Data Source: local file
## ================================================================================

library(shiny)
library(DT)
library(htmltools)

shinyUI(navbarPage(
  tags$head(includeScript("google-analytics.js"),
            tags$style(type="text/css",".navbar .container-fluid, .navbar-collapse {
    padding-left:0;
                       }
                       .navbar-collapse.in {
                       padding-left:30px;
                       }")),
  "",
    tabPanel(
      "Hepitopes Database",
      fluidPage(
        tags$style("overflow-y:scroll; max-height: 100%"),
        wellPanel(p("To use the database, optimise your view by selecting or deleting columns from the 'columns to show' toolbar at the top of the page. Use the up/down arrows at the right of each column header to sort the data, or type your free-text search selection into the box beneath the column header."),"NS=not specified, NA=not available."),
        uiOutput("HEPITOPES_selected_cols_UI"),
        DT::dataTableOutput("HEPITOPES_datatable", width = "100%")
      )
    ),
    tabPanel("About",
             includeMarkdown("App_Description.Rmd")),
  collapsible = TRUE)
)
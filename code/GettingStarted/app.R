
# Setup #######################################################################
library(shiny)
library(kableExtra)

# Define UI ###################################################################
ui <- fluidPage(
  selectInput("dataset", label = "Dataset", choices = ls("package:datasets")),
  verbatimTextOutput("summary"),
  tableOutput("table")
  
)

# Define Server ###############################################################
server <- function(input, output, session) {
  dataset <- reactive({
    dataset <- get(input$dataset, "package:datasets")
  })
  
  output$summary <- renderPrint({
    summary(dataset())
  })
  
  output$table <- renderTable(
    dataset(),
    striped = TRUE,
    hover = TRUE
)
}

# Run App #####################################################################

shinyApp(ui, server)



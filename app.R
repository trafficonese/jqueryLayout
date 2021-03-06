library(shiny)
library(DT)
library(ggplot2)
library(dplyr)
library(plotly)


ui <- shiny::htmlTemplate("www/index.html", document_ = "auto")

server <- function(input, output, session) {

  ## Barchart ############
  output$histo <- renderPlotly( {
    p <- plot_ly(data = mtcars) %>%
      add_bars(x = rownames(mtcars), y = ~mpg, name="Histogramm", color=(~mpg))
    p$elementId <- NULL
    p
  })

  ## Table ############
  output$histoTable <- DT::renderDataTable(server = T, {
    mtcars
  })
  output$histoTable1 <- DT::renderDataTable(server = T, {
  # output$histoTable1 <- renderTable({
    mtcars
  })
}

# Run the application
shinyApp(ui = ui, server = server)


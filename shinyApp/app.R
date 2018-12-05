#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Z-value to P-value"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      numericInput("z", "Z-Value to convert: ", min = -5, max = 5, value = 0)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      textOutput("p")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  output$p <- renderText({
    paste("p = ", pnorm(input$z))
  })
}

# Run the application 
shinyApp(ui = ui, server = server)


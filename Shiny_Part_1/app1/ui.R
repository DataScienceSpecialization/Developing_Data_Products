library(shiny)
shinyUI(fluidPage(
  titlePanel("Hello Shiny!"),
  sidebarLayout(
    sidebarPanel(
      h3("Sidebar")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h2("Hey")
    )
  )
))
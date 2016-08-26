library(shiny)
shinyUI(fluidPage(
  titlePanel("HTML Tags"),
  sidebarLayout(
    sidebarPanel(
      h1("H1 Text"),
      h3("H3 Text"),
      em("Emphasized Text")
    ),
    mainPanel(
      h3("Main Panel Text"),
      code("Some Code!")
    )
  )
))
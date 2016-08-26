library(shiny)
shinyUI(fluidPage(
  titlePanel("Plot Random Numbers"),
  sidebarLayout(
    sidebarPanel(
      numericInput("numeric", "How Many Random Numbers Should be Plotted?", 
                   value = 1000, min = 1, max = 1000, step = 1),
      sliderInput("sliderX", "Pick Minimum and Maximum X Values",
                  -100, 100, value = c(-50, 50)),
      sliderInput("sliderY", "Pick Minimum and Maximum Y Values",
                  -100, 100, value = c(-50, 50)),
      checkboxInput("show_xlab", "Show/Hide X Axis Label", value = TRUE),
      checkboxInput("show_ylab", "Show/Hide Y Axis Label", value = TRUE),
      checkboxInput("show_title", "Show/Hide Title")
    ),
    mainPanel(
      h3("Graph of Random Points"),
      plotOutput("plot1")
    )
  )
))
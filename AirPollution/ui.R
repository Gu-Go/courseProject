#
# This app allows users to manipulate data and to see the
# results of their manipulations with a plot.  The data that
# is used in this app is from R airquality datasets.
#
# The airquality is a data frame with 154 observations on
# 6 variables (Ozone, Solar.R, Wind, Temp, Month, Day)
#
# To use the app:
# 1. Select a specific Month or "All months"
# 2. Check the variable that will be plotted with Temperature
# 3. Check the box "Display data based on the Wind value" to
#    see data plotted based on the Wind size
# 4. Check the box "Add the Regression Line" to view the the line
#
# The outcome of the plot shows:
# 1. If there is any relationship
# between Ozone and Temperature or Solar.R and Temperature
# 2. The high and low temperature in the selected time period
# 3. The difference between the high and low temperature in the
# selected time period
#

library(shiny)
data("airquality")

shinyUI(fluidPage(
  titlePanel("New York Air Quality Measurements"),

  # Input data selection
  sidebarLayout(
    sidebarPanel(
       selectInput("months",
                   label = "Choose a month or all months",
                   choices=list("All months"=1,"May"=5,"June"=6,"July"=7,"August"=8,
                                "September"=9),
                   selected = 1),
       radioButtons("op1","Plot Temperature with",
                    c("Ozone" = "oz", "Solar.R" = "so")),
       checkboxInput("wWind", "Display data based on wind value", value=TRUE),
       checkboxInput("reg", "Add the Regression Line", value=TRUE)
    ),

    # Show a plot of the generated distribution
    mainPanel(
            h3("Graph of New York Air Quality for 1973"),
            plotOutput("distPlot"),
            h5(textOutput("out1")),
            h5(textOutput("out2")),
            h5(textOutput("out3"))
    )
  )
))

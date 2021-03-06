# Developing Data Products Course Project

This app allows users to manipulate data and to see the results of their manipulations with a plot.  
The data that is used in this app is from R airquality datasets.

The airquality is a data frame with 154 observations on 6 variables (Ozone, Solar.R, Wind, Temp, Month, Day)

To use the app, first download the two files in the AirPollution folder.  Open them with RStudio.  In RStudio, click on the green triangle Run App button, right above the code window to run the app.  
Then, following the steps below to specify the options:
1. Select a specific Month or "All months"
2. Check the variable that will be plotted with Temperature
3. Check the box "Display data based on the Wind value" to see data plotted based on the Wind size
4. Check the box "Add the Regression Line" to view the the line

The outcome of the plot shows:
1. The relationship between Ozone and Temperature or Solar.R and Temperature in the selected time period
2. The highest and lowest temperature in the selected time period
3. The difference between the highest and lowest temperature in the selected time period

The app presentation file can be found at:  http://rpubs.com/EllaDataScience/ProjectPresentation 

The app is running at:  https://elladatascience.shinyapps.io/airpollution/

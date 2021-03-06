Course Project Presentation for Developing Data Products
========================================================
author: Ella
date: 07-07-2017
autosize: true

New York Air Quality Analysis
========================================================

<h2>This app explores the relationship between Temperature and Ozone level or Solar Radiation level.   </h2>

- Users view the result in a plot.
- The data used in this app is from R airquality datasets, which has 154 observations and 6 variables (Ozone, Solar.R, Wind, Temp, Month, Day)
- The dataset includes data from May to September of 1973

**The complete source code is located at https://github.com/Gu-Go/courseProject.git

**The app is located at: https://elladatascience.shinyapps.io/airpollution/

To Use the App
========================================================
- Select a specific Month or "All months"
- Check the variable that will be plotted with Temperature
- Check the box "Display data based on the Wind value" to view data plotted based on the Wind size
- Check the box "Add the Regression Line" to view the the line
![UI Opt](uiOpt.png)

The outcome of the plot shows in a selected time period
========================================================
- The relationship between Ozone and Temperature or Solar.R and Temperature
- The highest and lowest temperature and their difference
![my image](outputfile.png)


Code for a Plot
========================================================

```r
library(ggplot2)
ggplot(airquality,aes(x=Ozone,y=Temp,color=Month))+
geom_point(size=5) + geom_smooth(method="lm")
```

![plot of chunk unnamed-chunk-1](courseProjectPresentation-figure/unnamed-chunk-1-1.png)

library(shiny)
library(ggplot2)
data("airquality")

shinyServer(function(input, output) {
   output$distPlot <- renderPlot({
        month <- input$months
        if (month!="1")
           df <- airquality[airquality$Month==month, ]
        else
           df <- airquality
        if (input$op1=="oz" && !input$wWind && !input$reg)
           ggplot(df,aes(x=Ozone,y=Temp,color=Month))+
                geom_point(size=5)
        else if (input$op1=="oz" && !input$wWind && input$reg)
                ggplot(df,aes(x=Ozone,y=Temp,color=Month))+
                    geom_point(size=5) + geom_smooth(method="lm")
        else if (input$op1=="oz" && input$wWind && !input$reg)
                 ggplot(df,aes(x=Ozone,y=Temp,color=Month))+
                   geom_point(aes(size=Wind)) +
                   scale_size_continuous(range = c(3, 7))
        else if (input$op1=="oz" && input$wWind && input$reg)
                ggplot(df,aes(x=Ozone,y=Temp,color=Month))+
                   geom_point(aes(size=Wind))+geom_smooth(method="lm")+
                   scale_size_continuous(range = c(3, 7))
        else if (input$op1=="so" && !input$wWind && !input$reg)
                ggplot(df,aes(x=Solar.R,y=Temp,color=Month))+
                   geom_point(size=5)
        else if (input$op1=="so" && !input$wWind && input$reg)
                ggplot(df,aes(x=Solar.R,y=Temp,color=Month))+
                   geom_point(size=5)+geom_smooth(method = "lm")
        else if (input$op1=="so" && input$wWind && !input$reg)
                ggplot(df,aes(x=Solar.R,y=Temp,color=Month))+
                   geom_point(aes(size=Wind))+
                   scale_size_continuous(range = c(3, 7))
        else
                ggplot(df,aes(x=Solar.R,y=Temp,color=Month))+
                   geom_point(aes(size=Wind))+geom_smooth(method="lm")+
                   scale_size_continuous(range = c(3, 7))
        })

        output$out1 <- renderText({
           month <- input$months
           if (month!="1")
                df <- airquality[airquality$Month==month, ]
           else
                df <- airquality
           highTemp <- max(unlist(df$Temp),na.rm = TRUE)
           lowTemp <- min(unlist(df$Temp),na.rm = TRUE)
           paste("The highest temperature for the selected
                 time frame is: ", highTemp,
                 "The lowest temperature for the selected
                 time frame is: ", lowTemp)
        })

        output$out2 <- renderText({
                month <- input$months
                if (month!="1")
                        df <- airquality[airquality$Month==month, ]
                else
                        df <- airquality
                highTemp <- max(unlist(df$Temp),na.rm = TRUE)
                lowTemp <- min(unlist(df$Temp),na.rm = TRUE)
                diffTemp = highTemp - lowTemp
                paste("The difference is: ", diffTemp)
        })
})

ui = fluidPage(
  fluidRow(column(width = 9,
                  lineChartOutput("mychart")),
           column(width = 3,
                  sliderInput("sinePhase", 
                              "Sine phase", 
                              min = -180, 
                              max = 180, 
                              value = 0, 
                              step = 10,
                              animate = animationOptions(interval = 100, 
                                                         loop = TRUE)),
       
                  sliderInput("sineAmplitude", 
                              "Sine amplitude", -2, 2, 1, 
                              step = 0.1,
                              animate = animationOptions(interval = 100, 
                                                         loop = TRUE)))))

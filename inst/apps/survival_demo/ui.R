library(teachingApps)

ui = navbarPage(title = 'Survival Function',
                collapsible = T, 
                position = 'fixed-top',
                theme = shinythemes::shinytheme(theme = getShinyOption("theme")),
                header = list(tags$head(includeCSS(getShinyOption("CSS"))),
                              tags$head(includeCSS("www/custom.css"))),
                footer = HTML(teachingApps::signature(getShinyOption("appName"))),
                
tabPanel(h4('Properties'),
         mainPanel(uiOutput('survdemo'), class = 'shiny-text-output', width = 12)),

tabPanel(h4('Computing Values in R'),
         mainPanel(uiOutput('survr'), class = 'shiny-text-output', width = 12)),
                
tabPanel(h4('ShinyApp'),                
  sidebarLayout( 
    sidebarPanel(
      shinyAce::aceEditor(fontSize = 16, 
                          wordWrap = T,
                          outputId = "relplot", 
                          mode = "r", 
                          theme = "github", 
                          height = "450px", 
                          value = 
"par(family = 'serif',mar = c(4,6,2,1))

curve(
expr = 1-pnorm(x, mean = 3, sd = 1),
xlab = 'Time, t',
ylab = expression(S(t)[Normal]),
ylim = c(0,1),
xlim = c(0,6),
lwd = 3,
lty = 3,
col = 4,
cex.lab = 1.5,
cex.axis = 1.5,
las = 1)"),

        actionButton("evalrel", h4("Evaluate"), width = '100%')),
        
        mainPanel(plotOutput("plotrel", height = "600px")))))
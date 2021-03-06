#' Function Title
#'
#' @description Description
#'
#' @importFrom shinythemes shinytheme
#' @importFrom shinyAce aceEditor
#' @importFrom shiny fixedPanel uiOutput HTML htmlOutput sidebarLayout renderUI titlePanel
#' @importFrom shiny brushedPoints brushOpts br hr checkboxInput div
#' @importFrom shiny fixedPanel uiOutput HTML htmlOutput sidebarLayout tags renderUI 
#' @importFrom shiny sidebarPanel mainPanel fluidPage navbarPage tabPanel h2 h4
#' @importFrom shiny tabsetPanel withMathJax updateSelectInput updateSliderInput
#' @importFrom shiny updateNumericInput strong stopApp shinyAppDir
#' @importFrom shiny radioButtons clickOpts runApp helpText h1 h5 h6 includeCSS
#' @importFrom shiny includeScript includeMarkdown inputPanel isolate nearPoints
#' @importFrom shiny observe observeEvent reactiveValues reactive renderText selectInput
#' @importFrom shiny actionButton selectizeInput plotOutput renderPlot fillRow fillCol
#'
#'
#' @param theme Character string naming a color theme bootswatch color theme. Must be one of the themes that can be used in \code{shinythemes::shinytheme()}
#' @param width Width of the printed app 
#' @param height Height of the printed app
#' @param storyteller Is this a storyteller app?
#' @param css Path to a custom css file. If \code{NULL} the default css file is used 
#' @param more.opts A list of additional options/objects to be passed to the app (see Details)
#' @param ... Additional arguments passed to \code{shiny::shinyAppDir()} 
#'  
#' @details When publishing apps using shinyapps.io or shinyServer, setting code{pub = TRUE} prevents calls to code{install.packages}. Calls to code{install.packages} should not be included within an app and will result in an error.
#' 
#' @return A printed shiny app
#' @export
#'
#' @examples 
#' dontrun{
#' appy(theme = 'spacelab', height = '600px')
#' }
likelihood_ace2 <- 
function(theme = "flatly", storyteller = F, width = '100%',
         height = `if`(storyteller,'800px','600px'),
         more.opts = list(time = Sys.time()),...) {
    dir <- dirname(system.file("apps", "likelihood_ace2", "global.R", package = "teachingApps"))
    
    teachingApps::assign.shiny.opts(opts = more.opts,
                                    dir = dir,
                                    theme = theme,
                                    icon = icon)
    
    shiny::shinyAppDir(appDir = dir, 
                       options = list(height = height, width = width,...))
}

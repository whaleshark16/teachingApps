#' Visualize hazard function plots with various shapes
#'
#' @description Create uni- and bi-modal hazard function plots 
#' 
#' @details This app displays the hazard function for a 
#'     system with two independent failure modes.  System failure
#'     occurs when either of the arranged in series. 
#'     changes for various parameter values. effect Generates hazard functions plots for a 
#'     system with two-indeposterior samples by filtering the prior
#'
#' @importFrom shinythemes shinytheme
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
#' @import needs
#'
#' @param theme \code{character} A bootswatch color theme for use in code{shinythemes::shinytheme}
#' @param storyteller \code{logical} Is this a storyteller app?
#' @param width \code{character} Width of the printed app
#' @param height \code{character} Height of the printed app
#' @param icon \code{character} Name of fontAwesome icon printed at the bottom of an app
#' @param more.opts \code{list} Additional options/objects passed to the app (see Details)
#' @param ... \code{list} Additional options passed to code{shiny::shinyAppDir()} 
#' 
#' @family statistics apps
#' 
#' @return A printed shiny app
#' @export
#'
#' @examples 
#' dontrun{
#' appy(theme = 'spacelab', height = '600px')
#' }
bathtub_hazard <- 
function(theme = "flatly", storyteller = F, width = '100%',
         height = `if`(storyteller,'800px','600px'),
         icon = 'fa fa-github', more.opts = list(NA),...) {
    dir <- dirname(system.file("apps", "bathtub_hazard", "global.R", package = "teachingApps"))
    
    teachingApps::assign.shiny.opts(opts = more.opts,
                                    dir = dir,
                                    theme = theme,
                                    story = storyteller,
                                    icon = icon)
    
    shiny::shinyAppDir(appDir = dir, 
                       options = list(height = height, width = width,...))
}
#' Render a teachingApp With Options
#'
#' @description Renders a shiny app from the teachingApps package as a stand-alone app
#'     or as an element in an rmarkdown document. 
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
#' @param theme A \code{character} string naming a bootswatch color theme allowed by \code{shinythemes::shinytheme}
#' @param width A \code{character} string specifying the width of the printed app (in pixels)
#' @param height A \code{character} string specifying the height of the printed app (in pixels)
#' @param stamp  A \code{character} string of a fontAwesome icon or path to an image file to be placed in the footer of a navbarPage app
#' @param more.opts A \code{list} of additional options/objects that can be passed to the app (see Details)
#' @param ... A \code{list} of additional options passed to \code{shiny::shinyAppDir()} 
#' 
#' @return A printed shiny app
#' @export
#' @details The \code{teachingApps} package provides an infrastructure 
#'    that allows users to dynamically change the appearance and function of
#'    shiny apps. R users a familiar with writing functions to dynamically alter 
#'    some output - in this case the output is a app.  Normally, 
#'
#' @examples 
#' dontrun{
#' teachingApps(app_name = 'distribution_goma', theme = 'spacelab', height = '600px')
#' }
teachingApp <- 
function(app_name = NULL, 
         theme = 'flatly',
         width = '100%',
         height = '800px',
         stamp = 'fa fa-github',
         more.opts = list(NA),...)
{
 
    valid_apps <- list.files(system.file("apps", package = "teachingApps"))

    valid_apps_df <- data.frame(valid_apps)
    colnames(valid_apps_df) <- 'Valid teachingApps'
    
    if (missing(app_name) || !nzchar(app_name) || !app_name %in% valid_apps) {
      
    stop(paste0('Please run `teachingApp()` with a valid app as an argument.\n',
                 "See table for Valid teachingApps"),
         View(valid_apps_df),
         call. = FALSE)
    }
    
   
    dir <- dirname(system.file('apps', app_name, 'global.R', package = 'teachingApps'))
  
    teachingApps::add_shiny_opts(opts = more.opts,
                                 dir = dir,
                                 theme = theme,
                                 stamp = stamp)
    
    shiny::shinyAppDir(appDir = dir, 
                       options = list(height = height, width = width,...))

}
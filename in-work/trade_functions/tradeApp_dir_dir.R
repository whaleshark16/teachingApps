#' Transfer a teachingApp app between local directories
#' 
#' @param app \code{character} The app name
#' @param dir_from \code{character} The local directory from which the app will be traded (see details)
#' @param dir_to The directory to which the app will be traded (see details)
#' @param remove \code{logical} If \code{TRUE}, the app and calling function will be removed from \code{from}.
#' 
#' @importFrom R.utils copyDirectory
#' 
#' @details see ?teachingApps::tradeApp
tradeApp_dir_dir <- 
function(app, 
         dir_from = 'teachingApps', 
         dir_to = NULL, 
         remove = F) 
{
  
  main.app.dir <- dir_from
  from.app.dir <- file.path(main.app.dir, app)
  
  inst.dir     <- file.path(pkg_to,'inst')
  all.apps.dir <- file.path(inst.dir,'apps')
  this.app.dir <- file.path(all.apps.dir, app)
  
  if(!dir.exists(inst.dir)) dir.create(inst.dir)
  if(!dir.exists(all.apps.dir)) dir.create(all.apps.dir)
  
  if(!dir.exists(this.app.dir)) {
    
       dir.create(this.app.dir)
    
       R.utils::copyDirectory(from = from.app.dir,
                              to = this.app.dir)
    
  } else {
    
    overwrite <- readline(prompt = message('\nA directory with this name already exists in the specified package.\n\nDo you want to overwrite these files? (y/n)\n'))
    
    if(!any(startsWith(tolower(overwrite), c('y','n')))) {
      
      message('\nImproper response - use either "y" or "n".\n\nProcess Terminated')
      return()
    }
    if(startsWith(tolower(overwrite), 'n')) {
      
      message('\nProcess terminated by user - app not moved')
      return()
    }
    if(startsWith(tolower(overwrite), 'y')) {
      
      R.utils::copyDirectory(from = from.app.dir,
                             to = this.app.dir)
      
    }
  }
  
  # Move calling function
  calling.function.id <- paste(main.app.dir,'/', app,'.R', sep = '')
  
  calling.function.body <- readLines(calling.function.id)
  
  cfb.length <- length(calling.function.body)
  
  review <- lapply(X = 1:cfb.length, 
                   FUN = function(x) grep('dir <-',
                                          calling.function.body[x]))
  
  replace.text <- substitute(dirname(system.file("apps", a, "global.R", package = b)),
                             list(a = app, b = basename(pkg_to)))
  
  replace.path <- paste(c('   ',
                        'dir <-',
                        replace.text),
                        collapse = ' ')
  
  calling.function.body[which(review==1)] <- replace.path
  
  calling.function.file <- paste(app,'R', sep = '.')
  
  writeLines(calling.function.body,
             con = file.path(pkg_to, 'R', calling.function.file))
  
}
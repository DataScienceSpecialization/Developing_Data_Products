args <- commandArgs()
library(rmarkdown)

needs_making <- function(source_file, goal_file){
  !file.exists(goal_file) || file.mtime(source_file) > file.mtime(goal_file)
}

rmds <- list.files(recursive = TRUE, pattern = "[r|R]md$")
pdfs <- gsub("[r|R]md$", "pdf", rmds)
htmls <- gsub("[r|R]md$", "html", rmds)

if("clean" %in% args){
  for (i in seq_along(rmds)) {
    if(file.exists(pdfs[i])){
      unlink(pdfs[i], recursive = TRUE, force = TRUE)
    }
    if(file.exists(htmls[i])){
      unlink(htmls[i], recursive = TRUE, force = TRUE)
    }
  }
  stop("Cleaning Complete")
}

for(i in seq_along(rmds)){
  if(needs_making(rmds[i], htmls[i])){
    if(dirname(rmds[i]) == "."){
      render(rmds[i], output_format = html_document(toc = TRUE, toc_float = list(collapsed = FALSE),
                                                    fig_caption = FALSE, theme = 'cosmo', toc_depth = 2), 
             output_dir = dirname(rmds[i]))
    } else {
      render(rmds[i], output_format = ioslides_presentation(fig_height = 4.5, 
                                                            fig_caption = FALSE, 
                                                            logo = '../bloomberg_shield.png', 
                                                            css = '../slides.css'), 
             output_dir = dirname(rmds[i]))
    }
  } else {
    print(rmds[i])
    print(htmls[i])
  }
  
  if(needs_making(rmds[i], pdfs[i])){
    if(dirname(rmds[i]) == "."){
      render(rmds[i], output_format = pdf_document(fig_caption = FALSE), 
             output_dir = dirname(rmds[i]))
    } else {
      render(rmds[i], output_format = beamer_presentation(fig_caption = FALSE), 
             output_dir = dirname(rmds[i]))
    }
    
  } else {
    print(rmds[i])
    print(pdfs[i])
  }
}



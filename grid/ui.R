library(shiny)
library(httr)

shinyUI(bootstrapPage(
  tags$head(
    tags$link(rel = 'stylesheet', type = 'text/css', href = 'style.css')
  ),
  
  
  h1("shinyGridster test app"),
  
  gridster(width = 250,
           
           gridsterItem(col=1, row=1, sizex=1, sizey=2, class="widget-weather",
                        h1(textOutput("title"), class="title", `data-bind`="title"),
                        h2(textOutput("temp"), class="temp", `data-bind`="temp | raw"),
                        p(textOutput("condition"), class="condition", `data-bind`="condition"),
                        p(textOutput("updatedAt"), class="updated-at", `data-bind`="updatedAtMessage")
                        )
           
  )
))
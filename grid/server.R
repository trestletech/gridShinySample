weather <- reactiveValues()
weather$w <- content(GET("http://query.yahooapis.com/v1/public/yql?q=select%20item%20from%20weather.forecast%20where%20location%3D%2248907%22&format=json"))        

observe({        
  print("weather")      
  invalidateLater(15 * 60 * 1000)  
  weather$w <- content(GET("http://query.yahooapis.com/v1/public/yql?q=select%20item%20from%20weather.forecast%20where%20location%3D%2248907%22&format=json"))        
})

shinyServer(function(input, output) {
    
  output$title <- renderText({
    "Lansing Weather"
  })
  
  output$temp <- renderText({
    weather$w$query$results$channel$item$condition$temp
  })
  
  output$condition <- renderText({
    weather$w$query$results$channel$item$condition$text    
  })
  
  output$updatedAt <- renderText({
    paste("Updated at", gsub(".*(\\d{1,2}:\\d{2}\\s?[apAP][mM]).*", "\\1", weather$w$query$results$channel$item$condition$date))
  })
})
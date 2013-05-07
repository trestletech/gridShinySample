shinyServer(function(input, output) {
    
  #update every 15 minutes
  weatherTimer <- reactiveTimer(1 * 60 * 1000)
  
  weather <- reactive({        
    print("weather")    
    weatherTimer()
    content(GET("http://query.yahooapis.com/v1/public/yql?q=select%20item%20from%20weather.forecast%20where%20location%3D%2248907%22&format=json"))        
  })
  
  output$title <- renderText({
    "Weather"
  })
  
  output$temp <- renderText({
    weather()$query$results$channel$item$condition$temp
  })
  
  output$condition <- renderText({
    weather()$query$results$channel$item$condition$text    
  })
  
  output$updatedAt <- renderText({
    paste("Updated at", gsub(".*(\\d{1,2}:\\d{2}\\s?[apAP][mM]).*", "\\1", weather()$query$results$channel$item$condition$date))
  })
})
function(input,output,session){
  
  output$dairy_use <- renderPrint({ input$Dairy })  

  output$MilkTS <- renderPlot( {
    
        ggplot(Milk_ts, aes_string("Date",input$Dairy)) +
          geom_line()+
          labs(title = "Average Volume Produced")

    })
  
  
  output$plot_type <- renderPrint({ input$plot_type })

  
  observeEvent(input$plot_type, {
    if(input$plot_type == 1){
      output$anaplot <- renderPlot({gg_season(Milk_ts[,c("Date",input$Dairy)])})
  }
    if(input$plot_type == 2){
      output$anaplot <- renderPlot({gg_lag(Milk_ts[,c("Date",input$Dairy)])})
  }
    if(input$plot_type == 3){
      output$anaplot <- Milk_ts[,c("Date",input$Dairy)]%>%
        model(classical_decomposition(type = "multiplicative"))%>%
        components() %>%
        autoplot() %>%
        renderPlot()
  }
    })
  
  observeEvent(input$Dairy, {
    if(input$Dairy == "Cotagecheese.Prod"){
      output$analysis <- renderUI("Insert Cottage Cheese Analysis here")
    }
    if(input$Dairy == "Icecream.Prod"){
      output$analysis <- renderUI("Insert Icecream Analysis here")
    }
    if(input$Dairy == "Milk.Prod"){
      output$analysis <- renderUI("Insert Milk Analysis here")
    }
  })

observeEvent(input$Dairy, {
  
  output$Forecast <- renderPlot({
    
    fit <- Milk_ts %>%
      model(SNAIVE(input$Dairy))
    
    fit %>%
      forecast() %>%
      autoplot(Milk_ts) +
      labs(title = "Seasonal naïve model")
    
  })
  
})
  
}


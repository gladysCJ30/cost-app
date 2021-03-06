library(shiny)
library(magrittr)
library(readr)
library(DT)

df.meds = read_csv("data-meds.csv", col_names = TRUE)
df.comps = read_csv("data-comps.csv", col_names = TRUE)

# --------------------------------------------------------------------

shinyServer(function(input, output) {
  
  observeEvent(input$add, {
    save.string = paste0("--- ",
                         input$med, ", ",
                         input$sched.times, "x daily, ",
                         input$sched.weekly, ", ",
                         input$sched.yearly)
    output$test = renderText({
      print(save.string)
    })
  })
  
  output$list.of.components = renderText({
    print("Here's where the list will go:")
  })
  
  output$cost.meds = renderText({

  })
  
  # output$total.cost.explicit = renderText({
  #   (input$frequency * input$duration * 10) %>%
  #     paste0("Total explicit cost is... $", ., " in 2015 USD")
  # })
  # 
  # output$total.cost.implicit = renderText({
  #   (input$frequency * input$duration * 10) %>%
  #     paste0("Total implicit cost is... $", ., " in 2015 USD")
  # })
  # 
  # output$total.cost.combined = renderText({
  #   (input$frequency * input$duration * 10) %>%
  #     paste0("Total combined cost is... $", ., " in 2015 USD")
  # })

})

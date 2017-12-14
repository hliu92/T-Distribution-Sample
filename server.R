library(shiny)

shinyServer(function(input, output) {
        
  output$distPlot <- renderPlot({
    
    # Plot Normal Distribution
    x <- seq(-4, 4, length=100)
    hx <- dnorm(x)
    plot(x, hx, type="l", lty=1, xlab="x value", ylab="Density", main="Comparison of T Distribution with Normal Distribution", col="red")
    
    # Plot T Distribution
    df <- input$df
    lines(x, dt(x,df), lwd=4, lty=1, col="blue")

    # Add legend
    legend("topleft", title="Distributions", legend = c("Normal Distribution", paste("T Distribution with df =", df)), 
           lwd=c(1,4), lty=1, col=c("red", "blue"))
    
    # Calcualte P-value
    tstat <- input$tstat
    abline(v = tstat, col = "blue", lwd = 2, lty = 2)
    
  })
  
  output$text <- renderText({
    
    tstat <- input$tstat
    df <- input$df
    pt <- pt(tstat, df = df, lower.tail = FALSE)
    paste("The P-value when T Statistic =", tstat, "and Degree of freedom =", df, "for a T-distribution is", round(pt,3), ".")
                
  })
  
})

library(shiny)

# Define Server for Cost Estimator Shiny Application
# Author: Anne Kerr


# This application calculates the estimated costs two methods of implementing ServicePoint. 
# National is willing to subsidize the cost to implement for each of its affiliates,
# but wants to look at the cost options for various combinations of standalone and shared 
# implementations. This application allows the user to input several assumtion factors and, based
# on those factors, evaluate the cost of the various options. The assumption factors are input as 
# integers and the number of each type of implementation to evaluate is presented on a slider. As 
# as the user manipulates the slider, the given assumptions are taken into account and the estimated
# costs for the specified level are displayed in an output table.

shinyServer(function(input, output) {
  
  # Reactive expression to calculate the cost estimates based on user input, and to compose a 
  # data frame for display
  sliderValues <- reactive({
#      #number of standalone sites          
#      nSa <- input$nStandalone 
#      #number of affiliates using a shared site
# #      nSh <- input$nShared
#      nSh <- 0
#      totSiteCost <- format((input$nSites*5622), big.mark=",", scientific=FALSE)

        #Gross cost to outcomes project
        opgross <- (input$nS * input$sF) + 
                (input$nPL * input$pF) + 
                ((input$nCL + input$nPL) * input$rF)
        
        #Total affiliate fees, estimate based on portion of all licenses charged to affiliates (less national and SC owned)
        aFees <- ( (input$nCL + input$nPL) - (input$nSCL) - 3) * input$rF
   
        
        #Total housing fees
        hFees <- input$nProp * 500
        
        #Income to outcomes project
        opin <- aFees + hFees
        
        #Net cost to outcomes project
        opnet <- opgross - opin
        
        #Total housing fees
        hFees <- input$nProp * 500
        
        #Average sized affiliate fee
        aFee <- input$nAL * input$rF
        
        #format currency
        opgross <- format((opgross), big.mark=",",scientific=FALSE)
        opin <- format((opin), big.mark=",",scientific=FALSE)
        opnet <- format((opnet), big.mark=",",scientific=FALSE)
        aFee <- format((aFee), big.mark=",",scientific=FALSE)
        hFees <- format((hFees), big.mark=",",scientific=FALSE)


        
          

        # Compose data frame
        df <- data.frame(
         Department = c("Outcomes Project Gross Costs", 
                        "Outcomes Project Income",
                        "Outcomes Project Net Costs",
                        "Affiliate Cost, on average",
                        "SC Cost per property"),

         cost = as.character(c(paste("$",opgross),
                               paste("$",opin),
                               paste("$",opnet),
                               paste("$",aFee),
                               paste("$",hFees))),
#          DollarTest = as.character(c(format((100000), big.mark=",",scientific=FALSE),
#                                      format((100000), big.mark=",",scientific=FALSE),
#                                      format((100000), big.mark=",",scientific=FALSE),
#                                      format((100000), big.mark=",",scientific=FALSE))),
         stringsAsFactors=FALSE)

#         staticDF <- data.frame(
#         Department = c("Total number of sites * site fee",
#                        "Average number of licenses * license renewal fee",
#                        "Per property fee for SC property",
#                        "Staff costs for Service Coordination help desk and training support"),
#         stringsAsFactors=FALSE)

  })    ####end reactive code block




  
#   print(df)
  
  # Show the values using an HTML table
  output$values <- renderTable({
    sliderValues()
  
  })


})

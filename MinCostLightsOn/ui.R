library(shiny)

# Define UI for Cost Estimator Shiny Application
# Author: Anne Kerr


# This application calculates the estimated costs two methods of implementing ServicePoint. 
# National is willing to subsidize the cost to implement for each of its affiliates,
# but wants to look at the cost options for various combinations of standalone and shared 
# implementations. This application allows the user to input several assumtion factors and, based
# on those factors, evaluate the cost of the various options. The assumption factors are input as 
# integers and the number of each type of implementation to evaluate is presented on a slider. As 
# as the user manipulates the slider, the given assumptions are taken into account and the estimated
# costs for the specified level are displayed in an output table.

shinyUI(fluidPage(
  
  #  Application title
  titlePanel("ServicePoint Cost Estimator"),
  
  # Create a Sidebar layout with integer and slider to get the assumptions to 
  # use for estimating costs
  sidebarLayout(
    sidebarPanel(
      
        
#       # Input Number of sites
#       sliderInput("nStandalone", "Number of sites, including national's SC site:", 
#                   min=0, max=13, value=10),

#       # Input per site annual cost assumption (in thousand of dollars) national will incur 
#       # per standardization in standalone sites
#       sliderInput("sasupportfactor", "Assumed annual cost of standardization across standalone sites: ($K)", 
#                   min=0, max=60, value=30),
#       
            
        # Input Number of sites
        numericInput("nS", "Number of sites, including national's SC site:", 
                 value=14),
            

#       # Input current total number of license 
        numericInput("nCL", "Total current licenses:", 
            value=700),

#       # Input expected license growth (total to be added in the coming year)
        numericInput("nPL", "Expected additional licenses to be purchased in the next 12 months:", 
             value=100),


#       # Input average license number per site
        numericInput("nAL", "Average number of licenses per site:", 
             value=40),


#       # Input expected annual renewal fee affiliate pays per license
        numericInput("rF", "Expected annual renewal fee per license:", 
             value=228),


#       # Input expected new license purchase fee national will subsidize
        numericInput("pF", "Expected purchase price per new license:", 
             value=175),

#       # Input per site overhead fee national will subsidize
        numericInput("sF", "Expected purchase price per new license:", 
             value=5622),

#       # Input estimated number of service coordinator licenses needed
        numericInput("nSCL", "Estimated number of Service Coordination Licenses:", 
             value=150),

#       # Input number of service coordination properities supported
        numericInput("nProp", "Number of Service Coordination properties:", 
             value=150)


      
#       # Input Number of affiliates Using shared site
#       sliderInput("nShared", "Number affiliates using shared site:", 
#                   min=0, max=33, value=10),
      
#       # Input per site annual cost affiliates will pay for licenses. assumption (in thousand of dollars) national will incur 
#       # supporting standardization in a shared site
#       sliderInput("aasupportfactor", "Assumed annual per-affiliate cost of standarization for shared site model: ($K)", 
#                   min=0, max=50, value=25),
#       
#       # Input assumed percent of shared hosting paid by national 
#       sliderInput("sharedsupportsubsidy", "Assumed percent shared Systems Admin paid by national: (%)", 
#                   min=0, max=100, value=50)

    ),
    
# dfout  <- data.frame(c("Total number of sites * site fee",
#                        "Average number of licenses * license renewal fee",
#                        "Per property fee for SC property",
#                        "Staff costs for Service Coordination help desk and training support")
                     
    # Show a table summarizing the values entered
    mainPanel(
      h4("Annual cost to outcomes project includes:"),
      h5("    Site costs, license renewal fees, and new license purchase fees"),
      h5("    excluding any cost for overhead (salaries, travel, training, etc)"),
      h4("Annual income to outcomes project includes:"),
      h5("    Estimate of license fees reimbursed by affiliates and property fees paid by housing"),
      h4("Annual net cost to outcomes project:"),
      h5("    Cost, less income"),
      h4("Annual cost to affiliate for a medium-sized implementation includes:"),
      h5("    Annual license renewal fees, excluding cost of site administration"),
      h4("Annual cost to SC property manager includes:"),
      h5("    Annual property fee"),
      h4("Annual cost to housing Service Coordination property manager includes:"),
      h5("    Annual property fee per property"),
      tableOutput("values")
 
    )
  )
))

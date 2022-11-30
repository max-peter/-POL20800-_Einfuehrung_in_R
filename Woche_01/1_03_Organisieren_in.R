isRunningLocally = Sys.getenv("USERNAME") == "MaxPeter(cironeteu)"

if(isRunningLocally) {

    # load library
    library(igraph)
    library(igraphdata)

    # Load rstudioapi package
    library("rstudioapi")

    # set working directory
    # (WD <- getwd())
    # if (!is.null(WD)) setwd(WD)
    # Set working directory to source file location
    setwd(dirname(getActiveDocumentContext()$path))

    # Check updated working directory
    getwd()

    # load test data
    g1 = read_graph("g1.txt", format =  "edgelist", directed=F)
    g2 = read_graph("g2.txt", format =  "edgelist", directed=F)
    g3 = read_graph("g3.txt", format =  "edgelist", directed=F)
    g4 = read_graph("g4.txt", format =  "edgelist", directed=F)
}

library("rstudioapi") # Load rstudioapi package
setwd(dirname(getActiveDocumentContext()$path)) # Set working directory to source file location
getwd() # Check updated working directory
# https://statisticsglobe.com/set-working-directory-to-source-file-location-automatically-in-rstudio

# 1_03 Organisieren in R
install.packages("TeachingDemos")

#setwd("~/R-Vorlesung")
setwd("d:/vscode/POL20800_Einfuehrung_in_R/")
library(TeachingDemos)

read.table("Erste_Daten.csv")
read.csv("Erste_Daten.csv")
read.csv2("Erste_Daten.csv")
write.table("Hallo R", file ("Meine_Daten.txt")

# Demo Würfeln
plot(dice(4,1))

WD <- getwd()

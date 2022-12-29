# Hausaufgabe_Template
# Homework-Checker kompatibel

isRunningLocally = Sys.getenv("USERNAME") == "MaxPeter(cironeteu)"

if(isRunningLocally) {

#setwd("~/R-Vorlesung")
setwd("d:/vscode/POL20800_Einfuehrung_in_R/")
# Load csv
film<-read.csv("resources/xxx.csv", encoding="UTF-8")

}

# Informationen erhalten
# • Vektorlänge: length(vek)
# • Minimum, Maximum: min(vek), max(vek)
# • Mean, Median: mean(vek), median(vek)
# • Summary: summary(vek)


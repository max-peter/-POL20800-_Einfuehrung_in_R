# Hausaufgabe_Template
# Hausaufgabe_Template
# Homework-Checker kompatibel

isRunningLocally = Sys.getenv("USERNAME") == "MaxPeter(cironeteu)"

if(isRunningLocally) {

#setwd("~/R-Vorlesung")
setwd("d:/vscode/POL20800_Einfuehrung_in_R/")
# Load dataset chickwts
# https://www.picostat.com/dataset/r-dataset-package-datasets-chickwts
install.packages("datasets")
library("datasets")
data("chickwts")

require(stats); require(graphics)

avgweights<-aggregate(weight ~ feed,data=chickwts, FUN= mean)

barplot(
    avgweights$weight,
    names = avgweights$feed,
    main = "Durchschnitt. Gewicht von Hühnern in Abhängikeit des Futters",
    ylab = "Durchschnittsgewicht",
    xlab = "Futterzusatz",
    col=terrain.colors(6)
)

}
#Lösung:
a<-"weight"
b<-"feed"
c<-"mean"
d<-"weight"
e<-"feed"
f<-"ylab"
g<-"xlab"




# Examples

# require(stats); require(graphics)
# boxplot(weight ~ feed, data = chickwts, col = "lightgray",
#     varwidth = TRUE, notch = TRUE, main = "chickwt data",
#     ylab = "Weight at six weeks (gm)")
# anova(fm1 <- lm(weight ~ feed, data = chickwts))
# opar <- par(mfrow = c(2, 2), oma = c(0, 0, 1.1, 0),
#             mar = c(4.1, 4.1, 2.1, 1.1))
# plot(fm1)
# par(opar)

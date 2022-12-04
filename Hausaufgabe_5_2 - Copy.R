# Hausaufgabe_Template
# Homework-Checker kompatibel

isRunningLocally = Sys.getenv("USERNAME") == "MaxPeter(cironeteu)"

if(isRunningLocally) {

#setwd("~/R-Vorlesung")
setwd("d:/vscode/POL20800_Einfuehrung_in_R/")
# Load dataset esoph
e<-esoph
# Add row cancerrate
e$cancerrate<-round(e$ncases/(e$ncases+e$ncontrols),1)

boxplot(cancerrate ~ tobgp, data=e , main="Krebs und Tabakkonsum")
boxplot(cancerrate ~ alcgp, data=e , main="Krebs und Alkoholkonsum")
a<-aggregate(cancerrate ~ agegp + alcgp , data=e, FUN=mean)
a[a$cancerrate>=0,5,]

}
#Lösung:
a<-"boxplot"
b<-"cancerrate"
c<-"tobgp"
d<-"alcgp"
e<-"cancerrate"
f_1<-"agegp"
f_2<-"alcgp"
g<-"cancerrate"

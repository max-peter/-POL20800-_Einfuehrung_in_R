# Hausaufgabe_Template
# Homework-Checker kompatibel

isRunningLocally = Sys.getenv("USERNAME") == "MaxPeter(cironeteu)"

if(isRunningLocally) {

#setwd("~/R-Vorlesung")
setwd("d:/vscode/POL20800_Einfuehrung_in_R/")
# Load csv
film<-read.csv("resources/xxx.csv", encoding="UTF-8")

}

# Hausaufgabe 6_1
# Aufgabe 1
# R gespeicherten Datensatz USPersonalExpenditure


# a) Schreibe eine Funktion mit dem Namen “halbieren”, die als Parameter/Argument einen Wert x bekommt und diesen durch 2 teilt.

halbieren<-function(x){
    x/2
}
# halbieren(8)

# b) Maximale Punktzahl: 2 Punkte

# Schreibe eine Funktion mit dem Namen “spaltensumme”, die als Parameter/Argument einen Dataframe x bekommt und für jede Spalte in x die Summe der Werte in dieser Spalte berechnet. Nutze hierfür die apply-Funktion.

spaltensumme<-function(x){
    apply(x,2,sum)
}

# c) Maximale Punktzahl: 2 Punkte

# Funktion “zeilendurchschnitt”, die als Parameter/Argument einen Dataframe x bekommt und die für jede Zeile in x den Durchschnitt der Werte in dieser Zeile berechnet. 

zeilendurchschnitt<-function(x){
    apply(x,1,mean)
}

# d) Maximale Punktzahl: 1 Punkt

# Berechne mit dem Datensatz USPersonalExpenditure für jedes Jahr wie viel Geld die Personen insgesamt in diesem Jahr ausgegeben haben und speichere das Ergebnis in der Variable d. 

US<-USPersonalExpenditure
d<-apply(US,2,sum)

# e) Maximale Punktzahl: 1 Punkt

# Berechne mit dem Datensatz USPersonalExpenditure für jede Kategorie den Durchschnitt der Ausgaben über alle Jahre hinweg und speichere das Ergebnis in der Variable e

e<-apply(US,1,mean)

# f) Maximale Punktzahl: 1 Punkt

# Berechne mit dem Datensatz USPersonalExpenditurefür jede Kategorie den Durchschnitt der Ausgaben über die Jahre 1940 bis 1945 (eingeschlossen) und speichere das Ergebnis in der Variable f

f<-apply(US[,1:2],1,mean)

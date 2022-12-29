# Hausaufgabe_Template
# Homework-Checker kompatibel

isRunningLocally = Sys.getenv("USERNAME") == "MaxPeter(cironeteu)"

if(isRunningLocally) {

#setwd("~/R-Vorlesung")
setwd("d:/vscode/POL20800_Einfuehrung_in_R/")
}

# Load csv
Rentiere<-read.csv("resources/Rentiere.csv", encoding="UTF-8",row.names=1)

# Hausaufgabe 7_1
# Aufgabe 1

# a) Maximale Punktzahl: 2 Punkte
# Überprüfe deinen Datensatz Rentiere und füge eventuelle Änderungen durch: Der Datensatz soll keine fehlenden Werte enthalten und alle Spalten sollen den Datentyp numeric haben.

which(is.na(Rentiere)==TRUE)

for (spalte in 1:30) {
    if (class(Rentiere[,spalte])=="character"){
        Rentiere[,spalte]<-gsub(",", ".",Rentiere[,spalte])
        Rentiere[,spalte]<-as.numeric(Rentiere[,spalte])
        #print("Spalte %spalte wurde umgewandelt")
        }
    }

# class(Rentiere[,12])
# class(Rentiere[,12])=="character"

# b) Maximale Punktzahl: 2 Punkte
# Berechne für jedes Rentier die durchschnittliche Schnelligkeit über alle Wettrennen hinweg, gerundet auf 0 Nachkommastellen, und speichere das Ergebnis in der Variable zeiten_durchschn.

zeiten_durchschn<-round(rowMeans(Rentiere[,1:30], na.rm=TRUE), digits = 0)

# View(Rentiere)
# View(zeiten_durchschn)

# c) Maximale Punktzahl: 2 Punkte
# Schreibe eine Funktion mit dem Namen top_acht. Die Funktion erhält einen Vektor x. Der Vektor wird aufsteigend sortiert und die ersten 8 Elemente des Vektors des Vektors werden ausgegeben. Hier siehst du ein Beispiel:

top_acht <- function(x){
    x<- sort(x, decreasing = FALSE)
    x<-x[1:8]
    return(x)
    
}
# vek<-c(6,7,1,3,2,5,9,4,0,8)
# top_acht(vek)


# d) Maximale Punktzahl: 2 Punkte
# Erstelle einen Variable mit dem Namen santas_gefolge. Diese Variable soll die Namen der 8 Rentiere enthalten, die im Durchschnitt am schnellsten waren (=am wenigsten Zeit benötigt haben). Die Namen sollen in aufsteigender Reihenfolge sortiert sein, das heißt das schnellste Rentier an Stelle 1. Bei Rentieren, die gleich schnell sind, soll alphabetisch vorgegangen werden. Benutze die Funktion top_acht und die Variable zeiten_durchschn. Tipp: Überlege dir, mit welcher Funktion man die Namen eines Vektors erhält.

# Füge anschließend den Namen “Rudolph” am Ende des Vektors hinzu.

santas_gefolge<-top_acht(zeiten_durchschn)
santas_gefolge<-names(santas_gefolge)
santas_gefolge<-c(santas_gefolge,"Rudolph")

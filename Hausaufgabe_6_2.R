# Hausaufgabe_Template
# Homework-Checker kompatibel

isRunningLocally = Sys.getenv("USERNAME") == "MaxPeter(cironeteu)"

if(isRunningLocally) {

#setwd("~/R-Vorlesung")
setwd("d:/vscode/POL20800_Einfuehrung_in_R/")


}

# Load csv
prfamt<-read.csv2("resources/Prfamt.csv", encoding="UTF-8")
statistik<-read.csv2("resources/Statistikkurs.csv", encoding="UTF-8")

# Hausaufgabe 6_2
# Aufgabe 2

# Ziel: Umgang mit der Merge-Funktion üben



# a)
# Das Prüfungsamt muss die Noten der Studenten im Fach Statistik eintragen. Füge hierfür die Datensätze prfamt und statistik zusammen und speichere das Ergebnis in der Variable a #nolint
    # Wähle die richtige Spalte zum Zusammenfügen aus, damit keine duplizierten Werte entstehen. # nolint
    # Das Fach Statistik wird auch von Studenten aus anderen Unis belegt. Füge nur die Studenten ein, die auch im Datensatz des Prüfungsamtes vorkommen. # nolint
    # Nicht alle Studenten haben Statistik belegt. Diese Studenten sollen statt einer Note ein NA haben. # nolint
    # Die Zeilen deines Datensatzes sollten nach der Matrikelnummer aufsteigend sortiert sein.  # nolint
    # Verändere nicht die Datentypen der Spalten.
    # Entferne alle nicht benötigten Spalten und benenne die Spalten um, sodass dein Datensatz folgendes Format erhält: #nolint

# Vorname Nachname Matrikelnummer Fach Englisch Numerik Statistik
a<-merge(prfamt,statistik,by.x=c("Vorname","Nachname","Matrikelnummer"),
by.y=c("vorname","name","mtrnr"),all.x=TRUE)

# a<-a[!duplicated(a),]

# Spalten reduzieren
# a<-a[,c(1,2,3,4,5,6,8)]

# note nach Statistik umbenennen
# https://de.acervolima.com/andern-sie-den-spaltennamen-eines-bestimmten-dataframe-in-r/
colnames(a)[7] <- "Statistik"
# rownames(a)<-c(1:38)

# a nach Matrikelnummer aufsteigend sortieren
# https://de.wikibooks.org/wiki/GNU_R:_order
a<-a[order(a$Matrikelnummer),]

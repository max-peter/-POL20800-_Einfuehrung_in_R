# Hausaufgabe_Template
# Homework-Checker kompatibel

isRunningLocally = Sys.getenv("USERNAME") == "MaxPeter(cironeteu)"

if(isRunningLocally) {

#setwd("~/R-Vorlesung")
setwd("d:/vscode/POL20800_Einfuehrung_in_R/")

}
# Load csv
kinder<-read.csv("resources/Kinder.csv", encoding="UTF-8")

# Hausaufgabe 7_2
# Aufgabe 2

# a)
# Wandle dann die Spalte “Benehmen” in den Datentyp factor um.
kinder$Benehmen<-as.factor(kinder$Benehmen)

# View(kinder)

# b)
# Kinder artig und unartig
# levels(kinder$Benehmen)

benehmen<-summary(kinder$Benehmen)
artig<-sum(benehmen[1])
unartig<-sum(benehmen[2])

bericht<-paste("Dieses Jahr waren ",artig," Kinder artig und ",unartig," Kinder unartig.",sep="")

# c)
# Lade den Datensatz “Wunschliste.csv” herunter und speichere ihn in der Variable wuensche. #nolint
wuensche<-read.csv("resources/Wunschliste.csv", encoding="UTF-8")
# View(wuensche)

# Entferne alle Duplikate. Beziehe dich dabei nur auf die ID der Kinder.
wuensche<-wuensche[!duplicated(wuensche$ID),]

# Manche Briefe waren unleserlich. Entferne alle Zeilen, die einen fehlenden Wert enthalten. #nolint
wuensche<-na.omit(wuensche)

# Füge an das Ende des Datensatzes die Spalte Geschenk hinzu. Kopiere die Werte aus der Spalte Wunsch in die Spalte Geschenk. #nolint
wuensche$Geschenk<-wuensche$Wunsch

# Ersetze bei allen Kindern, die sich ein “Geschwisterchen” wünschen, das Geschenk durch eine “Puppe”. Ersetze bei allen Kindern, die sich ein “Haustier” wünschen, das Geschenk durch ein “Kuscheltier”. #nolint
wuensche$Geschenk[wuensche$Geschenk=="Geschwisterchen"]<-"Puppe"
wuensche$Geschenk[wuensche$Geschenk=="Haustier"]<-"Kuscheltier"

# Ersetze bei allen Kindern, deren Wunschzettel nach dem 06.12.20 eingegangen ist, das Geschenk durch eine “Uhr”. #nolint
wuensche$Geschenk[wuensche$eingang>"2020-12-06"]<-"Uhr"

# d)
# Füge den Datensatz kinder mit der Spalte ID und Geschenk aus dem Datensatz wuensche zusammen und speichere ihn in der Variable gesamt. Auch Kinder, die keinen Wunschzettel geschrieben haben, sollen in dem Datensatz vorkommen. #nolint
df2<-wuensche[,c(1,6)]
gesamt<-merge(kinder,df2,by="ID",all.x=TRUE)

# View(kinder)
# View(gesamt)

# Gib bei allen Kindern, die keinen Wunschzettel geschrieben haben, das Geschenk “Stifte” an.
gesamt$Geschenk[is.na(gesamt$Geschenk)]<-"Stifte"

# Ersetze bei allen Kindern, die unartig waren, das Geschenk durch “Kohle”.
gesamt$Geschenk[gesamt$Benehmen=="unartig"]<-"Kohle"

# Lösche die Spalte Benehmen aus dem Datensatz gesamt.
gesamt$Benehmen<- NULL

# e)
# Schreibe eine Funktion gewicht_ermitteln, die das Gewicht eines Geschenks in Kilogramm berechnet. Die Funktion bekommt einen Wert x. Wenn x eine “Ritterburg” oder ein “Roller” ist, gibt die Funktion 4.5 zurück. Wenn x eine “Puppe” oder ein “Buch” ist, gibt die Funktion 1.0 zurück. Sonst gibt die Funktion 0.5 zurück. #nolint
gewicht_ermitteln <- function(x)
{ifelse(x == "Ritterburg" | x == "Roller",4.5,
        ifelse(x == "Puppe" | x == "Buch",1.0,0.5))
}

# x<-"Ritterburg"
# x<-"Buch"
# x<-"Kohle"
# gewicht_ermitteln(x)
# https://www.statology.org/nested-ifelse-in-r/


# Erstelle einen Datensatz verpackung, der die Spalten Kontinent und Geschenk aus dem Datensatz gesamt enthält. Verändere nicht den Datensatz gesamt. #nolint
verpackung<-gesamt[,c(7,8)]

# Füge zum Datensatz verpackung eine Spalte Gewicht hinzu. Diese Spalte soll für jedes Geschenk in der Zeile das entsprechende Gewicht enthalten. Nutze deine Funktion gewicht_ermitteln. Tipp: Die Funktion sapply, die sehr ähnlich zur Funktion apply ist, könnte hilfreich sein. Recherchiere wie die Funktion sapply funktioniert. #nolint
# https://de.wikibooks.org/wiki/GNU_R:_sapply
verpackung$Gewicht<-sapply(verpackung$Geschenk,gewicht_ermitteln)

# Erstelle einen Dataframe gewicht_uebersicht, der für jeden Kontinent das Gesamtgewicht der Geschenke enthält.#nolint
gewicht_uebersicht<-aggregate(Gewicht~Kontinent, data=verpackung,FUN=sum)

# f)
# Speicher die Anzahl an Kindern, die im Datensatz gesamt ein Puzzle als Geschenk erhalten, in der Variable puzzle. #nolint
puzzle<-sum(gesamt$Geschenk=="Puzzle")

# letters<-c("X","C","E","S","H","O","N","F","C","R","I"," ",")",":") #nolint
# paste(letters[puzzle+c(1,6,2,3,0,4,0,9,5,0,7,8,0,4,11,10)], collapse="") #nolint
# -> SCHOENE FERIEN:)
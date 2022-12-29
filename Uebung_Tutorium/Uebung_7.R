# Hausaufgabe_Template
# Homework-Checker kompatibel

isRunningLocally = Sys.getenv("USERNAME") == "MaxPeter(cironeteu)"

if(isRunningLocally) {

#setwd("~/R-Vorlesung")
setwd("d:/vscode/POL20800_Einfuehrung_in_R/")
# Load csv
# CSV_file<-read.csv("resources/xxx.csv", encoding="UTF-8")

}

###
# Woche_7_1 Zeichenketten
###

satz<-"Dies ist ein Satz"
nchar(satz)
toupper(satz)
tolower(satz)

#Spalten bei "ein" wird gelöscht
strsplit(satz,split="ein")
# Split bei allen Leerzeichen ergibt eine Liste
strsplit(satz,split=" ")

# Vektor erhalten
wortvektor<-strsplit(satz,split=" ")[[1]]
# Wort an Stelle drei
wortvektor[3]
# 3. Wort groß
wortvektor[3]<-toupper(wortvektor[3])

substring(satz,first=1,last=3)
substring(satz,first=1,last=6)
# "Dies ist EIN Satz"
substring(satz,first=10,last=12)<-toupper(substring(satz,first=10,last=12))

# paste
paste("Dies","ist","ein","Satz")
paste("Dies ist Nummer",1:10)

# Trennzeichen behandeln mit sep
paste("Dies ist Aufgabe A_",1:5, sep="")

# auch mit Character-Vektor
paste("Ich esse gerne",c("Schokoeis","Vanilleeis","Erdbeereis"))

# Kombination mit Wiederholung wenn ungleich
paste("Ich esse gerne",c("Schokoeis","Vanilleeis","Erdbeereis"),
    "und trinke gerne",c("Limo","Tee") )

women

# Leerzeichen ergänzen
paste("Fakt_",rownames(women),":",
    "Eine amerikanische Frau mit einer Durchschnittsgröße von ",
    women$height,
    " cm, ist im Durchschnitt ",
    women$weight,
    " Kilo schwer ",
    sep="")

# inch und pfund umrechnen und runden
paste("Fakt_",rownames(women),":",
    "Eine amerikanische Frau mit einer Durchschnittsgröße von ",
    round(women$height*2.54,0),
    " cm, ist im Durchschnitt ",
    round(women$weight/2.205,0),
    " Kilo schwer ",
    sep="")

# Zeichen suchen / ersetzten
# grep

# Gross/Klein beachten
grep(x=wortvektor,pattern="i")
# oder Funktion
grep(x=wortvektor,pattern="s|S")

# Zeichen ersetzen
gsub(x=satz,pattern="s",replacement="l")
# oder ??
gsub(x=satz,pattern="s|S",replacement="l")

# Jetzt mit Funktion für Unterscheidung gross oder klein!!
gsub(gsub(x=satz,pattern="s",replacement="l"),pattern="S",replacement="L")

# Gilt auch für Wortvektor
gsub(gsub(x=wortvektor,pattern="s",replacement="l"),pattern="S",replacement="L")

###
# Woche_7_2 Schleifen und Bedingungen
###

print("Hallo")
print(3)

# Zufälliges ziehen mit Sample
sample(c("rot","grün","blau"),size=1)
sample(1:100,size=90)
# mit doppelten Werten
sample(1:100,size=90,replace=TRUE)

x<-3
x<-10

x<8

# if
if(x<8){print("x ist kleiner als 8")}else{print("x ist grösser/gleich 8")}

# oder besser ifelse
ifelse(x<8,print("x ist kleiner als 8"),print("x ist grösser/gleich 8"))
# auch ohne print möglich
ifelse(x<8,"x ist kleiner als 8","x ist grösser/gleich 8")

# while-Schleife (Bedingung Variable und Befehl):
x<-1
while (x<11) {
print(x)
x<-x+1
}

# For-Schleife (Vektor mit Wert und Befehl), z.B.:
for (wert in 1:10) {
print(wert)
print(wert*3)
print("Fertig")
}

# Geht auch mit Character-Vektor Befehle sind unabhängig
for(wert in c("Apfel","Banane","Mango")){
    print("hallo")
}

mitarbeiter<-data.frame(Jahre=1900:2000)
for(x in 2:31){
    mitarbeiter[,x]<-sample(1:101, replace=TRUE)
}

for(x in 2:31){
    if(x<=16){
        mitarbeiter[,x]<-sample(20:100,size=101,replace=TRUE)
    } else{
        mitarbeiter[,x]<-sample(100:500,size=101,replace=TRUE)
    }
}

# Dataframe benennen
colnames(mitarbeiter)<-c("Jahre",paste("Firma_",1:30,sep=""))
View(mitarbeiter)

###
# Woche_7_3 Datums- und Zeitangaben
###

Sys.time()
class(Sys.time())

Sys.Date()
class(Sys.Date())


# 1) Erstellen
# Datum ohne Zeitangabe (Typ Date):

datum1 <- "Feb 02, 2019"
datum1 <- as.Date(datum1, "%b %d, %Y")

datum2 <- "05.08.20"
datum2 <- as.Date(datum2, "%d.%m.%y")


# Datum mit Zeitangabe (Typ POSIXt):
datum <- "05.08.20, 13:30"
datum <- strptime(datum, "%d.%m.%y, %H:%M")



# 2) Rechnen
# • Zeitdifferenz berechnen: 
difftime (datum2,datum1)
difftime(datum2,datum1, units="weeks")

difftime(datum2,datum1, units="secs")

datum1<datum2
vek<-c(datum1,datum2)
min(vek)
max(vek)
mean(vek)

# • Wochentage erhalten: 
weekdays(datum1)

# • Funktionen auf Datumsvektoren anwenden: 
min(c(datum1,datum2)), mean(c(datum1,datum2))

# 3) Formatieren
# • In character umwandeln (für Date und POSIXt): 
format(datum, "%b %d, %Y: %H Uhr %M")

format(datum1, "%b %d, %Y")
format(datum2, "%d.%m.%y")
format(Sys.time(),"Heute ist der %d. Tag im %m. Monat im Jahr %Y")

# Hausaufgabe 3_2

# Aufgabe 2
# Ziel: Umgang mit Listen üben
# Deine zweite Station ist die Marketing-Abteilung. Für die Firmenwebsite sollst du ein paar Fakten über die Firma zusammentragen.

# a) Maximale Punktzahl: 2 Punkte
# Erstelle eine Liste in der Variable firmenfakten, die Namen der Geschäftsführer (character-Vektor), die Anzahl der Mitarbeiter in den einzelnen Abteilungen (numeric-Vektor), das Gründungsjahr (numeric) und die beliebtesten Produkte (character-Vektor) enthält. Die Liste soll folgende Elemente enthalten:

# $Geschaeftsfuehrer
# [1] "Jahnke"  "Paschinski"    "Schmidt"

# $Mitarbeiteranzahl_Abteilungen
# [1] 20 34 26 27 32 16 24

# $Gruendungsjahr
# [1] 1912

# $Beliebteste_Produkte
# [1] "Erdbeer"  "Keks"     "Karamell"

firmenfakten<-list(Geschaeftsfuehrer=c("Jahnke","Paschinski","Schmidt"),Mitarbeiteranzahl_Abteilungen=c(20,34,26,27,32,16,24),Gruendungsjahr=1912,Beliebteste_Produkte=c("Erdbeer","Keks","Karamell"))

# View(firmenfakten)

# b) Maximale Punktzahl: 1 Punkt
# Berechne die Gesamtanzahl an Mitarbeitern und speichere das Ergebnis in der Variable mitarbeiteranzahl_gesamt.
mitarbeiteranzahl_gesamt<-sum(firmenfakten$Mitarbeiteranzahl_Abteilungen)

# c) Maximale Punktzahl: 2 Punkte
# Im neuen Jahr ergeben sich einige Änderungen. Der Geschäftführer Jahnke geht in den Ruhestand und wird durch die Geschäftsführerin Meiler ersetzt. In Abteilung 2 wird die Größe von 34 Mitarbeitern auf 23 Mitarbeiter reduziert. Kopiere den Wert von Variable firmenfakten in die Variable firmenfakten_2021. Führe dann die Änderungen an der Variable firmenfakten_2021 durch.
firmenfakten_2021<-firmenfakten
firmenfakten_2021$Geschaeftsfuehrer[1]<-"Meiler"
firmenfakten_2021$Mitarbeiteranzahl_Abteilungen[2]<-23

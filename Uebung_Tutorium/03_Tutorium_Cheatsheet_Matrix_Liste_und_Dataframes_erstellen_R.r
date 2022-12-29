# WAS FÜR EIGENSCHAFEN HABEN MATRIZEN, LISTEN UND
# DATAFRAMES UND WIE KANN ICH SIE ERSTELLEN?

################
### Matrizen ###
################
matrix(c(1:15), ncol=3, nrow=5, byrow= T)

matrix(c(1:15), nrow = 2) # Warum geht das nicht? 


# Wie funktioniert die Matrix-Funktion? 
?matrix()

matrix(data = c(1:36), nrow = 6, ncol = 6, byrow = FALSE,
       dimnames = list(paste(rep("row", 6), 1:6), paste(rep("col", 6), 1:6)))
# dimnames benötigt eine Liste: erster Listeneintrag enthält die Rownames, zweiter Listeneintrag die Colnames



# Alternativ zu dimnames
?colnames() 
?rownames() 

# Wie greife ich auf Einträge zu?

# Schritt 1: Mit einem Variablennamen abspeichern
meine_matrix = matrix(data = c(1:36), nrow = 6, 
                      dimnames = list(paste(rep("row", 6), 1:6), paste(rep("col", 6), 1:6)))

# Schritt 2: meine_matrix[row, column] 
meine_matrix[1,] # Gesamte erste Zeile
meine_matrix[,2] # Gesamte zweite Spalte

# Einzelnen Eintrag abrufen
meine_matrix[1,2] #Eintrag in erster Zeile, zweiter Spalte
meine_matrix["row 1", "col 2"] # Mit Namen der Zeilen und Spalten aufrufen (falls Namen vergeben sind)

# Einträge die bestimmtes Kriterium erfüllen 
meine_matrix[meine_matrix>12] # Alle Einträge der Matrix, die größer als 12 sind


##############
### Listen ###
##############
list(c(1:10), "a") # Liste mit der Länge 2

list(Zahlen = c(1:10), # Benannte Liste mit Länge 2
     Buchstabe = "a") 

# Wie funktioniert die Listen-Funktion? 
?list() 
# list() nimmt Objekte und hängt sie in eine Liste. 
# list() benötigt keine weiteren Parameter. 
# Die Elemente der list() können, müssen aber nicht benannt werden.
# Die Elemente der list() müssen nicht gleich lang sein 
# Die Elemente der list() können verschiedene Datentypen haben 

# Wie greife ich auf einzelne Listeneinträge zu? 
lis = list(Zahlen = c(1:10),
           Buchstabe = "a") 

lis[1] # 1. Listenelement
lis[[1]] # Inhalt des 1. Listenelement
lis[[1]][1] # 1. Stelle des Inhaltes des 1. Listenelements
lis$Zahlen[1] # Gleiches Ergebnis wie oben

lis$Zahlen[3]
lis$Buchstabe[1]

##################
### Dataframes ###
##################
?data.frame()

# Ein Dataframe kann man sich wie eine Excel-Tabelle zum Speichern für Daten vorstellen. 


# Ein Dataframe muss Spaltennamen haben. Wenn ihr diese nicht vergebt, erstellt R automatisch Spaltennamen. 
data.frame(c(1:10)) 
data.frame(Zahlen = c(1:10))

# Alle Zeilen und Spalten eines Dataframes müssen gleich lang sein. 
data.frame(Zahlen = c(1:10), 
           Buchstaben = c("a", "b", "c")) 

data.frame(Zahlen = c(1:10), 
           Buchstaben = rep(c("a", "b", "c"), length.out = 10))


# Ein Dataframe kann verschiedene Datentypen in verschiedenen Spalten haben 
data.frame(Zahlen = c(1:3),
           Buchstaben = "a")

str(data.frame(Zahlen = c(1:3),
               Buchstaben = "a"))

# ABER nicht verschiedene Datentypen innerhalb einer Spalte
rbind(data.frame(Zahlen = c(1:3), 
                 Buchstaben = "a"), c("a", 4))

# R verändert den Datentyp automatisch von numeric zu character
str(rbind(data.frame(Zahlen = c(1:3), 
                     Buchstaben = "a"), c("a", 4)))

# Ein Dataframe hat Reihennamen die automatisch die Anzahl der Reihen zählen
# Reihennamen können aber auch extra vergeben werden 
data.frame(Zahlen = c(1:3), 
           Buchstaben = "a", 
           row.names = c("Tomate", "Kirsche", "Apfel"))

# Alternativ kann man Row- und Column names auch nachträglich ändern mit
?colnames()
?rownames()

# Als Objekt abspeichern
df = data.frame(Zahlen = c(1:3), 
                Buchstaben = c("a", "b", "c"), 
                row.names = c("Tomate", "Kirsche", "Apfel"))

df

# Wie greife ich auf einzelne Einträge zu?

# Viele Möglichkeiten: Alles was bei Matrix und Liste geht, geht auch bei Dataframe

# Wieder nach dem Prinzip df[row, column]

# Gesamte erste Zeile
df[1,]
df["Tomate",]

# Gesamte erste Spalte
df$Zahlen
df[,1]
df[,"Zahlen"]

# Einzelne Einträge: Alle diese Wege führen zum gleichen Eintrag des Dataframes

df[1,2] # Erste Zeile, zweite Spalte
df["Tomate", "Buchstaben"] # Namen der Zeile, Name der Spalte
df[[2]][1] # Zweite Spalte, erster Eintrag
df$Buchstaben[1] # Dollar-Operator mit dem Namen der zweiten Spalte, erster Eintrag






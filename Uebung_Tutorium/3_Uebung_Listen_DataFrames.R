sort(c(2,4,3,1),decreasing=TRUE)
sort(c(2,4,3,1))

##############
# Listen
##############
# Erzeuge eine Liste
x<-list(1:5,c("A","B","C"),TRUE,11,matrix(1:9,nrow=3))
x[[1]]

# Bei Vektoren Position in []
# Matrizen [Zeile, Spalte]
# Listen [[x]] fur x. Element 

# Zahlenvektor 2. Element
x[[1]][2]
# Vektor
x[[1]][c(1,3)]
# Matrix
x[[5]][2,3]
# Wert überschreiben
x[[1]][3]<-8

# Listen mit Bezeichnung
y<-list(Zahlen=c(4,8),Wort="Haus")

# Position mit $ !!
# geht nicht:
y("Zahlen")
# aber das ginge:
y["Zahlen"][[1]][2]
# aber besser einfach mit Dollar-Operator!
y$Zahlen
y$Zahlen[2]

# Arbeiten mit Label und log. Operatoren:
names(x)<-c("A","B","c","D","E")
x$A 
y$Zahlen[y$Zahlen<5]
y$Zahlen+1

x$E[2,3]+x$E[1,]

# sum geht nicht mit Listen, aber mit Elementen
sum(y$Zahlen)

View(x)
View(y)
##############
## Data Frames
##############
# sind einfach Tabellen, also Vektoren gleicher Länge

v1<-c("Mathe","Info","BWL","Powi")
v2<-c(4,4,5,3)
v3<-c("m","w","m","w")

d<-data.frame(v1,v2,v3)

# Spalten-Namen
d<-data.frame(Hauptfach=v1,Semester=v2,Geschlecht=v3)

# Zeilen-Namem
namen<-c("Peter","Anna","Stephan","Melanie")

# Zusammen:
d<-data.frame(Hauptfach=v1,Semester=v2,Geschlecht=v3, row.names=namen)
# Strings als Faktoren
d<-data.frame(Hauptfach=v1,Semester=v2,Geschlecht=v3, row.names=namen, stringsAsFactors = TRUE)

# Elemente ansprechen
# Matrizen:
d[3,1]
d[3,]
d[,1]
# Listen
# 1. Vektor und 3. Element (Achtung erst Spalte dann Zeile!!)
d[[1]][3]
# Zeilen sind hier jetzt aber aufwendig, wir bleiben bei Matrix-Schreibweise!

# Elemente aus 3. und 4. Zeile aus der 1. Spalte
d[c(3,4),1]
# Elemente aus 3. Zeile und 1. und 2. Spalte
d[3,c(1,2)]

# Überschreiben, wie immer:
d[1,2]<-3
# Namen
d["Anna","Semester"]
d["Anna",]
d[,"Semester"]
# Listen
d$Semester

# Namen und Position mixen:
d[1:2,"Semester"]
# mit Liste
d$Semester[1:2]

# Elemente Vektor Semester < 4
d$Semester[d$Semester<4]
# Wir können jetzt aber auch nach dem Hauptfach fragen:
d$Hauptfach[d$Semester<4]

# Ausgabe Alle Zeilen mit Semester <4 (Matrix-Schreibweise)
d[d$Semester<4,]
# Alle Männer:
d[d$Geschlecht=="m",]

# Operatoren
# Alle BWL und Semester <= 4
d[d$Hauptfach=="BWL"&d$Semester<=4,]

# Jetzt mit einer Funktion
# Alle Zeilen mit Sem. < 4
subset(d,d$Semester<4)
# jetzt nur Hauptfach
subset(d,d$Semester<4, select=Hauptfach)
# mit Geschlecht
subset(d,d$Semester<4, select=c(Hauptfach, Geschlecht))
# mit Bedingungen
subset(d,d$Hauptfach=="BWL"&d$Semester>=4, select=Geschlecht)

# Alle Infos über Student mit höchsten Semester
subset(d,d$Semester==max(d$Semester))
# Kleinstes Semester nur Hauptfach
subset(d,d$Semester==min(d$Semester),select=Hauptfach)
# Kombinationen
subset(d,d$Semester>min(d$Semester)&d$Semester<max(d$Semester),select=c(Hauptfach,Geschlecht))

# Zeilennamen - Stefan ändern
rownames(d)<-c("Peter","Anna","Stefan","Melanie")
# besser
rownames(d)[rownames(d)=="Stephan"]<-"Stefan"
# Spalten mit colnames
# analog zu oben

# Data Frames aus einer Matrix erstellen
m<-matrix(1:9,nrow=3)
dm<-as.data.frame(m)

# Mit DF rechnen
sum(d$Semester)
sum(dm) # geht weil alles numerisch
sum(d) # geht nicht

summary(d) # funktioniert

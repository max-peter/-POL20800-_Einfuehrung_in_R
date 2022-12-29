
# Load csv
prfamt<-read.csv2("resources/Prfamt.csv", encoding="UTF-8")
statistik<-read.csv2("resources/Statistikkurs.csv", encoding="UTF-8")

# a)
# Merge
a<-merge(prfamt,statistik,by.x=c("Vorname","Nachname","Matrikelnummer"),
by.y=c("vorname","name","mtrnr"),all.x=TRUE)

# note nach Statistik umbenennen
colnames(a)[7] <- "Statistik"

# a nach Matrikelnummer aufsteigend sortieren
a<-a[order(a$Matrikelnummer),]

# Zeilen neu nummerieren
# row.names(a)<-1:38
row.names(a)<- NULL

b<-merge(statistik,prfamt,by.x=c("name","vorname","mtrnr"),
by.y=c("Nachname","Vorname","Matrikelnummer"),all.x=TRUE)

# Spalten reduzieren
b<-b[,c(1,2,3,4,5)]
colnames(b)[5] <- "fach"

# b nach Matrikelnummer aufsteigend sortieren
b<-b[order(b$mtrnr),]

# Zeilen neu nummerieren
row.names(b)<- NULL

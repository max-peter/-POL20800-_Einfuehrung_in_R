# Hausaufgabe_Template
# Homework-Checker kompatibel

isRunningLocally = Sys.getenv("USERNAME") == "MaxPeter(cironeteu)"

if(isRunningLocally) {

#setwd("~/R-Vorlesung")
setwd("d:/vscode/POL20800_Einfuehrung_in_R/")
# Load csv
film<-read.csv("resources/xxx.csv", encoding="UTF-8")

}

###
# Woche_6_1 Funktionen
###

verdoppeln<-function(x){
    x*2
}
verdoppeln(4)
verdoppeln(c(1,3,8))

fu<-function(x,y){
    x<-verdoppeln(x)
    y<-y/3
    x+y
}
fu(2,9)

# Nur letzte Variable wird ausgegeben!
# deswegen return
# mehrargumentige Rückgabe nicht möglich
# deswegen Vektor zurückgeben
fu<-function(x,y){
    x<-verdoppeln(x)
    y<-y/3
    return(c(x,y,x+y))
}
fu(2,9)

größer_zehn<-function(x){
    x>10
}
größer_zehn(25)
größer_zehn(c(1,3,35))

###
# Woche_6_2
###

a<-1:3
b<-c(5,-7,2)
c<-(4:2)
da<-data.frame(a,b,c)

# Bisher
mean(da$a)
mean(da$b)
mean(da$c)

# Besser mit apply (kleiner Roboter)

apply(FUN=mean, X=da, MARGIN=2) # X muss gross sein!
# margin 1 = Zeilen 2 = Spalten
# Kurzschreibweise:
# Datensatz, (Zeile/Spalte 1/2), Funktion
apply(da,2,mean)

# Zeilen
apply(da,1,mean)

# Summe der Zeilen
apply(da,1,sum)

# Einfügung eines fehlenden Werts NA
da$d<-c(1,NA,3)

# Prüfen auf NA für alles
any(is.na(da))

# Wir mussten das für alle Spalten prüfen
# mit apply:
apply(is.na(da),2,any)

# Äussere Funktion muss nach hinten
# Apply hat auf einen log. Dataframe ausgeführt
# Alternativ aufspalten mit sep. Funktion
fehlende_werte<-function(x){
    any(is.na(x))
}
apply(da,2,fehlende_werte)

# Jetzt auch gleich in apply definieren
apply(da,2,function(x){any(is.na(x))})

# Beispiel mit iris aus R
i <- iris
View (i)

# mean der Spalten 1-4
apply(i[,1:4],2,mean)

# Daten auf nur eine Nachkommastelle
# mit function in apply
apply(i[,1:4],2,function(x){round(mean(x),1)})

# Mittelwert der ersten 4 Spalten pro Spezies
# Hierzu benötigen wir wieder die Funktion aggregate!
aggregate(Sepal.Length~Species,data=i,mean)

# Jetzt für alle unserer 4 Spalten mit apply
apply(i[,1:4],2,function(x){aggregate(x~Species,data=i,mean)})

# Jetzt wieder runden
mw_ger<-function(x){
    round(mean(x),1)
}

# Jetzt:
apply(i[,1:4],2,function(x){aggregate(x~Species,data=i,mw_ger)})

###
# Woche_6_3 Merge
###

n<-c("Paula","Markus","Diana","Hedwig")
h<-c(818818818, 717717717, 616616616, 515515515)
a<-c("Wachtelweg","Dorfgasse","Stahlstraße","Herzogweg")

d1<-data.frame(Namen=n,Handy=h)
d2<-data.frame(Namen=n,Adresse=a)

# Zusammenfügen von d1 und d2
# Wichtig der gem. Nenner mit by
m<-merge(x=d1,y=d2,by="Namen")

# oder kürzer bei gleicher Reihenfolge
m<-merge(d1,d2,by="Namen")

# Was wenn der Nenner unterschiedliche Namen hat?
d1<-data.frame(Namen=n,Handy=h)
d2<-data.frame(Vornamen=n,Adresse=a)
m<-merge(d1,d2,by.x="Namen",by.y="Vornamen")

# Jetzt mit mehreren Spalten
n<-c("Paula","Markus","Diana","Hedwig")
h<-c(818818818, 717717717, 616616616, 515515515)
a<-c("Wachtelweg","Dorfgasse","Stahlstraße","Herzogweg")
n1<-c("Huber","Maier","Müller","Schmidt")
n2<-c("Huber","Maier","Müller","Schächter")

d1<-data.frame(Namen=n,Nachnamen=n1,Handy=h)
d2<-data.frame(Vornamen=n,Nachnamen=n2,Adresse=a)

m<-merge(d1,d2,by.x=c("Namen","Nachnamen"),by.y=c("Vornamen","Nachnamen"))

# Für Alle Datensätze d1 = x
m<-merge(d1,d2,by.x=c("Namen","Nachnamen"),
by.y=c("Vornamen","Nachnamen"),all.x=TRUE)

# Für Alle Datensätze d2 = y
m<-merge(d1,d2,by.x=c("Namen","Nachnamen"),
by.y=c("Vornamen","Nachnamen"),all.y=TRUE)

# Beide Datensätze
m<-merge(d1,d2,by.x=c("Namen","Nachnamen"),
by.y=c("Vornamen","Nachnamen"),all=TRUE)

# Da es sich um einen Schreibfehler handelt, einfach beide anhand der
# Zeilennummern zusammenfügen
m<-merge(d1,d2,by="row.names",all=TRUE)

# Bereinigung von unnötigen doppelten Spalten
m<-m[,c(5,6,4,7)]

# Fall bei doppelten Einträgen
d3<-data.frame(Namen=c("Paula","Paula","Jona"),Noten=c(1,1,3))
d4<-data.frame(Namen=c("Paula","Jona","Jona"),Semester=c(4,5,5))
merge(d3,d4,by="Namen")

# Duplikate entfernen
m<-merge(d3,d4,by="Namen")
m<-m[!duplicated(m),]


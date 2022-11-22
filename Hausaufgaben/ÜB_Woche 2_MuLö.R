###############################
######### Aufgabe 1 ###########
###############################
#a)
vek = 20:30

#b)
vek[3]+vek[6]

#c)
sum(vek[c(6:8,10)])

#d)
length(vek)

#e)
vek2 = seq(from=7, to=42, by=5)

#f)
vek2 = vek2+2

#g)
vek3 = rep(c(4,1,6), each=2, times=3, length.out=17)

#h)
vek3*3.78

#i)
vek4 = 2530:135

#j)
summary(vek4)

###############################
######### Aufgabe 2 ###########
###############################
#a)
#Um Elemente eines Vektors anzusprechen m?ssen eckige
#Klammern  verwendet werden.
v1<-c(2,5,3,9,17,32,-1)
v1[3]

#b)
#Das letzte Element ist an Position 7 und nicht 8. 
v1[1]+v1[7]

#c)
# Mehrere Vektorelemente kann man ansprechen, indem man
# einen Vektor von Positionen angibt. Einfach mehrere Positionen
# angeben, ohne einen Vektor drumherum, funktioniert nicht.
v1[c(2,6)]

#d)
#Bei v1[6-3] wird 3 minus 6 gerechnet, somit wird das Ergebnis von
#v1[3] zur?ckgegeben. M?chte man die Reihe von einer Zahl bis zu einer
#Zahl muss man einen Doppelpunkt und keinen Bindestrich verwenden.
v1[6:3]

#e)
#Gro?- und Kleinschreibung beachten. Das V bei bei V1[4] muss klein
#geschrieben werden, weil wir unseren Vektor mit einem kleinen v 
#benannte haben.
v1[1]+v1[4]

#f)
#Reihenfolge beachten. Man muss erst einen Vektor erstellen, 
#bevor man mit ihm rechnen kann.
v2<-1:7
v1+v2

#g)
#In Vektoren darf nur ein Datentyp enthalten sein. Die 3 ist jedoch
#ein Character-Wert, w?hrend 2 und 4 numerische Werte sind. Indem wir
#die Anf?hrungszeichen weglassen, ist auch die 3 ein numerischer Wert.
v3<-c(2,3,4)
sum(v3)

#h)
#Beim Ansprechen des dritten Vektorelements wurde der Vektor falsch
#geschrieben und zwar mit sum statt sum_. Dadurch versucht R nicht 
#das dritte Element des Vektors sum_, sondern das dritte Element
#der Funktion sum zur?ckzugeben. In der Fehlermeldung erkl?rt R,
#dass es die Elemente von eingebaute Funktionen nicht ansprechen kann.
sum_<-c(12,34,16,28)
sum_[3]

#i)
#Der Zuweisungspfeil wurde falsch herum geschrieben. Dadurch 
#wird die Variable v4 nicht erstellt und es kann auch kein 
#Mittelwert davon berechnet werden.
v4<-rep(c(1,2,3), times=2, each=4) 
mean(v4)

###############################
######### Aufgabe 3 ###########
###############################
#a)
NeueFaelle=c(16084,15245,11721,9043,7193,1794,527)
names(NeueFaelle)=c("Mo","Di", "Mi", "Do","Fr", "Sa", "So")
#b)
mean(NeueFaelle)
#c
mean(NeueFaelle[1:5])>mean(NeueFaelle[6:7])
#d
NeueFaelle["Mo"]<NeueFaelle["Di"]
#e
anz_Einwohner=13176989
inz=(sum(NeueFaelle)/anz_Einwohner)*100000

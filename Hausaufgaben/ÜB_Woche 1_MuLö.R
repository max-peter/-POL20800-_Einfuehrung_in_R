###############################
######### Aufgabe 1 ###########
###############################
#a)
a=3

#b)
b=8

#c)
c="Dies ist ein Wort"

#d)
d=TRUE

#e)
#Man muss die Punktschreibweise beachten
e=3.89

#f)
#Datentyp character, erkennbar man an den Anführungszeichen
is.character(c)

#g)
#Datentyp logical
mode(d)

###############################
######### Aufgabe 2 ###########
###############################
#a)
#Möglichkeit 1
sum_ab = sum(a,b)
#Möglichkeit 2
sum_ab = a+b

#b)
#Antwort: Nein, ist sie nicht
sum_ab<sqrt(2*sum_ab)

#c)
div_ab = round(b/a,1)

#d)
#Annas Behauptung ist falsch, denn beide Teil-Aussaugen sind wahr
xor(((a^b)>(a*b)),((b^a)>(a*b)))

###############################
######### Aufgabe 3 ###########
###############################
#a)
#Im Gegensatz zu round gibt man bei signif nicht die Anzahl
#der Nachkommastellen, sondern die Anzahl der signifikanten
#Stellen an.
div_ab_2 = signif(b/a,2)

#b)
x = 90.78
cos(pi*x)

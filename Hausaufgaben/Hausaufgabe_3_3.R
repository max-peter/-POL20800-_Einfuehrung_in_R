# Hausaufgabe 3_3
# Aufgabe 3

# Ziel: Umgang mit Dataframes üben
# Deine dritte Station ist die Forschungsabteilung. Hier werden gerade 4 neue Schokoladen-Sorten getestet.

# a) Maximale Punktzahl: 2 Punkte
# Erstelle einen Dataframe mit den folgenden Daten und speichere ihn in der Variable produkte:

#     Sorte Kakaogehalt Enthaelt_Laktose Koernigkeit
# 1  Crispy        0.50             TRUE        hoch
# 2 Joghurt        0.30             TRUE      mittel
# 3   Kokos        0.75             TRUE     niedrig
# 4  Waffel        0.60            FALSE        hoch

# Hierbei soll die Spalte Sorte character-Werte, die Spalte Kakaogehalt numeric-Werte, die Spalte Enthaelt_Laktose logical-Werte und die Spalte Koernigkeit factor-Werte mit der Ordnung niedrig<mittel<hoch beinhalten.

Sorte<-c("Crispy","Joghurt","Kokos","Waffel")
Kakaogehalt<-c(0.50,0.30,0.75,0.60)
Enthaelt_Laktose<-c(TRUE,TRUE,TRUE,FALSE)

Koernigkeit<-factor(c("hoch","mittel","niedrig","hoch"), levels=c("niedrig","mittel","hoch"),ordered = TRUE)

# x <- factor(c("single", "married", "married", "single"), levels = c("single", "married", "divorced"))

produkte<-data.frame(Sorte,Kakaogehalt,Enthaelt_Laktose,Koernigkeit)

# b) Maximale Punktzahl: 2 Punkte
# Speichere die Zeile mit dem größten Kakaogehalt in der Variable dunkelste_sorte.
dunkelste_sorte<-produkte[produkte$Kakaogehalt==max(produkte$Kakaogehalt),]

# c) Maximale Punktzahl: 1 Punkt
# Berechne den Mittelwert aus dem Kakaogehalt der Sorte Joghurt und Kokos und speichere das Ergebnis in der Variable kakao. # nolint
kakao<-subset(produkte$Kakaogehalt,produkte$Sorte=="Joghurt"|produkte$Sorte=="Kokos",select=Kakaogehalt)
kakao<-mean(kakao)

# sum(produkte$Kakaogehalt)
# mean(produkte$Kakaogehalt)

# d) Maximale Punktzahl: 1 Punkt
# Speichere die Spalten Sorte und Koernigkeit aus allen Zeilen, die mindestens eine Körnigkeit von mittel enthalten, in der Variable koernig.

koernig<-subset(produkte,produkte$Koernigkeit>="mittel",select=c(Sorte,Koernigkeit))

# produkte$Koernigkeit>="mittel"
# levels(produkte$Koernigkeit)>=2
# nlevels(produkte$Koernigkeit)


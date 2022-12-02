# Load Filmauswahl
film<-read.csv("resources/Filmauswahl.csv", encoding="UTF-8")

# a) Maximale Punktzahl: 1 Punkt
# Nicht alle Daten sind für diese Aufgabe von Interesse. Speichere deshalb in der Variable film_a

film_a<-film[,c("imdb_title_id", "original_title", "year", "genre", "duration", "budget", "avg_vote", "metascore", "reviews_from_users", "reviews_from_critics")] 


# b) Maximale Punktzahl: 1 Punkt
# Prüfe, in wie vielen Spalten aus film_a fehlende Werte vorkommen und schreibe das Ergebnis in die Variable b. #nolint

# b<-is.na(film_a)
# b<-any(is.na(film_a))
# b<-colSums(is.na(film_a))
# b<-which(is.na(film_a)==TRUE)
b<-sum(is.na(film_a))

# c) Maximale Punktzahl: 1 Punkt
# Berechne den Mittelwert aller Metascores aus film_a und speichere das Ergebnis in der Variable c. Fehlende Werte sollen nicht in die Berechnung miteinfließen. # nolint

c<-mean(film_a$metascore, na.rm=TRUE)

# d) Maximale Punktzahl: 2 Punkte
# Entferne alle Zeilen aus film_a mit fehlenden Werte in der Spalte reviews_from_users und speichere das Ergebnis in der Variable film_d1. Entferne alle Zeilen aus film_a mit fehlenden Werte in der Spalte reviews_from_critics und speichere das Ergebnis in der Variable film_d2. #nolint

film_d1<-film_a[!is.na(film_a$reviews_from_users),]
film_d2<-film_a[!is.na(film_a$reviews_from_critics),]

# e) Maximale Punktzahl: 1 Punkt
# Entferne alle Zeilen aus film_a, die in irgendeiner Spalte fehlende Werte haben und speichere das Ergebnis in der Variable film_e. Verändere nicht die Variable film_a. # nolint

film_e<-na.omit(film_a)

# f) Maximale Punktzahl: 2 Punkte
# Kurz-Film “Staplerfahrer Klaus” 2001,  IMDb ein durchschnittliches Voting von 7,8, sowie 20 User reviews und 13 externe Kritiken. Die Werte für den Metascore und das Budget fehlen. imdb-title-id von “tt8820590” und das Genre “Lehrvideo” #nolint
film_f<-film_a
film_f<-rbind(film_f, list("tt8820590","Staplerfahrer Klaus",2001,"Lehrvideo",10,NA,"7,8",NA,20,13))


# g) Maximale Punktzahl: 2 Punkte
# Kopiere den Datensatz film_a in die Variable film_g. Entferne anschließend die dreihundertste Zeile aus film_g. Achte darauf, dass am Ende die Zeilenpositionen mit den Zeilennamen wieder übereinstimmen. # nolint

film_g<-film_a
film_g<-film_g[-300,]
rownames(film_g)<-1:327

# h) Maximale Punktzahl: 2 Punkte
# Kopiere den Datensatz film_a in die Variable film_h. Füge eine neue Spalte am Ende des Datensatzes film_h hinzu. Die Spalte soll duration_hours heißen und die Länge des Filmes in Stunden (gerundet auf eine Nachkommastelle) enthalten. Entferne anschließend die Spalte duration aus dem Datensatz film_h. # nolint

film_h<-film_a
film_h$duration_hours<-round((film_h$duration/60),1)
film_h$duration<-NULL

# i) Maximale Punktzahl: 2 Punkte
# Kopiere den Datensatz film_a in die Variable film_i. Wandle die Spalte avg_vote in film_i in den Datentyp numeric um. Achte dabei darauf, die Kommata durch Punkte zu ersetzen. # nolint
film_i<-film_a
film_i$avg_vote<-as.numeric(gsub(x=film_i$avg_vote, pattern=",", replacement = "."))

# j) Maximale Punktzahl: 2 Punkte
# Speichere den Originial-Titel des am besten bewertetsten Filmes aus film_i in der Variable best. Speichere den Originial-Titel des am schlechtesten bewertetsten Filmes aus film_i in der Variable worst. # nolint

# x<-max(film_i$avg_vote)
best<-film_i$original_title[film_i$avg_vote == max(film_i$avg_vote)]
worst<-film_i$original_title[film_i$avg_vote == min(film_i$avg_vote)]

# k) Maximale Punktzahl: 1 Punkt
# Kopiere den Datensatz film_a in die Variable film_k. Wandle die Spalte genre in film_k in den Datentyp factor um.
film_k<-film_a
film_k$genre<-as.factor(film_k$genre)

# l) Maximale Punktzahl: 3 Punkte
# Arbeite mit dem Datensatz film_k:
#     Finde den Originaltitel und das Durchschnitts-Voting aller Filme mit dem Genre “Adventure” und speichere das Ergebnis in der Variable l_adv. # nolint
#     Finde den Originaltitel aller Animationsfilme, die länger dauern als 90 Minuten und speichere das Ergebnis in der Variable l_ani. # nolint
#     Finde den Originaltitel aller Actionfilme, die im Jahr 2006 oder 2016 erschienen sind und speichere das Ergebnis in der Variable l_act. # nolint

l_adv<-subset(film_k,film_k$genre=="Adventure", select=c(original_title,avg_vote))

l_ani<-subset(film_k,film_k$duration>90&film_k$genre=="Animation", select=c(original_title))

l_act<-subset(film_k,film_k$genre=="Action"&(film_k$year==2006|film_k$year==2016), select=c(original_title))

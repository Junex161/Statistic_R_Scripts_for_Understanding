set.seed(500)
# Parameters
n <- 100          # 100 Personen - wieso nicht?
sd <- 5           # Standardabweichung = 5 

# Wiiir generieren unsere Daten! (Totalverboten in der Praxis)
depressionsscore_zu_beginn <- rnorm(n, mean = 22, sd = sd)
depressionsscore_zu_ende <- rnorm(n, mean = 15, sd = sd)
differenz_d <- depressionsscore_zu_ende - depressionsscore_zu_beginn


# Optional: Visualize the distributions
hist(depressionsscore_zu_beginn, breaks = 10, col = "blue", main = "Depressionssocre zu Beginn", xlab = "Values")
hist(depressionsscore_zu_ende, breaks = 10, col = "red", main = "Depressionsscore zu Ende", xlab = "Values")
hist(differenz_d, breaks = 10, col = "green", main = "Differenz D", xlab = "Values")

# Mittelwert ist nicht 0
mean(differenz_d)

shapiro.test(differenz_d)


t.test(depressionsscore_zu_ende, depressionsscore_zu_beginn, paired=T)


t.test(differenz_d, mu=0)

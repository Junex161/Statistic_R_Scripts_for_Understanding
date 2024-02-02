library(ggplot2)

# Anzahl der Samples (wie oft soll es mir einen Mittelwert von IQ berechnen)
anzahl_samples <- 100
# Anzahl der Werte pro Sample (wie viele Werte soll es für den Mittelwert nehmen)
werte_pro_sample <- 1000
# Parameter für die Normalverteilung 
erwartungswert <- 100
standardabweichung <- 15

# Leerer Vektor zur Speicherung der Mittelwerte
mittelwerte <- numeric(anzahl_samples)

# Schleife über die Anzahl der Samples
for (i in 1:anzahl_samples) {
  # Generiere IQ-Werte für jedes Sample
  iq_werte <- rnorm(werte_pro_sample, mean = erwartungswert, sd = standardabweichung)
  
  # Berechne den Mittelwert der IQ-Werte
  mittelwerte[i] <- mean(iq_werte)
}

# Berechne den Mittelwert der 100 Mittelwerte
gesamt_mittelwert <- mean(mittelwerte)

# Berechne die Standardabweichung des Mittelwerts der 100 Mittelwerte
gesamt_standardabweichung <- sd(mittelwerte)

# Berechne die Standardabweichung des Mittelwerts der 100 Mittelwerte
standardabweichung_mittelwert <- sd(mittelwerte) / sqrt(anzahl_samples)


# Erzeugt die Normalverteilung des Mittelwerts der 100 Mittelwerte
normalverteilung <- data.frame(x = seq(gesamt_mittelwert - 3 * standardabweichung_mittelwert, gesamt_mittelwert + 3 * standardabweichung_mittelwert, length.out = 1000))
normalverteilung$y <- dnorm(normalverteilung$x, mean = gesamt_mittelwert, sd = standardabweichung_mittelwert)

# Erzeugt den Plot/Graph mit der coolen Schrift
ggplot(normalverteilung, aes(x, y)) +
  geom_line() +
  geom_vline(xintercept = gesamt_mittelwert, color = "red", linetype = "dashed") +
  annotate("text", x = gesamt_mittelwert, y = max(normalverteilung$y), label = sprintf("Mittelwert: %.4f", gesamt_mittelwert), vjust = -0.5, hjust = 0.5, color = "red") +
  annotate("text", x = gesamt_mittelwert + 2.2 * standardabweichung_mittelwert, y = max(normalverteilung$y), label = sprintf("Standardabweichung: %.4f", standardabweichung_mittelwert), vjust = -0.5, hjust = 0.5, color = "blue") +
  annotate("text", x = gesamt_mittelwert, y = max(normalverteilung$y) * 0.95, label = sprintf("Anzahl Samples: %d", anzahl_samples), vjust = -0.5, hjust = 2, color = "black") +
  annotate("text", x = gesamt_mittelwert, y = max(normalverteilung$y) * 0.9, label = sprintf("Werte pro Sample: %d", werte_pro_sample), vjust = -0.5, hjust = 2, color = "black") +
  labs(title = sprintf("Normalverteilung des Mittelwerts der %d Mittelwerte", anzahl_samples),
       x = sprintf("Mittelwert der %d Mittelwerte", anzahl_samples),
       y = "Dichte")



# Gibt mir die Werte auch in der konsoleeee aus

cat("\nMittelwert der 100 Mittelwerte:", gesamt_mittelwert, "\n")
cat("Standardabweichung des Mittelwerts der 100 Mittelwerte:", gesamt_standardabweichung, "\n")
cat("Standardabweichung des Mittelwerts der 100 Mittelwerte (Standardfehler):", standardabweichung_mittelwert, "\n")


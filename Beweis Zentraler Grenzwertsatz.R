# Anzahl der Simulationen und Würfel pro Simulation
# Hier können Anzahl der Würfel sowie Simulationen angegeben werden
num_simulations <- 1000
num_dice <- 30

# Funktion zum Simulieren der Würfe und Berechnung der Mittelwerte
simulate_dice_means <- function(num_simulations, num_dice) {
  means <- numeric(num_simulations) # Vektor zur Speicherung der Mittelwerte
  
  for (i in 1:num_simulations) {
    rolls <- sample(1:6, num_dice, replace = TRUE) # 30 Würfe simulieren
    means[i] <- mean(rolls) # Mittelwert berechnen
  }
  
  return(means)
}

# Simulation durchführen
# Für Reproduzierbarkeit
means <- simulate_dice_means(num_simulations, num_dice)

# Plot der Mittelwerte
hist(means, 
     breaks = 10, 
     main = "Verteilung der Mittelwerte (30 Würfel, 1000 Simulationen)", 
     xlab = "Mittelwert", 
     col = "skyblue", 
     border = "black")

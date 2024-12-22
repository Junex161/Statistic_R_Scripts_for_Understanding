# Parameter der Normalverteilung
mean <- 100
p25 <- 97
p975 <- 103

# Calculate standard deviation
z25 <- qnorm(0.025)  # Z-score for the 2.5th percentile
z975 <- qnorm(0.975) # Z-score for the 97.5th percentile

# Using the relationship between X, mean, and Z
sd <- 1

# Define the x range for the plot
x <- seq(mean - 4 * sd, mean + 4 * sd, length.out = 1000)
x

# Calculate the normal density
y <- dnorm(x, mean = mean, sd = sd)

# Plot the normal distribution without the default x-axis
plot(x, y, type = "l", col = "#abceff", lwd = 2, 
     main = "Normal Distribution", 
     xlab = "Value", ylab = "Density", xaxt = "n")

# Add customized x-axis with 1-step increments
axis(1, at = seq(floor(mean - 4 * sd), ceiling(mean + 4 * sd), by = 1))

# Add vertical lines for the kritische Werte, mean, and 97.5th percentile
abline(v = c(mean), col = c("black"), lwd = 2, lty = 2)

# Annotate the kritische Werte and mean 
text(c(p25, mean, p975), c(0.02, 0.02, 0.02), 
     labels = c("", "Mean", ""), 
     pos = 3, col = c("red", "black", "red"), cex = 0.8, font = 2)

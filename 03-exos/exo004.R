# 187Re/188Os
x = c(5, 12, 50, 83, 124)

# 187Os/188Os
y = c(8.3317, 8.3410, 8.3917, 8.4357, 8.4904)

# Tracé du graphique
plot(x, y, type = "p", 
     xlab = "187Re/188Os", ylab = "187Os/188Os",
     xlim = c(0, 130), ylim = c(8.3, 8.5), pch = 20, col = "blue")
grid()

# Ajout des numéros de points
text(x, y, labels = seq_along(x), pos = 3, col = "red", cex = 0.8)

# Calcul de la pente
slope = (y[5] - y[1]) / (x[5] - x[1])

# Calcul de l'ordonnée à l'origine
y0 = y[5] - slope * x[5]

# Affichage des résultats dans la console
cat("La pente de la droite est", slope, "\n")
cat("L'ordonnée à l'origine est", y0, "\n")

# Ajout de la droite de régression
abline(y0, slope, col = "red", lwd = 2, lty = 1)

# Calcul de l'âge de l'échantillon
lambda = 1.666e-11 # en 1/année
t = log(1 + slope) / lambda

cat("L'âge des minéraux de l'échantillon est", signif(t / 1e6, 3), "Ma\n")

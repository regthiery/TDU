# Étude sismique
#----------------------------

# Données
xx = c(10, 25, 50, 75, 100, 150, 200)
tt = c(1.54, 3.85, 7.69, 10.99, 14.11, 20.36, 26.61)

# Tracer les points
plot(xx, tt, type = 'p', pch = 19, col = "blue", 
     xlab = "Distance (km)", ylab = "Temps (s)", main = "Étude sismique", xlim = c(0, 250), ylim = c(0, 30))

# Calcul des pentes
v1 = xx[3] / tt[3]  # Pente de la droite passant par l'origine et le point 3
v2 = (xx[7] - xx[4]) / (tt[7] - tt[4])  # Pente de la droite passant par les points 4 et 7

# Calcul de l'ordonnée à l'origine pour la deuxième droite
t0 = tt[7] - xx[7] / v2

# Droite 1 : passant par l'origine et le point 3
abline(a = 0, b = 1 / v1, col = "red", lwd = 2, lty = 2)  # a = ordonnée à l'origine, b = pente

# Droite 2 : passant par les points 4 et 7
abline(a = t0, b = 1 / v2, col = "black", lwd = 2, lty = 3)  # a = t0, b = pente

# Ajout de légende
legend("topleft", legend = c("Onde directe (origine, point 3)", "Onde réfractée ou conique (points 4, 7)"), 
       col = c("red", "black"), lwd = 2, lty = c(2, 3), bg = "white")

grid()

# Calculs supplémentaires
lambda = asin(v1 / v2)
h = t0 / (2 * cos(lambda)) * v1

# Impression des résultats
cat("Résultats des calculs :\n")
cat(sprintf("- Pente de la droite 1 (v1) : %.2f km/s\n", v1))
cat(sprintf("- Pente de la droite 2 (v2) : %.2f km/s\n", v2))
cat(sprintf("- Ordonnée à l'origine de la droite 2 (t0) : %.2f s\n", t0))
cat(sprintf("- Lambda (asin(v1 / v2)) : %.4f rad\n", lambda))
cat(sprintf("- Lambda (asin(v1 / v2)) : %.4f°\n", lambda*180/pi))
cat(sprintf("- h : %.2f km\n", h))

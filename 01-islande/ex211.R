# Chargement des données

# # data <- data.frame(
  # Annee = c(1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024, 2025),
  # Deplacement_Est = c(32.786, 31.5946, 30.6546, 29.7569, 29.1384, 27.2782, 26.0843, 24.6598, 23.8808, 22.7818, 21.6566, 20.859, 20.06, 18.5149, 17.3629, 16.6279, 15.6189, 14.8063, 13.6812, 12.7728, 11.8786, 10.8737, 10.0494, 9.1308, 8.0693, 6.8624, 4.3615, 3.2274, 1.1385, -0.2628),
  # Deplacement_Ouest = c(-58.2403, -56.3803, -54.3918, -52.3493, -50.695, -47.1746, -45.4573, -43.2858, -41.5294, -39.5261, -37.3033, -35.9077, -33.7948, -31.2051, -29.0876, -27.3002, -25.2819, -23.4383, -20.9587, -18.9929, -16.7667, -14.831, -12.953, -10.6909, -9.4267, -6.809, -5.5901, -3.5769, -2.0949, -0.7322)
# )

data <- data.frame(
  Annee = 1997:2025,
  Deplacement_Est = c(-38.1168, -37.2995, -36.1685, -35.2191, -33.6545, 
                      -32.7014, -31.6825, -30.4999, -28.9895, -27.5133, 
                      -26.1007, -24.8715, -23.4228, -22.187, -20.3579, 
                      -18.8351, -17.3914, -15.7578, -13.8397, -12.3844, 
                      -11.093, -9.6174, -8.4962, -6.9173, -5.5502, 
                      -4.1799, -2.8421, -0.7897, -0.0567),
  Deplacement_Ouest = c(-39.4835, -39.2676, -37.3924, -36.0637, -34.2874, 
                        -32.9745, -31.643, -29.9594, -28.6787, -26.9325, 
                        -25.9998, -24.1413, -22.7467, -21.1784, -19.7709, 
                        -18.3822, -17.0452, -15.2569, -15.0087, -13.4935, 
                        -11.9806, -10.7097, -8.9023, -8.0365, -6.0325, 
                        -4.5837, -3.2915, -1.2988, -0.8088)
)




# Préparation de l'affichage côte à côte
par(mfrow = c(1, 2))  # 1 ligne, 2 colonnes

# Graphique des déplacements Est
plot(data$Annee, data$Deplacement_Est, type = "o", col = "blue", pch = 16, xlab = "Année", ylab = "Déplacement Est (cm)", main = "Déplacement Est au fil du temps")
grid()  # Ajout d'une grille

# Calcul et tracé de la régression linéaire pour le déplacement Est
model_est <- lm(Deplacement_Est ~ Annee, data = data)
abline(model_est, col = "darkblue", lwd = 2)
# Ajout du coefficient de régression
legend("topleft", legend = paste("Régression: y =", round(coef(model_est)[2], 4), "x +", round(coef(model_est)[1], 4)), bty = "n")

# Graphique des déplacements Ouest
plot(data$Annee, data$Deplacement_Ouest, type = "o", col = "red", pch = 16, xlab = "Année", ylab = "Déplacement Ouest (cm)", main = "Déplacement Ouest au fil du temps")
grid()  # Ajout d'une grille

# Calcul et tracé de la régression linéaire pour le déplacement Ouest
model_ouest <- lm(Deplacement_Ouest ~ Annee, data = data)
abline(model_ouest, col = "darkred", lwd = 2)
# Ajout du coefficient de régression
legend("topleft", legend = paste("Régression: y =", round(coef(model_ouest)[2], 4), "x +", round(coef(model_ouest)[1], 4)), bty = "n")

# Réinitialisation de l'affichage graphique
par(mfrow = c(1, 1))




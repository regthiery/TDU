# Données
R = 80       # Rayon de l'astéroïde
rho1 = 7.9   # Densité 1 du noyau
rho2 = 3.2   # Densité 2 du manteau

# Calcul de R1
R1 = R * (2 * rho2 / (rho1 + 2 * rho2))^(1/3)

# Sortie des résultats
cat("Résultats des calculs :\n")
cat(sprintf("- Rayon de l'astéroïde (R) : %.2f\n", R))
cat(sprintf("- Densité rho1 du noyau : %.2f\n", rho1))
cat(sprintf("- Densité rho2 du manteau : %.2f\n", rho2))
cat(sprintf("- Rayon du noyau (R1) : %.2f\n", R1))

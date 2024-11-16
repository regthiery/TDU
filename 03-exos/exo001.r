#----------------------------
# Les données
#----------------------------

# Densités
ds <- 2.3  # Densité du cône de scories
dc <- 2.9  # Densité de la croûte océanique
dm <- 3.3  # Densité du manteau
de <- 1    # Densité de l'eau

H <- 2400  # Hauteur du cône volcanique (en mètres)
h <- 357   # Altitude du cône au-dessus de la surface de l'eau (en mètres)

#----------------------------
# Les relations de calcul
#----------------------------

p <- H - h  # Profondeur du plancher océanique
a <- H * (dm - ds) / (dm - de)  # Hauteur du cône volcanique par rapport au plancher océanique
x <- p - a  # Profondeur du sommet du cône après réajustement isostatique
R <- H - a  # Enfoncement de la croûte océanique sous l'édifice volcanique

#----------------------------
# Sortie des résultats
#----------------------------

cat("Résultats des calculs :\n")
cat(sprintf("- Profondeur du plancher océanique (p) : %.2f m\n", p))
cat(sprintf("- Profondeur du sommet du cône après réajustement isostatique (x) : %.2f m\n", x))
cat(sprintf("- Hauteur du cône volcanique par rapport au plancher océanique (a) : %.2f m\n", a))
cat("- Épaisseur de la croûte océanique (e) : Indisponible (non calculée)\n")
cat(sprintf("- Enfoncement de la croûte océanique sous l'édifice volcanique (R) : %.2f m\n", R))

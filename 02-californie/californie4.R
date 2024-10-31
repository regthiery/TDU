# Charger les bibliothèques nécessaires
library(ggplot2)
library(dplyr)
library(maps)

# Lire les données sans en-tête
data <- read.table("data/californie.txt", header = FALSE)

# Nommer les colonnes manuellement
colnames(data) <- c("Site", "Lon", "Lat", "Delta.E", "Delta.N", "Delta.V", "Sigma.E", "Sigma.N", "Sigma.V")

data$x = data$Delta.E
data$y = data$Delta.N

# Appliquer K-means
set.seed(123)  # Pour la reproductibilité
kmeans_result <- kmeans(data[, c("x", "y")], centers = 2)  # 2 clusters

# Ajouter les résultats au DataFrame
data$group <- as.factor(kmeans_result$cluster)

# Calculer les moyennes pour chaque groupe
mean_values <- data %>%
  group_by(group) %>%
  summarise(mean_x = mean(x),
            mean_y = mean(y),
            n = n())  # Nombre de points dans chaque groupe

print(mean_values)

# Charger la carte de la Californie
california_map <- map_data("state") %>% filter(region == "california")

# Tracer la carte de la Californie avec les vecteurs de déplacement
ggplot() +
  # Fond de carte de la Californie
  geom_polygon(data = california_map, aes(x = long, y = lat, group = group), fill = "lightgray", color = "black") +
  
  # Points représentant les stations GPS
  geom_point(data = data, aes(x = Lon, y = Lat), color = "black", size = 1) +  # Couleur noire pour les points
  
  # Vecteurs de déplacement avec flèches plus longues, colorées selon le groupe
  geom_segment(data = data,
               aes(x = Lon, y = Lat, 
                   xend = Lon + Delta.E / 1e2 ,  # Augmenter la longueur de la flèche
                   yend = Lat + Delta.N / 1e2,
                   color = group),  # Couleur selon le groupe
               arrow = arrow(length = unit(0.2, "cm"))) +  # Utiliser les couleurs des groupes pour les flèches
               
  # Ajuster les limites de la carte pour se concentrer sur la Californie, en les prolongeant
  coord_fixed(ratio = 1.3, xlim = c(-125, -115), ylim = c(33, 43)) +
  
  # Ajouter des titres et labels
  labs(title = "Vecteurs Déplacement en Californie",
       x = "Longitude",
       y = "Latitude") +
  
  theme_bw() +  # Utiliser un thème différent pour un meilleur contraste
  scale_color_manual(values = c("1" = "red", "2" = "blue"), name = "Groupe")  # Définir des couleurs pour les groupes

# Enregistrer le graphique dans un fichier PNG
ggsave("outputs/californie4.png", width = 8, height = 6)

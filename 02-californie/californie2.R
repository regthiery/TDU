# Charger les bibliothèques nécessaires
library(ggplot2)
library(dplyr)



# Lire les données sans en-tête
data <- read.table("data/californie.txt", header = FALSE)

# Nommer les colonnes manuellement
colnames(data) <- c("Site", "Lon", "Lat", "Delta.E", "Delta.N", "Delta.V", "Sigma.E", "Sigma.N", "Sigma.V")

data$x = data$Delta.E
data$y = data$Delta.N
data$group <- NA  # Ajouter une colonne pour le groupe




ggplot(data, aes(x = x, y = y)) +
  geom_point(alpha = 0.5) +
  labs(title = "Nuage de points") 
  

# Appliquer K-means
set.seed(123)  # Pour la reproductibilité
kmeans_result <- kmeans(data[, c("x", "y")], centers = 2)  # 2 clusters

# Ajouter les résultats au DataFrame
data$group <- as.factor(kmeans_result$cluster)


ggplot(data, aes(x = x, y = y, color = group)) +
  geom_point(alpha = 0.5) +
  labs(title = "Nuage de points avec groupes identifiés") 

ggsave("outputs/californie2.png", width = 8, height = 6)

# Calculer les moyennes pour chaque groupe
mean_values <- data %>%
  group_by(group) %>%
  summarise(mean_x = mean(x),
            mean_y = mean(y),
            n = n())  # Nombre de points dans chaque groupe

print(mean_values)

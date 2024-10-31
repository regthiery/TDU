# Charger les bibliothèques nécessaires
library(ggplot2)
library(dplyr)

# Exemple de données
set.seed(123)  # Pour la reproductibilité
n1 <- 100
n2 <- 100

# Population 1 : x faible, y fort
pop1 <- data.frame(x = rnorm(n1, mean = 2, sd = 2.5),
                   y = rnorm(n1, mean = 8, sd = 2.5))

# Population 2 : x fort, y faible
pop2 <- data.frame(x = rnorm(n2, mean = 8, sd = 0.5),
                   y = rnorm(n2, mean = 2, sd = 1))

# Combiner les données
data <- rbind(pop1, pop2)
data$group <- NA  # Ajouter une colonne pour le groupe

ggplot(data, aes(x = x, y = y)) +
  geom_point(alpha = 0.5) +
  labs(title = "Nuage de points")

ggsave("outputs/californie1a.png", width = 8, height = 6)


# Appliquer K-means
set.seed(123)  # Pour la reproductibilité
kmeans_result <- kmeans(data[, c("x", "y")], centers = 2)  # 2 clusters

# Ajouter les résultats au DataFrame
data$group <- as.factor(kmeans_result$cluster)


ggplot(data, aes(x = x, y = y, color = group)) +
  geom_point(alpha = 0.5) +
  labs(title = "Nuage de points avec groupes identifiés")

ggsave("outputs/californie1b.png", width = 8, height = 6)

# Calculer les moyennes pour chaque groupe
mean_values <- data %>%
  group_by(group) %>%
  summarise(mean_x = mean(x),
            mean_y = mean(y),
            n = n())  # Nombre de points dans chaque groupe

print(mean_values)

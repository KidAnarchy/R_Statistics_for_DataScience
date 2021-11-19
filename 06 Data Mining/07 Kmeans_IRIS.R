#-----------------Kmeans------------------------------

# Import data set
data(iris)

# Set new name
newiris <- iris

# Delete class feature.
newiris$Species <- NULL

# Use Kmean to cluster 3 group
(kc <- kmeans(newiris, 3)) 

# Look at the table comparison 
table(iris$Species, kc$cluster)

# Plot compare Sepal.length and Sepal,width
plot(newiris[c("Sepal.Length", "Sepal.Width")], col=kc$cluster)

# Show centroid for each group
points(kc$centers[,c("Sepal.Length", "Sepal.Width")], col=1:3, pch=8, cex=2)
kc$centers


#determine number of clusters 1-15
wss <- (nrow(newiris)-1)*sum(apply(newiris,2,var))
for (i in 2:15) wss[i] <- sum(kmeans(newiris,
  	centers=i)$withinss)

# Shown plot and finding k optimal
plot(1:15, wss, type="b", xlab="Number of Clusters", ylab="Within groups sum of squares")

# If we used k = 2 groups
(kc <- kmeans(newiris, 2)) 
table(iris$Species, kc$cluster)
#-----------------------------------------------------

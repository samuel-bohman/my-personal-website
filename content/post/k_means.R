k_means <- function(x, k, iter.max = 10) {
  random_index <- sample(1:k, nrow(x), replace = TRUE)
  data_w_cluster <- cbind(x, clusterID = random_index)
  iterations <- 1
  plot(data_w_cluster[, 1:2], xaxt = "n", yaxt = "n")
  legend("topright", paste0("i = ", 0), bg = NULL)
  while(TRUE) {
    centroids <- matrix(rep(0, times = k * ncol(x)), nrow = k, ncol = ncol(x))
    for(i in 1:k) {
      obs_of_cluster_i <- data_w_cluster$clusterID == i
      centroids[i, ] <- colMeans(data_w_cluster[obs_of_cluster_i, 1:2])
    }
    dist_from_centroids <- matrix(rep(0, nrow(x) * k), nrow = nrow(x), ncol = k)
    for(i in 1:nrow(x)) {
      for(j in 1:nrow(centroids)) {
        dist_from_centroids[i, j] <- my_dist(x[i, ], centroids[j, ])  # see my_dist.R
      }
    }
    obs_new_clusterID <- apply(dist_from_centroids, 1, which.min)
    if(all(obs_new_clusterID == data_w_cluster$clusterID)) {
      km.clusters <- obs_new_clusterID
      centroid.matrix <- centroids
      break
    } else if (iterations > iter.max) {
      break
    } else {
      data_w_cluster$clusterID <- obs_new_clusterID
      plot(data_w_cluster[, 1:2], col = alpha(data_w_cluster$clusterID, 0.7), xaxt = "n", yaxt = "n")
      points(centroids[, 1:2], pch = 4, cex = 1.5, lwd = 2, col = 1:k)
      legend("topright", paste0("i = ", iterations), bg = NULL)
      iterations <- iterations + 1
    }
  }
}

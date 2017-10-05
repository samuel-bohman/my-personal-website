my_dist <- function(a, b, metric = "euclidean") {
  if (metric == "manhattan") {
    dist <- sum(abs(a - b))  # manhattan
  } else {
    dist <- sqrt(sum((a - b) ^ 2))  # euclidean
  }
  return(dist)
}

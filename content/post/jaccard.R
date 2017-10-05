# The function takes two arguments: `x` a dataframe or matrix object, and 
# `m` the `MARGIN` argument used in the `apply` function. 
jaccard <- function(x, m) {
  if (m == 1 | m == 2) {
    M_00 <- apply(x, m, sum) == 0
    M_11 <- apply(x, m, sum) == 2
    if (m == 1) {
      x <- x[!M_00, ]
      JSim <- sum(M_11) / nrow(x)
    } else {
      x <- x[, !M_00]
      JSim <- sum(M_11) / length(x)
    }
    JDist <- 1 - JSim
    return(c(JSim = JSim, JDist = JDist))
  } else break
}
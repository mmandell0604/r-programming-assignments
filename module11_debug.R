tukey.outlier <- function(x) {
  q1 <- quantile(x, 0.25, na.rm = TRUE)
  q3 <- quantile(x, 0.75, na.rm = TRUE)
  iqr_value <- IQR(x, na.rm = TRUE)
  
  x < (q1 - 1.5 * iqr_value) |
    x > (q3 + 1.5 * iqr_value)
}

set.seed(123)
test_mat <- matrix(rnorm(50), nrow = 10)

tukey_multiple <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  
  for (j in 1:ncol(x)) {
    outliers[, j] <- outliers[, j] & tukey.outlier(x[, j])
  }
  
  outlier.vec <- vector("logical", length = nrow(x))
  
  for (i in 1:nrow(x)) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  
  return(outlier.vec)
}

original_result <- tukey_multiple(test_mat)
print(original_result)

corrected_tukey <- function(x) {
  
  if (!is.matrix(x) || !is.numeric(x)) {
    stop("Input must be a numeric matrix.")
  }
  
  if (nrow(x) == 0 || ncol(x) == 0) {
    stop("Matrix must have at least one row and column.")
  }
  
  outliers <- array(TRUE, dim = dim(x))
  
  for (j in seq_len(ncol(x))) {
    outliers[, j] <- outliers[, j] &
      tukey.outlier(x[, j])
  }
  
  outlier.vec <- logical(nrow(x))
  
  for (i in seq_len(nrow(x))) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  
  return(outlier.vec)
}

corrected_result <- corrected_tukey(test_mat)

print(corrected_result)

print(length(corrected_result))
print(is.logical(corrected_result))

try(corrected_tukey(data.frame(a = 1:5, b = 6:10)))






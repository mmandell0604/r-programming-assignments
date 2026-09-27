# 1. Create the matrices
A <- matrix(1:100, nrow = 10)
B <- matrix(1:1000, nrow = 10)

A
B

# 2. Inspect dimensions
dim(A)
dim(B)

nrow(A) == ncol(A)
nrow(B) == ncol(B)

# 3. Compute inverse and determinant

invA <- tryCatch(
  solve(A),
  error = function(e) e
)

detA <- tryCatch(
  det(A),
  error = function(e) e
)

invA
detA


invB <- tryCatch(
  solve(B),
  error = function(e) e
)

detB <- tryCatch(
  det(B),
  error = function(e) e
)

invB
detB
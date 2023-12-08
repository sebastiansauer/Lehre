library(matlib)

V <- matrix(c(.9487, .9844, 
              .3162, -.4472), byrow = T, nrow = 2)
L <- matrix(c(7, 0, 0, 2), byrow =T, nrow = 2)

Vt = t(V)

Vinv = solve(V)
Vinv2 = inv(V)

det(V)
VL = V %*% L

VLVinv = VL %*% Vinv


A = V %*% L %*% Vinv
A

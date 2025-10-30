

log(1/4, base = 2)


log(4, base = 2)

log2(4)

log2(1/.5)

# Wenig Überraschung:
log2(1/.99)


# Viel Überraschung/Information:
log2(1/.01)

# synonym:x
-log2(.01)




# Faire Münze:

I_K <- log2(1/.5)
I_K

I_Z <- log2(1/.5)

I_faire_Münze <- .5*I_K + .5*I_Z


# Gezinkte Münze:

I_Kz <- log2(1/.99)
I_Zz <- log2(1/.01)

I_gezinkte_Muenze <- .99*I_Kz + .01*I_Zz


name_of_elliptic_curve = '11.a1'
E = EllipticCurve(name_of_elliptic_curve)
for prime in factor(E.conductor()):
	j_inv = E.j_invariant().valuation(prime[0])
	factors = factor(prime[0]-1)
	modular_degree = E.modular_degree()
	for ell in factors:
        if gcd(ell[0], modular_degree) > 1:
            continue
		if gcd(ell[0], j_inv) > 1:
			print(split[0] + split[1] + split[2] + ' ' + str(prime[0]) + ' ' + str(ell[0]) + ' ' + j_inv)

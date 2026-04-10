# Change the following variable to the label of the elliptic curve you want to analyze. This can be LMFDB label or Cremona label.
name_of_elliptic_curve = '11.a1'

# We create the elliptic curve object using the label given.
E = EllipticCurve(name_of_elliptic_curve)

is_expectation_true = True

for prime in factor(E.conductor()):

	# The expectation is only for the primes for which E has split multiplicative reduction. If the curve does not have split multiplicative reduction at the prime, we skip it.
	if not E.has_split_multiplicative_reduction(prime[0]):
		continue

	# We get the p-adic valuation of the j-invariant of E at the prime.
	j_inv = E.j_invariant().valuation(prime[0])

	# We calculate the factors of p-1.
	factors = factor(prime[0]-1)
	modular_degree = E.modular_degree()
	
	for ell in factors:

		# Recall that the expectation is only for the primes ell|p-1 such that gcd(ell, modular_degree) = 1.
		if gcd(ell[0], modular_degree) > 1:
			continue

		# If the elliptic curve does not satisfy the expectation, we print the label of the elliptic curve.
		if gcd(ell[0], j_inv) > 1:
			print(split[0] + split[1] + split[2] + ' ' + str(prime[0]) + ' ' + str(ell[0]) + ' ' + j_inv)
			is_expectation_true = False

if is_expectation_true:
	print('The expectation holds for all for the elliptic curve: ' + name_of_elliptic_curve)

else:
	print('The expectation does not hold for all for the elliptic curve: ' + name_of_elliptic_curve)

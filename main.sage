# The output of the code is the following:
# If there is no counterexample of the Expectation then there is no output.
# If there is a counterexample of the Expectation then the output is of the form:
# The Cremona label of the elliptic curve, the prime p, the prime ell, the valuation of the j-invariant at p.

import os

# Is is necessary that the folder 'alldegphi' is in the same directory and with the same name, otherwise the code will not work.
for file_name in os.listdir('./alldegphi'):
	# We loop through all the files in the folder 'alldegphi'.
	# We are assuming that the files in the folder 'alldegphi' have the form given by Cremona. That is, the first three entries of each line of the file comprise the Cremona label of the elliptic curve.
	file = open('./alldegphi/{}'.format(file_name))
	for line in file.readlines():

		# As mentioned before
		split = line.split(' ')

		# We construct the elliptic curve given by the Cremona label and we calculate its modular degree.
		E = EllipticCurve(split[0] + split[1] + split[2])
		modular_degree = E.modular_degree()
		
		for prime in factor(int(split[0])):
			if not E.has_split_multiplicative_reduction(prime[0]):
				continue
			
			# We calculate ord_p(j(E)) for the prime p.
			j_inv = E.j_invariant().valuation(prime[0])
			
			# We loop through the prime factors of p-1.
			for ell in factor(prime[0]-1):

				# If there is an elliptic curve that does not satisfy the Expectation then the output is of the form:
				# The Cremona label of the elliptic curve, the prime p, the prime ell, the valuation of the j-invariant at p.

				# We ignore the cases where gcd(ell, modular_degree) > 1 because in those cases the Expectation does not apply.
				if gcd(ell[0], modular_degree) > 1:
					continue

				if gcd(ell[0], Integer(j_inv)) > 1:
					print(str(split[0]) + str(split[1]) + str(split[2]) + ' ' + str(prime[0]) + ' ' + str(ell[0]) + ' ' + str(j_inv))
	
	file.close()

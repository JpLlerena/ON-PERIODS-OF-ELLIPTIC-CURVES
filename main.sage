import os

counterexample_file = open('./temp.txt', 'w')
for file_name in os.listdir('./alldegphi'):
	file = open('./alldegphi/{}'.format(file_name))
	for line in file.readlines():
		split = line.split(' ')
		for prime in factor(int(split[0])):
			if prime[0] < 22:
				continue
			E = EllipticCurve(split[0] + split[1] + split[2])
			if E.j_invariant() == 0:
				continue
			j_inv = E.j_invariant().valuation(prime[0])
			if not E.has_split_multiplicative_reduction(prime[0]):
				continue
			if j_inv == 0:
				continue
			factors = factor(prime[0]-1)
			for ell in factors:
				if ell[0] < 9:
					continue
				modular_degree = E.modular_degree()
#				if gcd(ell[0], modular_degree) > 1:
#					continue
				if gcd(ell[0], Integer(j_inv)) > 1:
					print(str(split[0]) + str(split[1]) + str(split[2]) + ' ' + str(prime[0]) + ' ' + str(ell[0]) + ' ' + str(j_inv))
					write_text = str(split[0]) + str(split[1]) + str(split[2]) + ' ' + str(prime[0]) + ' ' + str(ell[0]) + ' ' + str(j_inv) + '\n'
					counterexample_file.write(write_text)
	
	file.close()
counterxample_file.close()

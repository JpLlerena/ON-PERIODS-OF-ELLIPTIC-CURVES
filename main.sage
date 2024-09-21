import os

counterexample_file = open('./temp.txt', 'w')
for file_name in os.listdir('./alldegphi'):
	file = open('./alldegphi/{}'.format(file_name))
	for line in file.readlines():
		split = line.split(' ')
		E = EllipticCurve(eval(split[3]))
		for prime in factor(E.conductor()):
			j_inv = E.j_invariant().valuation(prime[0])
			factors = factor(prime[0]-1)
			modular_degree = eval(split[4])
			for ell in factors:
				if gcd(ell[0], j_inv) > 1:
					print(split[0] + split[1] + split[2] + ' ' + str(prime[0]) + ' ' + str(ell[0]) + ' ' + j_inv)
	file.close()
counterxample_file.close()

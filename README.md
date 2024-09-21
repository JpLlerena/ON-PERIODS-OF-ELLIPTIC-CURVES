# j_invariant_valuation
This code was used in the article "On periods of elliptic curves" by Daniel Barrera and Juan-Pablo Llerena.
## Objective
The objective of this code was to study Expectation 8.2 of the aformentioned article. This expectatoin relates the p-adic valuation of a j-invariant of a rational elliptic curve, when p is a prime for which E has split multiplicative reduction.

This code also allowed us to study the more general question: "Let E be a rational elliptic curve of conductor N, let p be a prime such that p divides N and j_E be the j-invariant of E. If ell > 5 is a prime such that ell|p-1 and it is coprime to the modular degree of E, then (ord_p(j_E),ell) = 1".

The code was runned on all the elliptic curves in the cremona database version 2022-10-13: https://zenodo.org/records/7194436

## Structure

There are 3 files and 1 folder in this project:

Readme.md: This is the file you are currently reading, and contains the general description of this project, it also contains a small explanation of the code.

main.sage: This is the code that was used in the article.

main_2.sage: This is a more basic version of main.sage used primarly for checking one elliptic curve at a time instead of all at once.

alldelphi: For simplification purposes (and following cremona's license) we copied, as is and without modification, the folder named alldelphi of cremona's data base: https://zenodo.org/records/7194436. This folder contains the minimal Wiestrass equation and the j-invariant of all the elliptic curves in the cremona database.

## Disclaimer

The code used on the article cannot be run with online interpreters (e.g. Cocalc). The reason being that we are unaware if there is a way to upload files into Cocalc which will allow SageMath to have acces to the list of elliptic curves in the cremona database. Nevertheless, the main_2.sage can be used in online interpreters, by changing the variable 'name_of_elliptic_curve'.

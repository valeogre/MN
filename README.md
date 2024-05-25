Tema 2 - Metode Numerice

Task1 - Numerical Music
Funcții
1. stereo_to_mono(stereo)
Convertește un semnal audio stereo într-un semnal mono prin medierea canalelor.
2. apply_reverb(signal, impulse_response)
Aplică un efect de reverb unui semnal audio folosind convoluția cu un răspuns impuls.

Task2 - Robotzii
Acest task implică simularea părții autonome a mișcării unui robot pe un teren bidimensional. 
Robotul trebuie să urmeze o traiectorie care trece printr-un set de puncte. Traiectoria este 
determinată folosind două metode de interpolare: Vandermonde și Splineuri Cubice.
Funcții
1. parse_data (filename)
Citește numărul de elemente și doi vectori dintr-un fișier.
2. spline_c2 (x, y)
Calculează coeficienții pentru un spline cubic de clasa C2.
3. P_spline (coef, x, x_interp)
Evaluează spline-ul cubic de clasa C2 la punctele de interpolare.
4. vandermonde(x, y)
Calculează coeficienții polinomului folosind matricea Vandermonde.
5. P_vandermonde(coef, x_interp)
Evaluează polinomul calculat folosind matricea Vandermonde la punctele de interpolare.

Task3 - Recommendations
Acest task conține funcții MATLAB/OCTAVE pentru procesarea matricei de date și 
generarea de recomandări bazate pe similaritatea cosinus. Funcțiile incluse 
sunt read_mat, preprocess, cosine_similarity și recommendations.
Funcții
1. function mat = read_mat(path)
Citește o matrice dintr-un fișier CSV, ignorând prima linie și prima coloană.
2. function reduced_mat = preprocess(mat, min_reviews)
Filtrează rândurile din matrice care au un număr minim de recenzii nenule.
3. function similarity = cosine_similarity(A, B)
Calculează similaritatea cosinus între doi vectori.
4. recommendations(path, liked_theme, num_recoms, min_reviews, num_features)
Generează recomandări bazate pe similaritatea cosinus între tema apreciată
și alte teme dintr-o matrice de date.

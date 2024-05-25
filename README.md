Tema 2 - Metode Numerice

Task1 - Numerical Music

Task2 - Robotzii

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
Generează recomandări bazate pe similaritatea cosinus între o temă apreciată
și alte teme dintr-o matrice de date.

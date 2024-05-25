function reduced_mat = preprocess(mat, min_reviews)
  n = size(mat,1);
  reviewscnt = zeros(n, 1);
  % formez un vector de lungime egala cu numarul de randuri ale matricii 
  % pentru a memora numarul de recomandari
  for i = 1:n
    reviewscnt(i) = sum(mat(i, :) ~= 0);
  endfor
  % parcurg randurile pentru a numara review-urile nenule
  valid_reviews = (reviewscnt >= min_reviews);
  % formez un vector ce va retine 1 daca numarul de review-uri este mai mare 
  % sau egal cu numarul minim de recenzii, altfel 0

  reduced_mat = mat(valid_reviews, :);
  % extrag intr-o matrice redusa doar liniile ce indeplinesc conditia
  % de review-uri minime
end

function reduced_mat = preprocess(mat, min_reviews)
  n = size(mat,1);
  reviewscnt = zeros(n, 1);

  for i = 1:n
    reviewscnt(i) = nnz(mat(i, :));
  endfor

  valid_reviews = reviewscnt >= min_reviews;

  reduced_mat = mat(valid_reviews, :);
end

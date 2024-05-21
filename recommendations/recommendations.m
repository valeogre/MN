function recoms = recommendations(path, liked_theme, num_recoms, min_reviews, num_features)
  # TODO: Get the best `num_recoms` recommandations similar with 'liked_theme'.
  matrix = read_mat(path);
  processed_matrix = preprocess(matrix, min_reviews);

  [U, S, V] = svds(processed_matrix, num_features);
  
  liked_theme_vector = V(liked_theme, :);

  V = V';

  num_themes = size(V, 2);
  similiarities = zeros(num_themes, 1);

  for i = 1:num_themes
      if i ~= liked_theme
          theme_vector = V(:, i);
          similarities(i) = cosine_similarity(liked_theme_vector, theme_vector);
      else
          similarities(i) = -Inf;
      endif
  endfor

  [~, sorted_indices] = sort(similarities, 'descend');
    recoms = sorted_indices(1:num_recoms);
end

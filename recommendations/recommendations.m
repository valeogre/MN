function recoms = recommendations(path, liked_theme, num_recoms, min_reviews, num_features)

    matrix = read_mat(path);
    % citesc matrice din fisier
    processed_matrix = preprocess(matrix, min_reviews);
    % prelucrez matricea pentru a obtine review-uri relevante
    [U, S, V] = svds(processed_matrix, num_features);
    % efectuez descompunerea valorilor singulare SVD pe matricea redusa
    liked_theme_vector = V(liked_theme, :);
    % extrag vectorul aferent temei 

    V = V';
    % transpun matricea V obtinuta in urma SVD

    num_themes = size(V, 2);
    similiarities = zeros(num_themes, 1);
    % formez un vector pentru similiaritatile temelor de dimensiune egala cu numarul de teme

    for i = 1:num_themes
        if i ~= liked_theme
            theme_vector = V(:, i);
            similarities(i) = cosine_similarity(liked_theme_vector, theme_vector);
        else
            similarities(i) = -Inf;
        endif
    endfor
    % calculez similaritatea dintre o tema si cea preferata(tema preferata nu se compara)

    [~, sorted_indices] = sort(similarities, 'descend');
    recoms = sorted_indices(1:num_recoms);
    % sortez descrescator similaritatile si extrag doar primele num_recoms
end

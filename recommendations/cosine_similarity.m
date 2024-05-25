function similarity = cosine_similarity(A, B)
  % folosind produsul scalar si normele celor doi vectori calculeaza similiaritatea cosinus
  similarity = dot(A, B) / (norm(A) * norm(B));
end

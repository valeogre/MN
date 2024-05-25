function mat = read_mat(path)
  mat = csvread(path, 1, 1);
  % folosind csvread citesc matricea fara prima linie si prima coloana ce contin 
  % denumirile campurilor si numarul liniei sau coloanei matricii
end

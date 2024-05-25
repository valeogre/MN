function [x, y] = parse_data(filename)

    % deschid fisierul pentru citire
    file = fopen(filename, 'r');
    % citesc numarul de elemente si cei doi vectori din fisier
    n = fscanf(file, '%d', 1);
    x = fscanf(file, '%d', n + 1);
    y = fscanf(file, '%d', n + 1);
    % transpun vectorii pentru a fi coloane
    x = x';
    y = y';
    % inchid fisierul de citire
    fclose(file);
end
function coef = vandermonde(x, y)
    % x = [x0, x1, ..., xn]'
    % y = [y0, y1, ..., yn]'
    % coef = [a0, a1, a2, ..., an]'
    x = x';
    y = y';
    n = length(x);
    V = zeros(n);
    for i = 1 : n
        for j = 1 : n
            V(i,j) = x(i)^(j - 1);
        endfor
    endfor

    coef = V \ y;
    % coef = coef'
    % TODO: Calculate the Vandermonde coefficients
endfunction

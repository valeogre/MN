function y_interp = P_vandermonde (coef, x_interp)
	% P_vandermonde(x) = a0 + a1 * x + a2 * x^2 + ... + an * x^n
	% coef = [a0, a1, a2, ..., an]'
	% y_interp(i) = P_vandermonde(x_interp(i)), i = 0 : length(x_interp) - 1
	n = length(coef);
	
	m = length(x_interp);

	V = zeros(m, n);

	for i = 1:m
		for j = 1:n
			V(i, j) = x_interp(i)^(j-1);
		endfor
	endfor

	y_interp = V * coef;
	% TODO: Calcualte y_interp using the Vandermonde coefficients
end

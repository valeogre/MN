function y_interp = P_spline (coef, x, x_interp)
	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3, i = 0 : n - 1
	% coef = [a0, b0, c0, d0, a1, b1, c1, d1, ..., an-1, bn-1, cn-1, dn-1]
	% x = [x0, x1, ..., xn]
	% y_interp(i) = P_spline(x_interp(i)), i = 0 : length(x_interp) - 1
	% Be careful! Indexes in Matlab start from 1, not 0

	% TODO: Calculate y_interp using the Spline coefficients
	n = length(x) - 1;

    y_interp = zeros(size(x_interp), 1);
    
    for k = 1:length(x_interp)
        for i = 0: n-1
            if x_interp(k) >= x(i + 1) && x_interp(k) <= x(i+2)
                a = coef(i * 4 + 1);
                b = coef(i * 4 + 2);
                c = coef(i * 4 + 3);
                d = coef(i * 4 + 4);
				var = x_interp(k) - x(i + 1);
                y_interp(k) = a + b*var + c*var^2 + d*var^3;
                break;
            endif
        endfor
    endfor
	y_interp = y_interp';
end

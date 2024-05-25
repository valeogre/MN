function y_interp = P_spline (coef, x, x_interp)
	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3, i = 0 : n - 1
	% coef = [a0, b0, c0, d0, a1, b1, c1, d1, ..., an-1, bn-1, cn-1, dn-1]
	% x = [x0, x1, ..., xn]
	% y_interp(i) = P_spline(x_interp(i)), i = 0 : length(x_interp) - 1

	n = length(x) - 1;
    y_interp = zeros(size(x_interp), 1);
    % initilizez vectorul y de spline-uri de lungime n cu zerouri

    a = coef(1:4:end);
    b = coef(2:4:end);
    c = coef(3:4:end);
    d = coef(4:4:end);
    % formez vectori cu coeficientii fiecarui interval
    
    for k = 1:length(x_interp)
        idx = find(x_interp(k) >= x(1:end-1) & x_interp(k) <= x(2:end),1);
        % gasesc, folosind cautarea binara, intervalul pentru fiecare valoarea a x_interp
            if ~isempty(idx)
				var = x_interp(k) - x(idx);
                y_interp(k) = a(idx) + b(idx)*var + c(idx)*var^2 + d(idx)*var^3;
            endif
            % calculez spline-ul folosind diferenta si coeficientii calculati initial
    endfor
	y_interp = y_interp';
end

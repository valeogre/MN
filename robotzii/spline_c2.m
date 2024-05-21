function coef = spline_c2 (x, y)
	% Remember that the indexes in Matlab start from 1, not 0
	% x = [x0, x1, ..., xn]'
    % y = [y0, y1, ..., yn]'
	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3
	% si'(x)  =      bi         + 2ci(x - xi)  + 3di(x - xi)^2
	% si''(x) =                   2ci          + 6di(x - xi)
	x = x';
	y = y';
	n = length(x);

	A = zeros(4 * (n - 1), 4 * (n - 1));
	b = zeros(4 * (n - 1), 1);

	cnt = 1;
	% TOOD 1: si(xi) = yi, i = 0 : n - 1
	for i = 1 : n - 1
		A(cnt, (i - 1)*4 + 1) = 1;
		b(cnt) = y(i);
		cnt = cnt + 1;
	endfor

	% TODO 2: s_n-1(xn) = yn
	A(cnt, (n - 2)*4 + 1) = 1;
	A(cnt, (n - 2)*4 + 2) = (x(n) - x(n-1));
	A(cnt, (n - 2)*4 + 3) = (x(n) - x(n-1))^2;
	A(cnt, (n - 2)*4 + 4) = (x(n) - x(n-1))^3;
	b(cnt) = y(n);
	cnt = cnt + 1;

	% TODO 3: si(x_i+1) = s_i+1(x_i+1), i = 0 : n - 1
	for i = 1:n-2
		A(cnt, (i - 1) * 4 + 1) = 1;
		A(cnt, (i - 1) * 4 + 2) = (x(i + 1) - x(i));
		A(cnt, (i - 1) * 4 + 3) = (x(i + 1) - x(i))^2;
		A(cnt, (i - 1) * 4 + 4) = (x(i + 1) - x(i))^3;
		A(cnt, i * 4 + 1) = -1;
		b(cnt) = 0;
		cnt = cnt + 1;
	endfor

	% TODO 4: si'(x_i+1) = s_i+1'(x_i+1), i = 0 : n - 1
	for i = 1:n - 2
		A(cnt, (i - 1) * 4 + 2) = 1;
		A(cnt, (i - 1) * 4 + 3) = 2 * (x(i + 1) - x(i));
		A(cnt, (i - 1) * 4 + 4) = 3 * (x(i + 1) - x(i))^2;
		A(cnt, i * 4 + 2) = -1;
		b(cnt) = 0;
		cnt = cnt + 1;
	endfor

	% TODO 5: si''(x_i+1) = s_i+1''(x_i+1), i = 0 : n - 1
	for i = 1:n - 2
		A(cnt, (i - 1) * 4 + 3) = 2;
		A(cnt, (i - 1) * 4 + 4) = 6 * (x(i + 1) - x(i));
		A(cnt, i * 4 + 3) = -2;
		b(cnt) = 0;
		cnt = cnt + 1;
	endfor

	% TODO 6: s0''(x0) = 0
	A(cnt, 3) = 2;
	b(cnt) = 0;
	cnt = cnt + 1;

	% TODO 7: s_n-1''(x_n) = 0
	A(cnt, (n - 2)*4 + 3) = 2;
	A(cnt, (n - 2)*4 + 4) = 6 * (x(n) - x(n-1));
	b(cnt) = 0;

	% Solve the system of equations
	coef = A \ b;
	coef = coef';
end

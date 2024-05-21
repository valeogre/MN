function plot_vandermonde(x, y, nr_points)
    % Calculate the Vandermonde polynomial coefficients
    coef = vandermonde(x, y);

    % Calculate plotting points
    xlin = linspace(min(x), max(x), nr_points)';
    ylin = P_vandermonde(coef, xlin);

    % Plot interpolation
    h = plot(xlin, ylin, '-', x, y, 'o', "markersize", 5, 'markerfacecolor', 'red', "color", "red");
    xlabel('x');
    ylabel('y');
    title('Traiectorie robot - Vandermonde');
    set(gcf, 'color', [0.8 0.8 0.8]); % Set background color to gray
    grid on;
    grid minor;
endfunction

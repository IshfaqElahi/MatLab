% Define functions and derivatives
f1 = @(x) x - exp(-x);
df1 = @(x) 1 + exp(-x);

f2 = @(x) x^3 - 6*x^2 + 11*x - 6;
df2 = @(x) 3*x^2 - 12*x + 11;

tol = 1e-6;
max_iter = 100;

% Solve x = e^(-x) with Bisection
a = 0; b = 1;
bisect1_iter = 0;
while (b - a)/2 > tol && bisect1_iter < max_iter
    c = (a + b)/2;
    if f1(c) == 0
        break;
    elseif f1(a)*f1(c) < 0
        b = c;
    else
        a = c;
    end
    bisect1_iter = bisect1_iter + 1;
end
root1_bisect = (a + b)/2;

% Solve x = e^(-x) with Newton-Raphson
x0 = 0.5;
newton1_iter = 0;
while newton1_iter < max_iter
    x1 = x0 - f1(x0)/df1(x0);
    if abs(x1 - x0) < tol
        break;
    end
    x0 = x1;
    newton1_iter = newton1_iter + 1;
end
root1_newton = x1;

% Solve cubic equation with Bisection (three roots)
% Root 1: [0, 1.5]
a = 0; b = 1.5;
bisect2_1_iter = 0;
while (b - a)/2 > tol && bisect2_1_iter < max_iter
    c = (a + b)/2;
    if f2(c) == 0
        break;
    elseif f2(a)*f2(c) < 0
        b = c;
    else
        a = c;
    end
    bisect2_1_iter = bisect2_1_iter + 1;
end
root2_1_bisect = (a + b)/2;

% Root 2: [1.5, 2.5]
a = 1.5; b = 2.5;
bisect2_2_iter = 0;
while (b - a)/2 > tol && bisect2_2_iter < max_iter
    c = (a + b)/2;
    if f2(c) == 0
        break;
    elseif f2(a)*f2(c) < 0
        b = c;
    else
        a = c;
    end
    bisect2_2_iter = bisect2_2_iter + 1;
end
root2_2_bisect = (a + b)/2;

% Root 3: [2.5, 4]
a = 2.5; b = 4;
bisect2_3_iter = 0;
while (b - a)/2 > tol && bisect2_3_iter < max_iter
    c = (a + b)/2;
    if f2(c) == 0
        break;
    elseif f2(a)*f2(c) < 0
        b = c;
    else
        a = c;
    end
    bisect2_3_iter = bisect2_3_iter + 1;
end
root2_3_bisect = (a + b)/2;

% Solve cubic with Newton-Raphson (three roots)
% Root 1: x0 = 0.5
x0 = 0.5;
newton2_1_iter = 0;
while newton2_1_iter < max_iter
    x1 = x0 - f2(x0)/df2(x0);
    if abs(x1 - x0) < tol
        break;
    end
    x0 = x1;
    newton2_1_iter = newton2_1_iter + 1;
end
root2_1_newton = x1;

% Root 2: x0 = 2
x0 = 2;
newton2_2_iter = 0;
while newton2_2_iter < max_iter
    x1 = x0 - f2(x0)/df2(x0);
    if abs(x1 - x0) < tol
        break;
    end
    x0 = x1;
    newton2_2_iter = newton2_2_iter + 1;
end
root2_2_newton = x1;

% Root 3: x0 = 3
x0 = 3;
newton2_3_iter = 0;
while newton2_3_iter < max_iter
    x1 = x0 - f2(x0)/df2(x0);
    if abs(x1 - x0) < tol
        break;
    end
    x0 = x1;
    newton2_3_iter = newton2_3_iter + 1;
end
root2_3_newton = x1;

% Display results
fprintf('Equation 1: x = e^{-x}\n');
fprintf('Bisection: Root = %.6f, Iterations = %d\n', root1_bisect, bisect1_iter);
fprintf('Newton-Raphson: Root = %.6f, Iterations = %d\n\n', root1_newton, newton1_iter);

fprintf('Equation 2: x^3 = 6x^2 - 11x + 6\n');
fprintf('Bisection:\n');
fprintf('Root 1 = %.6f, Iterations = %d\n', root2_1_bisect, bisect2_1_iter);
fprintf('Root 2 = %.6f, Iterations = %d\n', root2_2_bisect, bisect2_2_iter);
fprintf('Root 3 = %.6f, Iterations = %d\n\n', root2_3_bisect, bisect2_3_iter);

fprintf('Newton-Raphson:\n');
fprintf('Root 1 = %.6f, Iterations = %d\n', root2_1_newton, newton2_1_iter);
fprintf('Root 2 = %.6f, Iterations = %d\n', root2_2_newton, newton2_2_iter);
fprintf('Root 3 = %.6f, Iterations = %d\n', root2_3_newton, newton2_3_iter);
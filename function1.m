function result = function1()
    syms x y z
     fumction = 3*x^2 + y^2 + 3*z^2 + x - y + sin(x);
     fumction2 = x^4 + y^4 - x^2 +  x*y + x - y + z^2*cos(y);
     fumction3 = exp(1)^x + exp(1)^y + z^2 - x*y + 2*x*cos(y) - sin(x);
     fumction4 = exp(1)^(x+y) + exp(1)^x + exp(1)^y + z^2 - x^2 + y^2;
    % دستورات تابع
    result = fumction4;
end

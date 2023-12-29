clc
clear all
syms x y z
f1 = function1();
gradient_f = gradient(f1, [x, y, z]);
hessian_f = hessian(f1, [x, y, z]);
eps=1*10^-1000;
err=1;
x0=[1,1,1];
i=1;
while eps<err
    A = hessian_f;
    Hessian_at_point = double(subs(hessian_f, [x, y, z], x0));
    Gradient_at_point = double(subs(gradient_f, [x, y, z], x0));
    % بررسی مثبت معین بودن با استفاده از chol
    try
        chol(Hessian_at_point);
        disp('ماتریس هسیان معین مثبت است.');
    catch
        error('ماتریس هسیان مثبت معین نیست یا خطا در بررسی رخ داده است.');
    end
    if det(Hessian_at_point) ~= 0
        A_inv = inv(Hessian_at_point); % محاسبه ماتریس وارون اگر ماتریس قابل معکوس باشد
        % اکنون ماتریس وارون A_inv در دسترس شماست
        disp('ماتریس هسیان وارون پذیر است.');
    else
        error('ماتریس وارون وجود ندارد، زیرا ماتریس قابل معکوس نیست.');
    end
    x1 = x0'-(A_inv*Gradient_at_point);
    err=sqrt(norm(x1-x0'));
    i=i+1;
    x0=x1';
    disp(err)
end

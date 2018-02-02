function ret = paradiff(y, x, t, n)
%chapter 3.2.6
%example 3.12
if n <= 0
    error('n should be positive integer, please correct')
else
    if n == 1
        ret = diff(y, t) / diff(x, t);
    else
        ret = diff(paradiff(y, x, t, n-1), t)/diff(x, t);
    end
end
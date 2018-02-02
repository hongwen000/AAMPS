function ret = select(yi)
ret = floor((yi + 5) / (10/1000)) + 1;
if ret > 1000
    ret = 1000;
end
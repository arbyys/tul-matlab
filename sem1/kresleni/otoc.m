function Y=otoc(X,a)
    S=[cos(a), -sin(a); sin(a), cos(a)]
    Y=S*X;
end
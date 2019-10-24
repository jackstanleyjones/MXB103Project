function y = forward_eval(X, T, x)
%FORWARD_EVAL Evaluate Newton's forward difference form of the
%interpolating polynomial
% y = FORWARD_EVAL(X, T, x) returns y = Pn(x), where Pn is the
% interpolating polynomial constructed using the abscissas X and
% forward difference table T

[m,n] = size(T);
if m ~= n
    error('T must be square.');
end


y = zeros(size(x));
h = mean(diff(X));
S =(x-X(1))/h;

for k = 1:n
    P = ones(size(x));
    for i = 1:k-1
        P = P .*(S-(i)+1);
    end 
    P = P / factorial(k-1);
    y = y +T(k,k) * P;
end 

end

function p = bisection (f,a,b,n)
% BISECTION Bisection method 
% P = BISECTION(F, A, B, N) returns the most recently computed midpoint
% after applying N iterations of the bisection method for dolving f(x) = 0
% where F is an anonymous function for f, and [A,B] is the initial
% bracketing.
% Errors are raised if F is not given as an anonymous function and if [A,B]
% does not bracket the root

if ~isa(f, 'function_handle')
    error('Your first input was not a function handle')
end 

if sign(f(a)) == sign (f(b))
    error('f(a) and f(b) must have opposite signs.')
end 

for i =1:n
    p = (a+b)/2;
    if sign (f(a)) == sign(f(p))
        a = p ;
    else 
        b = p;
    end 
end 

end

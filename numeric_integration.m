function distance = numeric_integration(a,b,n,V)
%Function for numeric integration of an array of values
%Using the trapezoidal method
%V is the array of values
%n is the number of subintervals
%a - b is the bounds of the integral

h = (b-a)/n;

distance = h/2 * (V(1) + 2*sum(V(2:end-1)) + V(end));

end
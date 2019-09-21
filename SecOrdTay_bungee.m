function [t, y, v, h, a] = SecOrdTay_bungee(T, n, g, C, K, L)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% Calculate subinterval width h
h = T / n;

% Create time array t
t = 0:h:T;

% Initialise solution arrays y and v
y = zeros(1,n+1);
v = zeros(1,n+1);
a = 9.8*ones(1,n+1);

% Perform iterations
for j = 1:n
    a(j+1) = g - (C.*abs(v(j)).*v(j)) - max(0, K*(y(j) - L));
    y(j+1) = y(j) + h*v(j) + ((h^2/2)*a(j));  
    v(j+1) = v(j) + h*(a(j+1));
end

end

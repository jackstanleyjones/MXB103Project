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
    y(j+1) = y(j) + h*v(j) + ((h^2/2)*a(j));  
    v(j+1) = v(j) + h*(g - C*abs(v(j))*v(j) - max(0, K*(y(j) - L)));
    a(j+1) = a(j) - h*max(0, K*(y(j) - L));
end

end

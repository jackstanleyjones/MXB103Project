%% MXB103 Project Group 18:  BUNGEE!

%% 1  Introduction test
% As part of Brisbane's "New World City" transformation, the Brisbane City
% Council is investigating a proposal to allow bungee jumping off the
% Story Bridge. This report addresses several key questions about the
% proposal.
%
% In Section 2 of this report, the proposal and the key questions relating 
% to it are discussed in more detail.  In Section 3, the model ...
% In Section 4, etc.

%% 2  The proposal
% What is the proposal exactly?
% What questions have you been asked to answer?
% What's your approach to doing this?
% A few paragraphs should be enough.
% Finish with a sentence linking to the next section on the model.

%% 3 The model
%
% The equation of motion for bungee jumping is
%%
% $$\frac{dv}{dt} = g - C|v|v - \max(0,K(y-L))$$
%
% Write a paragraph or two about the equation, including where it comes
% from and what the symbols mean.

%% 3.1 Assumptions and limitations
%
% Write a paragraph on the assumptions and limitations on the model,
% and a paragraph on the limitations on the study you have conducted.

%% 3.2 Parameters
H = 74;             % Height of jump point (m)
D = 31;             % Deck height (m)
c = 0.9;            % Drag coefficient (kg/m)
m = 80;             % Mass of the jumper (kg)
L = 25;             % Length of bungee cord (m)
k = 90;             % Spring constant of bungee cord (N/m)
g = 9.8;            % Gravitational acceleration (m/s^2)
C = c/m;            % Scaled drag coefficient
K = k/m;            % Scaled spring constant

%% 4 The numerical method
%
% How do you formulate the model to solve numerically? (hint: you write it
% as two equations)

%% 4.1 Parameters

T = 60;             % Final time in simulation (s)
n = 10000;          % Number of subintervals (you decide how many you need)

%% 4.2 Solution
%
% The ordinary differential equations are solved using [which method].
[t, y, v, h] = euler_bungee(T, n, g, C, K, L);
% (you must change this to a second order or higher method)

% second order taylor method
[tm, ym, vm, hm, am] = SecOrdTay_bungee(T, n, g, C, K, L);

%RK4 Method
[trk, yrk, vrk, hrk] = RK4_bungee(T, n, g, C, K, L)

figure(1);
plot(t, y);
hold on
plot(tm, ym)
plot(trk, yrk)
xlabel('time (s)');
ylabel('distance fallen (m)');
title('Figure 1: Bungee Jump Using Eulers Method vs Second Order Taylor Method');
legend('Euler', 'Second Order Taylor', 'RK4')

%% 5 Analysis
%
% In this section, the model predictions are analysed with respect to the
% key questions being asked about the proposal.

%% 5.1 Timing and bounces
%
% Describe the question, and then answer it.  In this case, you will refer
% to Figure 1 of $y$ versus $t$.
% 
% The model produced above as a result of using a higher order modelling method (Second Order Taylor Method) agrees with the company's claim of 10 "bounces" in 60 seconds (as seen in Figure 1). While both models agree on the general behaviour regarding bounce frequency, the Second Order Taylor Series Model produces slightly more decay in bounce amplitude over time than the Euler Model. This is because, by using a higher order method, the error term in the Taylor model decays by an order of magnitude (tenfold) faster (i.e. it consequently accumulates less error given the same number of iterations). Specifically, the Second Order Taylor Method works by taking the position of the jumper ($y$) and adds the velocity of the jumper for a given time step interval ($h$), same as the Euler Method. However, the Taylor Method also includes the additional acceleration term (velocity derivative) that is scaled by$h^2/2$. In this case the extra derivative term represents the reduction in downward acceleration when the bungee rope is in tension (when $y$ > $L$).  The explicit consideration of the bungee rope’s opposition to downward motion logically results in the model coming to a rest/ equilibrium state faster (less “bouncing” as a result of faster periodic amplitude decay) than when it is not included. 
%% 5.2 Maximum speed experienced by the jumper
%
% Describe the question, and then answer it.  In this case, you will create
% a figure of $v$ versus $t$ and refer to it to answer the question.
% 
% As can be seen in Figure 2, the maximum speed of the jumper is achieved
% at the moment before the first upward bounce (i.e. the last moment of
% freefall from the inital jump from the platform) when the jumper is
% travelling at approximately 20.0325m/s. This is logical as the resistive
% force of the bungee rope has not yet begun to contribute to decay in the
% bounce amplitude and as such the inertia of the jumper is at its maximum as they have been in uninterrrupted freefall due to gravity. 

figure(2);
plot(t, vm);
hold on
plot(t, vrk)
xlabel('time (s)');
ylabel('jumper velocity (m/s)');
title('Figure 2: Bungee Jump Velocity Over Time (Second Order Taylor Series Modelling)');
maximum_speed = max(abs(vm))

%% 5.3 Maximum acceleration experienced by the jumper
%
% Describe the question, and then answer it.  In this case, you will call
% a function to numerically differentiate $v$ to find $a$.  Then plot $a$ 
% versus $t$ and refer to it to answer the question.
figure(3);
tayAccel = diff(vm);
RK4Accel = diff(vrk);
time = t(1:10000)
plot(time, tayAccel)
hold on
plot(time, RK4Accel)
xlabel('time (s)'), ylabel('acceleration (m/s/s)')
legend('Second Order Taylor Series', 'RK4')
%% 5.4 Distance travelled by the jumper
%
% Describe the question, and then answer it.  In this case, you will call
% a function to numerically integrate $|v|$ to find the distance.

%% 5.5 Automated camera system
%
% Describe the question, and then answer it.  In this case, you will
% fit an interpolating polynomial through the four points in your solution
% $y$ that lie either side of the camera location.  Then use that
% polynomial to solve for when the jumper passes the camera.

%% 5.6 Water touch option
%
% Describe the question, and then answer it.  In this case, you will
% re-solve the equations with different parameters for $L$ and $k$.  
% Experiment to find which values work best for the water touch option, but 
% include only the best combination that you found in the submitted code.

%% 6 Conclusion
%
% Conclude your report by summing up your findings and making any
% recommendations.
%{
Benjamin Sites
AE 426-M3.2.1
March 5, 2020

Assignment:
Find the numerical solution to the torque-free attitude dynamics EOM by using MATLAB.
(EOM means Euler's rotational EOM.
USE A=B with omega_z=constant. i.e., Axi-symmetric spinning body.
You are supposed to find omega_x and omega_y)
You need to present the solution as a graph (time vs value) since the answers are not a function.
Submit the codes and graphs in a pdf file.
%}

clear;
clc;
close all;

%Define Initial Angular Velocity
w0 = [3; 5; 4]; %wx; wy; wz

%Define Time Span
tSpan = linspace(0,10,200);

%Call ode45 Function
[t, y] = ode45(@eomFun, tSpan, w0);

%Plot time vs value
plot(t,y(1:end,1),'g',t,y(1:end, 2),'r',t,y(1:end, 3),'k');
grid on;
axis equal;
xlabel('Time');
ylabel('Angular Velocity');
legend('ωx', 'ωy', 'ωz');

%EOM Function to use in ode45 Function
function dydt = eomFun(t,y)
    %Define Moments of Interita
    Ig = [10 0 0; 0 10 0; 0 0 20]; %A = B (Axi-symmetric)
    A = Ig(1);
    B = Ig(5);
    C = Ig(9);
    %Define Angular Velocity Components in y
    wx = y(1);
    wy = y(2);
    wz = y(3);
    %Euler's EOM for Torque Free Motion
    wxDot = ((C-B)*wy*wz) / (-A);
    wyDot = ((A-C)*wx*wz) / (-B);
    wzDot = ((B-A)*wx*wy) / (-C);
    %Return dydt
    dydt = [wxDot; wyDot; wzDot];
end
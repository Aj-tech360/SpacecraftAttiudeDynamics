function odeSolver()
    %Benjamin Sites
    %AE 426 M1.2.1 Task: M01
    %Modified 05 February 2021

    %odeSolver function solves the differential equation defined in the eqn() function with the defined intial conditions 


    %Define Differential Equation
    function dxdt = eqn(t,x)
        dxdt = [x(2); 1/3 * (-x(2) - 2*x(1))]; %xDotDot = -1/3*xDot - 2/3*x
    end

    %Define Inital Conditions
    initCon = [5; 0]; %xDot(0) = 5, x(0) = 0
    
    %Define Time Span
    tspan = [0:0.5:30];

    %Call ode45 Function
    [t,y] = ode45(@eqn, tspan, initCon);
    
    %Plot Solution to Differential Equation
    plot(t,y(:,1),'m-o',t,y(:,2),'g-^');
    
    %Add Plot Elements
    xlabel('Time, t');
    ylabel('Solution, y');
    title('Solution to Differential Equation Using ode45 and Inital Conditions');
    legend('Solution y1', 'Solution y2');
    grid on;
end
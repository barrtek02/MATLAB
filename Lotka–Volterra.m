a = 1.2; %częstość narodzin ofiar
b = 0.6; %częstość umierania ofiar 
c = 0.3; %częstość narodzin drapieżników
d = 0.8; %częstość umierania drapieżników
x0 = 2;  %populacja początkowa ofiar
y0 = 1;  %populacja początkowa drapieżników
tspan = 0:0.001:20; %czas

params = [a, b, c, d]; 
a0 = [x0,y0];

[t,y] = ode45(@(t,y)lotkavoltera(t,y,params), tspan, a0);

plot(t,y) %wykres
xlabel('CZAS')
ylabel('POPULACJA')
title('Rozmiar populacji drapieżnik/ofiara w czasie')
legend('ofiara','drapieżnik')


function da = lotkavoltera(t,y,params) %model
    a = params(1);
    b = params(2);
    c = params(3);
    d = params(4);
    
    X = y(1);
    Y = y(2);
    
    da = zeros(2,1);
    
    da(1) = a * X - b* X * Y;
    da(2) = c * X * Y - d* Y;
end 


    
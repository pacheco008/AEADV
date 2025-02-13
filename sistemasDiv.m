%% Hallar zona parametrica con caos para sistemas no uniformemente
% disipativos o conservativos en base con base a su divergencia
clear all; close all
%beta = linspace(2, 6, 101); % Zona parametrica para explorar - Rossler
%beta = linspace(3.5, 4.2, 100);  % Zona parametrica para explorar - HNN
%beta = linspace(1.5, 3, 101); % Zona parametrica para explorar - SprottD
beta = linspace(5.15, 5.3, 101);  % Zona parametrica para explorar - Pernarowski

h = 0.001;                   % Paso de integracion
Ni = 120000;                 % No. de iteraciones para la transiente
Nf = Ni + 5000;              % No. de iteraciones ha analizar
y0 = [-1.5, 0.1, 1.5, -0.03]';      % Condicion inicial Rossler
eps = 0.0002*[1, 1, 1, 1]';   % Separacion incial 
[error, m1, m2] = AEADV(@pernarowski, y0, Ni, Nf, h, beta, eps);

figure(1)
plot(beta, error, 'm')
ylabel('$\ln\left( \mu_\beta +1\right)$', 'Interpreter', 'latex')
xlabel('$\beta$', 'Interpreter', 'latex')
ax = gca; % Obtener el handle del eje actual
ax.TickLabelInterpreter = 'latex';

figure(2)
plot(beta, m1, 'k-.', 'LineWidth', 1.5)
hold on
plot(beta, m2, 'b:', 'LineWidth', 1.5)
hold off
xlabel('$\beta$', 'Interpreter', 'latex')
ax = gca; % Obtener el handle del eje actual
ax.TickLabelInterpreter = 'latex';
legend('ADFO', 'ADSO', 'Interpreter', 'latex', 'Location', 'northwest')

function df = divrossler(u, a) % Sistema de Rossler
    x=u(1); y=u(2); z= u(3);
    f(1) = -y-z;
    f(2) = x+0.2*y;
    f(3) = 0.2+z*(x-a); 
    df = [f(1); f(2); f(3); f(1)];
end

function df = hnndiv(x, a)
   W = [0  1.2 -7;
        1.1  0  2.8 ;
        0.7 -2 a];
   f = -x(1:3)+W*tanh(x(1:3));
   df = [f ; [0, 0,-2*a*tanh(x(3))*(1-tanh(x(3))^2)]*(W*tanh(x(1:3)))];
end

function df = sprottD(x, a)
    f(1) = -x(2);
    f(2) = x(1)+x(3);
    f(3) = x(1)*x(3)+a*x(2)^2;
    df = [f(1);f(2);f(3);f(1)];
end

function df = pernarowski(x, prm1)
    % Sistem state variables
    u = x(1); v = x(2); c = x(3);

    % Parameters
    a = -0.02;
    u_hat = 0;
    beta = 2;
    u_line = -1.5;
    n = prm1;
    epsilon = 0.178;

    % Functions
    F_u = a * ( (u-u_hat)^2 - n^2 );
    G_uc = c + u^3 - 3*(u+1);
    H_uc = beta*(u-u_line)-c;

    % Space state description
    f = zeros(3, 1);
    f(1) = v; % du/dt
    f(2) = -epsilon*H_uc - v*F_u - G_uc; % dv/dt = d2u/dt2
    %f(2) = - v*F_u - G_uc; % dv/dt = d2u/dt2
    f(3) = epsilon*H_uc; % dc/dt

    % Return vector field
    df = [f(1);f(2);f(3);0.02*f(1)];
end

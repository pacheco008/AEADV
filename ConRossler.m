%% AEADV metric 
% This algorithm is devoted for detecting chaotic parametric zones 
% on nonuniformly dissipative and conservative systems
%
%
%   CITED AS:
%   Diego S. de la Vega, Olga G. Felix-Beltran, Jesus M. Munoz-Pacheco
%   "Identifying chaotic dynamics in nonuniformly dissipative and conservative dynamical
%   systems from the average of the varying divergence"
%   Preprint February 2025,
%
%   version 1.0



beta = linspace(2, 6, 101);  % Parametric zones
h = 0.001;                   % Integration step
Ni = 100000;                 % Iterations number for transient
Nf = Ni + 5000;              % Iterations number for analysis
y0 = [0.1, 1, 1, 0.3]';      % Initial conditions
eps = 0.001*[1, 1, 1, 1]';   % Epsilon
[error, m1, m2] = AEADV(@divrossler, y0, Ni, Nf, h, beta, eps);

figure(1)
plot(beta, error, 'm')
ylabel('$\ln\left( \mu_\beta +1\right)$', 'Interpreter', 'latex')
xlabel('$\beta$', 'Interpreter', 'latex')
ax = gca;
ax.TickLabelInterpreter = 'latex';

figure(2)
plot(beta, m1, 'k-.', 'LineWidth', 1.5)
hold on
plot(beta, m2, 'b:', 'LineWidth', 1.5)
hold off
xlabel('$\beta$', 'Interpreter', 'latex')
ax = gca; 
ax.TickLabelInterpreter = 'latex';
legend('ADFO', 'ADSO', 'Interpreter', 'latex', 'Location', 'northwest')

function df = divrossler(u, a) % Rossler system
    x=u(1); y=u(2); z= u(3);
    f(1) = -y-z;
    f(2) = x+0.2*y;
    f(3) = 0.2+z*(x-a); 
    df = [f(1); f(2); f(3); f(1)]; % Varying divergence
end
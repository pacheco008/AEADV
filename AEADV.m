%% This algorithm is devoted for detecting chaotic parametric zones 
% on nonuniformly dissipative and conservative dynamical systems
%
%   The main purposes of this code are:
%   - Faster chaotic analysis varying a parameter.
%   - Easy to use.
%   - Novel technique to identify chaotic and nonchaotic parametric zones.
% 
%   Authors:
%     Diego Ruiz Sanchez de la Vega (Developer and Coder)
%     Jesus M. Munoz-Pacheco (Conceptualization and Validation)
%
%   CITED AS:
%   Diego S. de la Vega, Olga G. Felix-Beltran, Jesus M. Munoz-Pacheco
%   "Identifying chaotic dynamics in nonuniformly dissipative and conservative dynamical
%   systems from the average of the varying divergence"
%   Preprint February 2025,
%
%   version 1.0
%
%
function [mu, ADFO, ADSO]  = AEADV(exp_ODE, ...
                                  y0, ...
                                  Ni, ...
                                  Nf, ...
                                  h, ...
                                  beta, ...
                                  epsilon)
%   AEADV (Absolute Error of the Avearage Divergence Variable)
%   ADFO (Average Derivative for First Orbit)
%   ADSO (Average Derivative for Second Orbit)
%   mu (Average Error)


    

    n = length(y0); % Dimension +1
    if nargin <7 % Check inputs
        epsilon = 0.001*ones(n, 1);
    end
    
    m = length(beta);
    mu = zeros(m, 1);

    for j = 1:m
        y = y0-[0, 0, 0, -beta(j)]';
        z = y0 + epsilon-[0, 0, 0, -beta(j)]';
        mean = 0;
        m1 = 0;
        m2 = 0;
        for i = 2:Ni
            y = y + h * exp_ODE(y, beta(j));
            z = z + h * exp_ODE(z, beta(j));
        end
        for i = Ni+1:Nf
            y = y + h * exp_ODE(y, beta(j));
            z = z + h * exp_ODE(z, beta(j));
            m1 = m1 + y(n);
            m2 = m2 + z(n);
            mean = mean + y(n) - z(n);
        end
    ADFO(j) = m1/(Nf-Ni);
    ADSO(j) = m2/(Nf-Ni);
    mu(j) = log(abs(mean)/(Nf-Ni)+1);
    end
end
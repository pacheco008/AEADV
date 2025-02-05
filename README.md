***************************************************
***************** AEADV algorithm *****************
*****************    version 1.0  *****************
***************** MATLAB environment ***************
***************************************************



***************************************************
Description

This algorithm is devoted to detecting chaotic parametric zones 
on nonuniformly dissipative and conservative dynamical systems

The main purposes of this code are:
- Faster chaotic analysis varying a parameter.
- Easy to use.
- Novel technique to identify chaotic and nonchaotic parametric zones.



*************************************************** 
Authors:
     Diego Ruiz Sanchez de la Vega (Developer and Coder)
     Jesus M. Munoz-Pacheco (Conceptualization and Validation)


CITED AS:
Diego S. de la Vega, Olga G. Felix-Beltran, Jesus M. Munoz-Pacheco, "Identifying chaotic dynamics in nonuniformly dissipative and conservative dynamical systems from the average of the varying divergence", Preprint February 2025.


***************************************************
Files

1. AEADV.m
This file contains the main procedure of the proposed chaos metric. It can accept a dynamical system of any dimension.
The associated m-file function is described by: 

	function [mu, ADFO, ADSO]  = AEADV(exp_ODE, ...
                                  y0, ...
                                  Ni, ...
                                  Nf, ...
                                  h, ...
                                  beta, ...
                                  epsilon)

	AEADV (Absolute Error of the Avearage Divergence Variable)
	
	inputs:
	exp_ODE (non uniformly dissipative or conservative dynamical system)
	y0 (initial conditions)
	Ni (Initial time after transient)
	Nf (Final time)
	h (integration step)
	beta (parameter under study)
	epsilon (small deviation from initial conditions)

	outputs:
	ADFO (Average Derivative for First Orbit)
	ADSO (Average Derivative for Second Orbit)
	mu (Absolute Error)


2. ConRossler.m
This files presents an example of the proposed chaos metric. It contains: 
	- The description of the input arguments for AEADV.m
	- Graphic options
	- The function *divrossler*, which invokes the underlying dynamical system.
		
	  

***************************************************
First steps


1. Download the files AEADV.m and ConRossler.m and save in the same directory.
2. Open the ConRossler.m file in a MATLAB environment.
3. Excuse the file and wait for the results.
4. You will see two plots showing the results for the Rossler system and its chaotic parametric zones.




***************************************************
Other systems

1. If you want to test the AEADV metric with other systems you should change the 
function *divrossler* included in the ConRossler.m file.
2. Such a function describes the particular system you want to analyze.
3. Please consider that the last line *df = [f(1); f(2); f(3); f(1)]*
describes the expanded dynamical system. It means, for the Rossler case, the first f(1) f(2) f(3),
are the three differential equations while the last entry in *df*, i.e., f(1) is the divergence of system.
In the Rossler example, the divergence has the same form that the first differential equation. 
However, be aware since many other systems this is not hold.
4. Please refer to the following reference for details for determining the divergence
and the expanded dynamical system.




CITED AS:
Diego S. de la Vega, Olga G. Felix-Beltran, Jesus M. Munoz-Pacheco, "Identifying chaotic dynamics in nonuniformly dissipative and conservative dynamical systems from the average of the varying divergence", Preprint February 2025.


***************************************************
Bugs, Comments and Collaborations send email to:


jesusm.pacheco@correo.buap.mx




CITED AS:
Diego S. de la Vega, Olga G. Felix-Beltran, Jesus M. Munoz-Pacheco, "Identifying chaotic dynamics in nonuniformly dissipative and conservative dynamical systems from the average of the varying divergence", Preprint February 2025.

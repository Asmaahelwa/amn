Clear;clc;
 

J=0.1;
b=0.5;
Kt=1;
L=1;
R=5;
Ke=1;
L=1;
A=[0 1 0; 0 -b/J Kt/J; 0 -Ke/L -R/L];
B=[0; 0; 1/L];
W=[0; -1/J; 0];
C=[0 1 0];
Btotal=[B W];
sys = ss(A,Btotal,C,[])
dt = 0.01;
Tfinal= 5;
discretization_time = (0:dt:Tfinal);
figure(1)
control_step = ones(size(discretization_time))';
plot(discretization_time,control_step,'LineWidth',2)
xlabel('Time')
ylabel('Control input (voltage)')
title('Control Input Used for Simulation')
disturbance = zeros(size(discretization_time));
U_step=[control_step, disturbance];
Ycontrol_step=lsim(sys,U_step,discretization_time);
figure(2)
plot(discretization_time,Ycontrol_step,'LineWidth',2)
xlabel('Time')
ylabel('System output (angular velocity)')
title('System response to the step control input')
figure(3)
control_sin = (4+sin(5*discretization_time))';
plot(discretization_time,control_sin,'LineWidth',2)
xlabel('Time')
ylabel('Control input (voltage)')
title('Control Input Used for Simulation')
disturbance = zeros(size(discretization_time))';
U_sin=[control_sin, disturbance];
Ycontrol_sin=lsim(sys,U_sin,discretization_time);
figure(4)
plot(discretization_time,Ycontrol_sin,'LineWidth',2)
xlabel('Time')
ylabel('System output (angular velocity)')
title('System response to the sinusoidal control input')
X0=[1; 1; 1];
Yinitial=initial(sys,X0,discretization_time);
figure(5)
plot(discretization_time,Yinitial,'LineWidth',2)
xlabel('Time')
ylabel('System output (angular velocity)')
title('System response to the initial condition')

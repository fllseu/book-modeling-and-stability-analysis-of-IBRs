s = tf('s');
LPF = 1/(1+0.01*s); 
LPF1 = 1/(1+0.05*s);
Kp = 180; Ki = 3200; 
figure;
LoopGain = 1/2*(Kp+Ki/s)/s;

bode_P = bodeoptions; 
bode_P.FreqUnits = 'Hz';
bode(LoopGain*LPF, LoopGain*LPF1, bode_P);
grid on;


% check the closed-loop system
sys1 = feedback(LoopGain*LPF, 1);
sys2 = feedback(LoopGain*LPF1, 1);
figure;
step(sys1,sys2);
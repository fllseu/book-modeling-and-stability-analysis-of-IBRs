R = 0.1; 
L = 0.5/377; 
C = 1/(377*0.25);

s = tf('s');
Z = R+L*s+1/(C*s);
s1 = s+1i*377;
s2 = s-1i*377;
Y = 1/Z;
Y1 = 1/(R+ L*s1+1/(C*s1));
Y2 = 1/(R+ L*s2+1/(C*s2));
Yr = 1/2*(Y1+Y2);
Yi = 1/(2*1i)*(Y1-Y2);

[num, den]= tfdata(Y,'v')

[num1, den1]= tfdata(Yr,'v')
[num2, den2]= tfdata(Yi,'v')

figure;
bode_P = bodeoptions;
bode_P.FreqUnits = 'Hz';
bode_P.PhaseWrapping ='on';
bode(Yr, Yi, Y1, 1/Z, bode_P); grid on;
legend('Yr','Yi', 'Y1','Y'); grid on;

%Yr1 = tf(num1{1}(end-1:end), den1{1}(end-2:end))
%figure;
%bode(Yr, Yr1)
%grid on;
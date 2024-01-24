clear;clc

f = 60;
Sb = 1e6; % base power
Vb_S = 13.2e3*sqrt(2)/sqrt(3);% secondary side base voltage phase to ground
Ib_S =Sb/Vb_S; % secondary side base current
Vb_P = 400*sqrt(2)/sqrt(3); % primary side base V
Ib_P = Sb/Vb_P; % primary side base I
Zb = ((400)^2)/Sb; % primary side base impedance
Zs = ((13.2e3)^2)/Sb; % secondary side base impedance
Zt = 0.02+1i*0.0721; % transformer impedance
Vg = 1;
P = 0.5;
Q = 0.5;
S = P+1i*Q;
I3 = conj(S/Vg); 
V3 = Vg+I3*Zt; % pcc voltage in S side
% Vpcc = V3*Vb_S/Vb_P; % P side
Vpcc = V3;
R1 = 0.001/Zb;
L1 = (1i*120*pi*46e-6)/Zb; % impedacne ZL1
C1 = -(1i/(120*pi*3*444e-6))/Zb; %impedance ZC1
I2 = Vpcc/C1; % curreent going through the Capcitor
I1 = I2+I3;
V1 = Vpcc+I1*(R1+L1);
V = V1*Vb_P;


%%%
Ts = 50e-6; s = tf('s');

%%%
f = 60; w0 = 2*pi*f;vdc = 1000;
sb = 1e6;vn1 = 400;vn2 = 13.2e3;
vb1 = vn1*sqrt(2/3);
zb1 = vn1^2/sb;
zb2 = vn2^2/sb;
%%% passive
rfpu = 0.034;
rf = rfpu*zb1;

xfpu = 2*pi*60*(46e-6)/0.16; %0.1084;
lf = xfpu*zb1/w0;
cf = 444e-6*3; 
%bc = 0.102; xcpu = 1/bc;
%cf = 1/xcpu/zb1/w0;
bc = w0*cf*zb1;


% grid
xgpu = 0.35;
lg = xgpu*zb2/w0;
rgpu = xgpu/10;
rg = rgpu*zb2;

%% grid impedance
xgrid_pu = 0.8; %0.2 pu is working  0.19 is not working
lg_real = xgrid_pu*zb2/w0;

rgrid_pu = xgrid_pu/10;
rg_real = rgrid_pu*zb2;

%%% controller
Pdroop1 = 0.02*377;
Pdroop2 = 0.05*377;


Kp_v=0.4; Ki_v = 40;   % GFL
Kp_vq = 1; Ki_vq = 10; %GFM 3
Kp_P = 0.25; Ki_P = 25; 
%Kp_P = 0.1; Ki_P = 10; 


%kpvd = 3; kivd = 300;
k = 0.1;
%kpvd = 1*k; kivd = 100*k;
kpvd = 0.4; kivd = 40;
kpq = 0.2; kiq = 20; 
kpv = 0.4; kiv = 40;
% kpv = 0.25; kiv = 25;
% kpv = 1; kiv = 100;

ang_0 = 22*pi/180;

% Yazdani's GFM
%kpv = 1; kiv = 100;
%Kp_v=1; Ki_v = 100;

%%%
%kpi = 0.4758; 
%kii = 3.2655; % current control
 kpi = 0.4758; kii = 3.2655; % current control

OL = (kpi+kii/s)/(rfpu+xfpu*s);
bw_in = bandwidth(feedback(OL, 1))/2/pi;

%%%
kp_PLL = 60; ki_PLL = 1400; 
%kp_PLL = 30; ki_PLL = 600; 

Gs_PLL = (kp_PLL/s+ki_PLL/s/s)/(1+kp_PLL/s+ki_PLL/s/s);
bw_PLL = bandwidth(Gs_PLL)/2/pi;

%%%%
Tc=3e-3;
Td=25e-6;

wn=2*pi*15;
f1=1;f2=30;fc=sqrt(f1*f2);
Q=fc/(f2-f1);
zeta=1/2/Q;
%%  GFM claculation
SL = 0.5+0.5*1i;
Vpcc_gfm = 1;
I3_gfm = conj(SL/Vpcc_gfm);
Zb = 400^2/1e6;
XC1 = -(1i/(120*pi*3*444e-6))/Zb; %impedance ZC1
I2_gfm = Vpcc_gfm/XC1;
I1_gfm = I2_gfm + I3_gfm;
Spcc = Vpcc_gfm*conj(I1_gfm);
real(Spcc)
1-real(Spcc)


R = 0.05; 

Tc=1e-3;
Td=25e-6;
K1 = 1/0.05; 
K2 = 0.3;


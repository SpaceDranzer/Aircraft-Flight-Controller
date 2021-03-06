%%F-35 Static Stability Analysis

%%Assumptions
% Airfoil -> NACA 66-206
% Aerodynamic Center of the wing and the tail is at quarter - chord


%%F-35 Specifications
C_L_0_w = 0.1724; % at angle of attack = 0 degrees
C_L_0_t = 0 ; %-> Symmetric Airfoil 
S = 42.7; %Wing's Area
S_t = 11.96; %Tail Area
b = 10.7; %Wingspan
b_t = 6.65; %Horizontal tail wingspan
c_bar = 4.78; %Mean Chord
l_t = 3.6576;%Mean Length
epsilon_0 = %from experiment
k_epsilon_alpha = %from experiment
i_t = 0; %incidence angle of tail
e = 0.6; %Oswald Efficiency Factor - From the AE405 class slides

%%Preliminary Calculations
V_H = (S_t / S) * (l_t / c_bar);
C_L_0 = C_L_0_w + (S_t / S) * (i_t - epsilon_0);
C_M_0 = C_M_ac_w + C_L_0 * (h_cm - h_ac) - V_H * C_L_alpha_t * (i_t - epsilon_0);
C_L_alpha = C_L_alpha_w + (S_t / S) * C_L_alpha_t * (1 - k_epsilon_alpha);
C_M_alpha = C_L_alpha * (h_cm - h_ac) - V_H * C_L_alpha_t * (1 - k_epsilon_alpha);

%Total Lift - Non Dimensionalized
C_L = C_L_0 + C_L_alpha * alpha;

%Total Pitching Moment - Non Dimensionalized
C_M = C_M_0 + C_M_alpha * alpha;

%Neutral Point
h_np = h_ac + (C_L_alpha_t / C_L_alpha) * V_H * (1 - k_epsilon_alpha);

%Static Margin
static_margin = h_np - h_cm;
static_margin_distace = static_margin*c_bar;



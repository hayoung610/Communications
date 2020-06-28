function [state] = pllinit(f, D, k, w0, T)
% Creates and initializes a new phase locked loop.
% Inputs:
%         f - Nominal ref. frequency
%         D - Damping factor
%	      k - Loop gain
%         w0 - Loop corner frequency
%         T - Sample period
%bfs = buffer size   
% Outputs:
%	       state	-	Current/Initial state

%% Add/Save parameters for calculation of filter coefficients
state.f= f;
state.D= D;
state.k= k;
state.w0= w0;
state.T=T;

%% compute coefficients

tau1 = k/(w0 * w0) ;  
tau2 = 2*D/w0 - 1/k ; 
state.a1=-(T-2*tau1)/(T+2*tau1);
state.b0=(T+2*tau2)/(T+2*tau1);
state.b1=(T-2*tau2)/(T+2*tau1);


%state.sin_table = sin(2*pi*linspace(0,1023/1024, 1024));
state.ym1 = 0;
state.xm1 = 0;
state.zm1 = 0;
state.vm1 = 0;
state.acc = 0;
state.acc2 = 0;
end


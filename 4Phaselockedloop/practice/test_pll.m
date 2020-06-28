% Test the PLL.
% Global parameters
Nb = 10;	% Number of buffers
Ns = 100;	% Samples in each buffer
f = 0.1; k = 1; D = 1; w0 = 2*pi/100; T = 1;

%initialize PLL
pllstate = pllinit(f, D, k, w0, T);
load('ref_stepf');

%Generate random samples
x = ref_in;
%% for amplitude modualtion
for j = 1:1000
    x(j) = x(j)*3;
end
%% reshape buffers
xb = reshape(x, Ns, Nb);
%Output samples
y = zeros(Ns, Nb);

%Process each buffer
for k = 1:Nb
    [state_out y(:,k)] = pll(pllstate, xb(:,k));
end

%Convert individual buffers back into a continouos signal
y_out = reshape(y, Ns*Nb, 1);

plot(n,x, 'b', n, y_out, 'r');
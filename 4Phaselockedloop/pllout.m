
% Script to test the PLL.

% Global parameters
Nb = 10;	% Number of buffers
Ns = 100;	% Samples in each buffer
f = 0.1;
k = 2;
D = 1;
w0 = 2*pi/100;
T = 1;

%initializing delay block
pllstate = pllinit(f, D, k, w0, T);


%Generate random samples
x = ref_in;
%changed to *3 for amp

%reshape buffers
xb = reshape(x, Ns, Nb);

%Output samples
y = zeros(Ns, Nb);

%Process each buffer
for bi = 1:Nb
    [stateout y(:,bi)] = pll(pllstate, xb(:,bi));
end

%Convert individual buffers back into a continouos signal
y_out = reshape(y, Ns*Nb, 1);

figure(1);
plot(n, x, 'red');
hold on;
plot(n, y_out, 'blue');


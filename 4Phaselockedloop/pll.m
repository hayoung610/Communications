function[state_out, y] = pll(state, a)
% Executes the phase locked loop .
% Inputs:
%	state   	Current/Input state
%	a           input function 
% Outputs:
%	state_out	Output state variables to be stored for next iteration

p = state;
x = a;
y = zeros(1, length(x));
amp_est = mean(abs(x))*(pi/2);


s = state_in;
z = zeros (s.bfs,1);
v = zeros (s.bfs,1);

for n = 1:length(x)
    z(n) = p.ym1 * p. xm1 / p.amp_est;
    v(n) = p.vm1 * p.a1 + z(n) * p.b0 + p.zm1 * p.b1;
    s.zm1 = z(n) ;
    s.vm1 = v(n) ;
    
    %accumulator computation and wrap around
    p.acc = p.acc + p.f - (p.k/(2*pi))*v(n);
    p.acc = p.acc - floor(p.acc);
    
    
    y(n) = sin((2*pi*p.accum));

    
s.accum(n) = s.acc;
s.acc2 = s.acc2 + (s.f - (s.k/(2*pi))*v(n));
s.acc2 = s.acc2 - floor(s.acc2);
s.y(n) = s.cos_t(ceil(s.n_p*s.acc2)); %should take s.sin_t
s.ym1 = s.sin_t(floor(s.n_p*s.acc)+1);
s.xm1 = x(n);
    
    
    
%*********************************    
 
    amp = amp + abs(x(n));
%**********************************




    
  %  p.old_accum = p.accum;
    p.oldv = v;
    p.oldz = z;
    p.oldy = y(n);
   
end
state_out = p;

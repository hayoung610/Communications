function [si, str_state] = str(Ib,Qb, str_state)
state = str_state;

[state.delay, delay_Ib] = delay(state.delay,Ib);
Ib = Ib .* delay_Ib;

% Using PLL on the Ib and Qb
[ref accum_out state.PLL] = pll(Ib, state.PLL);
si = zeros(length(state.accum_out));

for i=2: length(accum_out)
    if accum_out(i-1) < 0.75 && accum_out(i) >= 0.75
        si(i)=1;
    else
        si(1) = 0;
    end
   str.accum = state.accum_out(end); 
end
str_state = state;


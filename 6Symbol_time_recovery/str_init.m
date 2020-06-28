function[str_state] = str_init(p)
str_state.accum = 0;
str_state.accum_out = 0;

str_state.delay = delay_init(128, p.Tc/2);
str_state.PLL = pll_init(1/p.Tc, p.T, p.xi, p.K);
end
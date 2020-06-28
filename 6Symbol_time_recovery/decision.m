function [symbol] = decision(Ib, Qb);

for i = 1:length(Ib)
    if Ib(i)>= 0
        if Qb(i) >= 0
            symbol(i) = 0;
        else
            symbol(i) = 2;
        end
    end
    if Ib(i) <= 0
        if Qb(i) <= 0 
            symbol(i) = 3;
        else
            symbol(i) = 1;
        end
    end
end
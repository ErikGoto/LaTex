t = out.tout;

y = t.^2/4 - cos(10*2^(1/2)*t)/400 + 1/400
plot(t, out.simout, t, y);
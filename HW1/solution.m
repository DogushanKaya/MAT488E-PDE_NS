function result = solution(x,t)

%result = 8 / (n*pi)^2 * sin(n*pi/2) *sin(n * pi * x) * exp(-1*(n*pi)^2*t);

err = 1;
n=1;
while abs(err) > 1e-7
    
    err = (8 / (n*pi)^2 * sin(n*pi/2) *sin(n * pi * x) * exp(-1*(n*pi)^2*t)) - 8 / ((n+1)*pi)^2 * sin((n+1)*pi/2) *sin((n+1) * pi * x) * exp(-1*((n+1)*pi)^2*t) ;

    n = n+1;
    
end

    result = 8 / (n*pi)^2 * sin(n*pi/2) *sin(n * pi * x) * exp(-1*(n*pi)^2*t);

end


error = 1e-7;
r1 = 0.42;  T1final = 0.192;
r2 = 0.60;  T2final = 0.208;
deltaX = 0.1;
Jvalues = 0:deltaX:1;
deltaT1 = r1 * deltaX ^ 2;
deltaT2 = r2 * deltaX ^ 2;
T1values = 0:deltaT1:T1final;
T2values = 0:deltaT2:T2final;

sizeX = size(Jvalues,2)-1;
sizeT = size(T1values,2)-1;

 for i=1:10
 w(i,1) = initial(Jvalues(i+1));
 end

 
 for i=1:10
 w2(i,1) = initial(Jvalues(i));
 end
 

for i=1:8
    for j=1:sizeT
        w(i+1,j+1) = r1*w(i,j) + (1-2*r1)*w(i+1,j) + r1 * w(i+2,j);
    end
end


for i=1:8
    for j=1:sizeT
        w2(i+1,j+1) = r2*w2(i,j) + (1-2*r2)*w2(i+1,j) + r2 * w2(i+2,j);
    end
end

figure
subplot(2,1,1)      
plot(w)  
title('r = 0.48')
subplot(2,1,2)       
plot(w2)        
title('r = 0.52')

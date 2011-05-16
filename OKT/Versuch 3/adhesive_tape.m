clear
load('adhesive_tape.mat')

S = fft(Rk);

lambda0 = 1.310e-6;
delta_lambda = 0.13e-6; 

k0 = 2*pi/lambda0;
delta_k = 2*pi*delta_lambda/lambda0^2;
sdelta_k = 12.5e9*2*pi/3e8;

m = length(Rk);
sdelta_z = 2*pi/(2*1.5*m*sdelta_k);
for m = (1:length(Rk)-1)
    k(m) = k0 - delta_k/2 + m*sdelta_k;
     %space between the step in the z-domain.(cf. S 62in Izatt/Choma
    
    z(1) = 0;
    z(m+1) =z(m) +sdelta_z;
end
plot(z,abs(S))
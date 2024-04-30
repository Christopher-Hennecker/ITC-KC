function dFdt = michaelismentenODE(~,F,params,injRate,dilRate)
kcat = abs(params(1));
Km = abs(params(2));



S = F(1);
E = F(3);

dFdt(1,1) = -(kcat*E*S)/(Km+S); %substrate
dFdt(2,1) = (kcat*E*S)/(Km+S); %product
dFdt(3,1) = 0; %enzyme
dFdt = dFdt+injRate(:)-dilRate(:).*F(:); %injection and dilution

end
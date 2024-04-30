function dCelldt = covalentODE(~,Cell,params,injRate,dilRate)
%This function contains the ODE's required to fit the ITC data for
%two-step covalent inhibition.

%First we unpack the parameters, which are described the activity of the
%enzyme (Km and kcat), and the affinity (Ki) and reactivity (kinact) of the
%inhibitor
kcat = abs(params(1));
Km = abs(params(2));
Ki = abs(params(3));
kinact= abs(params(4));


%Now we can bring out the individual concentrations of the different
%species. Cell contains 
%[Substrate, Product, Enzyme, Inhibitor, Enzyme-Inhibitor complex]
S = Cell(1);
E = Cell(3);
I = Cell(4);


%Equation 8 from the main text
ES = (Ki*S*E)/(Km*Ki+Ki*S+Km*I);

%Equation 9 from the main text
EI = Km*I*E/(Km*Ki+Ki*S+Km*I);

%Equations 10 - 14 from the main text
dCelldt(1,1) = -kcat*ES; %Substrate
dCelldt(2,1) = kcat*ES; %Product
dCelldt(3,1) = -kinact*EI;  %Enzyme 
dCelldt(4,1) = -kinact*EI;  %Inhibitor
dCelldt(5,1) = kinact*EI;   %Enzyme-Inhibitor complex


%Equation 15 from the main text
dCelldt = dCelldt+injRate(:)+dilRate(:).*Cell(:);
end
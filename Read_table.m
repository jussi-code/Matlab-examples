
"Luetaan ensimmäisenä csv tiedoston kiihtyyvysdata"
MyData=readtable('Acceleration A001_1rps.csv');
MyData2=readtable('Acceleration A001_10rps.csv');

"Luodaan taulukosta ajalle ja kiihtyvyydelle omat taulukot"
Var1_name=MyData.Properties.VariableNames(1)
Var2_name=MyData.Properties.VariableNames(2)

MyTime = MyData.x_X
MyAcc = MyData.A001__Z_Acceleration_abs_

MyTime2 = MyData2.x_X
MyAcc2 = MyData2.A001__Z_Acceleration_abs_


"Liikkessä oleva paino 5kg"
MyMass=5

"Hox! Muunnetaan kiihtysvyystieto millimetreistä metreiksi"
hold on
plot(MyTime,MyMass*MyAcc/1000,"blue")
plot(MyTime2,MyMass*MyAcc2/1000,"red")

"Stacked plot onnistuu alla olevalla tavalla"
"stackedplot(MyData.x_X, MyData.A001__Z_Acceleration_abs_)"
'plot(MyTime,MyAcc_m*MyMass,"red")'

xlabel("Time")
ylabel("Force / Acceleration")
"xlim([0,1.2])"
"ylim([0,1.2])"
grid on

hold off
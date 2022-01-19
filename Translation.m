
"Pisteet jotka määrittävät kolmion ennen rotaatiota ja translaatiota"
P0=[5,2]
P1=[10,2]
P2=[5,8]

"Funktiot pisteiden välille"
Px0=@(u) (1-u)*P0(1)+u*P1(1)
Py0=@(u) (1-u)*P0(2)+u*P1(2)
Px1=@(u) (1-u)*P1(1)+u*P2(1)
Py1=@(u) (1-u)*P1(2)+u*P2(2)
Px2=@(u) (1-u)*P2(1)+u*P0(1)
Py2=@(u) (1-u)*P2(2)+u*P0(2)

"originaalit pisteet"
hold on
fplot(Px0,Py0,[0,1],"red")
fplot(Px1,Py1,[0,1],"red")
fplot(Px2,Py2,[0,1],"red")
xlim([0 30])
ylim([0 30])

"P matriisi"
P0x=transpose([P0(1),P0(2),1])
P1x=transpose([P1(1),P1(2),1])
P2x=transpose([P2(1),P2(2),1])

"Translaatiomatriisi x ja y komponenteilla"
x_new=5
y_new=5
T=[1,0,x_new;0,1,y_new;0,0,1]
"Translaatiomatriisi nollapisteeseen"
T0=[1,0,P0(1);0,1,P0(2);0,0,1]

"Rotaatiomatriisi z-akselin ympäri"
degrees = 45
delta = pi*degrees/180
T_rz=[cos(delta),-sin(delta),0;sin(delta),cos(delta),0;0,0,1]


"uudet pisteet nollapisteeseen"
P0_new=T0*P0x
P1_new=T0*P1x
P2_new=T0*P2x

"uudet pisteet rotaatio"
P0_new=T_rz*P0_new
P1_new=T_rz*P1_new
P2_new=T_rz*P2_new

"uudet pisteet lopulliseen translaatioon"
P0_new=T*P0_new
P1_new=T*P1_new
P2_new=T*P2_new

"Funktiot uusille pisteille"
Px0_n=@(u) (1-u)*P0_new(1)+u*P1_new(1)
Py0_n=@(u) (1-u)*P0_new(2)+u*P1_new(2)
Px1_n=@(u) (1-u)*P1_new(1)+u*P2_new(1)
Py1_n=@(u) (1-u)*P1_new(2)+u*P2_new(2)
Px2_n=@(u) (1-u)*P2_new(1)+u*P0_new(1)
Py2_n=@(u) (1-u)*P2_new(2)+u*P0_new(2)

"uudet pisteet"
fplot(Px0_n,Py0_n,[0,1],"blue")
fplot(Px1_n,Py1_n,[0,1],"blue")
fplot(Px2_n,Py2_n,[0,1],"blue")

grid on
hold off


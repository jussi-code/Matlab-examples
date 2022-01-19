a=-1
b=-150
c=150^2
d=150^3-(8750000/pi)

syms x

eqn=a*x^3+b*x^2+c*x+d==0

S=solve(eqn,x,'MaxDegree',3)


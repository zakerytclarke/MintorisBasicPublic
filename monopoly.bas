rem @name Monopoly Probability Generator
rem @version 1.0
rem @author Zakery Clarke
rem @date 10/14/2017
rem @description This program generates probabilities associated with the popular board game Monopoly and outputs it to an excel csv document.
cls
print "Monopoly Simulator"
print "       By Zakery Clarke"
print "====================="
dim property$(39)="Go","Meditteranean Avenue","Community Chest","Baltic Avenue","Income Tax","Reading Railraod","Oriental Avenue","Chance","Vermont Avenue","Connecticut Avenue","Jail","St. Charles Place","Electric Company","States Avenue","Virginia Avenue","Pennsylvania Railroad","St. James Place","Community Chest","Tennessee Avenue"," New York Avenue","Free Parking","Kentucky Avenue","Chance","Indiana Avenue","Illinois Avenue","B.&O. Railroad","Atlantic Avenue","Venice Avenue","Water Works","Marvin Gardens","Go to Jail","Pacific Avenue","North Carolina Avenue","Community Chest","Pennsylvania","Short Line","Chance","Park Place","Luxury Tax","Boardwalk"
dim price(39)=0,60,0,60,0,200,100,0,100,120,0,140,150,140,160,200,180,0,180,200,0,220,0,220,240,200,260,260,150,280,0,300,300,0,320,200,0,350,0,400
rem no house,1 house, 2 houses, 3 houses, 4 houses, Hotel
dim r(5,39)=[[0,0,0,0,0,0],[2,10,30,90,160,250],[0,0,0,0,0,0],[4,20,60,180,320,450],[0,0,0,0,0,0],[0,25,50,100,200,0],[6,30,90,270,400,550],[0,0,0,0,0,0],[6,30,90,270,400,550],[8,40,100,300,450,600],[0,0,0,0,0,0],[10,50,150,450,625,750],[0,0,0,0,0,0],[10,50,150,450,625,700],[12,60,180,500,700,900],[0,25,50,100,200,0],[14,70,200,550,750,950],[0,0,0,0,0,0],[14,70,200,550,750,950],[16,80,220,600,800,1000],[0,0,0,0,0,0],[18,90,250,700,875,1050],[0,0,0,0,0,0],[18,90,250,700,875,1050],[20,100,300,750,925,1100],[0,25,50,100,200,0],[22,110,330,800,975,1150],[22,110,330,800,975,1150],[0,0,0,0,0,0],[24,120,360,850,1025,1200],[0,0,0,0,0,0],[26,130,390,900,1100,1275],[26,130,390,900,1100,1275],[0,0,0,0,0,0],[28,150,450,1000,1200,1400],[0,25,50,100,200,0],[0,0,0,0,0,0],[35,175,500,1100,1300,1500],[0,0,0,0,0,0],[50,200,600,1400,1700,2000]]
dim cph(39)=0,50,0,50,0,0,50,0,50,50,0,100,0,100,100,0,100,0,100,100,0,150,0,150,150,0,150,150,0,150,0,200,200,0,200,0,0,200,0,200
dim hits(39)
loc=0
j=0
dr=0
input "Number of Rolls",m
if m<1 then m=500
rem # of rolls to simulate
n=m
do while n>0

dice1=int(rnd(1)*6)+1
dice2=int(rnd(1)*6)+1
if j=1 then
if dice1=dice2 then
dice=(dice1+dice2)
loc=loc+dice
j=0
else
j=j+1
if j=3 then
dice=(dice1+dice2)
loc=loc+dice
j=0
endif
endif
else
if dice1=dice2 then dr=dr+1
if dr> 3 then 
loc=11
j=1
dr=0
endif
dice=(dice1+dice2)
loc=loc+dice
endif

if loc>39 then loc=loc-40

if property$(loc)="Chance" then
chran=int(rnd(1)*15)
if chran=0 then loc=0
if chran=1 then loc=24
if chran=2 then loc=11
if chran=3 then loc=loc-3
if chran=4 then 
loc=int(loc/39*4)
loc=5+loc*10
endif
if chran=5 then 
loc=int(loc/39)
if loc=0 then 
loc =12
else
loc=28
endif
endif
if chran=6 then loc=11
if chran=7 then loc=5
if chran=8 then loc=39
endif
if property$(loc)="Community Chest" then
chran=int(rnd(1)*15)
if chran=0 then loc=0
if chran=1 then loc=11
endif
if loc<0 then loc=loc+40



hits(loc)=hits(loc)+1
n=n-1
loop
open 1,"monopoly.csv","w"
writeln 1,"Monopoly Probability"+","+"By Zakery Clarke"+","+"0 Houses"+","+"1 House"+","+"2 Houses"+","+"3 Houses"+","+"4 Houses"+","+"1 Hotel"
writeln 1,"Property"+","+"Probability"+","+"P*R/C"+","+"P*R/C"+","+"P*R/C"+","+"P*R/C"+","+"P*R/C"+","+"P*R/C"
x=0
do while x<40
o$=""
o$=o$+property$(x)
o$=o$+","+str$(hits(x)/m)
if price(x)>0 then
o$=o$+","+str$(((hits(x)/m)*r(0,x))/(price(x)))
else 
o$=o$+","+"n/a"
endif
y=1
do while y<6
if price(x)>0 then
o$=o$+","+str$(((hits(x)/m)*r(y,x))/(price(x)+cph(x)*y))
else 
o$=o$+","+"n/a"
endif
y=y+1
loop
writeln 1,o$
x=x+1
loop
close 1
print "Analysis completed, Monopoly.csv exported"
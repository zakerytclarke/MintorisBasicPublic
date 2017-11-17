dim x(0)=0
dim y(0)=0
dim z(0)=0
dim u(2)
dim a(0)=0
dim t(0)=0
r=100
i=time()
t=0
d=0
m=91
graphics on
sensors on
setscale 400,1000
orientation 1
textsize 25
dialog "Physics Sensor: By Zakery Clarke","This is a simple physics sensor. Tap to record data. Data can be exported to a csv file."
do
color 0,0,0
cls
u()=getaccelerometer()
color 60,60,60
grid 3
axisx 0,t(t)+1,"Time:"
axisy floor(n),ceil(m),"Acceleration:"
textcolor 100,0,0
color 100,0,0
drawtext "X-Acceleration:"+str$(u(0)), 300,75,90
graphxy t(),x()
textcolor 0,100,0
color 0,100,0
drawtext "Y-Acceleration:"+str$(u(1)), 250,75,90
graphxy t(),y()
textcolor 0,0,100
color 0,0,100
drawtext "Z-Acceleration:"+str$(u(2)), 200,75,90
textcolor 100,100,100
if d=0 then
drawtext "Touch to take data:", 350,75,90
else
drawtext "Touch to stop:", 350,75,90
endif
if d=1 then
graphxy t(),z()
t=t+1
redim x(t)
redim y(t)
redim z(t)
redim t(t)
x(t)=u(0)
y(t)=u(1)
z(t)=u(2)
t(t)=time()-i
c=0 
do while c<t
if x(c)>m then n=x(c)
if y(c)>m then n=y(c)
if z(c)>m then n=z(c)
if x(c)<n then n=x(c)
if y(c)<n then n=y(c)
if z(c)<n then n=z(c)
c=c+1
loop
endif
touch x,y,r
if x=-1 then

else
if d=1 then
dialog "Physics Sensor","Your data has been collected and saved to the .csv file 'physicssensor.csv' This can be opened in excel for further manipulation."
open 1,"physicssensor.csv","w"
c=0
write 1,"Time(ms):"+chr$(44)+"X-Acceleration:"+chr$(44)+"Y-Acceleration:"+chr$(44)+"Z-Acceleration:"+chr$(10)
do while c<t
write 1,str$(t(c))+chr$(44)+str$(x(c))+chr$(44)+str$(y(c))+chr$(44)+str$(z(c))+chr$(10)
c=c+1
loop
close 1
d=0
t=0
redim x(0)
redim y(0)
redim z(0)
redim t(0)
else
i=time()
d=1
endif
endif
loop
cls
sensors on
gps on
orientation 2
If isdir("satellite")=0 Then
mkdir "satellite"
Endif
textcolor 0,100,0
textsize 15
print "Satellite"
print "================="
print "(Touch to Start Collecting Data)"
touch x,y
dim a(2)
dim g(2)
t=time()
open 1,"satellite/data.csv","w"
write 1,"Time,Latitude,Longitude,Altitude,X-Accel,Y-Accel,Z-Accel,X-Gyro,Y-Gyro,Z-Gyro,Temperature\n"
close 1
i=0
do
lat=getlatitude()
lon=getlongitude()
alt=getaltitude()
a()=getaccelerometer()
g()=getgyroscope()
temp=gettemperature()
ot=(time()-t)/1000
print "Time:"+str$(ot)
print "Latitude:"+str$(lat)
print "Longitude:"+str$(lon)
print "Altitude:"+str$(alt)
print "Acceleration:("+str$(a(0))+","+str$(a(1))+","+str$(a(2))+")"
print "Gyroscope:("+str$(g(0))+","+str$(g(1))+","+str$(g(2))+")"
print "Temperature:"+str$(temp)
io$=str$(i)
if i<10 then io$="0"+io$
if i<100 then io$="0"+io$
if i<1000 then io$="0"+io$
if i<10000 then io$="0"+io$
takephotoauto "satellite/p"+io$+".jpeg",2,100,25
i=i+1
wait 1000
open 1,"satellite/data.csv","w+"
write 1,str$(ot)+","+str$(lat)+","+str$(lon)+","+str$(alt)+","+str$(a(0))+","+str$(a(1))+","+str$(a(2))+","+str$(g(0))+","+str$(g(1))+","+str$(g(2))+","+str$(temp)+"\n"
close 1
loop
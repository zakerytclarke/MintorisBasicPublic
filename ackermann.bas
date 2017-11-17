sub ack(m,n,a)
i=i+1
a=0
if m=0 then a=n+1
if m>0 and n=0 then ack(m-1,1, &a)
if m>0 and n>0 then
  ack(m, n-1, &b) 
  ack(m-1, b, &a)
endif
end sub

global x,y,i,t
x=0
y=0
print "Ackermann Function Calculator:"
print "By Zakery Clarke"
print "=========================="
do while 1=1
do while x+1>y
i=0
t=time()

ack(x,y,&a)

print  "("+str$(x)+","+str$(y)+")"
print "Solution:"+str$(a)
if i=0 then i=1
print "Recursions:",str$(i-1)
print "Time:"+str$((time()-t)/1000)+" seconds"
wait
if x=y then

else
i=0
t=time()
ack(y,x,&a)
print  "("+str$(y)+","+str$(x)+")"
print "Solution:"+str$(a)
if i=0 then i=1
print "Recursions:",str$(i-1)
print "Time:"+str$((time()-t)/1000)+" seconds"
wait
endif
y=y+1
loop
y=0
x=x+1
loop
fixdecimal 15
print "Pi Series Calculator:"
print "By Zakery Clarke"
print "====================="
print "(Touch to Start)"
touch x,x
t=time()
n=1
s=0
x=-1
do while x=-1
p=s
s=s+4*(((-1)^(n-1))/(2*n-1))
n=n+1
print s
touch x,x,1
loop
s$=str$(s)
p$=str$(p)
x=0
do while x<len(str$(s)) and x<len(str$(p)) and right$(left$(s$,x),1)=right$(left$(p$,x),1)
x=x+1
loop
x=x-2
fixdecimal 0
print "Accuracy: "+str$(x-1)+" decimal places"
fixdecimal 15
print "Decimal:"+left$(str$(s),x+1)
print "Time: "+str$((time()-t)/60000)+" minutes"
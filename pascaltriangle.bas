textsize 10
textalign 0
orientation 2
print "Pascal's Triangle"
print "================"
print 1
s$="1 1"
m=20
m=m+2
n=2
do while n<m
dim a$(0)
print s$
a$()=itemsplit$(s$," ")
c=1
s$="1"
do while c<n
s$=s$+" "+str$(val(a$(c-1))+val(a$(c)))
c=c+1
loop
s$=s$+" 1"
n=n+1
loop
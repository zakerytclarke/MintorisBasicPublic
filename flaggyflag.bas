graphics on
input "Flag File Name:",f$
if f$="" then f$="flaggyflag.png"
flag=loadbitmap(f$)
h=getbitmapheight(flag)
w=getbitmapwidth(flag)
a=screenx()/2
b=screeny()/2
dim f(w,h,2)
y=0
do while y< h
x=0
do while x<w
dim c(2)
c()=getbitmappixel(flag,x,y)
f(x,y,0)=c(0)
f(x,y,1)=c(1)
f(x,y,2)=c(2)
x=x+1
loop
y=y+1
x=0
loop
o=0
do while o<3.14*2
color 15,45,60
cls
textcolor 0,0,0
textsize 100
textalign 0
drawtext "Flaggy Flag Animator",a,100,0,1
drawtext "By Zakery Clarke",a,200,0,1
color 50,50,50
rect a-w/2-10,b-h/2-10, a-w/2,screeny(),1
color 15,100,15
rect 0,screeny()-100,screenx(),screeny(),1
x=0 
do while x<w
y=0
do while y<h
color f(x,y,0),f(x,y,1),f(x,y,2)
point a+x-w/2,b+y-h/2+w*sin(o+x/w*5)/10-w*sin(o+0/w*5)/10
y=y+1
loop
x=x+1
y=0
loop
color 60,60,60
circle a-w/2-5,b-h/2-5,15,1
o=o+.25
save=copysurface(0,0,screenx(),screeny())
savebitmap save,"flaggyflag"+str$(o*4)+".jpg"
loop

rem animate
c=1
dim flaggyflag(40)
do while c< 26
flaggyflag(c)=loadbitmap("flaggyflag"+str$(c)+".jpg")
c=c+1
loop
c=1
do while 1=1
drawbitmap flaggyflag(c),a,b
w=int(sin(c/8)*10)
if w<1 then w=1
wait w*2
c=c+1
if c=26 then c=1
loop
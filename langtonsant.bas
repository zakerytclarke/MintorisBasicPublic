Graphics on
color 0,0,0
cls
mx=screenx()
my=screeny()
dim f(mx,my)
dim b$(1)="Start","Rules"
dialog "Langton's Ants","By Zakery Clarke",b$(),c
select c
case 1
graphics off
do while t$<>"BACK"
htmlbrowser on
htmlloadurl " https://en.m.wikipedia.org/wiki/Langton%27s_ant"
htmlinput t$,a$,b$
loop
htmlbrowser off
graphics on
end select
dim b$(2)="Monochrome(Tracing)","Image","Monochrome(No Tracing)"
dialog "Langton's Ants","Choose a Color Scheme",b$(),c
select c
case 0
o=0
case 2
o=1
case 1
input "Image file:",i$
if i$<>"" then
bmp=loadbitmap(i$)
drawbitmap bmp,screenx()/2,screeny()/2
dim c(2)
y=int((screeny()/2)-(getbitmapheight(bmp)/2))
do while y<screeny()/2+getbitmapheight(bmp)/2
x=int((screenx()/2)-(getbitmapwidth(bmp)/2))
do while x<screenx()/2+getbitmapwidth(bmp)/2
c()=getpixel(x,y)
if (c(0)+c(1)+c(2))/3>50 then
color 100,100,100
f(x,y)=1
else
color 0,0,0
endif
x=x+1
loop
y=y+1
loop
endif
o=0
end select
dim b$(2)="Blank","Even Distribution","Speckled"
dialog "Langton's Ants","Choose a Setup(Note:It may take some time to render",b$(),c
select c
case 0
t=0
case 2
t=100
case 1
t=2
end select
dim b$(2)="Slow","Fast","Medium"
dialog "Langton's Ants","Choose a Speed",b$(),c
select c
case 0
s=100
case 2
s=1
case 1
s=0
end select
if t>0 then
c=mx*my/t
if o=2 then
color 100,50,0
else
color 100,100,100
endif
do while c>0
x= int(rnd(1)*(mx-1))
y= int(rnd(1)*(my-1))
f(x,y)=1
point x,y
c=c-1
loop
endif
d=0
rem 0=up 1=right 2=down 3=left
x=floor(mx/2+1)
y=floor(my/2+1)
dialog "Langton's Ants","Simulation Ready"
if o<2 then
do
if f(x,y)=0 then
color 100,0,0
if o=0 then point x,y
if s > 0 then wait s
 if o=0 then 
color 18,38,59
else
color 100,100,100
endif
point x,y
f(x,y)=1
if d=0 then x=x-1
if d=1 then y=y-1
if d=2 then x=x+1
if d=3 then y=y+1
d=d-1
else
color 0,0,0
point x,y
f(x,y)=0
if d=0 then x=x+1
if d=1 then y=y+1
if d=2 then x=x-1
if d=3 then y=y-1
d=d+1
endif
if d=-1 then d=3
if d=4 then d =0
if x > mx-1 then x=1
if x<1 then x = mx-1
if y > my-1 then y=1
if y<1 then y = my-1
loop
else

if o=2 then


else



endif
endif
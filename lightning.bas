graphics on
setscale 400,1000
w=screenx()
h=screeny()
color 0,0,0
cls
color 0,0,100
lightning(w/2,0,1)

sub lightning(x,y,r)
w=screenx()
h=screeny()
nx=x+rnd(1)*100-50
ny=y+rnd(1)*100
line x,y,nx,ny
if ny<h then
for i=0 to r-1
n=int(rnd(1)*3)
if r=1 and n =0 then
lightning(nx,ny,n+1)
else
lightning(nx,ny,n)
endif
next i
endif

end sub
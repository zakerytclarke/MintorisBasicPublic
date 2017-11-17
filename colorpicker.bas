rem @name Colo Picker
rem @version 1.0
rem @author Zakery Clarke
rem @date 10/16/2017
rem @description This program helps you select RGB color pairs


graphics on
do
colorpicker(&r,&g,&b)
color r,g,b
cls
dialog "Colors","Red:"+str$(r)+chr$(10)+"Green:"+str$(g)+chr$(10)+"Blue:"+str$(b)+chr$(10)
loop

sub colorpicker(r,g,b)
rem @param r the red componwnt to be returned
rem @param g the green component to be returned
rem @param b the blue component to be returned
Graphics On
dim a(2)
Color 0,0,0
setscale 800,1205
CLS
bitmap = LoadBitmap("graphics/colortriangle.jpg")
DrawBitmap bitmap, 400,1205/2-290
color 100,100,100
textalign 0
textsize 100
drawtext "Color Picker",400,1205/2+300,0,1
touch x,y
a()=getpixel(x,y)
r=a(0)
g=a(1)
b=a(2)
graphics off
return r,g,b
end sub
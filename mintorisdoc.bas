rem @name Mintoris Doc
rem @version 1.0
rem @author Zakery Clarke
rem @date 10/13/2017
rem @description This program generates java doc style comments in the MintorisDoc format.
rootdir on
chdir "mintoris.basic"
mintorisdoc("mintorisdoc.bas")

sub mintorisdoc(f$)
rem @description The main function
rem @param f$ the file to be passed
open 1,f$,"r"
read 1,t$
close 1
o$="<html><head><title>MintorisDoc</title></head><body style='background:white'><div style='border: 1px black solid;padding:5px;'>"
c$=mintorisdocfind$(t$,"@name",0)
if c$<>"" then
o$=o$+"<h1><u>"+c$+"</u></h1>"
endif
c$=mintorisdocfind$(t$,"@version",0)
if c$<>"" then
o$=o$+"<h3>"+"Version:"+c$+"</h3>"
endif
c$=mintorisdocfind$(t$,"@author",0)
if c$<>"" then
o$=o$+"<h2>"+c$+"</h2>"
endif
c$=mintorisdocfind$(t$,"@date",0)
if c$<>"" then
o$=o$+"<h3>"+"Date:"+c$+"</h3>"
endif
c$=mintorisdocfind$(t$,"@description",0)
if c$<>"" then
o$=o$+"<h3>"+c$+"</h3>"
endif
if instr(lower$(t$),"sub",1) then o$=o$+"<div style='border: 1px black solid;padding:10px;'><h2><u>Functions:</u></h2>"
x=1

open 1,f$,"r"
do while eof(1)<>1
if lower$(left$(t$,3))<>"sub" then
readln 1,t$
endif
if lower$(left$(t$,3))="sub" then
o$=o$+"<div style='border: 1px black solid;padding:10px;'><h2>"+right$(t$,len(t$)-4)+"</h2>"
readln 1,t$
do while eof(1)<>1 and lower$(left$(t$,3))<>"sub"
if lower$(left$(t$,16))="rem @description" then
o$=o$+"<u>Description:</u>"+right$(t$,len(t$)-16)+"<br>"
endif
if lower$(left$(t$,10))="rem @param" then
o$=o$+"<u>Parameter:</u>"+right$(t$,len(t$)-10)+"<br>"
endif
if lower$(left$(t$,11))="rem @return" then
o$=o$+"<u>Returns:</u>"+right$(t$,len(t$)-11)+"<br>"
endif
readln 1,t$
loop
o$=o$+"</div>"
endif
loop
close 1

o$=o$+"</div><h3>Generated using Mintoris Docs</h3><a href='http://www.mintoris.com'>Click to learn more about Mintoris Basic</a><br><button id='button' onclick='show()'>Documentation</button></div><div id='doc'  style='display:none;border: 1px black solid;padding:5px;'><h1><u>Documentation:</u></h1><h3>Simply place any of the fields within a rem statement directly below the function you wish to describe. Metadata can be anywhere but it is usually placed at the top of the program</h3><h2><u>Metadata:</u></h2><h3>@name the name of your program</h3><h3>@version the version number of the program</h3><h3>@author the author of the program</h3><h3>@date the last date the program was modified on</h3><h3>@description a description of the program</h3><h2><u>Function Notation:</u></h2><h3>@param an argument for a function and its description</h3><h3>@return describes what the function returns</h3><script>function show(){document.getElementById('doc').style.display='block';document.getElementById('button').style.display='none';} </script></body></html>"
htmlbrowser on
htmlloaddata o$

end sub

sub mintorisdocfind$(t$,s$,o)
rem @description Function used to find mintorisdoc commands
rem @param t$ the text to search
rem @param s$ the command to find
rem @param o the offset to look from
rem @return the string of the mintoris doc command
s$="rem "+lower$(s$)
s=instr(lower$(t$),s$,1)
if s<>0 then
a=0
do while mid$(t$,a+s,1)<>"\n"
a=a+1
o$=mid$(t$,s,a)
o$=right$(o$,len(o$)-len(s$))
loop
else
o$=""
endif
return o$
end sub
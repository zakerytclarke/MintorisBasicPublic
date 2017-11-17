t=time()
bor(99)

sub bor(bottles)
print str$(bottles)+" bottles of beer on the wall, "+str$(bottles)+" bottles of beer."
bottles=bottles-1
print "Take one down, pass it around, "+str$(bottles)+" bottles of beer on the wall"
print ""
if bottles > 1 then
bor(bottles)
else
print "1 bottle of beer on the wall, 1 bottle of beer."
print "Take one down, pass it around, no more bottles of beer on the wall."
print ""
endif
end sub
print "Elapsed Time:"+str$((time()-t)/1000)+" seconds"
@ECHO OFF

xas99.py -q -R -L bouncy.lst source/bouncy.a99

IF %ERRORLEVEL% NEQ 0 GOTO END

xas99.py -q -R -i source/bouncy.a99 -o bin/BOUNCY1

xdm99.py bouncy.dsk -X dssd -n BOUNCY
xdm99.py bouncy.dsk -a bin/BOUNCY1 -n BOUNCY1
xdm99.py bouncy.dsk -a bin/BOUNCY2 -n BOUNCY2
xdm99.py bouncy.dsk -a bin/BOUNCY3 -n BOUNCY3
xdm99.py bouncy.dsk -a bin/BOUNCY4 -n BOUNCY4
xdm99.py bouncy.dsk -t -a disk/LOAD

java -jar tools/ea5tocart.jar bin/BOUNCY1 "BOUNCY" > make.log
copy bin\bouncy18.bin bouncy8.bin
jar -cvf bouncy.rpk bouncy8.bin layout.xml > make.log

:END

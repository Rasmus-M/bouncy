@ECHO OFF

xas99.py -R -L bouncy.lst source/bouncy.a99

IF %ERRORLEVEL% NEQ 0 GOTO END

xas99.py -R -i source/bouncy.a99 -o IBOUNCY1

xdm99.py bouncy.dsk -a IBOUNCY1 -n BOUNCY1
xdm99.py bouncy.dsk -a IBOUNCY2 -n BOUNCY2
xdm99.py bouncy.dsk -a IBOUNCY3 -n BOUNCY3
xdm99.py bouncy.dsk -a IBOUNCY4 -n BOUNCY4

xdm99.py -T IBOUNCY1 -o BOUNCY1
xdm99.py -T IBOUNCY2 -o BOUNCY2
xdm99.py -T IBOUNCY3 -o BOUNCY3
xdm99.py -T IBOUNCY4 -o BOUNCY4

java -jar tools/ea5tocart.jar IBOUNCY1 "BOUNCY" > make.log

:END
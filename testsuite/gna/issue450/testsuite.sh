#! /bin/sh

. ../../testenv.sh

$GHDL --vpi-compile -v gcc -c vpi2.c
$GHDL --vpi-link -v gcc -o vpi2.vpi vpi2.o

analyze disptree.vhdl
elab_simulate disptree --vpi=./vpi2.vpi | tee disptree.out
diff --strip-trailing-cr -q disptree.ref disptree.out

rm -f vpi2.o vpi2.vpi disptree.out

clean

echo "Test successful"
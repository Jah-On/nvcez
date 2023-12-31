clear

vhdlFiles=$(ls | grep ^\.*.vhd    | tr "\n" " ")
testBench=$(ls | grep ^\.*_tb.vhd | sed 's/.vhd//')

nvc --std=2008 -a $vhdlFiles

if [ $? -ne 0 ]
then
    exit $?
fi

nvc --std=2008 -e $testBench

if [ $? -ne 0 ]
then
    exit $?
fi

nvc --std=2008 -r $testBench -w --format=vcd
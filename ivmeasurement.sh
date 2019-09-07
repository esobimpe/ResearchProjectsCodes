#!/bin/bash
# GNU bash, version 4.3.46

maxVol=30
minVol=24

takemeasurement(){
for ((i=minVol; i<maxVol; i++)); do

  snmpset -v 2c -m +./WIENER-CRATE-MIB_new.txt -c guru 10.226.15.16 outputVoltage.u900 F $i
  sleep 3s

  echo $(snmpget -v 2c -m +/home/novadaq/WIENER-CRATE-MIB.txt -c guru 10.226.15.16 outputMeasurementTerminalVoltage.u900)
  sleep 3s

  echo $(snmpget -v 2c -m +/home/novadaq/WIENER-CRATE-MIB.txt -c guru 10.226.15.16 outputMeasurementCurrent.u900)

done
}

for i in $(seq 1); do
 'takemeasurement' $i; sleep 300; done
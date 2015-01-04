#!/bin/bash
# cp src/edu/fiu/cis/acrl/vescheduler/ws/VESchedulerSkeleton.java .
rm -rf src/edu/fiu/cis/acrl/vescheduler/ws/
wsdl2java.sh -o . -sd -ss --noBuildXML -g -p edu.fiu.cis.acrl.vescheduler.ws -uri scheduler.wsdl
cp VESchedulerSkeleton.java src/edu/fiu/cis/acrl/vescheduler/ws/

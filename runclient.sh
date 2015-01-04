#!/bin/bash

if [ -z $AXIS2_LIBS ]; then
	echo "AXIS2_LIBS must be defined"
	exit 1
fi

echo $@
java -cp lib/veclient.jar:lib/VEScheduler.jar:$AXIS2_LIBS edu.fiu.cis.acrl.vescheduler.client.VESchedulerClient $@

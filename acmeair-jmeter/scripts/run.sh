#!/bin/sh
echo $ACMEAIR_HOST > hosts.csv

# load acmeair database
curl -X GET "$ACMEAIR_HOST:9080/rest/api/loader/load?numCustomers=10000"

$JMETER_HOME/bin/jmeter -DusePureIDs=true -n -t AcmeAir.jmx -j AcmeAir.log -l AcmeAir.jtl

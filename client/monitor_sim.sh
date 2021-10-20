#!/bin/bash
filename="results/replicas.csv"
echo "time,utilization,currentreplicas,desiredreplicas" > $filename
while true
do
    cur=`kubectl get hpa dbscan-serving -o yaml | grep currentReplicas | cut -f4 -d" "`
    des=`kubectl get hpa dbscan-serving -o yaml | grep desiredReplicas | cut -f4 -d" "`
    util=`kubectl get hpa dbscan-serving -o yaml | grep currentCPUUtilizationPercentage | cut -f4 -d" "`
    kubectl cp ofc2022/dbscan-serving-client-7f7fc86785-xr4gw:/app/results/ results/
    ls ./results
    echo `date +"%Y-%m-%d %T"`,$util,$cur,$des >> $filename
    sleep 10
done
`
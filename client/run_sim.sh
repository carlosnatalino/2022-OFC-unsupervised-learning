#!/bin/bash
numclients=1920
# for numclients in 30 60 120 240 480 960 1920
# do
    echo $numclients

    echo "Starting for ${numclients} client(s)" at `date +"%Y-%m-%d %T"`
    echo "Starting for ${numclients} client(s)" at `date +"%Y-%m-%d %T"` >> /app/results/results-time.csv
    for run in `seq 10`
    do
        echo $run
        /app/target/release/ofc dbscan-serving $numclients > /app/results/results-$numclients-$run.csv &
        echo $!
    done

    while [[ -n $(jobs -r) ]]
    do
        echo `date +"%Y-%m-%d %T"`
        sleep 60
    done
    echo "Finishing for ${numclients} client(s)" at `date +"%Y-%m-%d %T"` >> /app/results/results-time.csv
    echo "done with ${numclients}"
    # sleep 900

# done

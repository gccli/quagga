#!/bin/bash

if [ "${0}x" == "zebrax" ]; then
    r=$(hostname)
    echo "Starting router $r"
    sed -i "s/^hostname.*/hostname $r/" /etc/quagga/*
    zebra -d
    for svc in bgpd ospfd ospf6d; do
        if [ -f /etc/quagga/${svc}.conf ]; then
            echo "Starting ${svc}."
            $svc -d
        fi
    done

    tail -f /var/log/quagga.log
fi

exec $@

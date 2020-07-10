#!/bin/bash
iptables -N port-scaning
iptables -A port-scaning -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit --limit 1/s --limit-burst 2 -j RETURN
iptables -A port-scaning -j DROP

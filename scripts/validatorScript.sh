#!/bin/bash

#variable
BALANCE_BY='1000'
SLEEP_BY='3000'

#fixed variables
CURRENT_BALANCE=$(~/node.operator/scripts/checkBalance.sh | awk '{print $3}')
BALANCE=$(echo $CURRENT_BALANCE-$BALANCE_BY-10 | bc -l)
ROUNDED_BALANCE=$(printf "%.0f" $BALANCE)

#final variables
SLEEP="$(($RANDOM% $SLEEP_BY))"
STAKE="$(($RANDOM% $BALANCE_BY+$ROUNDED_BALANCE))"

sleep $SLEEP && cd ~/net.ton.dev/scripts && ./validator_msig.sh $STAKE >> ~/node.operator/logs/validator.log

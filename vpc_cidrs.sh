#!/bin/bash
REGIONS=$@

for REGION in $REGIONS
do
VPCS=$(aws ec2 describe-vpcs --region $REGION | jq .Vpcs[].VpcId)
VPCSARRAY=($VPCS)
LENGTH=${#VPCSARRAY[@]}
CIDRS=$(aws ec2 describe-vpcs --region $REGION | jq .Vpcs[].CidrBlockAssociationSet[].CidrBlock)
CIDRSARRAY=($CIDRS)
done

for ((i=0;i<$LENGTH;i++))
do
    echo "${VPCSARRAY[i]} --> ${CIDRSARRAY[i]}"
done
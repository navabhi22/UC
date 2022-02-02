#!/bin/bash -x

isPartTime=1
isFullTime=2
numOfWorkingDays=20
empRatePerHr=20
maxHoursInMonth=100
totalWorkingDays=0
totalEmpHr=0

function getWorkHrs()
{	case $1 in
		$isFullTime)
			empHrs=8;;
		$isPartTime)
			empHrs=4;;
			*)
			empHrs=0;;
	esac
}

function getEmpWage()
{
	echo $(($1*$empRatePerHr))
}

while [[ $totalEmpHr -lt $maxHoursInMonth && $totalWorkingDays -lt $numOfWorkingDays ]]
do
	((totalWorkingDays++))
	ramdomCheck=$((RANDOM%3))
	getWorkHrs $ramdomCheck
	totalEmpHr=$(($totalEmpHr+$empHrs))
	dailyWages[$totalWorkingDays]=$(($empHrs*$empRatePerHr))
done

totalSalary="$(getEmpWage $totalEmpHr)"
echo ${dailyWages[@]}

$count =0
do {
$count++

write-output "[$env:STAGE_NAME] starting container[Attempt: $count]"
$teststart = Invoke-WebRequest -Uri http://localhost:8081
if ($teststart.statuscode -eq '200')
$started = $true
}
else
{
start-sleep -Seconds 1
}
} until (!$started -or ($count -eq 3) )
if (!$started)
exit 1
}

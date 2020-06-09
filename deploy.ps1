$Resources = Get-ChildItem .\ -Recurse -Filter "*.yaml" -Exclude "deployment.yaml"
foreach ($Resouce in $Resources) {
	kubectl apply -f $Resouce
}

$Deployments = Get-ChildItem .\ -Recurse -Filter "deployment.yaml"
foreach ($Deployment in $Deployments) {
	kubectl apply -f $Deployment
	kubectl rollout restart -f $Deployment
}

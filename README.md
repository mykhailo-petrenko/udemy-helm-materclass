# Helm Masterclass (Udemu https://www.udemy.com/course/helm-masterclass/)

Goal: learn how to "prepare" helm to create/update/use charts in a day to day basis like a breathe. 

## Links 

- https://github.com/addamstj/helm-course 
- https://helm.sh/docs/chart_best_practices/conventions/
- https://helm.sh/docs/chart_template_guide/control_structures/
- https://helm.sh/docs/chart_template_guide/functions_and_pipelines/

## Challenges

- [Challenge 1](./challenge-1.md)

## Troubleshooting tricks

- `helm lint`
- `helm template .`
- `helm template . | kubectl create --dry-run -f -`

## Init 

### Start
`minikube start --static-ip 192.168.200.200`

### Access services (for macOS)
`minikube service web-server-service`

### Create empty (boilerpate) helm chart
`helm create CHARTNAME`

### Upload/Update

`helm install DEPLOYMENTNAME /path/to/chart`
`helm upgrade DEPLOYMENTNAME /path/to/chart`

### List
`helm list`

### Uninstall/Tear down
`helm uninstall CHARTNAME`

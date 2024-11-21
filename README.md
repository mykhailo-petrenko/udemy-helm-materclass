# Helm Masterclass (Udemu https://www.udemy.com/course/helm-masterclass/)

Goal: learn how to "prepare" helm to create/update/use charts in a day to day basis like a breathe. 

## Challenges

- [Challenge 1](./challenge-1.md)

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

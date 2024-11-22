# Challenge 2

## Assignment

1. Copy 'templatedchart' and rename it to: challenge2
2. In the service create an if statement based on the 'type'
  - If NodePort, use NodePort (30001) + Port 80
  - If LoadBalancer, use Port 8001
  - Default is ClusterIP, use port 8180
3. Replace 'nginxcontainer' with a template and use it

## Workbook

### Test Manually

- `helm template ./challenge-2 -f ./challenge-2/values.yaml`
- `helm template ./challenge-2 -f ./challenge-2/staging.values.yaml`
- `helm template ./challenge-2 -f ./challenge-2/production.values.yaml`


```
➜  udemy-helm-materclass git:(master) ✗ helm template ./challenge-2 -f ./challenge-2/values.yaml        
---
# Source: myfirstchart/templates/service.yaml
apiVersion: v1
kind: Service
metadata:
  name: helmservice
  labels:
    app: nginx
    location: frontend
    server: proxy
spec:
  type: NodePort
  ports:
    - port: 80
      targetPort: 80
      protocol: TCP
      name: http
      nodePort: 30001
  selector:
    app: nginx
---
# Source: myfirstchart/templates/deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: helmdeployment
  labels:
    app: nginx
    location: frontend
    server: proxy
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx
      location: frontend
      server: proxy
  template:
    metadata:
      labels:
        app: nginx
        location: frontend
        server: proxy
    spec:
      containers:
        - name: nginxcontainer
          image: "nginx:latest"
          ports:
          - name: http
            containerPort: 80
            protocol: TCP

```


```
➜  udemy-helm-materclass git:(master) ✗ helm template ./challenge-2 -f ./challenge-2/staging.values.yaml   
---
# Source: myfirstchart/templates/service.yaml
apiVersion: v1
kind: Service
metadata:
  name: staginghelmservice
  labels:
    app: nginx
    location: frontend
    server: proxy
spec:
  type: ClusterIP
  ports:
    - port: 80
      targetPort: 80
      protocol: TCP
      name: http
      nodePort: 8180
  selector:
    app: nginx
---
# Source: myfirstchart/templates/deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: staginghelmdeployment
  labels:
    app: nginx
    location: frontend
    server: proxy
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx
      location: frontend
      server: proxy
  template:
    metadata:
      labels:
        app: nginx
        location: frontend
        server: proxy
    spec:
      containers:
        - name: nginxcontainer
          image: "nginx:latest"
          ports:
          - name: http
            containerPort: 80
            protocol: TCP
```


```
➜  udemy-helm-materclass git:(master) ✗ helm template ./challenge-2 -f ./challenge-2/production.values.yaml
---
# Source: myfirstchart/templates/service.yaml
apiVersion: v1
kind: Service
metadata:
  name: prodhelmservice
  labels:
    app: nginx
    location: frontend
    server: proxy
spec:
  type: LoadBalancer
  ports:
    - port: 80
      targetPort: 80
      protocol: TCP
      name: http
      nodePort: 8001
  selector:
    app: nginx
---
# Source: myfirstchart/templates/deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: prodhelmdeployment
  labels:
    app: nginx
    location: frontend
    server: proxy
spec:
  replicas: 2
  selector:
    matchLabels:
      app: nginx
      location: frontend
      server: proxy
  template:
    metadata:
      labels:
        app: nginx
        location: frontend
        server: proxy
    spec:
      containers:
        - name: nginxcontainer
          image: "nginx:latest"
          ports:
          - name: http
            containerPort: 80
            protocol: TCP
        - name: proxy
          image: "nginx:latest"
          ports:
            - name: http
              containerPort: 80
              protocol: TCP
```
# Challenge 1

Start minikube.

`minikube start --static-ip 192.168.200.200`

Create boilerplate chart.

`helm create challenge-1`

Do the test assignment - edit charts. Install then:

`helm install challenge-1-deployment ./challenge-1`

Check the outcome (is it works). Since it mac lets use `minikube service ...`

`kubectl get svc`

`minikube service web-server-service `
    |-----------|--------------------|-------------|------------------------------|
    | NAMESPACE |        NAME        | TARGET PORT |             URL              |
    |-----------|--------------------|-------------|------------------------------|
    | default   | web-server-service | httpd/80    | http://192.168.200.200:31234 |
    |-----------|--------------------|-------------|------------------------------|
    🏃  Starting tunnel for service web-server-service.
    |-----------|--------------------|-------------|------------------------|
    | NAMESPACE |        NAME        | TARGET PORT |          URL           |
    |-----------|--------------------|-------------|------------------------|
    | default   | web-server-service |             | http://127.0.0.1:62411 |
    |-----------|--------------------|-------------|------------------------|
    🎉  Opening service default/web-server-service in default browser...
    ❗  Because you are using a Docker driver on darwin, the terminal needs to be open to run it.

Saw: It works! in browser. Now can clean up a bit.

- `minikube stop`
- `minikube delete`


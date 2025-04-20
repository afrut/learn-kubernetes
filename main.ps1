. $PSScriptRoot/envs/base.ps1
. $PSScriptRoot/envs/derived.ps1

# # Install kind
# # https://kind.sigs.k8s.io/docs/user/quick-start/#installing-from-release-binaries
# curl.exe -Lo kind-windows-amd64.exe https://kind.sigs.k8s.io/dl/v0.27.0/kind-windows-amd64
# if (-not (Test-Path -Path $KIND_DIR)) {
#     New-Item -Path $KIND_DIR -ItemType Directory -Force
# }
# Move-Item .\kind-windows-amd64.exe "$KIND_DIR\kind.exe"
# $usrpath = [Environment]::GetEnvironmentVariable("PATH", [System.EnvironmentVariableTarget]::User)
# if (-not $usrpath.Contains("$KIND_DIR")) {
#     [Environment]::SetEnvironmentVariable("PATH", $usrpath + ";$KIND_DIR", [System.EnvironmentVariableTarget]::User)
# }



# # Install minikube
# if (-not (Test-Path -Path $MINIKUBE_DIR)) {
#     New-Item -Path $MINIKUBE_DIR -ItemType Directory -Force
# }
# Invoke-WebRequest -OutFile "$MINIKUBE_DIR\minikube.exe" `
#     -Uri 'https://github.com/kubernetes/minikube/releases/latest/download/minikube-windows-amd64.exe' `
#     -UseBasicParsing
# $usrpath = [Environment]::GetEnvironmentVariable("PATH", [System.EnvironmentVariableTarget]::User)
# if (-not $usrpath.Contains("$MINIKUBE_DIR")) {
#     [Environment]::SetEnvironmentVariable("PATH", $usrpath + ";$MINIKUBE_DIR", [System.EnvironmentVariableTarget]::User)
# }



# kubectl
# https://kubernetes.io/docs/tasks/tools/install-kubectl-windows/#install-kubectl-binary-on-windows-via-direct-download-or-curl



# # chocolatey
# # https://chocolatey.org/install
# Set-ExecutionPolicy Bypass -Scope Process -Force
# [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
# iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))



# # kustomize
# # https://kubectl.docs.kubernetes.io/installation/kustomize/
# # https://kubectl.docs.kubernetes.io/installation/kustomize/chocolatey/
# choco install kustomize -y --force



# # kind clusters
# kind create cluster `
#     --name=$KIND_CLUSTER_NAME `
#     --image=$KIND_IMAGE `
#     --wait 2m

# kind delete clusters $KIND_CLUSTER_NAME



# # minikube clusters
# minikube start
# minikube stop
# minikube delete --all
# minikube status
# minikube service hello-node
# minikube addons list
# minikube addons enable metrics-server
# minikube addons disable metrics-server




# # Ad-hoc commands
# kind get clusters
# kubectl config view
# kubectl config get-contexts
# kubectl config current-context
# kubectl config use-context $KUBECTL_CONTEXT
# kubectl config set-context $KUBECTL_CONTEXT --cluster=my-cluster --namespace=$KUBECTL_NAMESPACE
# kubectl get namespaces
# kubectl get pods --all-namespaces
# kubectl logs pod
# kubectl get deployments
# kubectl get events
# kubectl get nodes
# kubectl get deployments
# kubectl get services
# kubectl get pod,svc -n kube-system
# kubectl top pods # See resource consumption of pods. Metrics Server has to be enabled
# kubectl delete service hello-node
# kubectl delete deployment hello-node



# # Create a deployment that contains a pod 
# kubectl create deployment `
#     hello-node `
#     --image=registry.k8s.io/e2e-test-images/agnhost:2.39 -- `
#     /agnhost netexec --http-port=8080

# # Create a service that exposes the pod
# kubectl expose deployment hello-node --type=LoadBalancer --port=8080
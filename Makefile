SCRIPT_DIR=$$(realpath $$(pwd))

define setup_environment
	echo ${SCRIPT_DIR}
endef

# --------------------------------------------------
#  setup
# --------------------------------------------------
setup: \
	install_minikube \
	install_kubectl

# https://minikube.sigs.k8s.io/docs/start/?arch=%2Flinux%2Fx86-64%2Fstable%2Fbinary+download
install_minikube:
	@$(setup_environment) && \
	curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64 && \
	sudo install minikube-linux-amd64 /usr/local/bin/minikube && \
	rm minikube-linux-amd64

# https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
install_kubectl:
	@$(setup_environment) && \
	echo "Installing kubectl $${KUBECTL_VERSION}" && \
	[ $$(uname -m) = x86_64 ] && curl -LO "https://dl.k8s.io/release/v$${KUBECTL_VERSION}/bin/linux/amd64/kubectl" && \
	curl -LO "https://dl.k8s.io/release/v$${KUBECTL_VERSION}/bin/linux/amd64/kubectl.sha256" && \
	echo "$$(cat kubectl.sha256)  kubectl" | sha256sum --check && \
	sudo mv $(SCRIPT_DIR)/kubectl /usr/local/bin/kubectl && \
	kubectl version --client --output=yaml && \
	rm -rf kubectl.sha256

# --------------------------------------------------
#  minikube
# --------------------------------------------------
start_cluster:
	@$(setup_environment) && \
	minikube start

# --------------------------------------------------
#  kubectl
# --------------------------------------------------
kubectl_list_contexts:
	@$(setup_environment) && \
	kubectl config get-contexts

kubectl_current_context:
	@$(setup_environment) && \
	kubectl config current-context

kubectl_use_context:
	@$(setup_environment) && \
	kubectl config use-context $${KUBECTL_CONTEXT} > /dev/null && \
	[ $$(kubectl config current-context) = $${KUBECTL_CONTEXT} ]

kubectl_set_context:
	@$(setup_environment) && \
	kubectl config set-context $${KUBECTL_CONTEXT} --cluster=minikube --namespace=default && \
	[ $$(kubectl config view --minify -o jsonpath='{..namespace}') = $${KUBECTL_NAMESPACE} ]

list_namespaces:
	@$(setup_environment) && \
	kubectl get namespaces
default: docker_build
include .env

# Note:
#	Latest version of kubectl may be found at: https://github.com/kubernetes/kubernetes/releases
# 	Latest version of helm may be found at: https://github.com/kubernetes/helm/releases
# 	Latest version of yq may be found at: https://github.com/mikefarah/yq/releases
VARS:=$(shell sed -ne 's/ *\#.*$$//; /./ s/=.*$$// p' .env )
$(foreach v,$(VARS),$(eval $(shell echo export $(v)="$($(v))")))

DOCKER_IMAGE ?= jcheng919/ljc-helper
DOCKER_TAG ?= 1.0.4

docker_build:
	@docker buildx build --platform=${TARGETOS}/${TARGETARCH} \
	  --build-arg KUBE_VERSION=$(KUBE_VERSION) \
	  --build-arg HELM_VERSION=$(HELM_VERSION) \
	  --build-arg AWS_VERSION=$(AWS_VERSION) \
	  --build-arg TARGETOS=${TARGETOS} \
	  --build-arg TARGETARCH=${TARGETARCH} \
	  --build-arg YQ_VERSION=$(YQ_VERSION) \
	  --build-arg VERACODE_CLI_VERSION=$(VERACODE_CLI_VERSION) \
	  --build-arg TERRAFORM_VERSION=$(TERRAFORM_VERSION) \
	  -t $(DOCKER_IMAGE):$(DOCKER_TAG) .

docker_push:
	# Push to DockerHub
	docker push $(DOCKER_IMAGE):$(DOCKER_TAG)


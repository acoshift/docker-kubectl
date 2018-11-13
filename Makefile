default:
	docker build --pull -t acoshift/kubectl .
	docker push acoshift/kubectl

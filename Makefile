.PHONY: up
up:
	docker-compose -f docker-compose.yaml --profile $(PROFILE) up --build -d --remove-orphans

.PHONY: down
down:
	docker-compose -f docker-compose.yaml --profile $(PROFILE) down --remove-orphans

.PHONY: httpd
http: PROFILE:=httpd
http: up

.PHONY: httpd_down
httpd_down: PROFILE:=httpd
httpd_down: down

.PHONY: nginx
nginx: PROFILE:=nginx
nginx: up

.PHONY: nginx_down
nginx_down: PROFILE:=nginx
nginx_down: down
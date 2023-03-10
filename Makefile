#!make
composeUp:
	npm run --prefix ./services/gateway build \
	&& npm run --prefix ./services/users build \
	&& sudo -S docker-compose build \
 	&& sudo docker-compose --env-file ./.env up -d

prepare:
	npm install --prefix ./services/gateway \
	&& npm install --prefix ./services/users \
	&& chmod +x ./services/users/.husky/pre-commit \
	&& chmod +x ./services/gateway/.husky/pre-commit

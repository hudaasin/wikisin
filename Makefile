.PHONY: build up up-admin down logs backup backup-dbms backup-data backup-imgs backups backups-dbms backups-data backups-imgs restore-dbms restore-data restore-imgs

# Build the containers
build:
	docker compose up --build -d

# Start the containers
up:
	docker compose up -d

# Start the containers with phpMyAdmin
up-admin:
	docker compose -f ./compose.yml -f ./compose.admin.yml up -d

# Stop and remove the containers
down:
	docker compose -f ./compose.yml -f ./compose.admin.yml down

# Inirialize database
init:
	docker compose down -v
	docker compose up -d
	docker compose exec db bash -c "yarsin init"
	docker compose restart

# Create a backup of the DBMS and media files
backup: up
	file_name="backup_$(shell date +'%Y_%m_%dT%H_%M_%S')"; \
	docker-compose exec db bash -c "yarsin backup dbms -i $${UID} -n $${file_name}_dbms.sql.gz"; \
	docker-compose exec wikisin bash -c "yarsin backup -i $${UID} -n $${file_name}_imgs.tar.xz"

# Create a backup of the DBMS
backup-dbms: up
	docker compose exec db bash -c "yarsin backup dbms -i $${UID}"

# Create a backup of the database
backup-data: up
	docker compose exec db bash -c "yarsin backup data -i $${UID}"

# Create a backup of the media files
backup-imgs: up
	docker compose exec wikisin bash -c "yarsin backup -i $${UID}"

# View the list of available backups including DBMS, database, and media files
backups: up
	docker compose exec db bash -c "yarsin backups all"
	docker compose exec wikisin bash -c "yarsin backups imgs"

# View the list of available DBMS backups
backups-dbms: up
	docker compose exec db bash -c "yarsin backups dbms"

#  View the list of available database backups
backups-data: up
	docker compose exec db bash -c "yarsin backups data"

# View the list of available images backups
backups-imgs: up
	docker compose exec wikisin bash -c "yarsin backups imgs"

# Restore the DBMS from a backup
restore-dbms: up
	docker compose exec db bash -c "yarsin restore dbms"
	docker compose restart db

# Restore a database from a backup
restore-data: up
	docker compose exec db bash -c "yarsin restore data"
	docker compose restart db

# Restore the media files from a backup
restore-imgs: up
	docker compose exec wikisin bash -c "yarsin restore imgs"

# View the container logs
logs:
	docker compose logs -f
# Update MediaWiki database
update:
	php maintenance/update.php --quick

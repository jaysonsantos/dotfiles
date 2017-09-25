db-start () {
  echo "More info about initialization: https://store.docker.com/images/postgres"
  docker-compose -f ~/dotfiles/roles/postgres/local_postgres.yml up -d
  docker ps
}

db-stop () {
  docker-compose -f ~/dotfiles/roles/postgres/local_postgres.yml stop
  docker ps
}

db-backup () {
  mkdir -p ~/Backup
  docker run --rm --volumes-from local_postgres -v ~/Backup:/backup busybox \
    tar cvf "/backup/local_postgres_$(date -u +"%Y-%m-%d_%H-%M-%S").tar" /var/lib/postgresql/data
}

db-restore() {
  echo 'Manual process. See https://stackoverflow.com/a/23778599/1391315'
  echo 'sudo docker run --rm --volumes-from DATA2 -v $(pwd):/backup busybox tar xvf /backup/backup.tar'
}

db-psql () {
  docker exec -it local_postgres psql -h postgres -U postgres $*
}

# If the real psql client is not installed on this host, create an alias
which psql 1>/dev/null 2>&1 || alias psql=db-psql

db-create() {
  local user_name=$1
  if [ -z ${user_name} ]; then
      echo 'Provide a username. E.g.: db-create my_user'
      return
  fi

  echo "Paste these commands in psql below:"
  echo
  echo "CREATE USER ${user_name};"
  echo "ALTER USER ${user_name} WITH PASSWORD '${user_name}';"
  echo "CREATE DATABASE ${user_name};"
  echo "GRANT ALL PRIVILEGES ON DATABASE ${user_name} TO ${user_name};"
  echo
  db-psql
}

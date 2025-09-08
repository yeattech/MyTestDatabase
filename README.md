# MyTestDatabase

- This is a repo which allow us to up different database easily by docker and having some experimental script.

# Docker Run

## Oracle SQL

- [LINK](https://hub.docker.com/r/gvenzl/oracle-free)
- Port: 1521
- Service Name: FREEPDB1
- Username: sys
- Password: password
- Role: SYSDBA

```
docker run -d -p 1521:1521 -e ORACLE_PASSWORD=password --name my-test-oraclesql -v my-test-oraclesql-data:/opt/oracle/oradata gvenzl/oracle-free gvenzl/oracle-free:23

docker start my-test-oraclesql
```

## MySQL

- [LINK](https://hub.docker.com/_/mysql)
- Port: 3306
- Username: root
- Password: password

```
# MySQL
docker run --name my-local-mysql -v my-test-mysql-data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=password -d -p 3306:3306 mysql:lts
```

##

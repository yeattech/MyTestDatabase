# MyTestDatabase

- This is a repo which allow us to up different database easily by docker and having some experimental script.

# Docker Run

## Oracle SQL

- [LINK](https://hub.docker.com/r/gvenzl/oracle-free)
- Username: sys
- Password: password

```
docker run -d -p 1521:1521 -e ORACLE_PASSWORD=password --name my-test-oraclesql -v my-test-oraclesql-data:/opt/oracle/oradata gvenzl/oracle-free gvenzl/oracle-free:23

docker start my-test-oraclesql
```

## MySQL

- [LINK](https://hub.docker.com/_/mysql)
- Username: root
- Password: password

```
# MySQL
docker run --name my-test-mysql -e MYSQL_ROOT_PASSWORD=password -d mysql:lts
```

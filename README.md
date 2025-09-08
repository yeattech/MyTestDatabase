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
docker run --name my-test-mysql -v my-test-mysql-data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=password -d -p 3306:3306 mysql:lts
```

## DB2

- [LINK](https://hub.docker.com/r/ibmcom/db2)
- Port: 50000
- Database: testdb
- Username: db2inst1
- Password: password

```
docker run --platform=linux/amd64 -itd --name my-local-db2 --privileged=true -p 50000:50000 -e LICENSE=accept -e DB2INST1_PASSWORD=password -e DBNAME=testdb -v my-test-db2-data:/database ibmcom/db2
```

## MSSQL

- [LINK](https://hub.docker.com/r/microsoft/mssql-server)
- Port: 1433
- Username: sa
- Password: password

```
docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=Password123" -e "MSSQL_PID=Evaluation" -p 1433:1433  --name my-test-mssql --hostname mssqlhost -d mcr.microsoft.com/mssql/server:2022-preview-ubuntu-22.04
```

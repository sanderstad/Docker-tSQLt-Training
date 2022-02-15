# loop until sql server is up and ready
for i in {1..50};
do
    sqlcmd -S localhost -d master -Q "SELECT @@VERSION"
    if [ $? -ne 0 ];then
        sleep 2
    fi
done

# create sqladmin with dbatools.IO password and disable sa
/opt/mssql-tools/bin/sqlcmdsqlcmd -S localhost -d master -i /tmp/create-admin.sql

# change the default login to sqladmin instead of sa
export SQLCMDUSER=sqladmin

# download the example databases
wget https://github.com/sanderstad/Docker-tSQLt-Training/raw/main/tsqlttraining/resources/northwind.bak
wget https://github.com/sanderstad/Docker-tSQLt-Training/raw/main/tsqlttraining/resources/pubs.bak

# restore the databases
/opt/mssql-tools/bin/sqlcmd -S localhost -d master -i /tmp/restore-db.sql -U sa -P MyStr0ngP@ssword

# prepare instance for tSQLt
/opt/mssql-tools/bin/sqlcmd -S localhost -d master -i /tmp/tsqlt/PrepareServer.sql -U sa -P MyStr0ngP@ssword

# install tsqlt into example databases
/opt/mssql-tools/bin/sqlcmd -S localhost -d Northwind-tSQLt -i /tmp/tsqlt/tSQLt.class.sql -U sa -P MyStr0ngP@ssword
/opt/mssql-tools/bin/sqlcmd -S localhost -d pubs-tSQLt -i /tmp/tsqlt/tSQLt.class.sql -U sa -P MyStr0ngP@ssword

#install tSQLt extra example database
/opt/mssql-tools/bin/sqlcmd -S localhost -d master -i /tmp/tsqlt/Example.sql -U sa -P MyStr0ngP@ssword


# loop until sql server is up and ready
for i in {1..50};
do
    sqlcmd -S localhost -d master -Q "SELECT @@VERSION"
    if [ $? -ne 0 ];then
        sleep 2
    fi
done

# create sqladmin with dbatools.IO password and disable sa
sqlcmd -S localhost -d master -i /tmp/create-admin.sql

# change the default login to sqladmin instead of sa
export SQLCMDUSER=sqladmin

# download the example databases
wget https://github.com/sanderstad/Training-Day-SQL-Bits-2022/raw/main/tsqlttraining/resources/northwind.bak
wget https://github.com/sanderstad/Training-Day-SQL-Bits-2022/raw/main/tsqlttraining/resources/pubs.bak
sqlcmd -S localhost -d master -i /tmp/restore-db.sql -U sqladmin -P MyStr0ngP@ssword

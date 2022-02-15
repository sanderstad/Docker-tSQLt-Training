# check for arm64 which does not support sqlcmd
arch=$(lscpu | awk '/Architecture:/{print $2}')
if [ "$arch" = "aarch64" ]; then
    wget https://github.com/microsoft/go-sqlcmd/releases/download/v0.2.0/sqlcmd-v0.2.0-linux-arm64.tar.bz2
    tar -xvf sqlcmd-v0.2.0-linux-arm64.tar.bz2
    mkdir /opt/mssql-tools /opt/mssql-tools/bin
    cp sqlcmd /opt/mssql-tools/bin
    chmod +x /opt/mssql-tools/bin/sqlcmd
fi
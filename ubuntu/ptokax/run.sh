#!/bin/bash
HUB=${HUB:-}
NICK=${NICK:-admin}
PASSWORD=${PASSWORD:-password}

if [ ! -d /opt/PtokaX/cfg ]
then
mv /opt/PtokaX/cfg.example /opt/PtokaX/cfg

cat << EOF > /opt/PtokaX/cfg/Settings.xml
<?xml version="1.0" encoding="windows-1252" standalone="yes" ?>
<PtokaX Version="0.5.0.1">
    <Booleans />
    <Integers />
    <Strings>
        <String Name="HubName">$HUB</String>
        <String Name="HubAddress">$HUB</String>
        <String Name="HubDescription">$HUB</String>
    </Strings>
</PtokaX>
EOF

cat << EOF > /opt/PtokaX/cfg/RegisteredUsers.xml
<?xml version="1.0" encoding="windows-1252" standalone="yes" ?>
<RegisteredUsers>
    <RegisteredUser>
        <Nick>$NICK</Nick>
        <Password>$PASSWORD</Password>
        <Profile>0</Profile><!-- 0 for master, 1 for operator, 2 for vip, 3 for reg -->
    </RegisteredUser>
</RegisteredUsers>
EOF
fi

/usr/bin/supervisord

db.getSiblingDB("unifi").createUser({user: "unifi", pwd: "unifi", roles: [{role: "dbOwner", db: "unifi"}]});
db.getSiblingDB("unifi_stat").createUser({user: "unifi", pwd: "unifi", roles: [{role: "dbOwner", db: "unifi_stat"}]});

use mydb;
db.createUser(
   {
     user: "user_secondary_1",
     pwd: "password",
     roles: [ "readWrite" ]
   }
);
quit();
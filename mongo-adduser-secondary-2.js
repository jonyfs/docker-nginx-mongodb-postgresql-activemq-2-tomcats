use mydb;
db.createUser(
   {
     user: "user_secondary_2",
     pwd: "password",
     roles: [ "readWrite" ]
   }
);
quit();
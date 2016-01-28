use mydb;
db.createUser(
   {
     user: "user_primary",
     pwd: "password",
     roles: [ "readWrite" ]
   }
);
quit();
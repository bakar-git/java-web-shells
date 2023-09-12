# java-web-shells

## simple-webshell.jsp

It allows you to execute commands on server 

### USAGE

http://target.com/simple-webshell.jsp?pwd=z&i=cmd

replace cmd parameter with command you want to execute like ls, id, whomai etc

## oracle-webshell.jsp

It allows you to connect with oracle database using connection string, username and password. It allows you to execute any SQL query on database. This also gives output if sql query in a proper tabular format.

### USAGE

http://target.com/oracle-webshell.jsp?u=connection-string&n=user-name&p=password&q=SQL-query

u : Connection String : jdbc:oracle:thin:@172.23.1.88:1521:sid

n : User Name : root

p : Password : root

s : SQL query : SELECT * FROM all_tables -> This will give all tables of database

replace u, n, p and s according toyour need

### LEGAL NOTICE

For educational purposes only: The developer explicitly disclaims any responsibility for misuse. It is imperative to exclusively target servers for which you possess legitimate authorization

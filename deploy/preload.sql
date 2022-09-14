CREATE TABLE accounts (
   ID serial PRIMARY KEY,
   name VARCHAR (255) NOT NULL,
   description VARCHAR (255),
   balance numeric(15,6)
);

INSERT INTO accounts (name, description, balance)
VALUES
 ('Tom', 'Main account',2999.90),
 ('Ben', 'Share account',10030.10),
 ('Jane', 'Crypto account',680.00),
 ('Laura', 'Business account',15202.00);


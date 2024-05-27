-- !preview conn=con_titanic

-- Table for data on tickets used to board the Titanic
DROP TABLE IF EXISTS tickets CASCADE;
CREATE TABLE tickets (
    ticket VARCHAR(255) PRIMARY KEY,
    price VARCHAR(255)
);
COPY tickets
FROM 'C:\Users\eugin\Documents\GitHub\titanic-for-data-eng-and-vis\titanic\tickets.csv'
CSV HEADER;

-- Table for lifeboats on the Titanic
DROP TABLE IF EXISTS lifeboats CASCADE;
CREATE TABLE lifeboats (
    lifeboat CHAR(2) PRIMARY KEY,
    boat_name VARCHAR(255),
    boat_info TEXT
);
COPY lifeboats
FROM 'C:\Users\eugin\Documents\GitHub\titanic-for-data-eng-and-vis\titanic\lifeboats.csv'
CSV HEADER;

-- Table for data on individuals aboard the Titanic
DROP TABLE IF EXISTS people CASCADE;
CREATE TABLE people (
    id SERIAL PRIMARY KEY,
    fam_name VARCHAR(255),
    given_name VARCHAR(255),
    age INT,
    class CHAR(4),
    sex VARCHAR(7),
    survived BOOL,
    ticket VARCHAR(255),
    embarkation_port VARCHAR(255),
    profession VARCHAR(255),
    job_on_board VARCHAR(255),
    lifeboat CHAR(2),
    certain_on_lifeboat BOOL,
    recovered_body INT
);
COPY people
FROM 'C:\Users\eugin\Documents\GitHub\titanic-for-data-eng-and-vis\titanic\people.csv'
CSV HEADER;

-- Add foreign-key constraints
ALTER TABLE people
ADD FOREIGN KEY (ticket) REFERENCES tickets,
ADD FOREIGN KEY (lifeboat) REFERENCES lifeboats;




    

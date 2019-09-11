SET datestyle='MDY'; 

/* Create the full set of Classic Models Tables */

CREATE TABLE sample_customers (
  customerNumber         INTEGER             NOT NULL,
  customerName           VARCHAR(50)         NOT NULL,
  contactLastName        VARCHAR(50)         NOT NULL,
  contactFirstName       VARCHAR(50)         NOT NULL,
  phone                  VARCHAR(50)         NOT NULL,
  addressLine1           VARCHAR(50)         NOT NULL,
  addressLine2           VARCHAR(50),
  city                   VARCHAR(50)         NOT NULL,
  state                  VARCHAR(50),
  postalCode             VARCHAR(15),
  country                VARCHAR(50)         NOT NULL,
  salesRepEmployeeNumber INTEGER,
  creditLimit            DOUBLE PRECISION,
  PRIMARY KEY (customerNumber)
);

CREATE TABLE sample_employees (
  employeeNumber         INTEGER             NOT NULL,
  lastName               VARCHAR(50)         NOT NULL,
  firstName              VARCHAR(50)         NOT NULL,
  extension              VARCHAR(10)         NOT NULL,
  email                  VARCHAR(100)        NOT NULL,
  officeCode             VARCHAR(20)         NOT NULL,
  reportsTo              INTEGER,
  jobTitle               VARCHAR(50)         NOT NULL,
  PRIMARY KEY (employeeNumber)
);

CREATE TABLE sample_offices (
  officeCode             VARCHAR(50)         NOT NULL,
  city                   VARCHAR(50)         NOT NULL,
  phone                  VARCHAR(50)         NOT NULL,
  addressLine1           VARCHAR(50)         NOT NULL,
  addressLine2           VARCHAR(50),
  state                  VARCHAR(50),
  country                VARCHAR(50)         NOT NULL,
  postalCode             VARCHAR(10)         NOT NULL,
  territory              VARCHAR(10)         NOT NULL,
  PRIMARY KEY (officeCode)
);

CREATE TABLE sample_orderDetails (
  orderNumber            INTEGER             NOT NULL,
  productCode            VARCHAR(50)         NOT NULL,
  quantityOrdered        INTEGER             NOT NULL,
  priceEach              DOUBLE PRECISION    NOT NULL,
  orderLineNumber        SMALLINT            NOT NULL,
  PRIMARY KEY (orderNumber, productCode)
);

CREATE TABLE sample_orders (
  orderNumber            INTEGER             NOT NULL,
  orderDate              TIMESTAMP           NOT NULL,
  requiredDate           TIMESTAMP           NOT NULL,
  shippedDate            TIMESTAMP,
  status                 VARCHAR(15)         NOT NULL,
  comments               TEXT,
  customerNumber         INTEGER             NOT NULL,
  PRIMARY KEY (orderNumber)
);

CREATE TABLE sample_payments (
  customerNumber         INTEGER             NOT NULL,
  checkNumber            VARCHAR(50)         NOT NULL,
  paymentDate            TIMESTAMP           NOT NULL,
  amount                 DOUBLE PRECISION    NOT NULL,
  PRIMARY KEY (customerNumber, checkNumber)
);

CREATE TABLE sample_products (
  productCode            VARCHAR(50)         NOT NULL,
  productName            VARCHAR(70)         NOT NULL,
  productLine            VARCHAR(50)         NOT NULL,
  productScale           VARCHAR(10)         NOT NULL,
  productVendor          VARCHAR(50)         NOT NULL,
  productDescription     TEXT                NOT NULL,
  quantityInStock        SMALLINT            NOT NULL,
  buyPrice               DOUBLE PRECISION    NOT NULL,
  MSRP                   DOUBLE PRECISION    NOT NULL,
  PRIMARY KEY (productCode)
);

CREATE TABLE sample_wine (
    alcohol              NUMERIC, 
    malic_acid           NUMERIC,  
    ash                  NUMERIC, 
    alcalinity           NUMERIC, 
    magnesium            NUMERIC, 
    total_phenols        NUMERIC, 
    flavanoids           NUMERIC, 
    nonflavanoid_phenols NUMERIC, 
    proanthocyanins      NUMERIC, 
    color_intensity      NUMERIC, 
    hue                  NUMERIC, 
    od280_od315          NUMERIC, 
    proline              NUMERIC, 
    wine                 TEXT
);

CREATE TABLE sample_cars (
    mpg                  DOUBLE PRECISION, 
    cylinders            INTEGER, 
    displacement         DOUBLE PRECISION, 
    horsepower           DOUBLE PRECISION, 
    weight               DOUBLE PRECISION, 
    acceleration         DOUBLE PRECISION, 
    model_year           INTEGER, 
    origin               INTEGER, 
    car_name             VARCHAR(64)
);

COPY sample_customers    FROM '/path/to/PostgreSQL-_PG_MAJOR_VERSION_/sampledata/Customers.csv'    WITH CSV HEADER;
COPY sample_employees    FROM '/path/to/PostgreSQL-_PG_MAJOR_VERSION_/sampledata/Employees.csv'    WITH CSV HEADER;
COPY sample_offices      FROM '/path/to/PostgreSQL-_PG_MAJOR_VERSION_/sampledata/Offices.csv'      WITH CSV HEADER;
COPY sample_orderdetails FROM '/path/to/PostgreSQL-_PG_MAJOR_VERSION_/sampledata/OrderDetails.csv' WITH CSV HEADER;
COPY sample_orders       FROM '/path/to/PostgreSQL-_PG_MAJOR_VERSION_/sampledata/Orders.csv'       WITH CSV HEADER;
COPY sample_payments     FROM '/path/to/PostgreSQL-_PG_MAJOR_VERSION_/sampledata/Payments.csv'     WITH CSV HEADER;
COPY sample_products     FROM '/path/to/PostgreSQL-_PG_MAJOR_VERSION_/sampledata/Products.csv'     WITH CSV HEADER;
COPY sample_wine         FROM '/path/to/PostgreSQL-_PG_MAJOR_VERSION_/sampledata/Wine.csv'         WITH CSV HEADER;
COPY sample_cars         FROM '/path/to/PostgreSQL-_PG_MAJOR_VERSION_/sampledata/Cars.csv'         WITH CSV HEADER;

CREATE EXTENSION tsm_system_time;
CREATE EXTENSION quantile; 

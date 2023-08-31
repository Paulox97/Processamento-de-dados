DROP TABLE IF EXISTS dbo.customer;
CREATE TABLE dbo.customer (
    customer_id integer IDENTITY NOT NULL PRIMARY KEY,
    store_id smallint NOT NULL,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    email character varying(50),
    address_id smallint NOT NULL,
    activebool bit DEFAULT 1 NOT NULL,
    create_date date DEFAULT GETDATE() NOT NULL,
    last_update datetime2 DEFAULT GETDATE(),
    active integer
);

DROP TABLE IF EXISTS dbo.actor;
CREATE TABLE dbo.actor (
    actor_id integer IDENTITY NOT NULL PRIMARY KEY,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    last_update datetime2 DEFAULT GETDATE() NOT NULL
);

DROP TABLE IF EXISTS dbo.category;
CREATE TABLE dbo.category (
    category_id integer IDENTITY NOT NULL PRIMARY KEY,
    name character varying(25) NOT NULL,
    last_update datetime2 DEFAULT GETDATE() NOT NULL
);

DROP TABLE IF EXISTS dbo.film;
CREATE TABLE dbo.film (
    film_id integer IDENTITY NOT NULL PRIMARY KEY,
    title character varying(255) NOT NULL,
    description text,
    release_year integer CHECK ((release_year >= 1901) AND (release_year <= 2155)),
    language_id smallint NOT NULL,
    rental_duration smallint DEFAULT 3 NOT NULL,
    rental_rate numeric(4,2) DEFAULT 4.99 NOT NULL,
    length smallint,
    replacement_cost numeric(5,2) DEFAULT 19.99 NOT NULL,
    rating char(5) DEFAULT 'G',
    last_update datetime2 DEFAULT GETDATE() NOT NULL,
    special_features text,
    special_fields text NOT NULL
);

DROP TABLE IF EXISTS dbo.film_actor;
CREATE TABLE dbo.film_actor (
    actor_id smallint NOT NULL,
    film_id smallint NOT NULL,
    last_update datetime2 DEFAULT GETDATE() NOT NULL
);

DROP TABLE IF EXISTS dbo.film_category;
CREATE TABLE dbo.film_category (
    film_id smallint NOT NULL,
    category_id smallint NOT NULL,
    last_update datetime2 DEFAULT GETDATE() NOT NULL
);

DROP TABLE IF EXISTS dbo.address;
CREATE TABLE dbo.address (
    address_id integer IDENTITY NOT NULL PRIMARY KEY,
    address character varying(50) NOT NULL,
    address2 character varying(50),
    district character varying(20) NOT NULL,
    city_id smallint NOT NULL,
    postal_code character varying(10),
    phone character varying(20) NOT NULL,
    last_update datetime2 DEFAULT GETDATE() NOT NULL
);

DROP TABLE IF EXISTS dbo.city;
CREATE TABLE dbo.city (
    city_id integer IDENTITY NOT NULL PRIMARY KEY,
    city character varying(50) NOT NULL,
    country_id smallint NOT NULL,
    last_update datetime2 DEFAULT GETDATE() NOT NULL
);

DROP TABLE IF EXISTS dbo.country;
CREATE TABLE dbo.country (
    country_id integer IDENTITY NOT NULL PRIMARY KEY,
    country character varying(50) NOT NULL,
    last_update datetime2 DEFAULT GETDATE() NOT NULL
);

DROP TABLE IF EXISTS dbo.inventory;
CREATE TABLE dbo.inventory (
    inventory_id integer IDENTITY NOT NULL PRIMARY KEY,
    film_id smallint NOT NULL,
    store_id smallint NOT NULL,
    last_update datetime2 DEFAULT GETDATE() NOT NULL
);

DROP TABLE IF EXISTS dbo.language;
CREATE TABLE dbo.language (
    language_id integer IDENTITY NOT NULL PRIMARY KEY,
    name character(20) NOT NULL,
    last_update datetime2 DEFAULT GETDATE() NOT NULL
);

DROP TABLE IF EXISTS dbo.payment;
CREATE TABLE dbo.payment (
    payment_id integer IDENTITY NOT NULL PRIMARY KEY,
    customer_id smallint NOT NULL,
    staff_id smallint NOT NULL,
    rental_id integer NOT NULL,
    amount numeric(5,2) NOT NULL,
    payment_date datetime2 NOT NULL
);

DROP TABLE IF EXISTS dbo.rental;
CREATE TABLE dbo.rental (
    rental_id integer IDENTITY NOT NULL PRIMARY KEY,
    rental_date datetime2 NOT NULL,
    inventory_id integer NOT NULL,
    customer_id smallint NOT NULL,
    return_date datetime2,
    staff_id smallint NOT NULL,
    last_update datetime2 DEFAULT GETDATE() NOT NULL
);

DROP TABLE IF EXISTS dbo.staff;
CREATE TABLE dbo.staff (
    staff_id integer IDENTITY NOT NULL PRIMARY KEY,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    address_id smallint NOT NULL,
    email character varying(50),
    store_id smallint NOT NULL,
    active bit DEFAULT 1 NOT NULL,
    username character varying(16) NOT NULL,
    password character varying(40),
    last_update datetime2 DEFAULT GETDATE() NOT NULL,
    picture image
);

DROP TABLE IF EXISTS dbo.store;
CREATE TABLE dbo.store (
    store_id integer IDENTITY NOT NULL PRIMARY KEY,
    manager_staff_id smallint NOT NULL,
    address_id smallint NOT NULL,
    last_update datetime2 DEFAULT GETDATE() NOT NULL
);
GO
SET IDENTITY_INSERT dbo.actor ON;
SET IDENTITY_INSERT dbo.address ON;
SET IDENTITY_INSERT dbo.category ON;
SET IDENTITY_INSERT dbo.city ON;
SET IDENTITY_INSERT dbo.country ON;
SET IDENTITY_INSERT dbo.customer ON;
SET IDENTITY_INSERT dbo.film ON;
SET IDENTITY_INSERT dbo.film_actor ON;
SET IDENTITY_INSERT dbo.film_category ON;
SET IDENTITY_INSERT dbo.inventory ON;
SET IDENTITY_INSERT dbo.language ON;
SET IDENTITY_INSERT dbo.payment ON;
SET IDENTITY_INSERT dbo.rental ON;
SET IDENTITY_INSERT dbo.staff ON;
SET IDENTITY_INSERT dbo.store ON;
GO

CREATE TABLE customer(
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    phone VARCHAR(100)
);
CREATE TABLE salesperson(
    salesperson_id SERIAL PRIMARY KEY, 
    first_name VARCHAR (50),
    last_name VARCHAR (50),
    employee_id INTEGER
);
CREATE TABLE mechanic(
    mechanic_id SERIAL PRIMARY KEY,
    first_name VARCHAR (50),
    last_name VARCHAR (50),
    employee_mechanic_id INTEGER
);
CREATE TABLE car(
    car_id SERIAL PRIMARY KEY,
    car_name VARCHAR(50),
    salesperson_id INTEGER NOT NULL,
    customer_id INTEGER NOT NULL,
    mechanic_id INTEGER NOT NULL,
    FOREIGN KEY (salesperson_id) REFERENCES salesperson(salesperson_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (mechanic_id) REFERENCES mechanic(mechanic_id)
);
CREATE TABLE service_ticket(
    service_ticket_id SERIAL PRIMARY KEY,
    vin INTEGER,
    parts VARCHAR(50),
    car_id INTEGER NOT NULL,
    customer_id INTEGER NOT NULL,
    mechanic_id INTEGER NOT NULL,
    FOREIGN KEY (car_id) REFERENCES car(car_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (mechanic_id) REFERENCES mechanic(mechanic_id)
);
CREATE TABLE invoice(
    invoice_id SERIAL PRIMARY KEY,
    invoice_number INTEGER,
    amount NUMERIC(5,2),
    car_id INTEGER NOT NULL,
    salesperson_id INTEGER NOT NULL,
    customer_id INTEGER NOT NULL,
    FOREIGN KEY (car_id) REFERENCES car(car_id),
    FOREIGN KEY (salesperson_id) REFERENCES salesperson(salesperson_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);


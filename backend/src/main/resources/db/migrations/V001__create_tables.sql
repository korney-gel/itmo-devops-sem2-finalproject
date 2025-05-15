-- Создание таблицы product
CREATE TABLE product (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    picture_url VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

-- Создание таблицы orders
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    status VARCHAR(20) NOT NULL,
    date_created DATE NOT NULL
);

-- Создание таблицы order_product (связь многие-ко-многим между orders и product)
CREATE TABLE order_product (
    order_id INTEGER NOT NULL REFERENCES orders(id),
    product_id INTEGER NOT NULL REFERENCES product(id),
    quantity INTEGER NOT NULL,
    PRIMARY KEY (order_id, product_id)
);
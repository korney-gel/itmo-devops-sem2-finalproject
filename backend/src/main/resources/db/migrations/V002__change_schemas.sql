-- Добавляем ограничения
ALTER TABLE product
ADD CONSTRAINT positive_price CHECK (price > 0);

ALTER TABLE order_product
ADD CONSTRAINT positive_quantity CHECK (quantity > 0);

ALTER TABLE orders
ADD CONSTRAINT valid_status CHECK (status IN ('pending', 'shipped', 'cancelled'));

-- Добавляем индексы для оптимизации
CREATE INDEX idx_orders_status ON orders(status);
CREATE INDEX idx_orders_date_created ON orders(date_created);
CREATE INDEX idx_order_product_order_id ON order_product(order_id);
CREATE INDEX idx_order_product_product_id ON order_product(product_id);
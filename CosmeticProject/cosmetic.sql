-- Create table categories if it does not exist
CREATE TABLE IF NOT EXISTS category (
    product_type VARCHAR(255) NOT NULL,
    image_link VARCHAR(255),
    PRIMARY KEY (product_type)
);

-- Create table products if it does not exist
CREATE TABLE IF NOT EXISTS product (
    id INT AUTO_INCREMENT,
    brand VARCHAR(255),
    name VARCHAR(255),
    price DECIMAL(10, 0),
    price_sign VARCHAR(1),
    currency VARCHAR(5),
    image_link VARCHAR(500),
    description TEXT,
    rating DECIMAL(3, 2),
    category VARCHAR(255),
    product_type VARCHAR(255),
    tag_list VARCHAR(500),
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    PRIMARY KEY (id)
);

-- Create table users if it does not exist
CREATE TABLE IF NOT EXISTS user (
    id INT AUTO_INCREMENT,
    role VARCHAR(30) NOT NULL,
    email VARCHAR(255) NOT NULL,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    firstname VARCHAR(255),
    lastname VARCHAR(255),
    phone VARCHAR(20),
    city VARCHAR(255),
    street VARCHAR(255),
    zipcode VARCHAR(20),
    PRIMARY KEY (id)
);

-- Create table account if it does not exist
CREATE TABLE IF NOT EXISTS account (
    user_id INT,
    balance DECIMAL(10, 0) NOT NULL DEFAULT 0,
    PRIMARY KEY (user_id)
);

-- Create table cart if it does not exist
CREATE TABLE IF NOT EXISTS cart (
    id INT AUTO_INCREMENT,
    user_id INT NOT NULL,
    PRIMARY KEY (id)
);

-- Create table cart_items if it does not exist
CREATE TABLE IF NOT EXISTS cart_item (
    id INT AUTO_INCREMENT,
    cart_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (id)
);

-- Create table shop_order if it does not exist
CREATE TABLE IF NOT EXISTS shop_order (
    id INT AUTO_INCREMENT,
    cart_id INT NOT NULL,
    user_id INT NOT NULL,
    note VARCHAR(255),
    date TIMESTAMP,
    method VARCHAR(255),
    total DECIMAL(10, 0) NOT NULL,
    status VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

-- Create table order_detail if it does not exist
CREATE TABLE IF NOT EXISTS order_detail (
    order_id INT NOT NULL,
    date TIMESTAMP NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, date, product_id)
);

-- Add foreign key constraints using ALTER TABLE statements
ALTER TABLE account ADD CONSTRAINT FK_account_user FOREIGN KEY (user_id) REFERENCES user(id);
ALTER TABLE cart ADD CONSTRAINT FK_cart_user FOREIGN KEY (user_id) REFERENCES user(id);
ALTER TABLE cart_item ADD CONSTRAINT FK_cart_item_cart FOREIGN KEY (cart_id) REFERENCES cart(id);
ALTER TABLE cart_item ADD CONSTRAINT FK_cart_item_product FOREIGN KEY (product_id) REFERENCES product(id);
ALTER TABLE shop_order ADD CONSTRAINT FK_shop_order_cart FOREIGN KEY (cart_id) REFERENCES cart(id);
ALTER TABLE shop_order ADD CONSTRAINT FK_shop_order_user FOREIGN KEY (user_id) REFERENCES user(id);
ALTER TABLE order_detail ADD CONSTRAINT FK_orderid FOREIGN KEY (order_id) REFERENCES shop_order(id);
ALTER TABLE order_detail ADD CONSTRAINT FK_productid FOREIGN KEY (product_id) REFERENCES products(id);

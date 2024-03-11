CREATE DATABASE Products;
use Products;
CREATE TABLE product_category (
    category_id INT PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);
CREATE TABLE product (
    product_id INT PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    category_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES product_category(category_id)
);

ALTER TABLE product
ADD CONSTRAINT fk_product_inventory_id
FOREIGN KEY (inventory_id) REFERENCES product_inventory(inventory_id);

ALTER TABLE product
ADD CONSTRAINT fk_product_discount_idproduct_id
FOREIGN KEY (discount_id) REFERENCES discount(discount_id);

use Products;
ALTER TABLE product
ADD SKU VARCHAR(50);

ALTER TABLE product
drop column SKU;

ALTER TABLE product
ADD COLUMN SKU VARCHAR(50) AFTER description;

ALTER TABLE product
ADD COLUMN inventory_id INT AFTER category_id;
ALTER TABLE product
ADD COLUMN price DECIMAL AFTER inventory_id;
ALTER TABLE product
ADD COLUMN discount_id INT AFTER price;



CREATE TABLE product_inventory (
    inventory_id INT PRIMARY KEY,
    SKU VARCHAR(50),
    quantity INT,
    category_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP,
    price DECIMAL(10, 2),
    discount_id INT,
    FOREIGN KEY (category_id) REFERENCES product_category(category_id),  
    FOREIGN KEY (discount_id) REFERENCES discount(discount_id)
);

ALTER TABLE product_inventory
DROP COLUMN category_id,
DROP COLUMN price,
DROP COLUMN discount_id;

ALTER TABLE product_inventory
DROP FOREIGN KEY product_inventory_ibfk_2 ;

ALTER TABLE product_inventory
drop column SKU;
ALTER TABLE product_inventory
DROP FOREIGN KEY product_category;
ALTER TABLE product_inventory
DROP FOREIGN KEY fk_product_inventory_category;
ALTER TABLE product_inventory
drop column category_id;


CREATE TABLE discount (
    discount_id INT PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    discount_percent DECIMAL(5, 2),
    active BOOLEAN,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);
select * from product_category;
show databases;
use Product;
show tables;

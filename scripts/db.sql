DROP DATABASE IF EXISTS foodaneo;
CREATE DATABASE IF NOT EXISTS foodaneo;

USE foodaneo;

DROP TABLE IF EXISTS `restaurant`;
CREATE TABLE IF NOT EXISTS `restaurant`(
    `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `description` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `open_time` TIME NOT NULL,
    `close_time` TIME NOT NULL,
    `path_photography` VARCHAR(100),
    `deleted_at` DATETIME(0) NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

DROP TABLE IF EXISTS `dish`;
CREATE TABLE IF NOT EXISTS `dish`(
    `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `id_restaurant` INT(10) NOT NULL,
    `name` VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `description` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
    `price` DECIMAL(7, 2) NOT NULL,
    `discount_price` DECIMAL(7, 2),
    `path_photography` VARCHAR(100),
    `deleted_at` DATETIME(0) NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

DROP TABLE IF EXISTS `dish_category`;
CREATE TABLE IF NOT EXISTS `dish_category`(
    `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `id_dish` INT(10) NOT NULL,
    `id_category` INT(10) NOT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category`(
    `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `landing_page` TINYINT (1),
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1;

INSERT INTO `restaurant` (id, name, description, open_time, close_time, path_photography) VALUES
    (1, 'Comida Con Conciencia', 'Alguna descripción', '8:00:00', '20:00:00', 'restaurant-pictures/ccc.jpg'),
    (2, 'Lonchería', 'Alguna descripción', '8:00:00', '20:00:00', 'restaurant-pictures/ccc.jpg'),
    (3, 'Cafetería', 'Alguna descripción', '8:00:00', '20:00:00', 'restaurant-pictures/ccc.jpg'),
    (4, 'Tiendita', 'Alguna descripción', '8:00:00', '20:00:00', 'restaurant-pictures/ccc.jpg'),
    (5, 'Estanquillo', 'Alguna descripción', '8:00:00', '20:00:00', 'restaurant-pictures/ccc.jpg');

INSERT INTO `dish` (id, id_restaurant, name, description, price, discount_price, path_photography) VALUES
    (1, 1, 'Plato de desayuno', 'Chilaquiles, huevo y café.', 49.00, NULL, 'plato_de_desayuno.jpg'),
    (2, 2, 'Sandwich de lomo', 'Sandwich de lomo en pan blanco, calentado en la parilla. Acompañado con jitomate, cebolla y lechuga fresca, además de aderezo especial.', 25.00, NULL, 'sandwich_de_lomo.jpg'),
    (3, 3, 'Taza de café', '250 ml. de café negro. Perfecto para iniciar tu mañana.', 15.00, NULL, 'taza_de_cafe.jpg'),
    (4, 4, 'Guiso del día', 'Plato que incluye el guisado del día, un acomapañante y una bebida.', 50.00, NULL, 'guiso_del_dia.jpg'),
    (5, 5, 'Hamburguesa', 'Hamburguesa clásica con carne de res, verdura y aderezos.', 55.00, NULL, 'hamburguesa.jpg'),
    (6, 2, 'Tacos de adobada', 'Orden de 5 taquitos de adobada.', 30.00, NULL, 'tacos_de_adobada.jpg'),
    (7, 3, 'Agua de sabor', 'Vaso de agua de sabor del día.', 12.00, NULL, 'agua_de_sabor.jpg'),
    (8, 2, 'Jugo natural', 'Jugo natural hecho 100% de frutas de temporada.', 18.00, NULL, 'jugo_natural.jpg'),
    (9, 5, 'Papas a la francesa', '250 gramos de papas fritas a la francesa, acompañadas de aderezos.', 20.00, NULL, 'papas_a_la_francesa.jpg'),
    (10, 1, 'Fruta', 'Fruta fresca, preparada con limón, sal y chile al gusto.', 18.00, NULL, 'fruta.jpg'),
    (11, 5, 'Gelatina', 'Vasito de gelatina de mosaico.', 10.00, NULL, 'gelatina.jpg'),
    (12, 5, 'Orden de huevos', 'Huevos revueltos con frijoles.', 35.00, 30.00, 'orden_de_huevos.jpg'),
    (13, 5,'Torta', 'Orden de 3 deliciosos hotcakes con mermelada o leche condensada.', 40.00, 37.50, 'torta.jpg'),
    (14, 3, 'Orden de hotcakes', 'Orden de 3 deliciosos hotcakes con mermelada o leche condensada.', 30.00, 25.00, 'orden_de_hotcakes.jpg'),
    (15, 3, 'Hot dog', 'Hot dog clásico, con jitomate, cebolla y aderezos.', 25.00, 22.50, 'hot_dog.jpg');

INSERT INTO `category` (id, name, landing_page) VALUES
    (1, 'Desayunos para comenzar con todo', 1),
    (2, 'Ofertas del día', 1),
    (3, 'Para despertar', 1),
    (4, 'Desayunos', 0),
    (5, 'Comida', 0),
    (6, 'Bebidas', 0),
    (7, 'Bocadillos', 0);

INSERT INTO `dish_category` (id_dish, id_category) VALUES
    (1, 1),
    (12, 1),
    (2, 1),
    (13, 2),
    (14, 2),
    (15, 2),
    (3, 3),
    (1, 4),
    (12, 4),
    (2, 4),
    (4, 5),
    (5, 5),
    (6, 5),
    (3, 6),
    (7, 6),
    (8, 6),
    (9, 7),
    (10, 7),
    (11, 7);
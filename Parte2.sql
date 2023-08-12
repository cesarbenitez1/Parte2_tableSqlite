--- Parte 2: Creando las tablas en SQLite
--- Dada la base de datos que diseñamos en la anterior etapa, escribe las consultas para crear cada una de las tablas en SQLite.

--- La tabla stock debe tener una restricción de unicidad unique (sucursal_id, producto_id).

CREATE TABLE sucursal (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    dirección TEXT
);

CREATE TABLE categoria (
	id INTEGER PRIMARY KEY,
	nombre TEXT
);

CREATE TABLE producto (
	id INTEGER PRIMARY KEY,
	nombre TEXT, 
	marca TEXT,
	categoria_id INTEGER,
	precio_unitario INTEGER,
	FOREIGN KEY (categoria_id) REFERENCES categoria(id)
);

CREATE TABLE stock (
	id INTEGER PRIMARY KEY,
	sucursal_id INTEGER,
	producto_id INTEGER, 
	cantidad INTEGER,
	UNIQUE (sucursal_id, producto_id)
	FOREIGN KEY (sucursal_id) REFERENCES sucursal(id)
	FOREIGN KEY (producto_id) REFERENCES producto(id)
);
CREATE TABLE cliente(
	id INTEGER PRIMARY KEY,
	nombre TEXT,
	telefono INTEGER
);

CREATE TABLE orden (
	id INTEGER PRIMARY KEY,
	cliente_id INTEGER,
	sucursal_id INTEGER,
	fecha DATE,
	total INTEGER,
	FOREIGN KEY (cliente_id) REFERENCES cliente(id)
	FOREIGN KEY (sucursal_id) REFERENCES sucursal(id)
);

CREATE TABLE item (
	id INTEGER PRIMARY KEY,
	orden_id INTEGER,
	producto_id INTEGER,
	cantidad INTEGER,
	monto_venta INTEGER,
	FOREIGN KEY (orden_id) REFERENCES orden(id)
	FOREIGN KEY (producto_id) REFERENCES producto(id)	
);


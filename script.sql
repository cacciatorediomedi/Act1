-- ===============================
-- RELACIÓN 1 A 1
-- ===============================
CREATE TABLE Vehiculos_1a1 (
  ID INT PRIMARY KEY,
  Patente VARCHAR(10),
  Año INT,
  Modelo VARCHAR(50),
  Marca VARCHAR(50)
);

CREATE TABLE Propietario_1a1 (
  ID INT PRIMARY KEY,
  Nombre VARCHAR(50),
  Apellido VARCHAR(50),
  Dirección VARCHAR(100),
  Ciudad VARCHAR(50),
  ID_vehiculo INT UNIQUE,
  FOREIGN KEY (ID_vehiculo) REFERENCES Vehiculos_1a1(ID)
);

INSERT INTO Vehiculos_1a1 VALUES (1, 'ABC123', 2015, 'Corolla', 'Toyota');
INSERT INTO Propietario_1a1 VALUES (1, 'Juan', 'Pérez', 'Calle 123', 'Buenos Aires', 1);

-- JOIN 1 a 1
SELECT * FROM Vehiculos_1a1
INNER JOIN Propietario_1a1 ON Vehiculos_1a1.ID = Propietario_1a1.ID_vehiculo;



-- ===============================
-- RELACIÓN 1 A N
-- ===============================
CREATE TABLE Propietario_1aN (
  ID INT PRIMARY KEY,
  Nombre VARCHAR(50),
  Apellido VARCHAR(50),
  Dirección VARCHAR(100),
  Ciudad VARCHAR(50)
);

CREATE TABLE Vehiculos_1aN (
  ID INT PRIMARY KEY,
  Patente VARCHAR(10),
  Año INT,
  Modelo VARCHAR(50),
  Marca VARCHAR(50),
  ID_propietario INT,
  FOREIGN KEY (ID_propietario) REFERENCES Propietario_1aN(ID)
);

INSERT INTO Propietario_1aN VALUES (1, 'Juan', 'Pérez', 'Calle 123', 'Buenos Aires');
INSERT INTO Vehiculos_1aN VALUES (1, 'ABC123', 2015, 'Corolla', 'Toyota', 1);

-- JOIN 1 a N
SELECT * FROM Propietario_1aN
INNER JOIN Vehiculos_1aN ON Propietario_1aN.ID = Vehiculos_1aN.ID_propietario;



-- ===============================
-- RELACIÓN N A N
-- ===============================
CREATE TABLE Vehiculos_NaN (
  ID INT PRIMARY KEY,
  Patente VARCHAR(10),
  Año INT,
  Modelo VARCHAR(50),
  Marca VARCHAR(50)
);

CREATE TABLE Propietario_NaN (
  ID INT PRIMARY KEY,
  Nombre VARCHAR(50),
  Apellido VARCHAR(50),
  Dirección VARCHAR(100),
  Ciudad VARCHAR(50)
);

CREATE TABLE Vehiculo_Propietario (
  ID_vehi INT,
  ID_prop INT,
  PRIMARY KEY (ID_vehi, ID_prop),
  FOREIGN KEY (ID_vehi) REFERENCES Vehiculos_NaN(ID),
  FOREIGN KEY (ID_prop) REFERENCES Propietario_NaN(ID)
);

INSERT INTO Vehiculos_NaN VALUES (1, 'ABC123', 2015, 'Corolla', 'Toyota');
INSERT INTO Propietario_NaN VALUES (1, 'Juan', 'Pérez', 'Calle 123', 'Buenos Aires');
INSERT INTO Vehiculo_Propietario VALUES (1, 1);

-- JOIN N a N
SELECT * FROM Vehiculos_NaN
INNER JOIN Vehiculo_Propietario ON Vehiculos_NaN.ID = Vehiculo_Propietario.ID_vehi
INNER JOIN Propietario_NaN ON Vehiculo_Propietario.ID_prop = Propietario_NaN.ID;

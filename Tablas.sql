CREATE TABLE [CLIENTE] (
  [dcto] int,
  [tipoDcto] varchar(3),
  [nombre1] varchar(15),
  [nombre2] varchar(15),
  [apellido1] varchar(15),
  [apellido2] varchar(15),
  [direccion] varchar(30),
  [email] varchar(50),
  [cel] int,
  PRIMARY KEY ([dcto])
);

CREATE TABLE [MECANICO] (
  [dcto] int,
  [tipoDcto] varchar(3),
  [nombre1] varchar(15),
  [nombre2] varchar(15),
  [apellido1] varchar(15),
  [apellido2] varchar(15),
  [direccion] varchar(30),
  [email] varchar(50),
  [cel] int,
  [estado] varchar(10),
  PRIMARY KEY ([dcto])
);

CREATE TABLE [VEHICULO] (
  [matricula] varchar(10),
  [marca] varchar(20),
  [modelo] varchar(20),
  [dctoCliente] int,
  [descripcion] varchar(200),
  PRIMARY KEY ([matricula]),
  CONSTRAINT [FK_VEHICULO.dctoCliente]
    FOREIGN KEY ([dctoCliente])
      REFERENCES [CLIENTE]([dcto])
);

CREATE TABLE [MANTENIMIENTO] (
  [IdMantenimiento] int,
  [matriculaVehiculo] varchar(10),
  [dctoMecanico] int,
  [estado] varchar(10),
  PRIMARY KEY ([IdMantenimiento]),
  CONSTRAINT [FK_MANTENIMIENTO.matriculaVehiculo]
    FOREIGN KEY ([matriculaVehiculo])
      REFERENCES [VEHICULO]([matricula]),
  CONSTRAINT [FK_MANTENIMIENTO.dctoMecanico]
    FOREIGN KEY ([dctoMecanico])
      REFERENCES [MECANICO]([dcto])
);

CREATE TABLE [REPUESTO] (
  [IdRepuesto] int,
  [nombreRepuesto] varchar(50),
  [precio] double,
  PRIMARY KEY ([IdRepuesto])
);

CREATE TABLE [FACTURA] (
  [IdFactura] int,
  [dctoCliente] int,
  [dctoMecanico] int,
  [totalFactura] double,
  [iva] double,
  PRIMARY KEY ([IdFactura]),
  CONSTRAINT [FK_FACTURA.dctoCliente]
    FOREIGN KEY ([dctoCliente])
      REFERENCES [CLIENTE]([dcto]),
  CONSTRAINT [FK_FACTURA.dctoMecanico]
    FOREIGN KEY ([dctoMecanico])
      REFERENCES [MECANICO]([dcto])
);

CREATE TABLE [DETALLE_REPUESTOS] (
  [IdRepuesto] int,
  [IdMantenimiento] int,
  [cantidad] int,
  [descuento] double,
  [total] double,
  PRIMARY KEY ([IdRepuesto], [IdMantenimiento]),
  CONSTRAINT [FK_DETALLE_REPUESTOS.IdRepuesto]
    FOREIGN KEY ([IdRepuesto])
      REFERENCES [REPUESTO]([IdRepuesto]),
  CONSTRAINT [FK_DETALLE_REPUESTOS.IdMantenimiento]
    FOREIGN KEY ([IdMantenimiento])
      REFERENCES [MANTENIMIENTO]([IdMantenimiento])
);

CREATE TABLE [MANTENIMIENTO_FACTURA] (
  [IdMantenimiento] int,
  [IdFactura] int,
  PRIMARY KEY ([IdMantenimiento], [IdFactura]),
  CONSTRAINT [FK_MANTENIMIENTO_FACTURA.IdFactura]
    FOREIGN KEY ([IdFactura])
      REFERENCES [FACTURA]([IdFactura]),
  CONSTRAINT [FK_MANTENIMIENTO_FACTURA.IdMantenimiento]
    FOREIGN KEY ([IdMantenimiento])
      REFERENCES [MANTENIMIENTO]([IdMantenimiento])
);

CREATE TABLE [SERVICIO] (
  [IdServicio] int,
  [servicio] varchar(15),
  [precio] double,
  PRIMARY KEY ([IdServicio])
);

CREATE TABLE [SERVICIO_FACTURA] (
  [IdServicio] int,
  [IdFactura] int,
  PRIMARY KEY ([IdServicio], [IdFactura]),
  CONSTRAINT [FK_SERVICIO_FACTURA.IdServicio]
    FOREIGN KEY ([IdServicio])
      REFERENCES [SERVICIO]([IdServicio]),
  CONSTRAINT [FK_SERVICIO_FACTURA.IdFactura]
    FOREIGN KEY ([IdFactura])
      REFERENCES [FACTURA]([IdFactura])
);



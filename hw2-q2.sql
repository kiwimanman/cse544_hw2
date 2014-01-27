CREATE TABLE InsuranceCo (
  name  TEXT PRIMARY KEY,
  phone TEXT
);

CREATE TABLE Person (
  ssn  INTEGER PRIMARY KEY,
  name TEXT
);

CREATE TABLE  Vehicle (
  licencePlate  TEXT PRIMARY KEY,
  year          INTEGER,
  insured_by    TEXT REFERENCES InsuranceCo(name),
  maxLossDamage INTEGER,
  maxLiability  INTEGER,
  owned_by      INTEGER REFERENCES Person(ssn)
);

CREATE TABLE Driver (
  licenceNo TEXT PRIMARY KEY,
  person_id INTEGER REFERENCES Person(ssn)
);

CREATE TABLE nonProfessionalDriver (
  licenceNo      TEXT PRIMARY KEY REFERENCES Driver(licenceNo)
);

CREATE TABLE ProfessionalDriver (
  licenceNo      TEXT PRIMARY KEY REFERENCES Driver(licenceNo),
  medicalHistroy TEXT
);

CREATE TABLE Car (
  licencePlate TEXT PRIMARY KEY REFERENCES Vehicle(licencePLate),
  make         TEXT
);

CREATE TABLE Truck (
  licencePlate TEXT PRIMARY KEY REFERENCES Vehicle(licencePLate),
  capacity     INTEGER,
  operated_by  TEXT REFERENCES ProfessionalDriver(licenceNo)
);

CREATE TABLE Cars_nonProfessionalDrivers (
  id           INTEGER PRIMARY KEY,
  licencePLate TEXT REFERENCES Car(licencePLate), 
  licenceNo    TEXT REFERENCES nonProfessionalDriver(licenceNo) 
);



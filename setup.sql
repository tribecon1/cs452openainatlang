CREATE TABLE Address (
    ID INTEGER PRIMARY KEY,
    street TEXT,
    unit_suite INTEGER,
    city TEXT,
    stateCode TEXT,
    zipCode TEXT
);

CREATE TABLE Office (
    ID INTEGER PRIMARY KEY,
    addressID INTEGER,
    FOREIGN KEY (addressID) REFERENCES Address(ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE CommissionRate (
    ID INTEGER PRIMARY KEY,
    commissionRate REAL
);

CREATE TABLE Employee (
    ID INTEGER PRIMARY KEY,
    firstName TEXT,
    lastName TEXT,
    homeAddressID INTEGER,
    birthDate TEXT,
    hireDate TEXT,
    baseSalary REAL,
    commissionID INTEGER,
    workType TEXT CHECK(workType IN ('HouseSalesRep', 'ColdCaller', 'OutsideSalesRep')),
    officeID INTEGER,
    FOREIGN KEY (homeAddressID) REFERENCES Address(ID)
        ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (commissionID) REFERENCES CommissionRate(ID)
        ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (officeID) REFERENCES Office(ID)
        ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE ColdCaller (
    ID INTEGER PRIMARY KEY,
    hoursWorked REAL,
    totalCalls INTEGER,
    totalLeads INTEGER,
    FOREIGN KEY (ID) REFERENCES Employee(ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE HouseSalesRep (
    ID INTEGER PRIMARY KEY,
    maxLeadLimit INTEGER,
    FOREIGN KEY (ID) REFERENCES Employee(ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE OutsideSalesRep (
    ID INTEGER PRIMARY KEY,
    FOREIGN KEY (ID) REFERENCES Employee(ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Team (
    ID INTEGER PRIMARY KEY,
    teamName TEXT
);

CREATE TABLE Manager (
    ID INTEGER PRIMARY KEY,
    employeeID INTEGER,
    FOREIGN KEY (ID) REFERENCES Team(ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (employeeID) REFERENCES Employee(ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Lead (
    ID INTEGER PRIMARY KEY,
    FoundByID INTEGER,
    AssignedToID INTEGER,
    ProspectName TEXT,
    ProspectOwner TEXT,
    ProspectAddressID INTEGER,
    ProspectQuoteSheet TEXT,
    FOREIGN KEY (FoundByID) REFERENCES Employee(ID)
        ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (AssignedToID) REFERENCES Employee(ID)
        ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (ProspectAddressID) REFERENCES Address(ID)
        ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE BoundLead (
    ID INTEGER PRIMARY KEY,
    bindAmt REAL,
    bindDate TEXT,
    FOREIGN KEY (ID) REFERENCES Lead(ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE EmployeeWorksAtOffice (
    officeID INTEGER,
    employeeID INTEGER,
    PRIMARY KEY (officeID, employeeID),
    FOREIGN KEY (officeID) REFERENCES Office(ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (employeeID) REFERENCES Employee(ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);
-- Address
INSERT INTO Address VALUES 
(1, '123 Elm St', 101, 'Springfield', 'IL', '62704'),
(2, '456 Oak Ave', NULL, 'Chicago', 'IL', '60616'),
(3, '789 Pine Rd', 202, 'Naperville', 'IL', '60540'),
(4, '321 Maple Ln', NULL, 'Peoria', 'IL', '61614');

-- Office
INSERT INTO Office VALUES 
(1, 1),
(2, 4);
-- Commission Rate
INSERT INTO CommissionRate VALUES 
(1, 0.10),
(2, 0.40),
(3, 1.0);

-- Employees
INSERT INTO Employee VALUES
(1, 'Alice', 'Smith', 1, '1990-01-01', '2020-06-01', 60000, 1, 'HouseSalesRep', 2),
(2, 'Bob', 'Jones', 2, '1985-05-23', '2019-04-15', 55000, 2, 'ColdCaller', 1),
(3, 'Carol', 'Lee', 3, '1992-07-12', '2021-03-11', 50000, 1, 'OutsideSalesRep', 3),
(4, 'David', 'Kim', 3, '1988-09-20', '2022-01-10', 58000, 2, 'HouseSalesRep', 2),
(5, 'Eva', 'Brown', 4, '1995-03-30', '2023-05-18', 48000, 3, 'ColdCaller', 1);


-- Rep Types
INSERT INTO HouseSalesRep VALUES 
(1, 50),
(4, 40);
INSERT INTO ColdCaller VALUES 
(2, 35.5, 120, 20),
(5, 40.0, 150, 30);
INSERT INTO OutsideSalesRep VALUES 
(3);

-- Team and Manager
INSERT INTO Team VALUES 
(1, 'Special Ops Cold Callers'),
(2, 'TIS House Sales Team');
(3, 'TIS Outside Sales Team')
INSERT INTO Manager VALUES 
(1, 5),
(2, 4),
(3, 3);


-- Lead and Bound Lead
INSERT INTO Lead VALUES 
(1, 2, 1, 'John Doe', 'Prospect Corp A', 2, 'Quote A'),
(2, 5, 4, 'Mary Johnson', 'Prospect Corp B', 3, 'Quote B'),
(3, 2, 3, 'Steve White', 'Prospect Corp C', 4, 'Quote C');
INSERT INTO BoundLead VALUES 
(1, 500.00, '2024-10-01'),
(3, 750.00, '2024-11-15');

-- Office assignment
INSERT INTO EmployeeWorksAtOffice VALUES 
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(2, 5);

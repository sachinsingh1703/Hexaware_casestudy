use projectmanagementsystem;

CREATE TABLE Project (
    Id INT PRIMARY KEY IDENTITY(100,1), 
    ProjectName VARCHAR(100) NOT NULL, 
    Description TEXT,                  
    StartDate DATE NOT NULL,          
    Status VARCHAR(10) CHECK (Status IN ('started', 'dev', 'build', 'test', 'deployed'))
);


CREATE TABLE Employee (

    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50) NOT NULL, 
    Designation VARCHAR(50) NOT NULL,
    Gender CHAR(1) CHECK (Gender IN ('M', 'F', 'O')),  
    Salary DECIMAL(10,2) CHECK (Salary > 0), 
    Project_id INT,
    CONSTRAINT FK_Project FOREIGN KEY (Project_id) REFERENCES Project(id) ON DELETE SET NULL
);

CREATE TABLE admins (
  id int primary key identity(2001,1) NOT NULL,
  Name varchar(100) NOT NULL,
  Email varchar(100) NOT NULL,
  password varchar(100) NOT NULL,
  Mobile bigint NOT NULL
  );

CREATE TABLE Task (
    task_id INT PRIMARY KEY IDENTITY(1000,1), 
    task_name VARCHAR(100) NOT NULL,          
    project_id INT,                           
    employee_id INT,                           
    Status VARCHAR(10) CHECK (Status IN ('Assigned', 'Started', 'Completed')), 
    CONSTRAINT FK_projectid FOREIGN KEY (project_id) REFERENCES Project(Id) ON DELETE CASCADE,
    CONSTRAINT FK_Employeeid FOREIGN KEY (employee_id) REFERENCES Employee(id) ON DELETE SET NULL
);



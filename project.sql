--CREATE DATABASE Unidatabase
USE Unidatabase
CREATE TABLE Student(
StudentID varchar(50) PRIMARY KEY not null,
Name varchar(50),
Email varchar(50),
Major varchar(50),
Year date,
GPA float
)
CREATE TABLE Faculty(
FacultyID varchar(50) primary key not null,
Name varchar(50),
Department varchar(50),
Title varchar(50),
Email varchar(50),
Office varchar(50),
ResearchInterests varchar(50)
)
CREATE TABLE Course(
CourseID varchar(50) primary key not null,
CourseName varchar(50),
Description varchar(100),
Credits int,
Prerequisites varchar(50)
)
CREATE TABLE Administrator(
AdministratorID varchar(50) primary key not null,
Username varchar(50),
Password varchar(50),
Name varchar(50),
Email varchar(50),
Role varchar(50),
Permissions varchar(100)
)
CREATE TABLE Department(
DeptID varchar(50) primary key not null,
DeptName varchar(50)
)
CREATE TABLE ResearchLab(
LabID varchar(50) primary key not null,
LabName varchar(50),
ResearchFocus varchar(100)
)
CREATE TABLE Program(
ProgramID varchar(50) primary key not null,
ProgramName varchar(50)
)
CREATE TABLE Admissions_Office(
AOffice_id varchar(50) primary key not null,
ContactInformation varchar(100),
ApplicationDeadlines date,
ApplicationRequirements varchar(100),
ApplicationStatus varchar(100)
)
CREATE TABLE Registrar_Office(
ROffice_id varchar(50) primary key not null,
ContactInformation varchar(100),
CourseRegistrationProcess varchar(100),
TranscriptRequests varchar(100),
GradeProcessing varchar(100)
)
CREATE TABLE Financial_Aid_Office(
FOffice_id varchar(50) primary key not null,
ContactInformation varchar(100),
FinancialAidPrograms varchar(100),
ApplicationProcess varchar(100),
AwardManagement varchar(100)
)
CREATE TABLE Libraries(
Library_id varchar(50) primary key not null,
Location varchar(50),
HoursOfOperation time,
OnlineResources varchar(100),
Catalog varchar(100)
)
CREATE TABLE IT_Department(
IOffice_id varchar(50) primary key not null,
ContactInformation varchar(100),
SupportServices varchar(100),
KnowledgeBase varchar(100)
)
CREATE TABLE Campus_Security(
SOffice_id varchar(50) primary key not null,
ContactInformation varchar(100),
EmergencyProcedures varchar(100),
CrimeReporting varchar(100),
SafetyResources varchar(100)
)
CREATE TABLE Administrator_Admissions (
  AssignmentID varchar(50) primary key not null,
  AdministratorID varchar(50),
  AOfficeID varchar(50),
  Permissions varchar(100),
  foreign key (AdministratorID) references Administrator(AdministratorID),
  foreign key (AOfficeID) references Admissions_Office(AOffice_id)
);
CREATE TABLE Administrator_Registrar(
AssignmentID varchar(50) primary key not null,
AdministratorID varchar(50),
ROfficeID varchar(50),
Permissions varchar(100),
foreign key (AdministratorID) references Administrator(AdministratorID),
foreign key (ROfficeID) references Registrar_Office(ROffice_id)
)
CREATE TABLE Administrator_FinancialAid (
  AssignmentID varchar(50) primary key not null,
  AdministratorID varchar(50),
  FOfficeID varchar(50),
  Permissions varchar(100),
  foreign key (AdministratorID) references Administrator(AdministratorID),
  foreign key (FOfficeID) references Financial_Aid_Office(FOffice_id)
); 
CREATE TABLE Administrator_Libraries (
  AssignmentID varchar(50) primary key not null,
  AdministratorID varchar(50),
  Library_id varchar(50),
  Permissions varchar(100),
  foreign key (AdministratorID) references Administrator(AdministratorID),
  foreign key (Library_id) references Libraries(Library_id)
);
CREATE TABLE Administrator_ITDept (
  AssignmentID varchar(50) primary key not null,
  AdministratorID varchar(50),
  IOfficeID varchar(50),
  Permissions varchar(100),
  foreign key (AdministratorID) references Administrator(AdministratorID),
  foreign key (IOfficeID) references IT_Department(IOffice_id)
);
CREATE TABLE Administrator_Security (
  AssignmentID varchar(50) primary key not null,
  AdministratorID varchar(50),
  SOfficeID varchar(50),
  Permissions varchar(100),
  foreign key (AdministratorID) references Administrator(AdministratorID),
  foreign key (SOfficeID) references Campus_Security(SOffice_id)
);
CREATE TABLE Student_AdmissionOffice (
  AdmissionID varchar(50) primary key not null,
  StudentID varchar(50),
  AOffice_id varchar(50),
  foreign key (StudentID) references Student(StudentID),
  foreign key (AOffice_id) references Admissions_Office(AOffice_id)
);
CREATE TABLE Student_RegistrarOffice (
  RegisterationID varchar(50) primary key not null,
  StudentID varchar(50),
  ROffice_id varchar(50),
  foreign key (StudentID) references Student(StudentID),
  foreign key (ROffice_id) references Registrar_Office(ROffice_id)
);
CREATE TABLE Student_FinancialAidOffice (
  AidID varchar(50) primary key not null,
  StudentID varchar(50),
  FOffice_id varchar(50),
  AidType varchar(100),
  foreign key (StudentID) references Student(StudentID),
  foreign key (FOffice_id) references Financial_Aid_Office(FOffice_id)
);
CREATE TABLE Student_Libraries (
  LibServiceID varchar(50) primary key not null,
  StudentID varchar(50),
  Library_id varchar(50),
  Services varchar(100),
  foreign key (StudentID) references Student(StudentID),
  foreign key (Library_id) references Libraries(Library_id)
);
CREATE TABLE Student_ITDepartment (
  ITServiceID varchar(50) primary key not null,
  StudentID varchar(50),
  IOffice_id varchar(50),
  Services varchar(100),
  foreign key (StudentID) references Student(StudentID),
  foreign key (IOffice_id) references IT_Department(IOffice_id)
);
CREATE TABLE Student_CampusSecurity (
  SecuirityServiceID varchar(50) primary key not null,
  StudentID varchar(50),
  SOffice_id varchar(50),
  Services varchar(100),
  foreign key (StudentID) references Student(StudentID),
  foreign key (SOffice_id) references Campus_Security(SOffice_id)
);
CREATE TABLE CourseEnrollment (
  EnrID varchar(50) primary key not null,
  StudentID varchar(50),
  CourseID varchar(50),
  foreign key (StudentID) references Student(StudentID),
  foreign key (CourseID) references Course(CourseID)
);
CREATE TABLE Department_Program (
  DPID varchar(50) primary key not null,
  DeptID varchar(50),
  ProgramID varchar(50),
  foreign key (DeptID) references Department(DeptID),
  foreign key (ProgramID) references Program(ProgramID)
);
CREATE TABLE Program_Course (
  PCID varchar(50) primary key not null,
  ProgramID varchar(50),
  CourseID varchar(50),
  foreign key (ProgramID) references Program(ProgramID),
  foreign key (CourseID) references Course(CourseID)
);
CREATE TABLE Department_Faculty (
  DFID varchar(50) primary key not null,
  DeptID varchar(50),
  FacultyID varchar(50),
  foreign key (DeptID) references Department(DeptID),
  foreign key (FacultyID) references Faculty(FacultyID)
);
CREATE TABLE Faculty_Course (
  FCID varchar(50) primary key not null,
  FacultyID varchar(50),
  CourseID varchar(50),
  foreign key (FacultyID) references Faculty(FacultyID),
  foreign key (CourseID) references Course(CourseID)
);
CREATE TABLE Course_ResearchLab (
  CRID varchar(50) primary key not null,
  CourseID varchar(50),
  LabID varchar(50),
  foreign key (LabID) references ResearchLab(LabID),
  foreign key (CourseID) references Course(CourseID)
);
1.	GetStudentInfo (studentID)
CREATE OR REPLACE FUNCTION GetStudentInfo (studentID IN VARCHAR2)
RETURN StudentInfo%ROWTYPE IS
  student_record StudentInfo%ROWTYPE;
BEGIN
  SELECT Name, Email, Major INTO student_record FROM Student WHERE StudentID = studentID;
  RETURN student_record;
END GetStudentInfo;
/
2.	UpdateOfficeHours (officeID, newHours)
CREATE OR REPLACE PROCEDURE UpdateOfficeHours (officeID IN VARCHAR2, newHours IN VARCHAR2)
IS
BEGIN
  UPDATE Registrar_Office -- Assuming Registrar's office for example
  SET CourseRegistrationProcess = newHours
  WHERE ROfficeID = officeID;
  DBMS_OUTPUT.PUT_LINE('Office hours updated successfully.');
END UpdateOfficeHours;
3.	 SearchLibraryResources (keyword)
CREATE OR REPLACE FUNCTION SearchLibraryResources (keyword IN VARCHAR2)
RETURN SYS_REFCURSOR IS
  resource_cursor CURSOR IS
    SELECT Title, Author
    FROM LibraryResource r
    WHERE r.Title LIKE '%'|| keyword ||'%'
      OR r.Author LIKE '%'|| keyword ||'%';
  OPEN resource_cursor;
  RETURN resource_cursor;
END SearchLibraryResources;

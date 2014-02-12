#DROP STATEMENTS
DROP TABLE Script;
DROP TABLE Controller;
DROP TABLE View;
DROP TABLE EventHandler;
DROP TABLE NameValuePair;
DROP TABLE Value;
Drop Table Model;
DROP TABLE Desktop;
DROP TABLE Mobile;
DROP TABLE Web;
DROP TABLE App;
DROP TABLE Role;
DROP TABLE RoleType;
DROP TABLE Developer;


#CREATE STATEMENTS
CREATE TABLE Developer(
	DevID int primary key not null
);

CREATE TABLE RoleType (
type varchar(255) primary key not null
);

CREATE TABLE Role(
	type varchar(255),
	DevID int,
	FOREIGN KEY(DevID) references Developer(DevID) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(type) references RoleType(type) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE App(
	AppID varchar(255) primary key not null,
	name varChar(255),
	dateCreated date,
	RoleType varchar(255) not null,
	FOREIGN KEY(RoleType) references Role(type) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Web(/*Subclass of Application */
AppID varchar(255) primary key references App(AppID),
url varChar(255),
price int,
browser varChar(255)
);

CREATE TABLE Mobile(/*Subclass of Application */
AppID varchar(255) primary key references App(AppID),
os varChar(255),
numInstalled int
);	

CREATE TABLE Desktop(/*Subclass of Application */
AppID varchar(255) primary key references App(AppID),
os varChar(255),
price int
);

CREATE TABLE Model(
ModelID varchar(255) primary key not null,
ViewID varchar(255),
AppID varchar(255),
FOREIGN KEY(AppID) references App(AppID) ON UPDATE CASCADE ON DELETE CASCADE 
);

CREATE TABLE Value (
type varchar(20) primary key not null
);

CREATE TABLE NameValuePair (
name varchar(20),
value varchar(20),
type varchar(20),
FOREIGN KEY(type) references Value(type),
id varchar(255) primary key references Model(ModelID)
);

CREATE TABLE EventHandler(
EventID int(10) primary key not null
);

CREATE TABLE View(
ViewID varchar(255) primary key not null,
AppID varchar(255),
EventID int(10),
FOREIGN KEY(EventID) references EventHandler(EventID) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(AppID) references App(AppID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Controller(
ControlID varchar(255) primary key not null,
AppID varchar(255),
ModelID varchar(255),
ViewID varchar(255),
FOREIGN KEY(AppID) references App(AppID) ON UPDATE CASCADE ON DELETE CASCADE 
);

CREATE TABLE Script(
ControlID varchar(255),
ModelID varchar(255),
EventID int(10),
data varchar(255),
FOREIGN KEY(ControlID) references Controller(ControlID) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(ModelID) references Model(ModelID) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(EventID) references EventHandler(EventID) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO RoleType(type) VALUES ('User Experience'), ('Project Manager'), ('Business Analyst'),
('Architect'), ('Database Admin'), ('Backend Developer'), ('Frontend Developer'
);

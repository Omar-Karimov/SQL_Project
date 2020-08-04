Create Database GetBus24DB

Use GetBus24DB

Create Table Customers
(
 Customer_ID int Primary Key Identity(1,1),
 ID_Number VarChar(11) Not Null Unique Check (Len(ID_Number) = 11),
 Name VarChar(30) Not Null,
 Surname VarChar(30) Not Null,
 Gender VarChar(10) Not Null,
 Customer_Address VarChar(200) Not Null,
 Telephone VarChar(11) Not Null Check (Len(Telephone) = 11)
)

Create Table Branches
(
 Branch_ID int Primary Key Identity(1,1),
 Branch_Name VarChar(30) Not Null,
 Branch_Address VarChar(200) Not Null,
 Telephone VarChar(11) Not Null Check (Len(Telephone) = 11)
)

Create Table Personnel
(
 Personnel_ID int Primary Key Identity(1,1),
 Name VarChar(30) Not Null,
 Surname VarChar(30) Not Null,
 Email VarChar(50) Not Null,
 Branch_ID int 
 Constraint FK_Personnel_Branch Foreign Key (Branch_ID) References Branches (Branch_ID)
)

Create Table Log_In
(
 Login_ID int Primary Key Identity(1,1),
 Username VarChar(30) Not Null,
 Login_Password VarChar(30) Not Null,
 Personnel_ID int
 Constraint FK_Login_Personnel Foreign Key (Personnel_ID) References Personnel (Personnel_ID)
)

Create Table Buses
(
 Bus_ID int Primary Key Identity(1,1),
 Brand VarChar(30) Not Null,
 Model VarChar(30) Not Null,
 Seats int
)

Create Table Expeditions
(
 Expedition_ID int Primary Key Identity(1,1),
 Route_Name VarChar(30) Not Null,
 Expedition_Date datetime Default GetDate(),
 Bus_ID int
 Constraint FK_Expedition_Bus Foreign Key (Bus_ID) References Buses (Bus_ID)
)


Create Table Expedition_Detail
(
 Expedition_Detail_ID int Primary Key Identity(1,1),
 Beginning VarChar(30) Not Null,
 Finish VarChar(30) Not Null,
 Price Money,
 Expedition_ID int
 Constraint FK_ExpeditionDT_Expeditions Foreign Key (Expedition_ID) References Expeditions (Expedition_ID)
)

Create Table Reservation
(
 Reservation_ID int Primary Key Identity(1,1),
 Sales_Status int,
 Seat_Number int,
 Reservation_Date datetime, 
 Reservation_Time time,
 Customer_ID int
 Constraint FK_Reservation_Customers Foreign Key (Customer_ID) References Customers (Customer_ID),
 Personnel_ID int
 Constraint FK_Reservation_Personnel Foreign Key (Personnel_ID) References Personnel (Personnel_ID),
 Expedition_Detail_ID int
 Constraint FK_Reservation_ExpeditionDT Foreign Key (Expedition_Detail_ID) References Expedition_Detail (Expedition_Detail_ID)
)
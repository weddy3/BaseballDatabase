CREATE DATABASE baseballDatabase;

Drop table if exists Agents;
Drop table if exists Players;
Drop table if exists Coach;
Drop table if exists Game;
Drop table if exists Team;
Drop table if exists Field;
Drop table if exists Worker;
Drop table if exists Mascot;

CREATE TABLE Agents (
Agent_ID	int(5) NOT NULL,
Players_No	int(3),
Agent_Name  	varchar(24) NOT NULL, 
Player_ID	int(5),

CONSTRAINT Agent_PK
       PRIMARY KEY (Agent_ID),

CONSTRAINT Agent_FK
       PRIMARY KEY (Player_ID)

);

CREATE TABLE Players (
Player_ID	int(5) NOT NULL,
Number   	int(3) NOT NULL, 
Name		varchar(24) NOT NULL,
Age    		int(3) NOT NULL, 
Position      	varchar(2), 
Years_In_League  	int(2) NOT NULL,
Right_Or_Left	char(1),
Home_Nation	varchar(24), 
Team_ID int(5),


CONSTRAINT Player_PK 
       PRIMARY KEY (Player_ID),
		   
CONSTRAINT Playe_FK_FK 
       FOREIGN KEY (Player_ID_ID)
           REFERENCES Agents(Player_ID_ID)		   
);

CREATE TABLE Coach (
Coach_ID   	int(5) NOT NULL, 
Title     		varchar(24) NOT NULL, 
Name      	varchar(24) NOT NULL,
Team_ID 	int(5), 

CONSTRAINT Coach_PK
       PRIMARY KEY (Coach_ID),
        
CONSTRAINT Team_FK
       FOREIGN KEY (Team_ID)
           REFERENCES Players(Team_ID)
);

CREATE TABLE Game (
Game_ID   	int(5) NOT NULL, 
Home_Team   varchar(24) NOT NULL, 
Away_Team    varchar(24) NOT NULL, 
Date		date NOT NULL, 
Temperature	int(3) NOT NULL,
Field_ID	int(5) NOT NULL,


CONSTRAINT Game_PK
       PRIMARY KEY (Game_ID),

CONSTRAINT Field_FK 
       FOREIGN KEY (Field_ID)
           REFERENCES Field(Field_ID)
);

CREATE TABLE Team (
Team_ID	int(5) NOT NULL,
Owner		varchar(24) NOT NULL,
City		varchar(24) NOT NULL,
Year_Created	int(4) NOT NULL,
Record	varchar(8),
Championships_Won		int(2) NOT NULL,
Payroll		int(9),
Field_ID	int(5) NOT NULL,

CONSTRAINT Team_PK 
       PRIMARY KEY (Team_ID),
        
CONSTRAINT Field_FK 
       FOREIGN KEY (Field_ID)
           REFERENCES Field(Field_ID)
);

CREATE TABLE Field (
Field_ID	int(5) NOT NULL,
Sqr_Footage	int(7),
Year_Created	int(4) NOT NULL,
Capacity	int(6),
Name		varchar(24),
Team_ID	int(5) NOT NULL,

CONSTRAINT Field_PK 
       PRIMARY KEY (Field_ID),
        
CONSTRAINT Team_FK 
       FOREIGN KEY (Team_ID)
           REFERENCES Team(Team_ID)
);

CREATE TABLE Worker (
Worker_ID   	int(5) NOT NULL, 
Name    varchar(24) NOT NULL, 
Expertise     	varchar(30) NOT NULL, 
Years_Working	int(3) NOT NULL,
Field_ID 		int(5) NOT NULL, 

CONSTRAINT Worker_PK
       PRIMARY KEY (Worker_ID),
        
CONSTRAINT Field_FK
       FOREIGN KEY (Field_ID)
           REFERENCES Field(Field_ID)
);

CREATE TABLE Mascot (
Mascot_ID   	int(5) NOT NULL, 
Year_Created     int(4) NOT NULL, 
Team_ID      	int(5) NOT NULL, 


CONSTRAINT Mascot_PK
       PRIMARY KEY (Mascot_ID),
        
CONSTRAINT Team_FK
       FOREIGN KEY (Team_ID)
           REFERENCES Team(Team_ID)
);

DROP DATABASE IF EXISTS `IPL_DB` ;
CREATE SCHEMA `IPL_DB`;
USE `IPL_DB` ;
DROP TABLE IF EXISTS `Franchise` ;
CREATE TABLE `Franchise` (
    `Name` varchar(40) NOT NULL,
    `Owner` varchar(40) NOT NULL,
    `Home_Stadium` varchar(40) NOT NULL,
    `Coach` varchar(40),
    PRIMARY KEY (`Name`,`Owner`) 
) ;
LOCK TABLES `Franchise` WRITE;
INSERT INTO `Franchise` VALUES ('DC','PARTH JINDAL','ARUN JAITLEY STADIUM','RICKEY PONTING'),('CSK','N. SRINIVASAN','M. A. CHIDAMBARAM STADIUM','STEPHEN FLEMING'),('MI','MUKESH AMBANI','WANKHEDE STADIUM','MAHELA JAYAWARDENE'),('RCB','ANAND KRIPALU','M. CHINNASWAMY STADIUM','MIKE HESSON') ;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Player` ;
CREATE TABLE `Player` (
    `Player_ID` INTEGER NOT NULL,
    `Franchise_Name` varchar(40) NOT NULL,
    `Franchise_Owner` varchar(40) NOT NULL,
    `Name` varchar(40) NOT NULL,
    `Nationality` varchar(40) NOT NULL,
    `IPL_Debut_Year` varchar(40) NOT NULL,
    `DOB` varchar(40)NOT NULL,
    PRIMARY KEY (`Player_ID`),
    FOREIGN KEY (`Franchise_Name`,`Franchise_Owner`) REFERENCES `Franchise` (`Name`,`Owner`)
) ;
LOCK TABLES `Player` WRITE;
INSERT INTO `Player` VALUES (1,'DC','PARTH JINDAL','SHIKHAR DHAWAN','INDIA','2008','05-12-1985'),(2,'DC','PARTH JINDAL','RISHABH PANT','INDIA','2015','04-10-1997'),(3,'DC','PARTH JINDAL','KAGISO RABADA','SOUTH AFRICA','2017','25-05-1995');
INSERT INTO `Player` VALUES (4,'CSK','N. SRINIVASAN','M. S. DHONI','INDIA','2008','07-07-1981'),(5,'CSK','N. SRINIVASAN','DWAYNE BRAVO','WEST INDIES','2008','07-10-1983'),(6,'CSK','N. SRINIVASAN','RUTHIRAJ GAIKWAD','INDIA','2018','31-01-1997');
INSERT INTO `Player` VALUES (7,'MI','MUKESH AMBANI','ROHIT SHARMA','INDIA','2008','30-04-1987'),(8,'MI','MUKESH AMBANI','JASPRIT BUMRAH','INDIA','2013','06-12-1993'),(9,'MI','MUKESH AMBANI','QUINTON DE KOCK','SOUTH AFRICA','2013','17-12-1992');
INSERT INTO `Player` VALUES (10,'RCB','ANAND KRIPALU','VIRAT KOHLI','INDIA','2008','5-11-1988'),(11,'RCB','ANAND KRIPALU','AB. DE VILLIERS','SOUTH AFRICA','2008','17-02-1984'),(12,'RCB','ANAND KRIPALU','YUZVENDRA CHAHAL','INDIA','2013','23-07-1990') ;
INSERT INTO `Player` VALUES (13,'RCB','ANAND KRIPALU','HARSHAL PATEL','INDIA','2012','23-11-1990') ;
INSERT INTO `Player` VALUES (14,'DC','PARTH JINDAL','AMIT MISHRA','INDIA','2008','24-11-1982') ;
INSERT INTO `Player` VALUES (15,'CSK','N. SRINIVASAN','JADEJA','INDIA','2008','06-12-1988') ;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Player_Date_of_Birth` ;
CREATE TABLE `Player_Date_of_Birth` (
    `DOB` varchar(40)NOT NULL,
    `Age` INTEGER NOT NULL,
    PRIMARY KEY (`DOB`)
) ;
LOCK TABLES `Player_Date_of_Birth` WRITE;
INSERT INTO `Player_Date_of_Birth` VALUES ('05-12-1985',35),('04-10-1997',24),('25-05-1995',26),('07-07-1981',40),('07-10-1983',38),('31-01-1997',24),('30-04-1987',34),('06-12-1993',27),('17-12-1992',28),('5-11-1988',32),('17-02-1984',37),('23-07-1990',31),('23-11-1990',30),('24-11-1982',38),('06-12-1988',32) ;
UNLOCK TABLES;
DROP TABLE IF EXISTS `League_Sponsor` ;
CREATE TABLE `League_Sponsor` (
    `Name` varchar(40) NOT NULL,
    `Sponsorship_type` varchar(40) NOT NULL,
    PRIMARY KEY (`Name`)
) ;
LOCK TABLES `League_Sponsor` WRITE;
INSERT INTO `League_Sponsor` VALUES ('STAR SPORTS','OFFICIAL BROADCASTER'),('DISNEY+HOTSTAR','OFFICIAL DIGITAL STREAMING PARTNER'),('VIVO','TITLE SPONSOR'),('SAFARI','OFFICIAL PARTNERS'),('DREAM11','OFFICIAL PARTNERS'),('CRED','OFFICIAL PARTNERS'),('PAYTM','UMPIRE PARTNER'),('CEAT','OFFICIAL STRATEGIC TIMEOUT PARTNER') ;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Stadium` ;
CREATE TABLE `Stadium` (
    `Name` varchar(40) NOT NULL,
    `Maximum_seating_capacity` INTEGER NOT NULL,
    `Country` varchar(40) NOT NULL,
    `City` varchar(40) NOT NULL,
    PRIMARY KEY (`Name`)
) ;
LOCK TABLES `Stadium` WRITE;
INSERT INTO `Stadium` VALUES ('M. A. CHIDAMBARAM STADIUM',50000,'INDIA','CHENNAI'),('SHARJAH CRICKET STADIUM',16000,'UAE','SHARJAH'),('WANKHEDE STADIUM',33000,'INDIA','MUMBAI'),('ARUN JAITLEY STADIUM',48000,'INDIA','DELHI'),('M. CHINNASWAMY STADIUM',40000,'INDIA','BENGALURU') ;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Matches` ;
CREATE TABLE `Matches` (
    `Stadium_Name` varchar(40) NOT NULL,
    `Date` varchar(40)NOT NULL,
    `Time` varchar(40)NOT NULL,
    `Match_ID` INTEGER NOT NULL,
    `Toss_winner` varchar(40) NOT NULL,
    `Outcome` varchar(40) NOT NULL,
    `Man_of_the_Match` varchar(40) NOT NULL,
    PRIMARY KEY (`Match_ID`),
    FOREIGN KEY (`Stadium_Name`) REFERENCES `Stadium` (`Name`)
) ;
LOCK TABLES `Matches` WRITE;
INSERT INTO `Matches` VALUES ('M. A. CHIDAMBARAM STADIUM','08-04-2021','19:30',1,'RCB','WINNER RCB','HARSHAL PATEL'),('WANKHEDE STADIUM','09-04-2021','19:30',2,'DC','WINNER DC','SHIKHAR DHAWAN'),('M. A. CHIDAMBARAM STADIUM','19-04-2021','19:30',3,'MI','WINNER DC','AMIT MISHRA'),('WANKHEDE STADIUM','24-04-2021','15:30',4,'CSK','WINNER CSK','JADEJA') ;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Contact_Us` ;
CREATE TABLE `Contact_Us` (
    `Facebook` varchar(40) NOT NULL,
    `Instagram` varchar(40) NOT NULL,
    `Twitter` varchar(40) NOT NULL,
    `Door_Number` INTEGER NOT NULL,
    `City` varchar(40) NOT NULL,
    `Country` varchar(40) NOT NULL,
    PRIMARY KEY (`Facebook`)
) ;
LOCK TABLES `Contact_us` WRITE;
INSERT INTO `Contact_Us` VALUES ('https://www.facebook.com/IPL/','https://www.instagram.com/iplt20/','https://twitter.com/IPL',10,'MUMBAI','INDIA') ;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Commentator` ;
CREATE TABLE `Commentator` (
    `Name` varchar(40) NOT NULL,
    `Match_ID` INTEGER NOT NULL,
    `Nationality` varchar(40) NOT NULL,
    `Gender` varchar(40) NOT NULL,
    `Language` varchar(40) NOT NULL,
    `Specialisation` varchar(40) NOT NULL,
    PRIMARY KEY (`Name`,`Match_ID`),
    FOREIGN KEY (`Match_ID`) REFERENCES `Matches` (`Match_ID`)
) ;
LOCK TABLES `Commentator` WRITE;
INSERT INTO `Commentator` VALUES ('HARSHA BHOGLE',1,'INDIA','MALE','ENGLISH','TV PRESENTER'),('KALYAN KRISHNA',1,'INDIA','MALE','TELUGU','EX-CRICKETER'),('RAVI SHASTRI',1,'INDIA','MALE','HINDI','EX-CRICKETER AND INDIA COACH'),('MATHEW HAYDEN',2,'AUSTRALIA','MALE','ENGLISH','EX-CRICKETER'),('SANJANA GANESAN',2,'INDIA','FEMALE','HINDI','TV HOST'),('MSK PRASAD',2,'INDIA','MALE','TELUGU','HEAD OF SELECTION COMMITEE - INDIA'),('HARSHA BHOGLE',3,'INDIA','MALE','ENGLISH','TV PRESENTER'),('AAKASH CHOPRA',3,'INDIA','MALE','HINDI','EX-CRICKETER'),('VENU GOPAL RAO',3,'INDIA','MALE','TELUGU','EX CRICKETER'),('ALAN WILKINS',4,'ENGLAND','MALE','ENGLISH','EX CRICKETER'),('PARTHIV PATEL',4,'INDIA','MALE','HINDI','EX CRICKETER'),('ASHISH REDDY',4,'INDIA','MALE','TELUGU','EX CRICKETER') ;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Franchise_Sponsor` ;
CREATE TABLE `Franchise_Sponsor` (
    `Franchise_Name` varchar(40) NOT NULL,
    `Name` varchar(40) NOT NULL,
    `Sponsorship_Type` varchar(40) NOT NULL,
    `Link` varchar(40) NOT NULL,
    PRIMARY KEY (`Franchise_Name`,`Name`),
    FOREIGN KEY (`Franchise_Name`) REFERENCES `Franchise` (`Name`)
) ;
LOCK TABLES `Franchise_Sponsor` WRITE;
INSERT INTO `Franchise_Sponsor` VALUES ('DC','JSW','PRINCIPAL SPONSORS','https://www.jsw.in/'),('DC','COLGATE','ASSOCIATE SPONSORS','https://www.colgate.com/en-in'),('CSK','INDIA CEMENTS','PRINCIPAL SPONSORS','https://www.indiacements.co.in/'),('CSK','DREAM 11','OFFICIAL PARTNERS','https://www.dream11.com/'),('MI','SAMSUNG','PRINCIPAL SPONSORS','https://www.samsung.com/in/'),('MI','JIO','ASSOCIATE PARTNERS','https://www.jio.com/'),('RCB','MUTHOOT FINCORP','TITLE SPONSOR','https://www.muthootfincorp.com/'),('RCB','PHONEPE','ASSOCIATE PARTNERS','https://www.phonepe.com/') ;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Batsmen` ;
CREATE TABLE `Batsmen` (
    `Player_ID` INTEGER NOT NULL,
    PRIMARY KEY (`Player_ID`)
) ;
LOCK TABLES `Batsmen` WRITE;
INSERT INTO `Batsmen` VALUES (1),(2),(4),(5),(6),(7),(9),(10),(11),(15) ;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Bowler` ;
CREATE TABLE `Bowler` (
    `Player_ID` INTEGER NOT NULL,
    PRIMARY KEY (`Player_ID`)
) ;
LOCK TABLES `Bowler` WRITE;
INSERT INTO `Bowler` VALUES (3),(8),(12),(13),(14) ;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Wicket_Keeper` ;
CREATE TABLE `Wicket_Keeper` (
    `Player_ID` INTEGER NOT NULL,
    PRIMARY KEY (`Player_ID`)
) ;
LOCK TABLES `Wicket_Keeper` WRITE;
INSERT INTO `Wicket_Keeper` VALUES (2),(4),(9),(11);
UNLOCK TABLES;
DROP TABLE IF EXISTS `Plays` ;
CREATE TABLE `Plays` (
    `Franchise_Name` varchar(40) NOT NULL,
    `Franchise_Owner` varchar(40) NOT NULL,
    `Match_ID` int NOT NULL,
    PRIMARY KEY (`Franchise_Name`,`Franchise_Owner`,`Match_ID`),
    FOREIGN KEY (`Franchise_Name`,`Franchise_Owner`) REFERENCES `Franchise` (`Name`,`Owner`),
    FOREIGN KEY (`Match_ID`) REFERENCES `Matches` (`Match_ID`)
) ;
LOCK TABLES `Plays` WRITE;
INSERT INTO `Plays` VALUES ('MI','MUKESH AMBANI',1),('RCB','ANAND KRIPALU',1),('CSK','N. SRINIVASAN',2),('DC','PARTH JINDAL',2),('MI','MUKESH AMBANI',3),('DC','PARTH JINDAL',3),('CSK','N. SRINIVASAN',4),('RCB','ANAND KRIPALU',4) ;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Captains_at_for` ;
CREATE TABLE `Captains_at_for` (
    `Player_ID` INTEGER NOT NULL,
    `Match_ID` INTEGER NOT NULL,
    `Stadium_Name` varchar(40) NOT NULL,
    `Franchise_Name` varchar(40) NOT NULL,
    `Franchise_Owner` varchar(40) NOT NULL,
    PRIMARY KEY (`Player_ID`,`Match_ID`),
    FOREIGN KEY (`Match_ID`) REFERENCES `Matches` (`Match_ID`),
    FOREIGN KEY (`Player_ID`) REFERENCES `Player` (`Player_ID`),
    FOREIGN KEY (`Stadium_Name`) REFERENCES `Stadium` (`Name`),
    FOREIGN KEY (`Franchise_Name`,`Franchise_Owner`) REFERENCES `Franchise` (`Name`,`Owner`)
) ;
LOCK TABLES `Captains_at_for` WRITE;
INSERT INTO `Captains_at_for` VALUES (7,1,'M. A. CHIDAMBARAM STADIUM','MI','MUKESH AMBANI'),(10,1,'M. A. CHIDAMBARAM STADIUM','RCB','ANAND KRIPALU'),(4,2,'WANKHEDE STADIUM','CSK','N. SRINIVASAN'),(2,2,'WANKHEDE STADIUM','DC','PARTH JINDAL'),(7,3,'M. A. CHIDAMBARAM STADIUM','MI','MUKESH AMBANI'),(2,3,'M. A. CHIDAMBARAM STADIUM','DC','PARTH JINDAL'),(10,4,'WANKHEDE STADIUM','RCB','ANAND KRIPALU'),(4,4,'WANKHEDE STADIUM','CSK','N. SRINIVASAN') ;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Match_Umpires` ;
CREATE TABLE `Match_Umpires` (
    `Match_ID` INTEGER NOT NULL,
    `Umpires` varchar(40) NOT NULL,
    PRIMARY KEY (`Match_ID`,`Umpires`),
    FOREIGN KEY (`Match_ID`) REFERENCES `Matches` (`Match_ID`)
) ;
LOCK TABLES `Match_Umpires` WRITE;
INSERT INTO `Match_Umpires` VALUES (1,'NITIN MENON'),(1,'K. ANANTHAPADMANABAN'),(1,'C. SHAMSUDDIN'),(2,'VIRENDER SHARMA'),(2,'ANIL CHAUDHARY'),(2,'S. RAVI'),(3,'CHRIS GAFFANEY'),(3,'C. SHAMSHUDDIN'),(3,'ULHAS GANDHE'),(4,'VIRENDER SHARMA'),(4,'BRUCE OXENFORD'),(4,'ANIL CHAUDHARY') ;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Contact_us_phone_number` ;
CREATE TABLE `Contact_us_phone_number` (
    `Facebook` varchar(40) NOT NULL,
    `Phone_Number` varchar(40) NOT NULL,
    PRIMARY KEY (`Facebook`,`Phone_Number`),
    FOREIGN KEY (`Facebook`) REFERENCES `Contact_Us` (`Facebook`)
) ;
LOCK TABLES `Contact_us_phone_numeber` WRITE;
INSERT INTO `Contact_us_phone_number` VALUES ('https://www.facebook.com/IPL/','+91 22 22800300'),('https://www.facebook.com/IPL/','+91 22 22800354') ;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Batting_Info` ;
CREATE TABLE `Batting_Info` (
    `Player_ID` INTEGER NOT NULL,
    `Match_ID` INTEGER NOT NULL,
    `Number_of_Runs` INTEGER NOT NULL,
    `Number_of_Balls_Played` INTEGER NOT NULL,
    `Out_or_NotOUT` boolean NOT NULL,
    PRIMARY KEY (`Player_ID`,`Match_ID`),
    CONSTRAINT `Batting_Info_ibfk_1` FOREIGN KEY (`Player_ID`) REFERENCES `Player` (`Player_ID`)
) ;
LOCK TABLES `Batting_info` WRITE;
INSERT INTO `Batting_Info` VALUES (7,1,19,15,1),(10,1,33,29,1),(11,1,48,27,1),(1,2,85,54,1),(2,2,15,12,0),(4,2,0,2,1),(6,2,5,8,1),(15,2,26,17,0),(7,3,44,30,1),(9,3,2,4,1),(1,3,45,42,1),(2,3,7,8,1),(10,4,8,7,1),(11,4,4,9,1),(4,4,2,3,0),(5,4,0,0,0),(6,4,33,25,1),(15,4,62,28,0) ;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Bowling_Info` ;
CREATE TABLE `Bowling_Info` (
    `Player_ID` INTEGER NOT NULL,
    `Match_ID` INTEGER NOT NULL,
    `Number_of_Wickets` INTEGER NOT NULL,
    `Number_of_Overs_Bowled` INTEGER NOT NULL,
    `Number_of_Runs_Given` INTEGER NOT NULL,
    PRIMARY KEY (`Player_ID`,`Match_ID`),
    CONSTRAINT `Bowling_Info_ibfk_1` FOREIGN KEY (`Player_ID`) REFERENCES `Player` (`Player_ID`)
) ;
LOCK TABLES `Bowling_Info` WRITE;
INSERT INTO `Bowling_Info` VALUES (8,1,2,4,26),(13,1,5,4,27),(12,1,0,4,41),(14,2,0,3,27),(15,2,0,2,16),(5,2,1,4,28),(14,3,4,4,24),(3,3,1,3,25),(8,3,1,4,32),(12,4,1,3,24),(13,4,3,4,51),(15,4,3,4,13),(5,4,0,2,19) ;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Wicket_Keeping_Info` ;
CREATE TABLE `Wicket_Keeping_Info` (
    `Player_ID` INTEGER NOT NULL,
    `Match_ID` INTEGER NOT NULL,
    `Number_of_Stumpings` INTEGER NOT NULL,
    `Number_of_Catches` INTEGER NOT NULL,
    PRIMARY KEY (`Player_ID`,`Match_ID`),
    CONSTRAINT `Wicket_Keeping_Info_ibfk_1` FOREIGN KEY (`Player_ID`) REFERENCES `Player` (`Player_ID`)
) ;
LOCK TABLES 'Wicker_Keeping_Info' WRITE;
INSERT INTO `Wicket_Keeping_Info` VALUES (11,1,0,1),(2,2,1,1),(4,2,0,2),(2,3,0,3),(9,3,1,0),(11,4,0,1),(4,4,0,1) ;
UNLOCK TABLES;
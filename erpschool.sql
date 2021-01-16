/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.5.5-10.0.17-MariaDB : Database - erpschool
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`erpschool` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `erpschool`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `aid` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `logname` varchar(200) DEFAULT NULL,
  `logpass` varchar(200) DEFAULT NULL,
  `position` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `admin` */

insert  into `admin`(`aid`,`name`,`logname`,`logpass`,`position`,`email`,`phone`) values (1,'Accounting','Accounting','Accounting','Accounting','accounting@gmail.com','123'),(2,'Admin','Admin','Admin','Admin','admin@gmail.com','456'),(3,'Bus','Bus','Bus','Bus','bus@gmail.com','789'),(4,'ClassAdmin','ClassAdmin','ClassAdmin','ClassAdmin','classadmin@gmail.com','369'),(5,'Driver','Driver','Driver','Driver','driver@gmail.com','258'),(6,'ExamAdmin','ExamAdmin','ExamAdmin','ExamAdmin','examadmin@gmail.com','147'),(7,'HostelAdmin','HostelAdmin','HostelAdmin','HostelAdmin','hosteladmin@gmail.com','874'),(8,'LibraryAdmin','LibraryAdmin','LibraryAdmin','LibraryAdmin','libraryadmin@gmail.com','632'),(9,'Principal','Principal','Principal','Principal','principal@gmail.com','951'),(10,'SportAdmin','SportAdmin','SportAdmin','SportAdmin','sportadmin@gmail.com','753'),(12,'Visitor','Visitor','Visitor','Visitor','visitor@gmail.com','214'),(13,'VicePrincipal','VicePrincipal','VicePrincipal','VicePrincipal','viceprincipal@gmail.com','910');

/*Table structure for table `admission` */

DROP TABLE IF EXISTS `admission`;

CREATE TABLE `admission` (
  `adid` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sname` varchar(255) DEFAULT NULL,
  `fathername` varchar(255) DEFAULT NULL,
  `mothername` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `enquiry` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `file1` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`adid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `admission` */

insert  into `admission`(`adid`,`name`,`sname`,`fathername`,`mothername`,`address`,`phone`,`enquiry`,`photo`,`file`,`file1`) values (1,'Kavya','Bhamare','Manish','Bhavna','Pune','8605017848','1st year Admission',NULL,NULL,NULL);

/*Table structure for table `announcement` */

DROP TABLE IF EXISTS `announcement`;

CREATE TABLE `announcement` (
  `annid` int(255) NOT NULL AUTO_INCREMENT,
  `announcement` varchar(400) DEFAULT NULL,
  `dateofann` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`annid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `announcement` */

insert  into `announcement`(`annid`,`announcement`,`dateofann`,`file`) values (1,'Be Cool','3/1/2021',NULL),(2,'sqswq dsfef','8/1/21','Maxgen Techonlogies Pvt.docx'),(3,'join new company','11/1/2021','erpschool.sql');

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `bookid` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `catagery` varchar(200) DEFAULT NULL,
  `standard` varchar(200) DEFAULT NULL,
  `subid` int(200) DEFAULT NULL,
  `author` varchar(200) DEFAULT NULL,
  `isbn` varchar(200) DEFAULT NULL,
  `page` varchar(200) DEFAULT NULL,
  `price` varchar(200) DEFAULT NULL,
  `quantity` varchar(200) DEFAULT NULL,
  `language` varchar(200) DEFAULT NULL,
  `publication` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`bookid`),
  KEY `subid` (`subid`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`subid`) REFERENCES `subject` (`subid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `book` */

insert  into `book`(`bookid`,`name`,`catagery`,`standard`,`subid`,`author`,`isbn`,`page`,`price`,`quantity`,`language`,`publication`) values (1,'math','subject','1',NULL,'abc','15dfb458d','25','50','60','English','Yesh Publication');

/*Table structure for table `bookfine` */

DROP TABLE IF EXISTS `bookfine`;

CREATE TABLE `bookfine` (
  `bfid` int(255) NOT NULL AUTO_INCREMENT,
  `sid` int(255) DEFAULT NULL,
  `due` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bfid`),
  KEY `sid` (`sid`),
  CONSTRAINT `bookfine_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bookfine` */

/*Table structure for table `bookissuestudent` */

DROP TABLE IF EXISTS `bookissuestudent`;

CREATE TABLE `bookissuestudent` (
  `bisid` int(255) NOT NULL AUTO_INCREMENT,
  `bookid` int(255) DEFAULT NULL,
  `sid` int(255) DEFAULT NULL,
  `issuedate` varchar(200) DEFAULT NULL,
  `returndate` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`bisid`),
  KEY `bookid` (`bookid`),
  KEY `sid` (`sid`),
  CONSTRAINT `bookissuestudent_ibfk_1` FOREIGN KEY (`bookid`) REFERENCES `book` (`bookid`),
  CONSTRAINT `bookissuestudent_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bookissuestudent` */

/*Table structure for table `bookissueteacher` */

DROP TABLE IF EXISTS `bookissueteacher`;

CREATE TABLE `bookissueteacher` (
  `bitid` int(255) NOT NULL AUTO_INCREMENT,
  `bookid` int(255) DEFAULT NULL,
  `tid` int(255) DEFAULT NULL,
  `issuedate` varchar(200) DEFAULT NULL,
  `returndate` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`bitid`),
  KEY `bookid` (`bookid`),
  KEY `tid` (`tid`),
  CONSTRAINT `bookissueteacher_ibfk_1` FOREIGN KEY (`bookid`) REFERENCES `book` (`bookid`),
  CONSTRAINT `bookissueteacher_ibfk_2` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bookissueteacher` */

/*Table structure for table `bus` */

DROP TABLE IF EXISTS `bus`;

CREATE TABLE `bus` (
  `busid` int(255) NOT NULL AUTO_INCREMENT,
  `busno` varchar(200) DEFAULT NULL,
  `dateofrepair` varchar(200) DEFAULT NULL,
  `capacity` varchar(200) DEFAULT NULL,
  `routeid` int(255) DEFAULT NULL,
  `did` int(255) DEFAULT NULL,
  PRIMARY KEY (`busid`),
  KEY `did` (`did`),
  KEY `routeid` (`routeid`),
  CONSTRAINT `bus_ibfk_1` FOREIGN KEY (`did`) REFERENCES `driver` (`did`),
  CONSTRAINT `bus_ibfk_2` FOREIGN KEY (`routeid`) REFERENCES `route` (`routeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bus` */

/*Table structure for table `busstatus` */

DROP TABLE IF EXISTS `busstatus`;

CREATE TABLE `busstatus` (
  `bsid` int(255) NOT NULL AUTO_INCREMENT,
  `busid` int(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bsid`),
  KEY `busid` (`busid`),
  CONSTRAINT `busstatus_ibfk_1` FOREIGN KEY (`busid`) REFERENCES `bus` (`busid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `busstatus` */

/*Table structure for table `busstudent` */

DROP TABLE IF EXISTS `busstudent`;

CREATE TABLE `busstudent` (
  `bsid` int(255) NOT NULL AUTO_INCREMENT,
  `busid` int(255) DEFAULT NULL,
  `sid` int(255) DEFAULT NULL,
  `stopname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bsid`),
  KEY `busid` (`busid`),
  KEY `sid` (`sid`),
  CONSTRAINT `busstudent_ibfk_1` FOREIGN KEY (`busid`) REFERENCES `bus` (`busid`),
  CONSTRAINT `busstudent_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `busstudent` */

/*Table structure for table `candidate` */

DROP TABLE IF EXISTS `candidate`;

CREATE TABLE `candidate` (
  `cid` int(255) NOT NULL AUTO_INCREMENT,
  `sid` int(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `tsid` int(255) DEFAULT NULL,
  `standard` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `sid` (`sid`),
  KEY `tsid` (`tsid`),
  CONSTRAINT `candidate_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`),
  CONSTRAINT `candidate_ibfk_2` FOREIGN KEY (`tsid`) REFERENCES `testseries` (`tsid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `candidate` */

/*Table structure for table `candidateans` */

DROP TABLE IF EXISTS `candidateans`;

CREATE TABLE `candidateans` (
  `caid` int(255) NOT NULL AUTO_INCREMENT,
  `cid` int(255) DEFAULT NULL,
  `questionno` varchar(255) DEFAULT NULL,
  `ans` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`caid`),
  KEY `cid` (`cid`),
  CONSTRAINT `candidateans_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `candidate` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `candidateans` */

/*Table structure for table `career` */

DROP TABLE IF EXISTS `career`;

CREATE TABLE `career` (
  `careerid` int(255) NOT NULL AUTO_INCREMENT,
  `post` varchar(255) DEFAULT NULL,
  `discriptions` varchar(500) DEFAULT NULL,
  `package` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`careerid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `career` */

/*Table structure for table `classs` */

DROP TABLE IF EXISTS `classs`;

CREATE TABLE `classs` (
  `classid` int(255) NOT NULL AUTO_INCREMENT,
  `classno` varchar(255) DEFAULT NULL,
  `standard` varchar(255) DEFAULT NULL,
  `division` varchar(255) DEFAULT NULL,
  `starttime` varchar(255) DEFAULT NULL,
  `endtime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`classid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `classs` */

/*Table structure for table `classsmart` */

DROP TABLE IF EXISTS `classsmart`;

CREATE TABLE `classsmart` (
  `scid` int(255) NOT NULL AUTO_INCREMENT,
  `classno` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `hours` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `tid` int(255) DEFAULT NULL,
  `capacity` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`scid`),
  KEY `tid` (`tid`),
  CONSTRAINT `classsmart_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `classsmart` */

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `commentid` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`commentid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `comment` */

/*Table structure for table `driver` */

DROP TABLE IF EXISTS `driver`;

CREATE TABLE `driver` (
  `did` int(255) NOT NULL AUTO_INCREMENT,
  `dname` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `aadhar` varchar(200) DEFAULT NULL,
  `panno` varchar(200) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `position` varchar(200) DEFAULT NULL,
  `gender` varchar(200) DEFAULT NULL,
  `age` varchar(200) DEFAULT NULL,
  `licenceno` varchar(200) DEFAULT NULL,
  `logname` varchar(200) DEFAULT NULL,
  `logpass` varchar(200) DEFAULT NULL,
  `licence` varchar(200) DEFAULT NULL,
  `salary` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `driver` */

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `eid` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `salary` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `joindate` varchar(255) DEFAULT NULL,
  `logname` varchar(255) DEFAULT NULL,
  `logpass` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `aadhar` varchar(255) DEFAULT NULL,
  `pan` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `employee` */

insert  into `employee`(`eid`,`name`,`position`,`phone`,`address`,`salary`,`gender`,`age`,`joindate`,`logname`,`logpass`,`photo`,`aadhar`,`pan`,`dob`) values (1,'d','teacher','666d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `employeeattendance` */

DROP TABLE IF EXISTS `employeeattendance`;

CREATE TABLE `employeeattendance` (
  `eaid` int(255) NOT NULL AUTO_INCREMENT,
  `eid` int(255) DEFAULT NULL,
  `totalabsentdays` varchar(255) DEFAULT NULL,
  `months` varchar(255) DEFAULT NULL,
  `halfdays` varchar(255) DEFAULT NULL,
  `fulldays` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`eaid`),
  KEY `eid` (`eid`),
  CONSTRAINT `employeeattendance_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `employeeattendance` */

/*Table structure for table `exampaper` */

DROP TABLE IF EXISTS `exampaper`;

CREATE TABLE `exampaper` (
  `eid` int(255) NOT NULL AUTO_INCREMENT,
  `std` varchar(255) DEFAULT NULL,
  `questionno` varchar(255) DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `ch1` varchar(255) DEFAULT NULL,
  `ch2` varchar(255) DEFAULT NULL,
  `ch3` varchar(255) DEFAULT NULL,
  `ch4` varchar(255) DEFAULT NULL,
  `ch5` varchar(255) DEFAULT NULL,
  `ans` varchar(255) DEFAULT NULL,
  `tsid` int(255) DEFAULT NULL,
  `questionmarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`eid`),
  KEY `tsid` (`tsid`),
  CONSTRAINT `exampaper_ibfk_1` FOREIGN KEY (`tsid`) REFERENCES `testseries` (`tsid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `exampaper` */

/*Table structure for table `examtimetable` */

DROP TABLE IF EXISTS `examtimetable`;

CREATE TABLE `examtimetable` (
  `ettid` int(255) NOT NULL AUTO_INCREMENT,
  `standard` varchar(255) DEFAULT NULL,
  `division` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ettid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `examtimetable` */

/*Table structure for table `fee` */

DROP TABLE IF EXISTS `fee`;

CREATE TABLE `fee` (
  `fsid` int(255) NOT NULL AUTO_INCREMENT,
  `year` varchar(200) DEFAULT NULL,
  `standard` varchar(255) DEFAULT NULL,
  `tuitionfees` varchar(255) DEFAULT NULL,
  `transport` varchar(255) DEFAULT NULL,
  `hostel` varchar(255) DEFAULT NULL,
  `library` varchar(255) DEFAULT NULL,
  `sport` varchar(255) DEFAULT NULL,
  `exam` varchar(255) DEFAULT NULL,
  `other` varchar(255) DEFAULT NULL,
  `totalfee` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`fsid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `fee` */

insert  into `fee`(`fsid`,`year`,`standard`,`tuitionfees`,`transport`,`hostel`,`library`,`sport`,`exam`,`other`,`totalfee`) values (1,'2021','1','10000','5000','3000','500','500','350','5550','24900');

/*Table structure for table `homework` */

DROP TABLE IF EXISTS `homework`;

CREATE TABLE `homework` (
  `homeid` int(255) NOT NULL AUTO_INCREMENT,
  `standard` varchar(200) DEFAULT NULL,
  `division` varchar(200) DEFAULT NULL,
  `doc` varchar(200) DEFAULT NULL,
  `subid` int(255) DEFAULT NULL,
  PRIMARY KEY (`homeid`),
  KEY `subid` (`subid`),
  CONSTRAINT `homework_ibfk_1` FOREIGN KEY (`subid`) REFERENCES `subject` (`subid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `homework` */

/*Table structure for table `homeworkcomplete` */

DROP TABLE IF EXISTS `homeworkcomplete`;

CREATE TABLE `homeworkcomplete` (
  `hcid` int(255) NOT NULL AUTO_INCREMENT,
  `homeid` int(255) DEFAULT NULL,
  `sid` int(255) DEFAULT NULL,
  `file` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`hcid`),
  KEY `sid` (`sid`),
  KEY `homeid` (`homeid`),
  CONSTRAINT `homeworkcomplete_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`),
  CONSTRAINT `homeworkcomplete_ibfk_2` FOREIGN KEY (`homeid`) REFERENCES `homework` (`homeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `homeworkcomplete` */

/*Table structure for table `homeworkreport` */

DROP TABLE IF EXISTS `homeworkreport`;

CREATE TABLE `homeworkreport` (
  `hrid` int(255) NOT NULL AUTO_INCREMENT,
  `homeid` int(255) DEFAULT NULL,
  `hcid` int(255) DEFAULT NULL,
  `sid` int(255) DEFAULT NULL,
  `report` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`hrid`),
  KEY `homeid` (`homeid`),
  KEY `hcid` (`hcid`),
  KEY `sid` (`sid`),
  CONSTRAINT `homeworkreport_ibfk_1` FOREIGN KEY (`homeid`) REFERENCES `homework` (`homeid`),
  CONSTRAINT `homeworkreport_ibfk_2` FOREIGN KEY (`hcid`) REFERENCES `homeworkcomplete` (`hcid`),
  CONSTRAINT `homeworkreport_ibfk_3` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `homeworkreport` */

/*Table structure for table `hostel` */

DROP TABLE IF EXISTS `hostel`;

CREATE TABLE `hostel` (
  `hostelid` int(255) NOT NULL AUTO_INCREMENT,
  `type` varchar(200) DEFAULT NULL,
  `wardenname` varchar(200) DEFAULT NULL,
  `wing` varchar(200) DEFAULT NULL,
  `room` varchar(200) DEFAULT NULL,
  `bed` varchar(200) DEFAULT NULL,
  `watertime` varchar(200) DEFAULT NULL,
  `breakfasttime` varchar(200) DEFAULT NULL,
  `lunchtime` varchar(200) DEFAULT NULL,
  `dinnertime` varchar(200) DEFAULT NULL,
  `logname` varchar(200) DEFAULT NULL,
  `logpass` varchar(200) DEFAULT NULL,
  `finalintime` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`hostelid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `hostel` */

/*Table structure for table `leaveemployee` */

DROP TABLE IF EXISTS `leaveemployee`;

CREATE TABLE `leaveemployee` (
  `leaveeid` int(255) NOT NULL AUTO_INCREMENT,
  `eid` int(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`leaveeid`),
  KEY `eid` (`eid`),
  CONSTRAINT `leaveemployee_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `leaveemployee` */

/*Table structure for table `leavestudent` */

DROP TABLE IF EXISTS `leavestudent`;

CREATE TABLE `leavestudent` (
  `leavesid` int(255) NOT NULL AUTO_INCREMENT,
  `sid` int(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`leavesid`),
  KEY `sid` (`sid`),
  CONSTRAINT `leavestudent_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `leavestudent` */

/*Table structure for table `leaveteacher` */

DROP TABLE IF EXISTS `leaveteacher`;

CREATE TABLE `leaveteacher` (
  `leavetid` int(255) NOT NULL AUTO_INCREMENT,
  `tid` int(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`leavetid`),
  KEY `tid` (`tid`),
  CONSTRAINT `leaveteacher_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `leaveteacher` */

/*Table structure for table `lectureattendance` */

DROP TABLE IF EXISTS `lectureattendance`;

CREATE TABLE `lectureattendance` (
  `laid` int(255) NOT NULL AUTO_INCREMENT,
  `dates` varchar(400) DEFAULT NULL,
  `hours` varchar(400) DEFAULT NULL,
  `standard` varchar(255) DEFAULT NULL,
  `division` varchar(255) DEFAULT NULL,
  `subid` int(255) DEFAULT NULL,
  `tid` int(255) DEFAULT NULL,
  `rollnospresents` varchar(500) DEFAULT NULL,
  `rollnoabsents` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`laid`),
  KEY `subid` (`subid`),
  KEY `tid` (`tid`),
  CONSTRAINT `lectureattendance_ibfk_1` FOREIGN KEY (`subid`) REFERENCES `subject` (`subid`),
  CONSTRAINT `lectureattendance_ibfk_2` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `lectureattendance` */

/*Table structure for table `lecturetimetable` */

DROP TABLE IF EXISTS `lecturetimetable`;

CREATE TABLE `lecturetimetable` (
  `ltid` int(255) NOT NULL AUTO_INCREMENT,
  `year` varchar(255) DEFAULT NULL,
  `standard` varchar(255) DEFAULT NULL,
  `division` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ltid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `lecturetimetable` */

/*Table structure for table `offlineexam` */

DROP TABLE IF EXISTS `offlineexam`;

CREATE TABLE `offlineexam` (
  `offexamid` int(255) NOT NULL AUTO_INCREMENT,
  `tsid` int(255) DEFAULT NULL,
  `standard` varchar(255) DEFAULT NULL,
  `division` varchar(255) DEFAULT NULL,
  `subid` int(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `submittime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`offexamid`),
  KEY `tsid` (`tsid`),
  KEY `subid` (`subid`),
  CONSTRAINT `offlineexam_ibfk_1` FOREIGN KEY (`tsid`) REFERENCES `testseries` (`tsid`),
  CONSTRAINT `offlineexam_ibfk_2` FOREIGN KEY (`subid`) REFERENCES `subject` (`subid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `offlineexam` */

/*Table structure for table `offlineexamresult` */

DROP TABLE IF EXISTS `offlineexamresult`;

CREATE TABLE `offlineexamresult` (
  `olerid` int(255) NOT NULL AUTO_INCREMENT,
  `standard` varchar(255) DEFAULT NULL,
  `division` varchar(255) DEFAULT NULL,
  `result_file` varchar(255) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`olerid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `offlineexamresult` */

/*Table structure for table `parent` */

DROP TABLE IF EXISTS `parent`;

CREATE TABLE `parent` (
  `pid` int(255) NOT NULL AUTO_INCREMENT,
  `fathername` varchar(200) DEFAULT NULL,
  `mothername` varchar(200) DEFAULT NULL,
  `fphone` varchar(20) DEFAULT NULL,
  `mphone` varchar(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `occupation` varchar(200) DEFAULT NULL,
  `logname` varchar(200) DEFAULT NULL,
  `logpass` varchar(200) DEFAULT NULL,
  `altphoneno` varchar(200) DEFAULT NULL,
  `fatherphoto` varchar(255) DEFAULT NULL,
  `motherphoto` varchar(255) DEFAULT NULL,
  `accno` varchar(255) DEFAULT NULL,
  `ifsc` varchar(255) DEFAULT NULL,
  `accholdername` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `parent` */

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `pid` int(255) NOT NULL AUTO_INCREMENT,
  `pname` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `product` */

insert  into `product`(`pid`,`pname`,`quantity`,`department`) values (1,'tab','25','class'),(2,'bat','10','sport');

/*Table structure for table `productorder` */

DROP TABLE IF EXISTS `productorder`;

CREATE TABLE `productorder` (
  `poid` int(255) NOT NULL AUTO_INCREMENT,
  `pname` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `dateoforder` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`poid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `productorder` */

/*Table structure for table `productpurchase` */

DROP TABLE IF EXISTS `productpurchase`;

CREATE TABLE `productpurchase` (
  `ppid` int(255) NOT NULL AUTO_INCREMENT,
  `pname` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `dateofpurchase` varchar(255) DEFAULT NULL,
  `billimg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ppid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `productpurchase` */

/*Table structure for table `proxylecture` */

DROP TABLE IF EXISTS `proxylecture`;

CREATE TABLE `proxylecture` (
  `plid` int(255) NOT NULL AUTO_INCREMENT,
  `teachername` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `tid` int(255) DEFAULT NULL,
  PRIMARY KEY (`plid`),
  KEY `tid` (`tid`),
  CONSTRAINT `proxylecture_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `proxylecture` */

/*Table structure for table `reviewstaff` */

DROP TABLE IF EXISTS `reviewstaff`;

CREATE TABLE `reviewstaff` (
  `reviewstaffid` int(255) NOT NULL AUTO_INCREMENT,
  `eid` int(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`reviewstaffid`),
  KEY `eid` (`eid`),
  CONSTRAINT `reviewstaff_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`eid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `reviewstaff` */

insert  into `reviewstaff`(`reviewstaffid`,`eid`,`comment`) values (1,1,'csd'),(2,1,'safdsa');

/*Table structure for table `reviewstudent` */

DROP TABLE IF EXISTS `reviewstudent`;

CREATE TABLE `reviewstudent` (
  `reviewstudid` int(255) NOT NULL AUTO_INCREMENT,
  `sid` int(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`reviewstudid`),
  KEY `sid` (`sid`),
  CONSTRAINT `reviewstudent_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `reviewstudent` */

insert  into `reviewstudent`(`reviewstudid`,`sid`,`comment`) values (1,1,'dsf'),(2,1,'fdsaf'),(3,1,'fdsf'),(4,1,'fdsaf');

/*Table structure for table `route` */

DROP TABLE IF EXISTS `route`;

CREATE TABLE `route` (
  `routeid` int(255) NOT NULL AUTO_INCREMENT,
  `source` varchar(200) DEFAULT NULL,
  `sourcetime` varchar(200) DEFAULT NULL,
  `destination` varchar(200) DEFAULT NULL,
  `destinationtime` varchar(200) DEFAULT NULL,
  `stopno` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`routeid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `route` */

insert  into `route`(`routeid`,`source`,`sourcetime`,`destination`,`destinationtime`,`stopno`) values (1,'Hadapsar','12','school','12:30','5');

/*Table structure for table `salary` */

DROP TABLE IF EXISTS `salary`;

CREATE TABLE `salary` (
  `salid` int(255) NOT NULL AUTO_INCREMENT,
  `employeename` varchar(255) DEFAULT NULL,
  `paid` varchar(255) DEFAULT NULL,
  `unpaid` varchar(255) DEFAULT NULL,
  `total` varchar(255) DEFAULT NULL,
  `month` varchar(255) DEFAULT NULL,
  `monthsalary` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`salid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `salary` */

/*Table structure for table `scholarshipreq` */

DROP TABLE IF EXISTS `scholarshipreq`;

CREATE TABLE `scholarshipreq` (
  `scholarqid` int(255) NOT NULL AUTO_INCREMENT,
  `sid` int(255) DEFAULT NULL,
  `uniqueid` varchar(255) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  `standard` varchar(255) DEFAULT NULL,
  `cast` varchar(255) DEFAULT NULL,
  `castcertificate` varchar(255) DEFAULT NULL,
  `nameofscholarship` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `file1` varchar(255) DEFAULT NULL,
  `file2` varchar(255) DEFAULT NULL,
  `file3` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`scholarqid`),
  KEY `sid` (`sid`),
  CONSTRAINT `scholarshipreq_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `scholarshipreq` */

/*Table structure for table `score` */

DROP TABLE IF EXISTS `score`;

CREATE TABLE `score` (
  `sid` int(255) NOT NULL AUTO_INCREMENT,
  `cid` int(255) DEFAULT NULL,
  `score` varchar(255) DEFAULT NULL,
  `tsid` int(255) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  KEY `caid` (`cid`),
  KEY `tsid` (`tsid`),
  CONSTRAINT `score_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `candidate` (`cid`),
  CONSTRAINT `score_ibfk_2` FOREIGN KEY (`tsid`) REFERENCES `testseries` (`tsid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `score` */

/*Table structure for table `sport` */

DROP TABLE IF EXISTS `sport`;

CREATE TABLE `sport` (
  `sportid` int(255) NOT NULL AUTO_INCREMENT,
  `sportname` varchar(255) DEFAULT NULL,
  `playerscount` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sportid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sport` */

/*Table structure for table `sportequipment` */

DROP TABLE IF EXISTS `sportequipment`;

CREATE TABLE `sportequipment` (
  `seid` int(255) NOT NULL AUTO_INCREMENT,
  `sportid` int(255) DEFAULT NULL,
  `ename` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`seid`),
  KEY `sportid` (`sportid`),
  CONSTRAINT `sportequipment_ibfk_1` FOREIGN KEY (`sportid`) REFERENCES `sport` (`sportid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sportequipment` */

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `sid` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `uniqueid` varchar(200) NOT NULL,
  `logname` varchar(200) DEFAULT NULL,
  `logpass` varchar(200) DEFAULT NULL,
  `standard` varchar(200) DEFAULT NULL,
  `division` varchar(200) DEFAULT NULL,
  `stdrollno` varchar(220) DEFAULT NULL,
  `pid` int(255) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `age` varchar(200) DEFAULT NULL,
  `dob` varchar(200) DEFAULT NULL,
  `gender` varchar(200) DEFAULT NULL,
  `aadhar` varchar(200) DEFAULT NULL,
  `fsid` int(255) DEFAULT NULL,
  `deductionfee` varchar(255) DEFAULT NULL,
  `unpaid` varchar(255) DEFAULT NULL,
  `paid` varchar(255) DEFAULT NULL,
  `fine` varchar(255) DEFAULT NULL,
  `totalfee` varchar(255) DEFAULT NULL,
  `deposit` varchar(255) DEFAULT NULL,
  `birthcertificate` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  UNIQUE KEY `uniqueid` (`uniqueid`),
  KEY `fsid` (`fsid`),
  KEY `pid` (`pid`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`fsid`) REFERENCES `fee` (`fsid`),
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `parent` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `student` */

insert  into `student`(`sid`,`name`,`uniqueid`,`logname`,`logpass`,`standard`,`division`,`stdrollno`,`pid`,`address`,`age`,`dob`,`gender`,`aadhar`,`fsid`,`deductionfee`,`unpaid`,`paid`,`fine`,`totalfee`,`deposit`,`birthcertificate`,`email`) values (1,'a','1','a','a','1','a','1',NULL,'pune',NULL,NULL,NULL,NULL,1,'20000','10000','10000','500','25000','10000',NULL,'gfd@gdds.fg');

/*Table structure for table `studenthostel` */

DROP TABLE IF EXISTS `studenthostel`;

CREATE TABLE `studenthostel` (
  `shid` int(255) NOT NULL AUTO_INCREMENT,
  `sid` int(255) DEFAULT NULL,
  `hostelid` int(255) DEFAULT NULL,
  `bedno` varchar(255) DEFAULT NULL,
  `roomno` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`shid`),
  KEY `sid` (`sid`),
  KEY `hostelid` (`hostelid`),
  CONSTRAINT `studenthostel_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`),
  CONSTRAINT `studenthostel_ibfk_2` FOREIGN KEY (`hostelid`) REFERENCES `hostel` (`hostelid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `studenthostel` */

/*Table structure for table `subject` */

DROP TABLE IF EXISTS `subject`;

CREATE TABLE `subject` (
  `subid` int(255) NOT NULL AUTO_INCREMENT,
  `subname` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`subid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `subject` */

/*Table structure for table `subjectsyllabus` */

DROP TABLE IF EXISTS `subjectsyllabus`;

CREATE TABLE `subjectsyllabus` (
  `ssid` int(11) NOT NULL AUTO_INCREMENT,
  `subid` int(255) DEFAULT NULL,
  `standard` varchar(255) DEFAULT NULL,
  `syllabus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ssid`),
  KEY `subid` (`subid`),
  CONSTRAINT `subjectsyllabus_ibfk_1` FOREIGN KEY (`subid`) REFERENCES `subject` (`subid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `subjectsyllabus` */

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `tid` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `post` varchar(200) DEFAULT NULL,
  `logname` varchar(200) DEFAULT NULL,
  `logpass` varchar(200) DEFAULT NULL,
  `salary` varchar(200) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `aadhar` varchar(255) DEFAULT NULL,
  `pancade` varchar(200) DEFAULT NULL,
  `gender` varchar(200) DEFAULT NULL,
  `age` varchar(3) DEFAULT NULL,
  `DOB` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `joindate` varchar(255) DEFAULT NULL,
  `subjects` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `teacher` */

/*Table structure for table `teacherattendance` */

DROP TABLE IF EXISTS `teacherattendance`;

CREATE TABLE `teacherattendance` (
  `taid` int(255) NOT NULL AUTO_INCREMENT,
  `tid` int(255) DEFAULT NULL,
  `absentdays` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`taid`),
  KEY `tid` (`tid`),
  CONSTRAINT `teacherattendance_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `teacherattendance` */

/*Table structure for table `testseries` */

DROP TABLE IF EXISTS `testseries`;

CREATE TABLE `testseries` (
  `tsid` int(255) NOT NULL AUTO_INCREMENT,
  `tsname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tsid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `testseries` */

/*Table structure for table `tournament` */

DROP TABLE IF EXISTS `tournament`;

CREATE TABLE `tournament` (
  `tournamentid` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sportid` int(255) DEFAULT NULL,
  `startdate` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `noofstudent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tournamentid`),
  KEY `sportid` (`sportid`),
  CONSTRAINT `tournament_ibfk_1` FOREIGN KEY (`sportid`) REFERENCES `sport` (`sportid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tournament` */

/*Table structure for table `videotutorial` */

DROP TABLE IF EXISTS `videotutorial`;

CREATE TABLE `videotutorial` (
  `vid` int(255) NOT NULL AUTO_INCREMENT,
  `tid` int(255) DEFAULT NULL,
  `standard` varchar(255) DEFAULT NULL,
  `subid` int(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `topicname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`vid`),
  KEY `tid` (`tid`),
  KEY `subid` (`subid`),
  CONSTRAINT `videotutorial_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`),
  CONSTRAINT `videotutorial_ibfk_2` FOREIGN KEY (`subid`) REFERENCES `subject` (`subid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `videotutorial` */

/*Table structure for table `visitormeeting` */

DROP TABLE IF EXISTS `visitormeeting`;

CREATE TABLE `visitormeeting` (
  `vmid` int(255) NOT NULL AUTO_INCREMENT,
  `vid` int(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`vmid`),
  KEY `vid` (`vid`),
  CONSTRAINT `visitormeeting_ibfk_1` FOREIGN KEY (`vid`) REFERENCES `visitors` (`vid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `visitormeeting` */

/*Table structure for table `visitors` */

DROP TABLE IF EXISTS `visitors`;

CREATE TABLE `visitors` (
  `vid` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `indate` varchar(255) DEFAULT NULL,
  `intime` varchar(255) DEFAULT NULL,
  `outdate` varchar(255) DEFAULT NULL,
  `outtime` varchar(255) DEFAULT NULL,
  `reason` varchar(400) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `idproof` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`vid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `visitors` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

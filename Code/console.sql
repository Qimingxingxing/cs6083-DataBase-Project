DROP table Tag;
DROP TABLE Rate;
DROP table Pledge;
DROP TABLE Updates;
DROP table Project;


# 1
CREATE TABLE `User` (
  `uid` VARCHAR(45) NOT NULL,
  `uname` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `uphone` VARCHAR(45) NULL,
  `credit_card` VARCHAR(45) NULL,
  `hometown` VARCHAR(45) NULL,
  `interests` VARCHAR(45) NULL,
  PRIMARY KEY (`uid`));

# 2
CREATE TABLE `Project` (
  `pid` INT NOT NULL,
  `uid` VARCHAR(45) NOT NULL,
  `pname` VARCHAR(45) NOT NULL,
  `pdescription` VARCHAR(200) NOT NULL,
  `create_time` DATETIME NOT NULL,
  `min_estimate` INT NOT NULL,
  `max_estimate` INT NOT NULL,
  `close_time` DATETIME NOT NULL,
  `completion_time` DATETIME NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`pid`),
  FOREIGN KEY (`uid`) REFERENCES `User` (`uid`)
  );


# pid,uid,pname,pdescription,create_time,min_estimate,max_estimate,close_time,completion_time,status

# 3
CREATE TABLE `Tag` (
  `pid` INT NOT NULL,
  `ptag` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`pid`, `ptag`),
  FOREIGN KEY (`pid`) REFERENCES `Project` (`pid`));

# 4
CREATE TABLE `Update` (
  `pid` INT NOT NULL,
  `update_time` DATETIME NOT NULL,
  `text` VARCHAR(45) NULL,
  `mp3` VARCHAR(45) NULL,
  `picture` VARCHAR(45) NULL,
  `video` VARCHAR(45) NULL,
  PRIMARY KEY (`pid`, `update_time`),
  FOREIGN KEY (`pid`) REFERENCES `Project` (`pid`));

# 5
CREATE TABLE `Pledge` (
  `uid` VARCHAR(45) NOT NULL,
  `pid` INT NOT NULL,
  `pledge_time` DATETIME NOT NULL,
  `amount` Double NOT NULL,
  `pledge_status`  VARCHAR(20)  NOT NULL,
  PRIMARY KEY (`uid`, `pid`, `pledge_time`),
  FOREIGN KEY (`uid`) REFERENCES `User` (`uid`),
  FOREIGN KEY (`pid`) REFERENCES `Project` (`pid`));

# 6
CREATE TABLE `Rate` (
  `uid` VARCHAR(45) NOT NULL,
  `pid` INT NOT NULL,
  `star` INT NOT NULL,
  PRIMARY KEY (`uid`, `pid`),
  FOREIGN KEY (`uid`) REFERENCES `User` (`uid`),
  FOREIGN KEY (`pid`) REFERENCES `Project` (`pid`));

# 7
CREATE TABLE `Comment` (
  `uid` VARCHAR(45) NOT NULL,
  `pid` INT NOT NULL,
  `ctime` DATETIME NOT NULL,
  `content` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`uid`, `pid`, `ctime`),
  FOREIGN KEY (`uid`) REFERENCES `User` (`uid`),
  FOREIGN KEY (`pid`) REFERENCES `Project` (`pid`));

# 8
CREATE TABLE `Like` (
  `uid` VARCHAR(45) NOT NULL,
  `pid` INT NOT NULL,
  PRIMARY KEY (`uid`, `pid`),
  FOREIGN KEY (`uid`) REFERENCES `User` (`uid`),
  FOREIGN KEY (`pid`) REFERENCES `Project` (`pid`));

# 9
CREATE TABLE `Follow` (
  `uid` VARCHAR(45) NOT NULL,
  `fid` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`uid`, `fid`),
  FOREIGN KEY (`uid`) REFERENCES `User` (`uid`),
  FOREIGN KEY (`fid`) REFERENCES `User` (`uid`));

# 10
CREATE TABLE `Log_information` (
  `uid` VARCHAR(45) NOT NULL,
  `contents` INT NOT NULL,
  PRIMARY KEY (`uid`),
  FOREIGN KEY (`uid`) REFERENCES `User` (`uid`));


INSERT INTO `User` VALUES ('yuxuan@gmail.com', 'yuxuan', '4321qwer', '917-283-4571', '4347 2187 3491 1683', 'tianjin', 'jogging');
INSERT INTO `User` VALUES ('feiyancheng@gmail.com', 'feiyancheng', 'q12w3e', '617-238-4951', '4347 2187 3492 1684', 'tailand', 'tennis');
INSERT INTO `User` VALUES ('hanchong@gmail.com', 'hanchong', '109wer', '817-238-2955', '4347 2187 3493 1685', 'shanghai', 'music');
INSERT INTO `User` VALUES ('epica@nyu.edu', 'epica', '123bcd456', '917-664-4951', '4347 2187 3496 1684', 'ningxia', 'shopping');
INSERT INTO `User` VALUES ('luyanqiang@gmail.com', 'luyanqiang', '109q3wer', '917-238-3155', '4347 2187 2893 1685', 'yanbian', 'football');
INSERT INTO `User` VALUES ('emily@nyu.edu', 'epica', '3ra2rv', '987-664-4951', '4347 2187 3306 1684', 'shanghai', 'shopping');
INSERT INTO `User` VALUES ('yangzhiyong@gmail.com', 'hanchong', 'w342se2', '917-238-3955', '4347 2187 3493 1687', 'tianjin', 'music');
INSERT INTO `User` VALUES ('sode@nyu.edu', 'epica', '3refr4b', '932-664-4951', '4347 2187 3496 3384', 'tokyo', 'shopping');
INSERT INTO `User` VALUES ('xixika@gmail.com', 'xixika', 'xuyimiao', '917-664-3889', '4347 2187 3495 1687', 'taixing', 'table tennis');
INSERT INTO `User` VALUES ('lulu@gmail.com', 'lulu', 'moyixia', '917-668-4951', '4347 2187 3496 1668', 'nantong', 'shopping');
INSERT INTO `User` VALUES ('bob@gmail.com', 'BobInBrooklyn', 'dasd', '917-338-5951', '4347 2187 6666 1688', 'brooklyn', 'football');


INSERT INTO `Project` VALUES ('1', 'xixika@gmail.com', 'Xixika Latin dance class',
                              'Dancer xixika is planing to open a dance studio in new york.',
                              '2017-02-15 09:10:00','3000', '5000', '2017-02-25 09:00:00', '2017-04-10 20:00:00', 'fund_success');

INSERT INTO `Project` VALUES ('2', 'xixika@gmail.com', 'Xixika painting studio',
                              'A famous painter xixika is dreaming of having a studio in new york.',
                              '2017-02-16 10:00:00', '3000', '4000', '2017-03-08 20:00:00', '2017-04-12 20:00:00', 'fund_success');

INSERT INTO `Project` VALUES ('3', 'xixika@gmail.com', 'Xixika flower shop',
                              'Handsome xixika is planing to open a flower shop at local.',
                              '2017-02-10 11:00:00', '500', '800', '2017-03-01 20:00:00', '2017-04-10 20:00:00', 'fund_success');

INSERT INTO `Project` VALUES ('4', 'xixika@gmail.com', 'Xixika Jazz album',
                              'Singer xixika is making a jazz.',
                              '2017-02-16 10:00:00', '3500', '5000', '2017-03-01 20:00:00', '2017-03-20 20:00:00', 'fund_success');


INSERT INTO `Project` VALUES ('5', 'lulu@gmail.com', 'Documentary: Yangtze river',
                              'Director lulu is trying to make a documentary about yangtze river.',
                              '2017-02-17 15:30:10', '2200', '3100', '2017-03-02 20:00:00', '2017-04-09 20:00:00', 'fund_success');

INSERT INTO `Project` VALUES ('6', 'lulu@gmail.com', 'Lulu photograph class',
                              'A famous photographer lulu is dreaming of having a photography class in new york.',
                              '2017-04-01 10:00:00', '3000', '4000', '2017-04-16 20:00:00', '2017-04-30 20:00:00', 'fund_success');

INSERT INTO `Project` VALUES ('7', 'lulu@gmail.com', 'Movie: New 007 series',
                              'Director lulu is planing to make a movie called new 007 series, which has jazz element',
                              '2017-04-15 12:10:10 ', '2000', '3000', '2017-05-01 22:00:00', '2017-05-20 20:00:00', 'fund_processing');

INSERT INTO `Project` VALUES ('8', 'lulu@gmail.com', 'Jazz in memory',
                              'A famous jazz singer lulu is making a jazz album.',
                              '2017-04-16 12:10:00', '3000', '4000', '2017-05-02 20:00:00', '2017-06-01 20:00:00', 'fund_processing');


# pledge 4
INSERT INTO `Pledge` VALUES ('hanchong@gmail.com', '4', '2017-04-22 15:00:00', '2500', 'success');
INSERT INTO `Pledge` VALUES ('feiyancheng@gmail.com', '4', '2017-04-22 15:00:00', '1500', 'success');
INSERT INTO `Pledge` VALUES ('luyanqiang@gmail.com', '4', '2017-04-22 15:00:00', '1000', 'success');

# pledge 1-8 except 4
INSERT INTO `Pledge` VALUES ('hanchong@gmail.com', '1', '2017-02-16 15:00:00', '3000', 'success');
INSERT INTO `Pledge` VALUES ('hanchong@gmail.com', '2', '2017-02-17 15:00:00', '3000', 'success');
INSERT INTO `Pledge` VALUES ('hanchong@gmail.com', '3', '2017-02-12 15:00:00', '500', 'success');
INSERT INTO `Pledge` VALUES ('hanchong@gmail.com', '5', '2017-02-18 15:00:00', '2200', 'success');
INSERT INTO `Pledge` VALUES ('hanchong@gmail.com', '6', '2017-04-02 15:00:00', '3000', 'success');



INSERT INTO `Follow` VALUES ('bob@gmail.com', 'hanchong@gmail.com');
INSERT INTO `Follow` VALUES ('bob@gmail.com', 'luyanqiang@gmail.com');


INSERT INTO `Comment` VALUES ('hanchong@gmail.com','4', '2017-04-01 15:00:00', 'The music is good.');
INSERT INTO `Comment` VALUES ('hanchong@gmail.com','4', '2017-04-01 15:10:00', 'I enjoy it very much.');
INSERT INTO `Comment` VALUES ('luyanqiang@gmail.com','4', '2017-04-02 10:10:00', 'This is amazing!');



INSERT INTO `Rate` VALUES ('hanchong@gmail.com', '1', 5);
INSERT INTO `Rate` VALUES ('hanchong@gmail.com', '2', 5);
INSERT INTO `Rate` VALUES ('hanchong@gmail.com', '3', 5);
INSERT INTO `Rate` VALUES ('hanchong@gmail.com', '4', 5);
INSERT INTO `Rate` VALUES ('hanchong@gmail.com', '5', 5);
INSERT INTO `Rate` VALUES ('hanchong@gmail.com', '6', 5);
INSERT INTO `Rate` VALUES ('feiyancheng@gmail.com', '4', 4);
INSERT INTO `Rate` VALUES ('luyanqiang@gmail.com', '4', 5);


INSERT INTO Updates VALUES ('1', '2017-03-01 15:00:00', 'Thank you all you guys!', '', '', '');
INSERT INTO Updates VALUES ('1', '2017-03-02 15:00:00', 'I am buying essencial goods', '', '' , '');
INSERT INTO Updates VALUES ('1', '2017-03-10 15:00:00', 'We will start the dance class very soon!', '', '' , '');

INSERT INTO Likes VALUES ('hanchong@gmail.com', '1');
INSERT INTO Likes VALUES ('hanchong@gmail.com', '2');
INSERT INTO Likes VALUES ('luyanqiang@gmail.com', '1');
INSERT INTO Likes VALUES ('luyanqiang@gmail.com', '3');


# 1  close time 还没到，捐款达到最大，trigger把project从 fund_processing 改成 fund_success，trigger 把 pledge 从 pending 变成 success
INSERT INTO `Project` VALUES ('9', 'yuxuan@gmail.com', 'Coffee shop', 'Yuxuan is planing to have a coffee shop.',
                              '2017-04-16 12:10:00', '1000', '2000', '2017-05-02 20:00:00', '2017-06-01 20:00:00', 'fund_processing');

UPDATE Project set close_time = '2017-04-21 02:03:30' where pid = '9';

INSERT INTO `Pledge` VALUES ('hanchong@gmail.com', '9', '2017-04-20 15:00:00', '2000', 'pending');


# 2 close time 到了，筹到的钱在最大和最小之间，event把 project从 fund_processing 改成 fund_success，event把 pledge 从 pending 变成 success
INSERT INTO `Project` VALUES ('10', 'yuxuan@gmail.com', 'Book store',
                              'Yuxuan is planing to have a book store.',
                              '2017-04-17 12:00:00', '1000', '2000', '2017-04-21 00:00:00', '2017-05-01 20:00:00', 'fund_processing');

INSERT INTO `Pledge` VALUES ('hanchong@gmail.com', '10', '2017-04-20 15:00:00', '1500', 'pending');


# 3 close time 到了，没有足够的钱，event吧project从fund_processing 改成 fund_failed，event把 pledge 从 pending 变成 fail
INSERT INTO `Project` VALUES ('11', 'yuxuan@gmail.com', 'Dictionary collection',
                              'Yuxuan is planing to have a dictionary collection.',
                              '2017-04-16 12:10:00', '1000', '2000', '2017-04-21 00:00:00', '2017-05-01 20:00:00', 'fund_processing');

INSERT INTO `Pledge` VALUES ('hanchong@gmail.com', '11', '2017-04-20 15:00:00', '100', 'pending');





INSERT INTO `Tag` VALUES ('4', 'jazz');
INSERT INTO `Tag` VALUES ('4', 'music');
INSERT INTO `Tag` VALUES ('4', 'art');
INSERT INTO `Tag` VALUES ('4', 'culture');
INSERT INTO `Tag` VALUES ('8', 'jazz');



# 开启
alter event check_project on completion preserve enable;
# 关闭
alter event check_project on completion preserve disable;

# event
DROP EVENT  check_project;
DROP EVENT  check_charge;
SHOW PROCESSLIST;
SET GLOBAL event_scheduler = 1;
select * from  mysql.event;

# check_project
DELIMITER //
CREATE EVENT check_project
ON SCHEDULE EVERY 5 SECOND STARTS now()
DO BEGIN
	UPDATE Pledge
	  SET pledge_status = 'success' WHERE Pledge.pid = Project.pid AND Project.status = 'fund_success';
  UPDATE Pledge
	  SET pledge_status = 'fail' WHERE Pledge.pid = Project.pid AND Project.status = 'fund_failed';
END //
DELIMITER ;

# check_charge
DELIMITER //
CREATE EVENT check_charge
ON SCHEDULE EVERY 5 SECOND STARTS '2017-04-20 19:59:40'
DO BEGIN
	UPDATE Pledge
	  SET pledge_status = 'success' WHERE Pledge.pid = Project.pid  AND Project.status = 'fund_success';
  UPDATE Pledge
    SET pledge_status   = 'fail' WHERE Pledge.pid = Project.pid AND  Project.status = 'fund_failed';
END //
DELIMITER ;




# 4 trigger & event
DELIMITER $
CREATE TRIGGER check_pledge
BEFORE INSERT ON Pledge
FOR EACH ROW
BEGIN
	UPDATE Project
	SET status = 'fund_success'
	WHERE pid = NEW.pid AND
	(select sum(amount)
     from Pledge
     Where pid = NEW.pid ) + NEW.amount >= (select max_estimate
   from Project  where pid = NEW.pid ) ;
END $



# SELECT * FROM Project WHERE pid=2;
#
# SELECT * FROM User WHERE uid= 'xixika@gmail.com';
#
#
# select ptag from Tag WHERE pid = 4;
#
# select * From Updates WHERE pid = 1 order by update_time DESC;
#
#
#
# # $query2 -> bind_result($pid, $update_time, $text, $mp3, $picture, $video);
#
# SELECT count(*) FROM Likes WHERE pid='1';
#
# SELECT sum(star) as stars, count(*) as nums FROM Rate WHERE pid='1';
#
# SELECT sum(amount) as amount  FROM Pledge WHERE pid='1';
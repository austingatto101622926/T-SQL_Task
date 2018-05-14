/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

IF '$(LoadTestData)' = 'true' BEGIN

DELETE FROM [Log]
DELETE FROM [Account]

INSERT INTO [Account] (AcctNo,Fname,Lname,CreditLimit,Balance) VALUES
(1,'Austin','Gatto',-500,1010),
(2,'Kyle','Jarman',-10,10),
(3,'Behnam','Rasooli',-50,999000)

INSERT INTO [Log] (OrigAcct,LogDateTime,RecAcct,Amount) VALUES
(3,'2018-05-14 07:43:00 PM',1,1000),
(1,'2018-05-14 07:43:00 PM',2,20),
(2,'2018-05-15 07:43:00 PM',1,20),
(2,'2018-04-15 07:43:00 PM',NULL ,-30)

END;
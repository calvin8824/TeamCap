--Use BinaryTextAdventureTest
--Go

Use BinaryTextAdventure
Go

exec DbReset

Select * From PlayerCharacter
Select * From Game
Select * From Scene
Select * From Ending
Select * From Outcome
Select * From EventChoice
Select * From AspNetUsers
Select * FROM AspNetUserRoles
SELECT * FROM AspNetRoles

UPDATE PlayerCharacter
SET PlayerId = '2420320c-b97b-4231-a92b-27a20b350cce'
WHERE CharacterId = 1

INSERT INTO AspNetUsers (Id)
VALUES ('fb06fcce-40d5-4854-ba35-1378b20960af')


INSERT INTO AspNetUserRoles(UserId, RoleId)
VALUES('2420320c-b97b-4231-a92b-27a20b350cce', 2), ('2420320c-b97b-4231-a92b-27a20b350cce', 1)
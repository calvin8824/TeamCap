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

UPDATE PlayerCharacter
SET PlayerId = 'fb06fcce-40d5-4854-ba35-1378b20960af'
WHERE CharacterId = 1
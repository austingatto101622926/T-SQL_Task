CREATE TABLE [dbo].[Log]
(
	[OrigAcct] INT NOT NULL, 
    [LogDateTime] DATETIME NOT NULL, 
    [RecAcct] INT NULL, 
    [Amount] MONEY NOT NULL

	CONSTRAINT [PK_Log] PRIMARY KEY ([OrigAcct],[LogDateTime])
	CONSTRAINT [FK_LogToOriginAccount] FOREIGN KEY ([OrigAcct]) REFERENCES Account([AcctNo])
)

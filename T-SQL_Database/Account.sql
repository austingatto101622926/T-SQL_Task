CREATE TABLE [dbo].[Account]
(
	[AcctNo] INT NOT NULL, 
    [Fname] NVARCHAR(50) NOT NULL, 
    [Lname] NVARCHAR(50) NOT NULL, 
    [CreditLimit] MONEY NULL, 
    [Balance] MONEY NULL

	CONSTRAINT [PK_Account] PRIMARY KEY ([AcctNo])
	CONSTRAINT [UN_FullName] UNIQUE ([Fname],[Lname])
	CONSTRAINT [CH_CreditLimitBelowZero] CHECK ([CreditLimit]<0)
	CONSTRAINT [CH_BalanceAboveCreditLimit] CHECK ([Balance]>[CreditLimit])
)

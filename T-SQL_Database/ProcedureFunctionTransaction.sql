/*
CREATE PROCEDURE MULTIPLY @NUM1 INT, @NUM2 INT AS
BEGIN
SELECT CONCAT('The product of ',@NUM1,' and ',@NUM2,' is ',(@NUM1*@NUM2));
END;

EXEC MULTIPLY @NUM1=5,@NUM2=3;
*/

/*
CREATE FUNCTION [ADD] (@NUM1 INT, @NUM2 INT) RETURNS INT AS
BEGIN
    RETURN (@NUM1+@NUM2)
END;

BEGIN
    DECLARE @NUM1 INT; SELECT @NUM1 = 16;
    DECLARE @NUM2 INT; SELECT @NUM2 = 14;
    SELECT CONCAT('The sum of ',@NUM1,' and ',@NUM2,' is ', dbo.[ADD](@NUM1,@NUM2))
END;
*/

CREATE PROCEDURE [TransferFunds] @OrigAcct INT, @RecAcct INT, @Amount MONEY AS
BEGIN
    BEGIN TRANSACTION
    SAVE TRANSACTION SavePoint
        BEGIN TRY
        /*Update Origin Account*/
            UPDATE Account
            SET Balance = Balance - @Amount
            WHERE AcctNo = @OrigAcct;
        /*Update Recipient Account*/
            UPDATE Account
            SET Balance = Balance + @Amount
            WHERE AcctNo = @RecAcct;
        /*Log Transfer*/
            INSERT INTO Log (OrigAcct,LogDateTime,RecAcct,Amount) VALUES
            (@OrigAcct,GETDATE(),@RecAcct,@Amount);
        END TRY
        BEGIN CATCH
            ROLLBACK TRANSACTION SavePoint
        END CATCH
    COMMIT TRANSACTION
END;

EXEC TransferFunds @OrigAcct=2, @RecAcct=1, @Amount=30;
SELECT * FROM Account


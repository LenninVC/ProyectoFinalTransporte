CREATE PROCEDURE uspCreateUser  
(  
 @email varchar(250),  
 @password varchar(250),  
 @idColaborador int  
)  
AS  
BEGIN TRY  
 BEGIN TRAN  
  INSERT INTO Usuario(Email,[Password],idColaborador)  
  VALUES(@email,PWDENCRYPT(@password),@idColaborador)  
 COMMIT TRAN  
  
 SELECT  
  Email,  
  Nombres,  
  Apellidos,  
  Colaborador.IdColaborador   
 FROM Usuario  INNER JOIN Colaborador ON Usuario.IdUsuario=Colaborador.IdColaborador  
 WHERE Email=@email AND PWDCOMPARE(@password,[Password])=1  
  
END TRY  
BEGIN CATCH  
 ROLLBACK TRAN  
END CATCH


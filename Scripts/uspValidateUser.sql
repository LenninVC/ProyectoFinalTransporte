CREATE PROCEDURE uspValidateUser  
(  
 @email varchar(250),  
 @password varchar(250)  
)  
AS  
BEGIN  
 SELECT  
  Email,  
  Nombres,  
  Apellidos 
 FROM Usuario INNER JOIN Colaborador ON Usuario.IdUsuario=Colaborador.IdColaborador  
 WHERE Email=@email AND PWDCOMPARE(@password,[Password])=1  
END  
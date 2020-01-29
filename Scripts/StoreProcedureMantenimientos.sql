USE [TransportesDB]
GO
CREATE PROCEDURE [dbo].[uspClientePagedList]
	@startRow int,
	@endRow int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	WITH ClienteResult AS 
	(
		SELECT 
		   [IdCliente]
		  ,[Documento]
		  ,[Nombres]
		  ,[Apellidos]
		  ,[Direccion]
		  ,[Telefono]
		  ,[Celular]
		  ,[Email]
		  ,[Estado]
		  ,ROW_NUMBER() OVER (ORDER BY IdCliente) AS RowNum
	  FROM [TransportesDB].[dbo].[Cliente]
	)
	SELECT  
		   [IdCliente]
		  ,[Documento]
		  ,[Nombres]
		  ,[Apellidos]
		  ,[Direccion]
		  ,[Telefono]
		  ,[Celular]
		  ,[Email]
		  ,[Estado]
	FROM ClienteResult
	WHERE Rownum BETWEEN @startRow AND @endRow
END
GO
CREATE PROCEDURE [dbo].[uspColaboradorPagedList]
	@startRow int,
	@endRow int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	WITH ColaboradorResult AS 
	(
		SELECT 
		   [IdColaborador]
		  ,[Documento]
		  ,[Nombres]
		  ,[Apellidos]
		  ,[Direccion]
		  ,[Telefono]
		  ,[Celular]
		  ,[EmailPersonal]
		  ,[Estado]
		  ,ROW_NUMBER() OVER (ORDER BY IdColaborador) AS RowNum
	  FROM [TransportesDB].[dbo].[Colaborador]
	)
	SELECT  
		   [IdColaborador]
		  ,[Documento]
		  ,[Nombres]
		  ,[Apellidos]
		  ,[Direccion]
		  ,[Telefono]
		  ,[Celular]
		  ,[EmailPersonal]
		  ,[Estado]
	FROM ColaboradorResult
	WHERE Rownum BETWEEN @startRow AND @endRow
END
GO
CREATE PROC [dbo].[uspGeListItinerarios]
AS
BEGIN
	SELECT 
	I.IdItinerario
	, I.IdConductor
	, C.Nombres + ' ' + C.Apellidos Conductor
	, C.Licencia
	, I.Descripcion
	, I.Origen
	, I.Destino
	, I.Costo
	, I.Estado FROM dbo.Itinerario I
	INNER JOIN dbo.Conductor c ON I.IdConductor = C.IdConductor
END
GO
CREATE PROCEDURE [dbo].[uspItinerarioPagedList]
	@startRow int,
	@endRow int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	WITH ItinerarioResult AS 
	(

		SELECT 
		I.IdItinerario
		, I.IdConductor
		, C.Nombres + ' ' + C.Apellidos Conductor
		, C.Licencia
		, I.Descripcion
		, I.Origen
		, I.Destino
		, I.Costo
		, I.Estado
		,ROW_NUMBER() OVER (ORDER BY IdItinerario) AS RowNum 
		FROM Itinerario I
		INNER JOIN Conductor c ON I.IdConductor = C.IdConductor
	)
	SELECT 
	 [IdItinerario]
	, [IdConductor]
	, [Conductor]
	, [Licencia]
	, [Descripcion]
	, [Origen]
	, [Destino]
	, [Costo]
	, [Estado]
	FROM ItinerarioResult
	WHERE Rownum BETWEEN @startRow AND @endRow
END
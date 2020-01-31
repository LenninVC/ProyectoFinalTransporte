(function (customer) {
    customer.success = successReload;
    customer.pages = 1;
    customer.rowSize = 10;
    customer.Costo = '';
    customer.nombre = ''
    /*Atributos para el manejo del Hub*/
    //customer.hub = {};
    //customer.ids = [];
    //customer.recordInUse = false;

    //customer.addCustomer = addCustomerId;
    //customer.removeHubCustomer = removeCustomerId;
    //customer.validate = validate;

    $(function () {

        getData();
        getData2();
        ObtenerValueSelect();
        BuscarCliente();
    })

    return customer;

    function successReload(option) {

    }
    function BuscarCliente() {
        $("#btnBuscar").click(function () {
            $.get('/Customer/BuscarCliente/' + parseInt($("#NumeroDni").val()),
                function (data) {

                    $("#Nombre").val(data.Nombres);
                    $("#Direccion").val(data.Direccion);
                });
        });


    }

    function getData2() {
        $("#btnsave").click(function () {
            var reserva = {
                Destino: $("#Nombre").val(),
                Origen: $("#Direccion").val(),
                IdItinerario: $("#cboEjemplo option:selected").index(),
                Fecha_Inicio: $("#fechaInicio").val(),
                Fecha_Fin: $("#fechaFin").val(),
                IdCliente: '1',
                Costo: $("#Costo").val()
            };
            $.ajax({
                type: "POST",
                URL: "/Customer/Reserva",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify(
                    {
                        EmpDet: reserva
                    }),
                error: function (response) {
                    alert(response.responseText);
                },
                //After successfully inserting records    
                success: function (response) {

                    cibertec.modifyAlertsClasses('create');
                    $('#Nombre').val("");
                    $('#Direccion').val("");
                    $('#Costo').val(0);
                    $('#NumeroDni').val("");
                    $("#NumeroDni").focus();
                    //Reload Partial view to fetch latest added records    
                    //$('#DivEmpList').load("/Home/EmployeeDetails");
                    //alert(response);
                }
            });
        });
    }
    function ObtenerValueSelect() {
        $('#cboEjemplo').change(function () {


            var ciudad = $(this[this.selectedIndex]).val();

            console.log(ciudad);
            if ($(this[this.selectedIndex]).val() == -1) {
                $("#Costo").val(0);
            } else {
                $("#Costo").val(ciudad);
            }


        });
    }



    function getData() {
        $.ajax({
            type: "POST",
            url: "/Customer/ListItinerario",
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                //var datos = $.parseJSON(data);
                //var s = '<option value="-1">Please Select a Department</option>';
                //for (var i = 0; i < data.length; i++) {
                //    s += '<option value="' + data[i].Origen + '">' + data[i].Destino + '</option>';
                //}
                //$("#cboEjemplo").html(s);  

                var s = '<option value="-1">Seleccione Ruta</option>';
                $(data).each(function (i, item) {
                    customer.Costo = 0;
                    customer.Costo = (item.Descripcion).split('_')[1];
                    s += '<option value="' + item.Costo + '">' + (item.Descripcion).split('_')[0] + '</option>';

                    $("#cboEjemplo").html(s);
                });
            }
        });
    }

    //function addCustomerId(id) {
    //    customer.hub.server.addCustomerId(id);
    //}

    //function removeCustomerId(id) {
    //    customer.hub.server.removeCustomerId(id);
    //}

    //function connectToHub() {
    //    customer.hub = $.connection.customerHub;
    //    customer.hub.client.customerStatus = customerStatus;
    //}

    //function customerStatus(customerIds) {
    //    console.log(customerIds);
    //    customer.ids = customerIds;
    //}

    //function validate(id) {
    //    customer.recordInUse = (customer.ids.indexOf(id) > -1);
    //    if (customer.recordInUse) {
    //        $('#inUse').removeClass('hidden');
    //        $('#btn-save').html("");
    //    }
    //}
})(window.customer = window.customer || {});
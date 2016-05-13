<script>
    function crearExcelMororos(){

        var zona = $("#zona").val();
        var params = null;
        if(zona){
            params = { zona: zona }
        }

        $.ajax({
            url: '${createLink(controller: "pago", action:"morosos")}',
            method: 'post',
            data: params,
            success: function(data){
                var array = typeof data != 'object' ? JSON.parse(data) : data;
                var str = 'Documento;Nombre;Telefono;Direccion;Zona;Ultimo_Pago;Dias_Mora;\r\n';
                for (var i = 0; i < array.length; i++) {
                    var line = '';
                    for (var index in array[i]) {
                        line += array[i][index] + ';';
                    }
                    line.slice(0,line.Length-1);
                    str += line + '\r\n';
                }

                var blob = new Blob(["\ufeff", str]);
                var url = URL.createObjectURL(blob);

                var downloadLink = document.createElement("a");
                downloadLink.href = url;
                downloadLink.download = "data.csv";
                document.body.appendChild(downloadLink);
                downloadLink.click();
                document.body.removeChild(downloadLink);

            }
        });
    }
</script>

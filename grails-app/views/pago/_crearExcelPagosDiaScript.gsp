<script>
    function crearExcelPagosDia(){

        $.ajax({
            url: '${createLink(controller: "pago", action:"pagosDia")}',
            method: 'post',
            data: null,
            success: function(data){
                var array = typeof data != 'object' ? JSON.parse(data) : data;
                var str = 'Credito;Cuota;Cuotas;Documento;Cliente;Valor;\r\n';
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

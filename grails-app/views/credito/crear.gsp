<meta name="layout" content="main">

<g:form>
    <div style="margin: 2em;">
        <h1>Gracias por su Compra</h1>
        <hr>
        <g:include controller="venta" action="imprimir" id="${credito.venta.id}" />
    </div>
    <fieldset class="text-center">
        <a class="btn btn-success" onclick="window.print();return;">Imprimir</a>
    </fieldset>
</g:form>

<meta name="layout" content="main">

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
    </ul>
</div>

<g:form>
    <div style="margin: 2em;">
        <h1>Gracias por su Compra</h1>
        <hr>
        <br>
        <g:include controller="venta" action="imprimir" id="${credito.venta.id}" />
    </div>
    <fieldset class="buttons">
        <a class="print" onclick="window.print();return;">Imprimir</button>
    </fieldset>
</g:form>

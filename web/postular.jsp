<%@include file="templates/header.jsp" %>
<%@include file="templates/menu.jsp" %>

<c:if test="${not empty rut}">
    <!-- Código -->
    <div class="row">
      <div class="col s6 offset-s3 white">
          <form method="post" action="control.do">
            <h2>Postular</h2>
            <div class="input-field col s12">
                <input name="codigo" id="codigo" type="text" 
                       class="validate"
                       value="${oferta.codigo}"
                       >
                <label for="codigo">Código</label>
            </div>
            <div class="input-field col s12">
                <input name="titulo" id="titulo" type="text" 
                       class="validate"
                       value="${oferta.titulo}"
                       >
                <label for="titulo">Título</label>
            </div>
            <div class="input-field col s12">
                <input name="descripcion" id="descripcion" type="text"
                       class="validate"
                       value="${oferta.descripcion}"
                       >
                <label for="descripcion">Descripcion</label>
            </div>
            <div>
             <button type="submit" class="waves-effect-light btn right"
                      name="btn" value="postular">
                Postular
             </button>
            </div>
          </form>
      </div>
    </div>
</c:if>
<c:if test="${empty rut}">
    <p>
        No está registrado para estar aquí.
        <a href="index.jsp">Ir al inicio</a>
    </p> 
</c:if>

<%@include file="templates/footer.jsp" %>

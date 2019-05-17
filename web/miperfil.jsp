<%@include file="templates/header.jsp" %>
<%@include file="templates/menu.jsp" %>

<c:if test="${not empty rut}">
    <!-- Código -->
    <div class="row">
      <div class="col s6 offset-s3 white">
        <form method="post" action="control.do">
            <h2>Mi Perfil</h2>
            <div class="input-field col s12">
                <input name="profesion" id="profesion" type="text" class="validate">
                <label for="profesion">Profesion</label>
            </div>
            <div class="input-field col s12">
                <input name="experiencia" id="experiencia" type="text" class="validate">
                <label for="experiencia">Experiencia</label>
            </div>
            <div class="input-field col s12">
                <input name="presentacion" id="presentacion" type="text" class="validate">
                <label for="presentacion">Presentación</label>
            </div>
            <div>
             <button type="submit" class="waves-effect-light btn right"
                      name="btn" value="ingresar_perfil">
                Ingresar Perfil
             </button>
            </div>
            <div class="row">
             ${requestScope.msg}
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
<%@include file="templates/header.jsp" %>

<%@include file="templates/menu.jsp" %>
<div class="row">
    <div class="col s6 offset-s3 white">
        <form method="post" action="control.do">
         <div class="input-field col s12">
           <input name="rut" id="rut" type="text" class="validate">
           <label for="rut">RUT</label>
         </div>
         <div class="input-field col s12">
           <input name="nombre" id="nombre" type="text" class="validate">
           <label for="nombre">Nombre</label>
         </div>
         <div class="input-field col s12">
           <input name="apellido" id="apellido" type="text" class="validate">
           <label for="apellido">Apellido</label>
         </div>
         <div class="input-field col s12">
           <input name="correo" id="correo" type="text" class="validate">
           <label for="correo">Correo</label>
         </div>
         <div class="input-field col s12">
           <input name="clave" id="clave" type="password" class="validate">
           <label for="clave">Clave</label>
         </div>
         <div class="input-field col s12">
           <input name="clave2" id="clave2" type="password" class="validate">
           <label for="clave2">Confirme Clave</label>
         </div>
         <div>
             <button type="submit" class="waves-effect-light btn right"
                                    name="btn" value="registro">
                Registrar
             </button>
         </div>
         <div class="row">
             ${requestScope.msg}
         </div>
        </form>
    </div>
</div>

<%@include file="templates/footer.jsp" %>

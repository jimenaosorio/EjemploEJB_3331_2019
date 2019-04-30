<%@include file="templates/header.jsp" %>
<%@include file="templates/menu.jsp" %>

<div class="row">
        <div class="col s12 m4 offset-l4">
          <div class="card">
            <div class="card-image">
              <img src="images/programar1.jpg">
              <span class="card-title">Ingresar</span>
            </div>
            <div class="card-content">
                <form method="post" action="control.do">
                    <div class="input-field col s12">
                        <input name="rut" id="rut" type="text" class="validate">
                        <label for="rut">RUT</label>
                    </div>
                    <div class="input-field col s12">
                        <input name="clave" id="clave" type="password" class="validate">
                        <label for="clave">Clave</label>
                    </div>
                    <div>
                      <button type="submit" class="waves-effect-light btn right"
                                    name="btn" value="ingresar">
                        Ingresar
                      </button>
                    </div>
                    <div class="row">
                        ${requestScope.msg}
                    </div>
                </form>
            </div>
            
          </div>
        </div>
      </div>

<%@include file="templates/footer.jsp" %>

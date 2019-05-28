<%@page import="modelo.Postulante"%>
<%@include file="templates/header.jsp" %>
<%@include file="templates/menu.jsp" %>

<c:if test="${not empty rut}">
    <!-- C�digo -->
    <%
        String rut=(String)request.getSession().getAttribute("rut");
        Postulante postulante=servicio.buscarPostulante(rut);
        
     %>
     <c:set var="postulante" scope="page" value="<%=postulante%>"/>
     
     <p>${requestScope.msg}</p>
    
     <div class="row">
        <div class="col s6 offset-s3 white">
            <h2>Mis Postulaciones</h2>
            <table class="bordered highlight">
                <tr>
                    <th>C�digo</th>
                    <th>T�tulo</th>
                    <th>Descripci�n</th>
                
                </tr>
                <c:forEach items="${postulante.misPostulaciones}" var="p">
                    <tr>
                        <td>${p.codigo}</td>
                        <td>${p.titulo}</td>
                        <td>${p.descripcion}</td>
                    </tr>
                </c:forEach>
                    
            </table>
        </div>
     </div>
</c:if>
<c:if test="${empty rut}">
    <p>
        No est� registrado para estar aqu�.
        <a href="index.jsp">Ir al inicio</a>
    </p> 
</c:if>

<%@include file="templates/footer.jsp" %>
<%@include file="templates/header.jsp" %>
<%@include file="templates/menu.jsp" %>

<c:if test="${not empty rut}">
    <!-- C�digo -->
    
</c:if>
<c:if test="${empty rut}">
    <p>
        No est� registrado para estar aqu�.
        <a href="index.jsp">Ir al inicio</a>
    </p> 
</c:if>

<%@include file="templates/footer.jsp" %>
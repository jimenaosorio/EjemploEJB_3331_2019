<%@page import="javax.naming.InitialContext"%>
<%@page import="beans.ServicioLocal"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%! ServicioLocal servicio; %>
<%
    InitialContext ctx=new InitialContext();    
    servicio=(ServicioLocal)
       ctx.lookup("java:global/PracticoU2_3331/Servicio!beans.ServicioLocal");
%>

<c:set var="servicio" scope="page" value="<%=servicio%>"/>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--Import Google Icon Font-->
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  
        <title>Ofertas de Trabajo</title>
    </head>
    <body class="orange lighten-3">
       

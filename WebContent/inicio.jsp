<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%		//imports que necesitaremos para el correcto funcionamiento de la aplicacion %>
<%@page import="com.tec.proyecto.clases.GeneradorListas" %>
<%@page import="com.tec.proyecto.clases.Imagen" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
    

<%
/*
 * Creamos una lista auxiliar para hacer que la llamada a las imagenes sea dinamica
 * a la ves que la metemos en un atributo de sesion
 */
List <String>carpetas = new ArrayList<String>();
carpetas.add("perro");
carpetas.add("globos");
carpetas.add("bomberos");
carpetas.add("pollito");
carpetas.add("payaso");
carpetas.add("arbol");
carpetas.add("hotdog");
carpetas.add("pastel");
session.setAttribute("carpetas", carpetas);
/*
 * inicialisamos mas atributos de sesion que ocuparemos mas adelante
 */
session.setAttribute("contador", 0); // contador es el indice de secuencia por el que voy, ejemplo 0 es perro, 1 es globos...
session.setAttribute("marcador", 0); // marcador actual de secuencias correctamente ordenadas
int contador = (Integer)session.getAttribute("contador");
session.setAttribute("gene", new GeneradorListas(carpetas.get(contador))); // cremos un nuevo generador de listas para iniciar
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cuentame Una Historia</title>
</head>
<body background="estrella.jpg">

<center>
	<font face="Comic Sans MS" size= 25 color=blue >Cuéntame Una Historia</font>
</center>
<p align="center" method="get">Presione Iniciar para comenzar el juego.</p>
<form action="pantallaJuego.jsp">
	<center>
		<button type="submit" action="pantallaJuego.jsp?siguiente=1">Iniciar</button>
	</center>
</form>
<br>
</body>
</html>
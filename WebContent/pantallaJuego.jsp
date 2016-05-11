<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%  //imports que necesitaremos para el correcto funcionamiento de la aplicacion %>    
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page import="com.tec.proyecto.clases.GeneradorListas" %>
<%@page import="com.tec.proyecto.clases.Imagen" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pantalla de Juego</title>
</head>
<body>

<%
//llamamos a los atributos de la sesion contador y carpetas.
int contador = (Integer)session.getAttribute("contador");
List<String> carpetas = (ArrayList<String>)session.getAttribute("carpetas");

if (request.getParameter("secuencia")!=null){ 		// parte de codigo que detecta se el usuario ha digitado pasar a la siguiente
	session.setAttribute("contador", contador+1);	// secuencia
	contador = (Integer)session.getAttribute("contador");
	session.setAttribute("gene", new GeneradorListas(carpetas.get(contador)));
}

//llamamos al objeto GeneradorListas
GeneradorListas gene = (GeneradorListas)session.getAttribute("gene");

//parte de codigo que mueve imagenes de la parte de arriba para la parte de abajo
if (request.getParameter("id") == null) {
} 
else {
	gene.getImagenesPOrd().add(new Imagen(Integer.parseInt(request.getParameter("id")),carpetas.get(contador)));
	int count = 0;
	while(Integer.parseInt(request.getParameter("id"))!= gene.getImagenesDes().get(count).getPos()){
		count++;
	}
	gene.getImagenesDes().remove(count);
}

//parte de codigo que mueve imagenes de la parte de abajo para la parte de arriba
if (request.getParameter("id2") == null) {
} 
else {
	gene.getImagenesDes().add(new Imagen(Integer.parseInt(request.getParameter("id2")),carpetas.get(contador)));
	int count = 0;
	while(Integer.parseInt(request.getParameter("id2"))!= gene.getImagenesPOrd().get(count).getPos()){
		count++;
	}
	gene.getImagenesPOrd().remove(count);
}

//parte de codigo que modifica el marcador dependiendo del estado de las listas por ordenar y la ordenada
if (gene.compararListas()==true){
	session.setAttribute("marcador", (Integer)session.getAttribute("marcador")+1);
} 

//llamamos al marcador desde la sesion
int marcador = (Integer)session.getAttribute("marcador");
%>
<center>
		<font  face="Comic Sans MS" 
		size= 25 color=blue >Cuéntame Una Historia</font>
</center>
<br>
<center>
	<font face="arial" size=4 color=black>
		<b>Instrucciones: </b>haga click sobre cualquier imagen de la fila superior para ir
		formando la secuencia de la historia en la parte inferior. <br>  
		Haga click en cualquier imagen de la fila inferior para devolverla a su posición original
	</font>
</center>
<br> 
<%
//Llena la lista desordenada
for(Imagen i:gene.getImagenesDes()){
%>
<a href="pantallaJuego.jsp?<% out.println("id="+i.getPos()); %>">
	<img alt=<%=gene.getNombre() %> 	
		src="<%=i.getDireccion() %>" 
		hspace=20 vspace=10  width=160 border='5'heigth=100 
		align='top' >
	</img>
</a>
<% }%>
<br>
<HR width=100% align="center" size="1">
<% 
//Llena lista Por ordenar con cuadros
for (Imagen i: gene.getImagenesPOrd()){ 
%>
<% if (gene.compararListas()==false){%>
<a href="pantallaJuego.jsp?<% out.println("id2="+i.getPos()); %>"><%} %>
	<img alt=<%=gene.getNombre() %> 
		src="<%=i.getDireccion() %>" 
		hspace=20 vspace=10 width=160 heigth=100
		border='5' 
		align='bottom' >
	</img>
</a>
<%  }%>
<br>
<HR width=100% align="center" size="1">
<table border="5" align="center" cellspacing="15" style="border:1px dashed #000000;">
	<tr>
    	<th>Historias Vistas</th>
    	<th>Historias Completadas</th>
    	<th>Estado</th>
 	</tr>
  	<del></del>
  	<tr>
    	<td><%= contador+1%></td>
    	<td><%= marcador%></td>
    	<%if (gene.compararListas()==true){%>
    	<td>Secuencia Completada</td>
    		<%}else{%>
    	<td>Jugando</td>
    	<%} %>
  	</tr>
</table>
<br>
<div align=center >
<% if (contador!=7){%>
<a href="pantallaJuego.jsp?secuencia=siguiente">
	<button>Siguiente</button>
</a>
<%} %>
<form action="inicio.jsp">
	<button type="submit" >Salir</button>
</form>
</div>
</body>
</html>

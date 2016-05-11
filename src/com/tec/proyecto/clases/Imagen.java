package com.tec.proyecto.clases;

public class Imagen {
	private int pos;
	private String direccion;
	
	
	/*
	 * constructor de la clase Imagen
	 */
	public Imagen(int pos, String direccion) {
		this.pos = pos;
		this.direccion = "Secuencia Imagenes/"+direccion+"/"+direccion+pos+".jpg";
	}
	
	/*
	 * getters de la clase
	 */
	public int getPos() {
		return pos;
	}
	public String getDireccion() {
		return direccion;
	}
	
	
	

}

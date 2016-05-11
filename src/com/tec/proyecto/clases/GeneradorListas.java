package com.tec.proyecto.clases;

import java.util.ArrayList;
import java.util.List;

public class GeneradorListas {
	List <Imagen> imagenesDes;//lista inicial
	List <Imagen> imagenesPOrd;//lista por ordenar
	List <Imagen> imagenesOrd;//lista ordenada
	String nombre;
	
	/*
	 * constructor de la clasegenerador de lista
	 */
	public GeneradorListas(String nombre){
		this.nombre=nombre;
		List <Integer>lista= new ArrayList<Integer>();
		imagenesDes=new ArrayList<Imagen>();
		imagenesPOrd=new ArrayList<Imagen>();
		imagenesOrd=new ArrayList<Imagen>();
	
		//para llenar la lista desordenada
		while (lista.size()<6){							//este while me genera una lista con numeros random ejemplo [2-3-6-1-5-4]
			int x = (int) Math.floor(Math.random()*6+1);//para poder usarlos como indices para llenar la lista que contiene objetos de
			if (lista.contains(x)!=true){				//tipo Imagen
				lista.add(x);
			}
		}
		for(Integer i:lista){
			Imagen newImg = new Imagen(lista.get(i-1),nombre);
			this.imagenesDes.add(newImg);
		}
		//creamos una lista ordenada para poder hacer la comparacion de listas
		for(int i=1;i<7;i++){
			Imagen newImg1 = new Imagen(i,nombre);
			imagenesOrd.add(newImg1);
		}
		
		
	}
	/*
	 * funcion que compara la lista por ordenar con la ordenada
	 */
	public boolean compararListas(){
		int cont=0;
		if (this.imagenesPOrd.size()==6){
		while(cont<this.imagenesOrd.size()){
			
			if(this.imagenesPOrd.get(cont).getPos()==this.imagenesOrd.get(cont).getPos()){
				cont++;
			}
			else{
				return false;
			}
		}
		return true;
		}
		else{
			return false;
		}
		
	}
	
	
	/*
	 * getters de la clase
	 */
	
	public String getNombre() {
		return nombre;
	}


	public List<Imagen> getImagenesDes() {
		return imagenesDes;
	}


	public List<Imagen> getImagenesPOrd() {
		return imagenesPOrd;
	}


	public List<Imagen> getImagenesOrd() {
		return imagenesOrd;
	}


	
	

}

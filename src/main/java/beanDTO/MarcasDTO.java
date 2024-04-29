/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package beanDTO;

/**
 *
 * @author servicio.gti
 */
public class MarcasDTO {
    private int idMarca;
    private String nomMar;
    private String desc;
    private float precio;
    private String img;

    public MarcasDTO() {
    }

    public MarcasDTO(String nomMar, String desc, float precio, String img) {
        this.nomMar = nomMar;
        this.desc = desc;
        this.precio = precio;
        this.img = img;
    }

    public MarcasDTO(int idMarca, String nomMar, String desc, float precio, String img) {
        this.idMarca = idMarca;
        this.nomMar = nomMar;
        this.desc = desc;
        this.precio = precio;
        this.img = img;
    }

    public int getIdMarca() {
        return idMarca;
    }

    public void setIdMarca(int idMarca) {
        this.idMarca = idMarca;
    }

    public String getNomMar(){
        return nomMar;
    }

    public void setNomMar(String nomMar) {
        this.nomMar = nomMar;
    }
    
    public String getDesc(){
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }
    
    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }
    
    public String getImagen(){
        return img;
    }

    public void setImagen(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "MarcasDTO{" + "idMarca=" + idMarca + ", Nombre=" + nomMar + '}';
    }
    
    
}

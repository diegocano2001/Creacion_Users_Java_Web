package modelo;

import java.io.Serializable;

public class EnvioApi implements Serializable {

    private static final long serialVersionUID = 1L;

    private String Nombre;
    private String Apellidos;
    private String Email;
    private String Telefono;
    private String Ciudad;
    private String Pais;


    // Constructores, getters y setters

    public EnvioApi() {
    }

    public EnvioApi(String nombre, String apellidos, String email, String telefono, String ciudad, String pais) {
        this.Nombre = nombre;
        this.Apellidos = apellidos;
        this.Email = email;
        this.Telefono = telefono;
        this.Ciudad = ciudad;
        this.Pais = pais;

    }

    // Agrega getters y setters según sea necesario

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String nombre) {
        this.Nombre = nombre;
    }

    public String getApellidos() {
        return Apellidos;
    }

    public void setApellidos(String apellidos) {
        this.Apellidos = apellidos;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        this.Email = email;
    }

    public String getTelefono() {
        return Telefono;
    }

    public void setTelefono(String telefono) {
        this.Telefono = telefono;
    }

    public String getCiudad() {
        return Ciudad;
    }

    public void setCiudad(String ciudad) {
        this.Ciudad = ciudad;
    }

    public String getPais() {
        return Pais;
    }

    public void setPais(String pais) {
        this.Pais = pais;
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.util.ArrayList;
import javax.ejb.Singleton;
import modelo.Mensaje;
import modelo.Oferta;
import modelo.Perfil;
import modelo.Postulante;

/**
 *
 * @author Informatica
 */
@Singleton
public class Servicio implements ServicioLocal {
    
    private ArrayList<Oferta> ofertas=new ArrayList();
    private ArrayList<Postulante> postulantes=new ArrayList();
    
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")

    public Servicio() {
        ofertas.add(new Oferta(1,"Desarrollador Java Web",
                "Desarrollador de tiempo completo",true));
        ofertas.add(new Oferta(2,"Diseñador grafico",
        "Experto en Materialize CSS",true));
        postulantes.add(new Postulante("111","admin","admin",
        "admin@localhost","admin"));
    }

    @Override
    public Oferta buscarOferta(int codigoOferta) {
        return null;
    }

    @Override
    public Postulante buscarPostulante(String rut) {
        for(Postulante p:postulantes){
            if(p.getRut().equals(rut)){
                return p;
            }
        }
        return null;
    }

    @Override
    public boolean cerrarOferta(int codigo) {
        return false;
    }

    @Override
    public boolean crearOferta(Oferta oferta) {
        return false;
    }

    @Override
    public String enviarMensaje(String rut, Mensaje msg) {
        return null;
    }

    @Override
    public ArrayList<Oferta> getOfertas() {
        ArrayList<Oferta> tmp=new ArrayList();
        for(Oferta of:ofertas)
        {
            if(of.isEstaActiva()){
                tmp.add(of);
            }
        }
        return tmp;
    }

    @Override
    public ArrayList<Postulante> getPostulantes() {
        return null;
    }

    @Override
    public boolean iniciarSesion(String rut, String pass) {
        Postulante p=buscarPostulante(rut);
        if(p!=null && p.getPass().equals(pass))
        {
            return true;
        }
        return false;
    }

    @Override
    public String postular(String rut, int codigoOferta) {
        return null;
    }

    @Override
    public String addPostulante(Postulante postulante) {
        String msg;
        Postulante p=buscarPostulante(postulante.getRut());
        if(p==null) //El postulante no esta en la lista, lo podemos agregar
        {
            postulantes.add(postulante);
            msg="Postulante ingresado correctamente";
        }
        else{
            msg="El postulante ya se encuentra registrado";
        }
        return msg;
    }

    @Override
    public String ingresarPerfil(String rut, Perfil perfil) {
        Postulante p=buscarPostulante(rut);
        p.setMiPerfil(perfil);
        return "Perfil actualizado correctamente";
    }
    
    
    
    
    
}

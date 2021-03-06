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
        for(Oferta of:ofertas){
            if(of.getCodigo()==codigoOferta){
                return of;
            }
        }
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
        Oferta oferta=buscarOferta(codigo);
        if(oferta.isEstaActiva())
        {
            oferta.setEstaActiva(false); //Desactivamos la oferta
            return true;
        }
        return false;
    }

    @Override
    public boolean crearOferta(Oferta oferta) {
        Oferta tmp=buscarOferta(oferta.getCodigo());
        if(tmp==null)
        {
            ofertas.add(oferta);
            return true;
        }
        return false;
    }

    @Override
    public String enviarMensaje(String rut, Mensaje msg) {
        Postulante p=buscarPostulante(rut);
        if(p!=null)
        {
            ArrayList<Mensaje> mensajes=p.getMisMensajes();
            mensajes.add(msg);
            p.setMisMensajes(mensajes);
            return "El mensaje se ha enviado correctamente";
        }
        return "No se puede enviar el mensaje";
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
        return postulantes;
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
        //Recuperamos el postulante
        Postulante p=buscarPostulante(rut);
        //Recuperamos la oferta
        Oferta of=buscarOferta(codigoOferta);
        if(p!=null && of!=null && of.isEstaActiva()) //Si puede postular
        {
            //Agregamos la oferta a las postulaciones del postulante
            ArrayList<Oferta> postulaciones=p.getMisPostulaciones();
            postulaciones.add(of);
            p.setMisPostulaciones(postulaciones);
            //Agregamos el postulante a la lista de postulantes de la oferta
            ArrayList<Postulante> postulantes=of.getMisPostulantes();
            postulantes.add(p);
            of.setMisPostulantes(postulantes);
            //Devolvemos un mensaje
            return "Postulación ingresada correctamente";
        }
        else{ //NO puede postular
            return "No se puede postular";
        }
        
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

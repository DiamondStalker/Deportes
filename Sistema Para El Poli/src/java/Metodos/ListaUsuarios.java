/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Metodos;

/**
 *
 * @author user
 */
public class ListaUsuarios {

    class Nodo {

        float info;
        Nodo sig;
    }

    private Nodo raiz;

    public ListaUsuarios() {
        raiz = null;
    }

    public void insertar(float x) {
        Nodo nuevo = new Nodo();
        nuevo.info = x;
        if (raiz == null) {
            raiz = nuevo;
        } else {
            if (x < raiz.info) {
                nuevo.sig = raiz;
                raiz = nuevo;
            } else {
                Nodo reco = raiz;
                Nodo atras = raiz;
                while (x >= reco.info && reco.sig != null) {
                    atras = reco;
                    reco = reco.sig;
                }
                if (x >= reco.info) {
                    reco.sig = nuevo;
                } else {
                    nuevo.sig = reco;
                    atras.sig = nuevo;
                }
            }
        }
    }

    public String mostrar() {
        String info = "";
        Nodo reco = raiz;
        while (reco != null) {
            info += reco.info + "→";
            reco = reco.sig;
        }
        return info;

    }

}

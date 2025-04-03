/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author 84338
 */
public class NumberOfGenre {
    private String genre;
    private int numbook;

    public NumberOfGenre(String genre, int numbook) {
        this.genre = genre;
        this.numbook = numbook;
    }

    public NumberOfGenre() {
    }
    
    
    
    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public int getNumbook() {
        return numbook;
    }

    public void setNumbook(int numbook) {
        this.numbook = numbook;
    }
    
    
}

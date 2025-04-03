/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author 84338
 */
public class Subcomment {

    private int id;
    private int userID;
    private int bookID;
    private String username;
    private String subcomment;

    public Subcomment() {
    }

    public Subcomment(int id, int userID, int bookID, String username, String subcomment) {
        this.id = id;
        this.userID = userID;
        this.bookID = bookID;
        this.username = username;
        this.subcomment = subcomment;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getBookID() {
        return bookID;
    }

    public void setBookID(int bookID) {
        this.bookID = bookID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getSubcomment() {
        return subcomment;
    }

    public void setSubcomment(String subcomment) {
        this.subcomment = subcomment;
    }
    
    

}

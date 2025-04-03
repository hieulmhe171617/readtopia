/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author 84338
 */
public class Cart {

    public List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public void addItem(Item t) {
        if (getItemByID(t.getBook().getId()) != null) {
            Item m = getItemByID(t.getBook().getId());
            m.setStatus(t.getStatus());

        } else {
            items.add(t);
        }
    }

    private Item getItemByID(int id) {
        for (Item i : items) {
            if (i.getBook().getId() == id) {
                return i;
            }
        }
        return null;
    }

    public void removeItem(int id) {
        if (getItemByID(id) != null) {
            items.remove(getItemByID(id));
        }
    }

    public Book getBookById(int id, List<Book> list) {
        for (Book i : list) {
            if (i.getId() == id) {
                return i;
            }
        }
        return null;
    }

    public Cart(String txt, List<Book> list) {
        items = new ArrayList<>();
        try {
            if (txt != null && txt.length() > 0) {
                String[] s = txt.split("/"); //danh sach book
                for (String i : s) {
                    String[] n = i.split(":");
                    int id = Integer.parseInt(n[0]);
                    int status = Integer.parseInt(n[1]);
                    Book b = getBookById(id, list);
                    if (b != null) {
                        Item t = new Item(b, status);
                        addItem(t);
                    }
                }
            }
        } catch (Exception e) {

        }

    }

    public void cartHasSort(String txt, List<Book> list) {
        items = new ArrayList<>();
        try {
            if (txt != null && txt.length() > 0) {
                String[] s = txt.split("/"); //danh sach book
                for (int i = 0; i < list.size(); i++) {
                    addItem(new Item(list.get(i), getStatusByBookID(txt, list.get(i).getId())));
                }
            }
        } catch (Exception e) {

        }

    }

    public int countBooks() {
        return items.size();
    }

    public int countReadBooks() {
        int count = 0;
        for (int i = 0; i < items.size(); i++) {
            if (items.get(i).getStatus() == 1) {
                count++;
            }
        }
        return count;
    }

    public int countReadingBooks() {
        int count = 0;
        for (int i = 0; i < items.size(); i++) {
            if (items.get(i).getStatus() == 2) {
                count++;
            }
        }
        return count;
    }

    public int countWantReadBooks() {
        int count = 0;
        for (int i = 0; i < items.size(); i++) {
            if (items.get(i).getStatus() == 3) {
                count++;
            }
        }
        return count;
    }

    public int getStatusByBookID(String txt, int bookid) {
        String s[] = txt.split("/");
        for (int i = 0; i < s.length; i++) {
            String n[] = s[i].split(":");
            if (Integer.parseInt(n[0]) == bookid) {
                return Integer.parseInt(n[1]);
            }
        }
        return 0;
    }
}

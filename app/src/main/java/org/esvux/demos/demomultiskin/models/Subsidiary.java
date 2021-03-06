package org.esvux.demos.demomultiskin.models;

public class Subsidiary {

    private String name;
    private String code;
    private String address;

    public Subsidiary(String name, String code, String address) {
        this.name = name;
        this.code = code;
        this.address = address;
    }

    public Subsidiary() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

}
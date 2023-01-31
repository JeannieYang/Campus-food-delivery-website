package pojo;

public class Contact {
    String name;
    String mail;
    String info;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    @Override
    public String toString() {
        return "Contact " +
                "name:'" + name + '\'' +
                ", mail:'" + mail + '\'' +
                ", info:'" + info + '\'';
    }
}

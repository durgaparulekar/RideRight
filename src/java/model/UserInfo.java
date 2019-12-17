package model;

import java.util.Random;

public class UserInfo
{
    private String firstName, lastName, username, password;
    private int ID;

    public String getFirstName()
    {
        return firstName;
    }

    public void setFirstName(String firstName)
    {
        this.firstName = firstName;
    }

    public String getLastName()
    {
        return lastName;
    }

    public void setLastName(String lastName)
    {
        this.lastName = lastName;
    }

    public String getUsername()
    {
        return username;
    }

    public void setUsername(String username)
    {
        this.username = username;
    }

    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }

    public int getID()
    {
        return ID;
    }

    public void setID(int length)
    {
        int ID = 0;
        Random random = new Random();
        
        for(int i = 0; i < length; i++)
        {
            ID += random.nextInt(10);
        }
        
        this.ID = ID;
    }
    
    
}

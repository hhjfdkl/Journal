package org.journal;

import java.sql.*;
import java.util.List;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {

        JournalAccess dba = new JournalAccess();

        List<Character> c = dba.getAllCharacters();

        for (Character a : c)
        {
            System.out.println(a.getFirstName() + " " + a.getLastName() + "\n");
        }
    }
}

package org.journal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class JournalAccess {


    private final String jdbcUrl = "jdbc:sqlite:Journal.db";



    public List<Character> getAllCharacters()
    {

        List<Character> characters = new ArrayList<>();
            try {
            Connection connection = DriverManager.getConnection(jdbcUrl);

            String sql = "SELECT * FROM character";
            Statement statement = connection.createStatement();
            ResultSet result = statement.executeQuery(sql);


            while(result.next()) {

                Character character = new Character(
                        result.getInt("id")
                        , result.getString("first_name")
                        , result.getString("last_name")
                        , result.getString("alias")
                        , result.getString("email")
                        , result.getString("phone")
                        , result.getString("sphere_id")
                        , result.getString("employer")
                        , result.getString("occupation")
                        , result.getString("location")
                );
                characters.add(character);

            }




        } catch (
        SQLException e) {
            System.out.println("Error connecting to SQLite database. Check if the file is there.");
            e.printStackTrace();
        }
            return characters;
    }
}

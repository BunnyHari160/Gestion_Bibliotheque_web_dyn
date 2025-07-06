package com.maBibliotheque.repository;

import com.maBibliotheque.util.DatabaseConnection;
import java.sql.*;
import java.util.*;

public class LivreRepository {
    public List<Map<String, Object>> findAll() {
        List<Map<String, Object>> livres = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "SELECT l.*, COUNT(e.id_exemplaire) AS nb_exemplaires " +
                         "FROM livre l LEFT JOIN exemplaire e ON l.id_livre = e.id_livre " +
                         "GROUP BY l.id_livre";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Map<String, Object> livre = new HashMap<>();
                livre.put("id_livre", rs.getInt("id_livre"));
                livre.put("titre", rs.getString("titre"));
                livre.put("auteur", rs.getString("auteur"));
                livre.put("edition", rs.getString("edition"));
                livre.put("langue", rs.getString("langue"));
                livre.put("note", rs.getFloat("note"));
                livre.put("mots_cles", rs.getString("mots_cles"));
                livre.put("nb_exemplaires", rs.getInt("nb_exemplaires"));
                livres.add(livre);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return livres;
    }

    public List<Map<String, Object>> search(String keyword) {
        List<Map<String, Object>> livres = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "SELECT l.*, COUNT(e.id_exemplaire) AS nb_exemplaires " +
                         "FROM livre l LEFT JOIN exemplaire e ON l.id_livre = e.id_livre " +
                         "WHERE CONCAT_WS(' ', titre, auteur, edition, langue, mots_cles, description, commentaires) LIKE ? " +
                         "GROUP BY l.id_livre";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, "%" + keyword + "%");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Map<String, Object> livre = new HashMap<>();
                livre.put("id_livre", rs.getInt("id_livre"));
                livre.put("titre", rs.getString("titre"));
                livre.put("auteur", rs.getString("auteur"));
                livre.put("edition", rs.getString("edition"));
                livre.put("langue", rs.getString("langue"));
                livre.put("note", rs.getFloat("note"));
                livre.put("mots_cles", rs.getString("mots_cles"));
                livre.put("nb_exemplaires", rs.getInt("nb_exemplaires"));
                livres.add(livre);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return livres;
    }
}

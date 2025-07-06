<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>

<html>
<head>
    <title>Vue d’ensemble</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/style.css">
</head>
<body>
<div class="container">

<h2>🔎 Aperçu général de la bibliothèque</h2>

<h3>🏆 Classement des livres les plus lus</h3>
<%
    List topLivres = (List) request.getAttribute("topLivres");
    if (topLivres != null && !topLivres.isEmpty()) {
%>
    <ul>
    <%
        for (Object livre : topLivres) {
    %>
        <li><%= livre %></li>
    <%
        }
    %>
    </ul>
<%
    } else {
%>
    <p>Aucune information disponible.</p>
<%
    }
%>

<h3>💪 Lecteurs les plus fréquents</h3>
<%
    List topAdherents = (List) request.getAttribute("topAdherents");
    if (topAdherents != null && !topAdherents.isEmpty()) {
%>
    <ul>
    <%
        for (Object adh : topAdherents) {
    %>
        <li><%= adh %></li>
    <%
        }
    %>
    </ul>
<%
    } else {
%>
    <p>Aucune information disponible.</p>
<%
    }
%>

<h3>📂 Répartition des emprunts par type d’adhérent</h3>
<%
    List profils = (List) request.getAttribute("profils");
    if (profils != null && !profils.isEmpty()) {
%>
    <ul>
    <%
        for (Object obj : profils) {
            Map profil = (Map) obj;
            Object typeAdherent = profil.get("type_adherent");
            Object total = profil.get("total");
    %>
        <li><%= typeAdherent %> : <%= total %> emprunts</li>
    <%
        }
    %>
    </ul>
<%
    } else {
%>
    <p>Aucune donnée à afficher.</p>
<%
    }
%>

<h3>🚨 Pourcentage d’emprunts en retard</h3>
<%
    Object tauxRetard = request.getAttribute("tauxRetard");
    if (tauxRetard != null) {
%>
    <p><%= tauxRetard %>% des livres ont été retournés après la date prévue.</p>
<%
    } else {
%>
    <p>Aucune donnée disponible.</p>
<%
    }
%>

<h3>📖 Emprunts enregistrés</h3>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Titre</th>
        <th>Lecteur</th>
        <th>Emprunté le</th>
        <th>Retour attendu</th>
    </tr>
    <%
        List<Map<String, Object>> histEmp = (List<Map<String, Object>>) request.getAttribute("historiqueEmprunts");
        if (histEmp != null) {
            for (Map<String, Object> row : histEmp) {
    %>
        <tr>
            <td><%= row.get("id") %></td>
            <td><%= row.get("titre") %></td>
            <td><%= row.get("nom") %> <%= row.get("prenom") %></td>
            <td><%= row.get("dateEmprunt") %></td>
            <td><%= row.get("dateRetourPrevue") %></td>
        </tr>
    <%
            }
        }
    %>
</table>

<br>

<h3>📅 Retours effectués</h3>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Titre</th>
        <th>Lecteur</th>
        <th>Date du retour</th>
    </tr>
    <%
        List<Map<String, Object>> histRet = (List<Map<String, Object>>) request.getAttribute("historiqueRetours");
        if (histRet != null) {
            for (Map<String, Object> row : histRet) {
    %>
        <tr>
            <td><%= row.get("id") %></td>
            <td><%= row.get("titre") %></td>
            <td><%= row.get("nom") %> <%= row.get("prenom") %></td>
            <td><%= row.get("dateRetour") %></td>
        </tr>
    <%
            }
        }
    %>
</table>

<p><a href="<%= request.getContextPath() %>/emprunt">📥 Enregistrer un nouvel emprunt</a></p>
<p><a href="<%= request.getContextPath() %>/retour">📤 Retourner un livre</a></p>
<p><a href="<%= request.getContextPath() %>/logout">🚪 Déconnexion</a></p>
<p><a href="<%= request.getContextPath() %>/livres">📘 Voir tous les livres</a></p>


</div>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List, java.util.Map" %>
<html>
<head>
    <title>Catalogue des livres</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/style.css">
</head>
<body>
<div class="container">
    <h2>📚 Catalogue des livres</h2>

    <form method="get" action="<%= request.getContextPath() %>/livres">
    <input type="text" name="search" placeholder="Rechercher...">
    <button type="submit">🔍</button>
</form>

    <%
        List<Map<String, Object>> livres = (List<Map<String, Object>>) request.getAttribute("livres");
        if (livres != null && !livres.isEmpty()) {
    %>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Titre</th>
            <th>Auteur</th>
            <th>Edition</th>
            <th>Langue</th>
            <th>Note</th>
            <th>Mots-clés</th>
            <th>Exemplaires</th>
        </tr>
        <% for (Map<String, Object> livre : livres) { %>
        <tr>
            <td><%= livre.get("id_livre") %></td>
            <td><%= livre.get("titre") %></td>
            <td><%= livre.get("auteur") %></td>
            <td><%= livre.get("edition") %></td>
            <td><%= livre.get("langue") %></td>
            <td><%= livre.get("note") %></td>
            <td><%= livre.get("mots_cles") %></td>
            <td><%= livre.get("nb_exemplaires") %></td>
        </tr>
        <% } %>
    </table>
    <% } else { %>
    <p>Aucun livre trouvé.</p>
    <% } %>

    <p><a href="<%= request.getContextPath() %>/dashboard">Retour au tableau de bord</a></p>
</div>
</body>
</html>

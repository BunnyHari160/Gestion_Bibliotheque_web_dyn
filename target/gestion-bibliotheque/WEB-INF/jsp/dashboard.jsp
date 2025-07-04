<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/style.css">
</head>
<body>
<h2>Statistiques</h2>

<h2>📚 Livres les plus empruntés</h2>
<%
    java.util.List topLivres = (java.util.List) request.getAttribute("topLivres");
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
    <p>Aucune donnée à afficher.</p>
<%
    }
%>

<h2>👤 Adhérents les plus actifs</h2>
<%
    java.util.List topAdherents = (java.util.List) request.getAttribute("topAdherents");
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
    <p>Aucune donnée à afficher.</p>
<%
    }
%>

<h3>📊 Emprunts par type d’adhérent</h3>
<%
    java.util.List profils = (java.util.List) request.getAttribute("profils");
    if (profils != null && !profils.isEmpty()) {
%>
    <ul>
    <%
        for (Object obj : profils) {
            java.util.Map profil = (java.util.Map) obj;
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

<h3>⏰ Taux de retard</h3>
<%
    Object tauxRetard = request.getAttribute("tauxRetard");
    if (tauxRetard != null) {
%>
    <p><%= tauxRetard %>% des emprunts sont en retard.</p>
<%
    } else {
%>
    <p>Pas de données sur le taux de retard.</p>
<%
    }
%>

<p><a href="<%= request.getContextPath() %>/emprunt">Nouvel emprunt</a></p>
<p><a href="<%= request.getContextPath() %>/retour">Retourner un livre</a></p>
<p><a href="<%= request.getContextPath() %>/logout">Se déconnecter</a></p>

</body>
</html>

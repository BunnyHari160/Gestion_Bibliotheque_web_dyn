package com.maBibliotheque.servlet;

import com.maBibliotheque.service.LivreService;
import com.maBibliotheque.repository.LivreRepository;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

public class LivreServlet extends HttpServlet {

    private LivreService livreService;

    @Override
    public void init() {
        livreService = new LivreService(new LivreRepository());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String motCle = request.getParameter("search");
        List<Map<String, Object>> livres;

        if (motCle != null && !motCle.trim().isEmpty()) {
            livres = livreService.rechercherParMotCle(motCle.trim());
        } else {
            livres = livreService.getAllLivres();
        }

        request.setAttribute("livres", livres);
        request.getRequestDispatcher("/WEB-INF/jsp/liste.jsp").forward(request, response);
    }
}

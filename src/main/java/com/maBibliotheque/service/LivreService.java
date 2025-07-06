package com.maBibliotheque.service;

import com.maBibliotheque.repository.LivreRepository;

import java.util.List;
import java.util.Map;

public class LivreService {
    private LivreRepository livreRepo;

    public LivreService(LivreRepository livreRepo) {
        this.livreRepo = livreRepo;
    }

    public List<Map<String, Object>> getAllLivres() {
        return livreRepo.findAll();
    }

    public List<Map<String, Object>> rechercherParMotCle(String mot) {
        return livreRepo.search(mot);
    }
}

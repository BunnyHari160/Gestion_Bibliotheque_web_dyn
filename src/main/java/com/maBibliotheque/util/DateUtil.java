package com.maBibliotheque.util;

import java.time.DayOfWeek;
import java.time.LocalDate;

public class DateUtil {

    public static LocalDate ajouterJoursOuvrables(LocalDate dateDepart, int jours) {
        LocalDate date = dateDepart;
        int ajout = 0;

        while (ajout < jours) {
            date = date.plusDays(1);
            if (date.getDayOfWeek() != DayOfWeek.SUNDAY) {
                ajout++;
            }
        }

        return date;
    }
}

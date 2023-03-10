%Baza wiedzy
% poci?g(ID_poci?gu, Miejscowosc_wyjazdu, Miejscowosc_przyjazdu,
% cena_biletu, czas_przejazdu, klasa, godzina_wyjazdu,
% godzina_przyjazdu, dni_kursowania).
pociag(1, 'Warszawa', 'Krak?w', 50, 3, '2', '09:00', '12:00', dzien(true, false, true, false, true, false, false)).
pociag(2, 'Warszawa', 'Krak?w', 40, 2, '1', '10:00', '12:00', dzien(false, true, false, true, false, false, false)).
pociag(3, 'Warszawa', 'Pozna?', 30, 2, '2', '11:00', '13:00', dzien(true, false, true, false, true, false, false)).
pociag(4, 'Warszawa', 'Pozna?', 35, 2, '1', '12:00', '14:00', dzien(false, true, false, true, false, false, false)).
pociag(5, 'Warszawa', '??d?', 20, 1, '2', '13:00', '14:00', dzien(true, true, true, true, true, false, false)).
pociag(6, 'Krak?w', 'Warszawa', 50, 3, '2', '09:00', '12:00', dzien(false, true, false, true, false, false, false)).
pociag(7, 'Krak?w', 'Warszawa', 45, 3, '1', '10:00', '13:00', dzien(true, false, true, false, true, false, false)).
pociag(8, 'Krak?w', 'Pozna?', 40, 4, '2', '11:00', '15:00', dzien(false, true, false, true, false, false, false)).
pociag(9, 'Krak?w', 'Pozna?', 35, 3, '1', '12:00', '15:00', dzien(true, false, true, false, true, false, false)).
pociag(10, 'Krak?w', '??d?', 25, 2, '2', '13:00', '15:00', dzien(true, false, true, false, true, true, false)).
pociag(11, 'Pozna?', 'Warszawa', 30, 2, '2', '09:00', '11:00', dzien(false, true, false, true, false, true, false)).
pociag(12, 'Pozna?', 'Warszawa', 35, 2, '1', '10:00', '12:00', dzien(true, false, true, false, true, false, false)).
pociag(13, 'Pozna?', 'Krak?w', 40, 4, '2', '11:00', '15:00', dzien(false, true, false, true, false, true, false)).
pociag(14, 'Pozna?', 'Krak?w', 45, 3, '1', '12:00', '15:00', dzien(true, false, true, false, true, false, false)).
pociag(15, 'Pozna?', '??d?', 30, 2, '2', '13:00', '15:00', dzien(true, false, true, false, true, false, false)).
pociag(16, 'Gda?sk', 'Szczecin', 30, 2, '2', '09:00', '11:00', dzien(true, true, true, true, true, false, false)).
pociag(17, 'Gda?sk', 'Szczecin', 35, 2, '1', '10:00', '12:00', dzien(false, false, true, true, false, true, false)).
pociag(18, 'Gda?sk', 'Wroc?aw', 40, 3, '2', '11:00', '14:00', dzien(true, true, true, true, true, false, false)).
pociag(19, 'Gda?sk', 'Wroc?aw', 45, 3, '1', '12:00', '15:00', dzien(false, false, true, true, false, true, false)).
pociag(20, 'Gda?sk', 'Krak?w', 50, 4, '2', '13:00', '17:00', dzien(true, true, true, true, true, false, false)).
pociag(21, 'Szczecin', 'Gda?sk', 30, 2, '2', '09:00', '11:00', dzien(false, false, true, true, false, true, false)).
pociag(22, 'Szczecin', 'Gda?sk', 35, 2, '1', '10:00', '12:00', dzien(true, true, true, true, true, false, false)).
pociag(23, 'Szczecin', 'Wroc?aw', 40, 3, '2', '11:00', '14:00', dzien(false, false, true, true, false, true, false)).
pociag(24, 'Szczecin', 'Wroc?aw', 45, 3, '1', '12:00', '15:00', dzien(true, true, true, true, true, false, false)).
pociag(25, 'Szczecin', 'Krak?w', 50, 4, '2', '13:00', '17:00', dzien(false, false, true, true, false, true, false)).
pociag(26, 'Warszawa', 'Pozna?', 35, 2, '1', '12:00', '14:00', dzien(false, false, false, false, false, false, true)).
pociag(27, 'Krak?w', '??d?', 25, 2, '2', '13:00', '15:00', dzien(false, false, false, false, false, false, true)).
pociag(28, 'Pozna?', 'Warszawa', 30, 2, '2', '09:00', '11:00', dzien(false, false, false, false, false, false, true)).
pociag(29, '??d?', 'Warszawa', 20, 1, '2', '13:00', '14:00', dzien(false, false, false, false, false, false, true)).


najtanszy_przejazd(MiejscowoscWyjazdu, MiejscowoscPrzyjazdu, Pociag) :-
    pociag(ID, MiejscowoscWyjazdu, MiejscowoscPrzyjazdu, Cena, _, _, _, _, _),
    forall(pociag(_, MiejscowoscWyjazdu, MiejscowoscPrzyjazdu, Cena2, _, _, _, _, _), Cena =< Cena2),
    Pociag = pociag(ID, MiejscowoscWyjazdu, MiejscowoscPrzyjazdu, Cena, _, _, _, _, _).


najwczesniejszy_pociag(Miejscowosc_wyjazdu, Pociag) :-
    pociag(_, Miejscowosc_wyjazdu, _, _, _, _, Godzina_odjazdu_str, _,_),
    parse_time1(Godzina_odjazdu_str, Godzina_odjazdu),
    forall(pociag(_, Miejscowosc_wyjazdu, _, _, _, _, Godzina_odjazdu_str2, _,_),
           (parse_time1(Godzina_odjazdu_str2, Godzina_odjazdu2),
           Godzina_odjazdu2 >= Godzina_odjazdu) ;
           Godzina_odjazdu2 > Godzina_odjazdu),
    Pociag = pociag(_, Miejscowosc_wyjazdu, _, _, _, _, Godzina_odjazdu_str, _,_).


parse_time1(TimeStr, Time) :-
    split_string(TimeStr, ":", "", [HourStr, MinuteStr]),
    atom_number(HourStr, Hour),
    atom_number(MinuteStr, Minute),
    Time is Hour * 60 + Minute.


pociagi_w_dniu(Dzien, Pociagi) :-
    findall(ID, (pociag(ID, _, _, _, _, _, _, _, dzien(Pon,Wt,Sr,Czw,Pt,So,N)),
       (Dzien == poniedzialek, Pon = true;
        Dzien == wtorek, Wt = true;
        Dzien == sroda, Sr = true;
        Dzien == czwartek, Czw = true;
        Dzien == piatek, Pt = true;
        Dzien == sobota, So = true;
        Dzien == niedziela, N = true)),
    Pociagi).


pociagi_do_miasta(Miejscowosc, Pociagi) :-
    findall(ID, pociag(ID, _, Miejscowosc, _, _, _, _, _, _), Pociagi).


pociagi_do_miasta_w_dniu(Miejscowosc, Dzien, Pociagi) :-
    findall(ID, (pociag(ID, _, Miejscowosc, _, _, _, _, _, dzien(Pon,Wt,Sr,Czw,Pt,So,N)),
       (Dzien == poniedzialek, Pon = true;
        Dzien == wtorek, Wt = true;
        Dzien == sroda, Sr = true;
        Dzien == czwartek, Czw = true;
        Dzien == piatek, Pt = true;
        Dzien == sobota, So = true;
        Dzien == niedziela, N = true)),
    Pociagi).


szczegoly(ID) :-
    pociag(ID, MiejscowoscWyjazdu, MiejscowoscPrzyjazdu, Cena, Czas, Klasa, GodzinaOdjazdu, _, _),
    write(ID), write('. Miejscowo?? wyjazdu: '), write(MiejscowoscWyjazdu),
    write(', miejscowo?? przyjazdu: '), write(MiejscowoscPrzyjazdu),
    write(', godzina odjazdu: '), write(GodzinaOdjazdu),
    write(', czas przejazdu: '), write(Czas), write('h,'),
    write(' cena: '), write(Cena), write(' z?'),
    write(', klasa: '), write(Klasa),
    nl.


pociagi_trasa(Miejscowosc_wyjazdu, Miejscowosc_przyjazdu) :-
    pociag(_, Miejscowosc_wyjazdu, Miejscowosc_przyjazdu, Cena, _, _, Godzina_odjazdu, _, _),
    write(Miejscowosc_wyjazdu), write(' - '), write(Miejscowosc_przyjazdu),
    write(', cena: '),write(Cena),
    write(', godzina odjazdu: '), write(Godzina_odjazdu),
    nl.

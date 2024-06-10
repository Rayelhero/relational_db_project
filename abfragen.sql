--1 Durchschnittliche Bewertungen je Event
select event.titel as "Titel", round(avg(bewertung.bewertung), 1) as "Bewertung"
from event join bewertung on event.event_id = bewertung.event_id
group by event.titel
order by avg(bewertung.bewertung) desc;

--2


--3 Anzahl und % der noch verfügbaren tickets
select  e.titel, round(((count(*)/(l.anzahl_stehplaetze+l.anzahl_sitzplaetze))*100), 4) as "Tickets verkauft %", (l.anzahl_stehplaetze+l.anzahl_sitzplaetze - count(*)) as "Tickets Verfügbar"
from ticket t join event e on t.event_id=e.event_id
    join location l on l.location_id=e.location_id
group by  l.anzahl_stehplaetze, l.anzahl_sitzplaetze, e.titel;

--4 Welche Mitarbeiter sind an einem bestimmten Tag (15.07.2023) verfügbar
select nachname as "Name"
from mitarbeiter
where mitarbeiter_id not IN (
    select mitarbeiter_id
    from  ressource r join einsatz e on e.ressource_id = r.ressource_id
    where e.datum = '15-JUL-23' and mitarbeiter_id is NOT NULL
);

--5 Location mit mindestens 200 Stehplätzen, 700 Sitzplätzen und Barrierefrei
select l.bezeichnung as "Location Name", p.nachname as "Kontaktperson", p.telefonnummer as "Telefonnummer"
from location l join person p on l.person_id=p.person_id
where l.anzahl_sitzplätze > 700 
    and l.anzahl_stehplätze > 200 
    and l.barrierefrei = 'true';

--10 Günstige Tickets (unter 20€)
select distinct e.titel as "Titel", t.preis as "Preis"
from ticket t join event e on t.event_id = e.event_id
where preis<20;

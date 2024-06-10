--1 Durchschnittliche Bewertungen je Event
select event.titel as "Titel", round(avg(bewertung.bewertung), 1) as "Bewertung"
from event join bewertung on event.event_id = bewertung.event_id
group by event.titel
order by avg(bewertung.bewertung) desc;

--2 Anzahl und % der noch verfügbaren tickets
select  e.titel, round(((count(*)/(l.anzahl_stehplaetze+l.anzahl_sitzplaetze))*100), 4) as "Tickets verkauft %", (l.anzahl_stehplaetze+l.anzahl_sitzplaetze - count(*)) as "Tickets Verfügbar"
from ticket t join event e on t.event_id=e.event_id
    join location l on l.location_id=e.location_id
group by  l.anzahl_stehplaetze, l.anzahl_sitzplaetze, e.titel;

--3 Welche Mitarbeiter sind an einem bestimmten Tag (15.07.2023) verfügbar
select nachname as "Name"
from mitarbeiter
where mitarbeiter_id not IN (
    select mitarbeiter_id
    from  ressource r join einsatz e on e.ressource_id = r.ressource_id
    where e.datum = '15-JUL-23' and mitarbeiter_id is NOT NULL
);

--4 Location mit mindestens 200 Stehplätzen, 700 Sitzplätzen und Barrierefrei?
select l.bezeichnung as "Location Name", p.nachname as "Kontaktperson", p.telefonnummer as "Telefonnummer"
from location l join person p on l.person_id=p.person_id
where l.anzahl_sitzplaetze > 700 
    and l.anzahl_stehplaetze > 200 
    and l.barrierefrei = 'true';

--5 Günstige Tickets (unter 20€)
select distinct e.titel as "Titel", t.preis as "Preis"
from ticket t join event e on t.event_id = e.event_id
where preis<20;

--6 Welche Mitarbeiter können an einem Tag den Einsatz übernehmen?
select nachname
from mitarbeiter
where qualifikation in (
    select a.qualifikation
    from arbeitsschritt a join technik t on a.technik_id=t.technik_id
        join ressource r on r.technik_id=t.technik_id
        join einsatz e on e.ressource_id=r.ressource_id
    where e.datum = '10-APR-24' and r.mitarbeiter_id is null
);

--7 Welcher Mitarbeiter hat die meisten Einsätze
select m.nachname as "Name", count(*) as "Anzahl Einsätze"
from mitarbeiter m join ressource r on m.mitarbeiter_id = r.mitarbeiter_id
    join einsatz e on r.ressource_id = e.ressource_id
group by m.mitarbeiter_id, m.nachname
order by count(*)desc , m.nachname asc;

--8 Welche Band hatte die meisten Zuhörer
select b.name as "Band", count(*) as "Anzahl Zuhörer"
from band b join event_band eb on b.band_id = eb.band_id
    join event e on e.event_id = eb.event_id
    join ticket t on t.event_id = e.event_id
group by b.name
order by count(*) desc
fetch first row only;

--9 Welcher Kunde hat die meisten Buchungen
select nachname as "Name"
from kunde
where kunde_id IN (
    select kunde_id
    from buchung
    group by kunde_id
    order by count(*) desc
    fetch first row only
);

--10 Prozent der Tickets die ermäßigt sind
select e.event_id, e.titel as "Titel Event", (sum(case when t.ermaessigt = 'true' then 1 else 0 end) *100)/ count(*) as "Anteil Ermaessigt in Prozent"
from ticket t join event e on t.event_id=e.event_id
group by e.event_id, e.titel
order by (sum(case when t.ermaessigt = 'true' then 1 else 0 end) *100)/ count(*) desc;
---
title: Beispiele für Fehler im Prognosewettbewerb
date: 2022-02-12
author: Sebastia Sauer
---



1. Es wird nicht die richtige Variable AV (y) modelliert.
    - Achten Sie auf eine korrekt spezifizierte Regressionsformel, etwa: `y ~ x1 + x2`.
2. Es werden leichtfertig alle Fälle (Zeilen) mit fehlenden Werten entfernt.
    - Das kann im Extremfall dazu führen, dass der Datensatz sehr klein wird, etwa von 1000 auf 50 Beobachtungen. Achten Sie darauf, wie viele Fälle übrig bleiben. Im Notfall trennen Sie sich von Variablen, die fast nur aus fehlenden Werten bestehen (entfernen Sie solche "Schweizer Käse" aus dem Datensatz).
3. Die AV (y) erscheint auf beiden Seiten der Regressionsformel: `y ~ x1 + y`.
    - Die AV darf nur auf der linken Seite der Regressionsformel erscheinen.
4. Nominale Variablen werden in numerische umgewandelt.
    - Sagen wir, in einer Analyse gibt es die (nominale) Variable *Bundesland*, mit den bekannten 16 Werten, Bayern, Baden-Württemberg, ... Wandelt man diese Nomen in Zahlen um, so würde zwei Mal Bayern das gleiche wie Baden-Württemberg ergeben. Kein Schluss mit dem die Bürger jener Länder einfach zustimmen würden! 
5. Der Quellcode ist nicht reproduzierbar: Der Prüfer versucht Ihre Analyse nachzuvollziehen, scheitert aber, weil er Ihre Syntax nicht zum Laufen bekommt oder es nicht (vollständig) dokumentiert ist, was Sie gemacht haben. 
    - Achten Sie darauf, dass Ihr Code lauffähig ist, auch auf einem anderen Computer. Das bedeutet idealerweise, dass Sie keine Pfade (für Daten) verwenden, die auf Ihren Computer zeigen, da darauf ja außer Ihnen niemand Zugriff hat.
6. Es wird keine explorative Analyse durchgeführt, und auch keine sonstigen Methoden, um herauszufinden, welche Variablen prädiktiv sind. Stattdessen werden auf Geratewohl Modelle ausprobiert.
    - Verwenden Sie die z.B. Methoden der explorativen Datenanalyse, um herauszufinden, welche Variable z.B. viele fehlende Werte aufweisen, oder keine Streuung aufweisen oder hoch mit der AV korreliert sind.
7. Es wird ein Prognosemodell gerechnet, ohne zu prüfen, ob die verwendeten Prädiktoren viele fehlende Werte aufweisen.
    - Als Extrembeispiel: Sagen wird, nur 10 Zeilen im Datensatz weisen keine fehlenden Werte in den Prädiktoren Ihres Modells auf. Eine Regression wird nur diese Zeilen verwenden, also nur Zeilen mit kompletten Werte (keine fehlenden Werte). Ist es zu erwarten, dass so eine kleine Stichprobe (n=10) eine präzise Vorhersage machen wird (noch dazu, wenn es viele Prädiktoren gibt)? Leider nein! Prüfen Sie also vorab, wie viele Zeilen übrig bleiben, wenn man ein Modell mit Ihren Prädiktoren rechnet. Ohne diese Prüfung wird Ihr Modell u.U. sehr unzuverlässig sein. Auch wenn es Ihre 10 Zeilen gut beschreibt, ist es sehr fraglich, ob so eine kleine Stichprobe neue Daten gut erklären wird. 
8. Es werden kollineare Prädiktoren aufgenommen.
    - Nimmt man zwei (fast) identische Prädiktoren in eine Regression auf, so kann das das Modell "durcheinander bringen". Besser ist es, auf eine der beiden Variablen zu verzichten.
9. Die Vorhersagen werden nicht mit der (richtigen) ID versehen.
    - Stellen Sie sich vor, Sie sollen Noten schon Studentis vorhersagen. Jemand sagt vorher: "Schorsch wird eine 1 haben!". Schorsch hat tatsächlich eine 1. Toll! Jemand anderes sagt vorher: "Jemand wird eine 1 haben!". Tja. Schon richtig. Aber wer? Diese Vorhersage ist leider nicht wenig nütze, ihr fehlt eine ID, in dem Fall wäre die richtige (oder eine rictige) ID "Schorsch". Achten Sie darauf, für jeden Wert von `pred` eine `id` anzugeben, sonst kann die Richtigkeit Ihrer Vorhersagen nicht überprüft werden bzw. es wird kein Treffer gefunden für Ihre Vorhersagen.
10. Den "Sanity-Check" vergessen.
    - Stellen Sie sich vor, Sie sollen Noten von Studentis vorhersagen (Note 1 bis Note 5). Bei den Vorhersagen einer Kommilitonin lesen Sie als Vorhersagen einen Wert von minus 42 Billionen (Es könnten 420 Billionen gewesen sein, bei so vielen Nullern kommt man schon mal durcheinander). Was ist von dieser Vorhersage zu halten? Ein Blick zur richtigen Zeit in die Vorhersagen hätte hier vor einer verkehrten Vorhersage geschützt. 
11. Die einzureichenden Dateien falsch benennen.
   - Soll man eine Datei "cool.csv" einreichen, aber man nennt die Datei stattdessen "cool_csv", dann wird ein einfach gestricktes Computerprogramm Probleme haben, den Namen zu erkennen. Achtung vor Rechtschreibfehlern in entscheidenden Situationen, so ähnlich wie beim Eingeben einer PIN oder eines Passwrots. An manchen Stellen lohnt sich ein Doppel-Check und Vorsicht. Man sollte auch keine Zip-Datei hochladen, wenn das vorab als ausgeschlossen deklariert wurde.
    
    
  

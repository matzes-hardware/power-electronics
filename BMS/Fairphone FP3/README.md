
# Fairphone 3 BMS

Vier Pins zum Telefon, von außen nach innen:

* P+
* T
* ID
* P-

Rückseite, zwei Schweißkontakte zur Li-Ionen-Zelle:

* B+
* B-

## Komponenten

* U1: "LW DD", 6 Pins
  * R1: zwischen U1 und B+
  * R2: zwischen U1 und
  * C1: Entkoppelkondensator für U1
* Q1, Q2: 8205A, Dual N-Kanal MOSFET, 20V, 6A, RDSon 27mR, TSSOP 8-Pin, 1.5W
  * Shop: https://www.shotech.de/de/dual-n-kanal-mosfet-8205a.html
  * Datenblatt: https://www.shotech.de/Datasheet/tw_sho/2209201730_HXY-MOSFET-8205A.pdf
* R3: zwischen T und P-
* R4: zwischen ID und P-


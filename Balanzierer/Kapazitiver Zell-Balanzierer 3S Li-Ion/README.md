
# 3S Kapazitiver Li-Ion-Zell-Balanzierer

* Abmessungen: 36x27x17mm

## Komponenten

* Xinluda XL7555, SO-8: Timer-IC
  * Webseite: https://xinluda.com/en/Clock-and-Time-Base/20240718585.html
  * Datenblatt: https://datasheet4u.com/pdf-down/X/L/7/XL7555-XINLUDA.pdf
* SMD-Widerstände 104, 104
* SMD-Diode "F7"
* SMD-Widerstand 310 (LED-Vorwiderstand)
* unbeschrifteter, SO-8: vermutlich ein Dual Gate-Treiber
* 3x unbeschriftet, SO-8: vermutlich Dual Back-to-Back FETs

Der Gate-Treiber hat (nur) zwei Steuerleitungen, die jeweils zu allen drei FET-ICs führen.

* 5x 1000uF 6.3V

Von den fünf Kondensatoren sind drei in Serie angeordnet und direkt mit den Batterieanschlüssen verbunden.
Zwei weitere sind separat, ebenfalls in Serie, und können vermutlich über die drei FETs mit den anderen dreien verbunden werden.


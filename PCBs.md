
# PCBs

The device consists of three PCBs:

* a display PCB with two buttons, labeled "TDS1-VER3-1-1"
* a power conversion PCB, labeled "XTRA1210N-V4-1-1"
* a communications PCB, labeled "GENA485MK1-V4-1-1"

A large inductor (L11) is soldered to the power PCB and
glued onto the heatsink on the back side of the device.

## User interface PCB

* J1 and J3: 6x6mm push buttons
* LCD1: character LCD of unknown type
* below the LCD there is an unindentified LCD controller IC
* R2: 3k SMD resistor, likely connected to the LCD backlight
* D1 and D2: LCD backlight
* P5: flat cable connector with 20 pins (1mm pitch)

### Power converter PCB

* U4: STM32F030C8T6
* Y1: 8 MHz crystal
* J6: 5 pin header (1.27mm pitch)
    * pin 1: VCC
    * pin 3: GND
    * pins 2, 4 and 5 connected to U4
* P2: 5 pin header (2.54mm pitch)
* P8: 20 pin flat cable connector (1mm pitch)
* F1: 30A car fuse: soldered on, used as through-hole component
* D21: P6KE200A
* P4: RJ-45 socket
* L11: large inductor

### Communications adapter PCB

A small PCB acts as communications adapter.
It is soldered onto the power PCB at P10 and P6,
connecting P4 (RJ-45 socket) to the rest of the circuit.

* U16: IC, SO-8, RS-485 interface controller
* P10 to P4: 4 wires: presumably VCC, GND, differential signal +/-


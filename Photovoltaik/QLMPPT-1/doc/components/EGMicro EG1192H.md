
## 4.2 Pin Description

| Pin | Name      | Type    | Description                                        |
|-----|-----------|---------|----------------------------------------------------|
| 0   | VIN       | passive | Low-side supply / heat-sink pad at the chip bottom |
| 1   | VIN       | passive | Low-side supply                                    |
| 2   | GND       | passive | Low-side ground                                    |
| 3   | EN        | input   | Chip enable, active high                           |
| 4   | VIA       | output  | Output after input power resistor divider          |
| 5   | FB        | input   | Output voltage feedback input (Uref=1.25V)         |
| 6   | VB        | passive | High-side supply (floating)                        |
| 7   | VS        | passive | High-side ground (floating)                        |
| 8   | IS        | input   | overcurrent protection input                       |


# 8. Application Notes

## 8.1 PCB Layout

Place ceramic capacitors between **VIN** and **GND** as well as between **VB** and **VS**, as close as possible to the chip pins.
Maximize the copper area on the back side of the chip for better heat dissipation and higher current output.
Keep high-current paths (**GND**, **VIN**, **VS**, **IS**) as wide and short as possible.

## 8.2 Power Inductor

The EG1192H supports Continuous Conduction Mode (CCM) and Discontinuous Conduction Mode (DCM).
The inductance of the selected power inductor affects operating mode and ripple current.
In light load, EG1192H works in DCM.

The inductance $L$ can be calculated using:

$$
L = \frac{V_{out} (V_{in} - V_{out})}{I_{ripple} F_s V_{in}}
$$

where:
- $V_{in}$: input voltage
- $V_{out}$: output voltage
- $F_s$: PWM switching frequency
- $I_{ripple}$: peak-to-peak inductor ripple current (typically ≤30% of the maximum output current)

## 8.3 Freewheeling Diode

An external freewhelling diode is required to conduct the current when the switch is off.
It's switching speed and forward voltage drop directly affect the DC/DC conversion efficiency.
Use a Schottky diode for fast switching and low forward drop to maximize converter efficiency.

## 8.4 Output Capacitor

Output capacitor $C_o$ filters the output voltage to provide stable DC output.
Choose a large capacitor with low ESR.
It's capacitance is determined by the ripple requirements:

$$
\Delta V_o = \Delta I_L \left(ESR + \frac{1}{8 C_o F_s}\right)
$$

Where:
- $\Delta V_o$: output voltage ripple
- $\Delta I_L$: inductor current ripple
- $F_s$: PWM switching frequency
- $ESR$: equivalent series resistance of capacitor

## 8.5 Output Voltage Setting

The output voltage can be set using a resistor divider at the feedback voltage input pin **FB**.
Reference voltage of the internal error amplifier is $1.25\ \text{V}$.

$$
V_{out} = \left(1 + \frac{R_1}{R_2}\right) \times 1.25\ \text{V}
$$

Example:

$V_{out} = 13.75\ \text{V}$ can be achieved using $R_1 = 10\ \text{k}\Omega$ and $R_2 = 1\ \text{k}\Omega$:

$$
V_{out} = \left(1 + \frac{10}{1}\right) \times 1.25\ \text{V} = 13.75\ \text{V}
$$

Total series resistance is typically between $10\ \text{k}\Omega$ and $100\ \text{k}\Omega$.
It is advisable to stablize **FB** with a ceramic capacitor close to the chip.


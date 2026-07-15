# MAC_UNIT
This is MAC_Unit
<h1 align="center">MAC Unit RTL → GDSII</h1>

<p align="center">
<b>Complete ASIC Implementation using Verilog HDL, OpenLane & Sky130 PDK</b>
</p>

<p align="center">

![Verilog](https://img.shields.io/badge/Language-Verilog-blue)
![OpenLane](https://img.shields.io/badge/OpenLane-ASIC-green)
![Sky130](https://img.shields.io/badge/PDK-Sky130-orange)
![Azure VM](https://img.shields.io/badge/Platform-Azure_VM-blue)
![Ubuntu](https://img.shields.io/badge/OS-Ubuntu-E95420)

</p>

---

# Overview

A **Multiply–Accumulate (MAC)** unit is a fundamental digital hardware component widely used in **Digital Signal Processing (DSP)**, embedded systems, and modern processor architectures. It performs multiplication followed by accumulation in a single operation, making it an essential building block for high-speed arithmetic and signal processing applications.

This repository presents the complete **RTL-to-GDSII ASIC design flow** for a custom **4-bit MAC Unit**, implemented using **OpenLane** with the **Sky130 Process Design Kit (PDK)** on an **Azure Virtual Machine (Ubuntu Linux)**.

The project demonstrates the complete ASIC implementation flow including:

- RTL Design
- Functional Verification
- Logic Synthesis
- Floorplanning
- Power Distribution Network (PDN)
- Placement
- Clock Tree Synthesis (CTS)
- Routing
- Static Timing Analysis (STA)
- Design Rule Checking (DRC)
- Layout Versus Schematic (LVS)
- GDSII Generation

Although this project was implemented on an Azure Virtual Machine running Ubuntu, the same RTL-to-GDSII methodology can be followed on any Linux environment with OpenLane installed.

---

---

# MAC Unit Architecture

<p align="center">
<img src="MAC_UNIT Architecture.jpg" width="420">
</p>

<p align="center">
<b>Figure 1.</b> MAC Unit Block Diagram
</p>

---

# Connecting to Azure Virtual Machine

This project was implemented on an **Azure Virtual Machine (Ubuntu Linux)** with OpenLane and the Sky130 Process Design Kit (PDK) installed.

Connect to the VM using SSH.

```bash
ssh -i "<path-to-your-key>.pem" abhishek@<vm-public-ip>
```

Replace:

- `<path-to-your-key>.pem`
- `<vm-public-ip>`

with your own Azure credentials.

After logging in, all remaining commands are executed inside the VM.

---

# Project Setup

Navigate to the **OpenLane** directory and follow the steps below to create the project structure.

<table>

<tr>
<th width="15%">Step</th>
<th>Description</th>
</tr>

<tr>
<td><b>Step 1</b></td>
<td>

Navigate to the OpenLane directory.

```bash
cd ~/OpenLane
```

</td>
</tr>

<tr>
<td><b>Step 2</b></td>
<td>

Move to the **designs** directory.

```bash
cd designs
```

</td>
</tr>

<tr>
<td><b>Step 3</b></td>
<td>

Create a new project directory.

```bash
mkdir MAC_UNIT
```

</td>
</tr>

<tr>
<td><b>Step 4</b></td>
<td>

Move into the project directory.

```bash
cd MAC_UNIT
```

</td>
</tr>

<tr>
<td><b>Step 5</b></td>
<td>

Create the **src** directory.

```bash
mkdir src
```

</td>
</tr>

<tr>
<td><b>Step 6</b></td>
<td>

Create the **testbench** directory.

```bash
mkdir testbench
```

</td>
</tr>

<tr>
<td><b>Step 7</b></td>
<td>

Verify the project structure.

```bash
tree
```

Expected output:

```text
MAC_UNIT
│
├── src
└── testbench
```

</td>
</tr>

</table>

---

---

# Creating the RTL Files

Move into the source directory.

```bash
cd src
```

Create the following Verilog files.

```bash
gedit multiplier.v
```

```bash
gedit adder.v
```

```bash
gedit accumulator.v
```

```bash
gedit mac.v
```

Paste the corresponding Verilog code into each file and save them.

Verify all files.

```bash
ls
```

Expected output

```text
accumulator.v
adder.v
multiplier.v
mac.v
```

---

# Creating the Testbench

Return to the project directory.

```bash
cd ..
```

Enter the testbench directory.

```bash
cd testbench
```

Create the testbench.

```bash
gedit mac_tb.v
```

Paste the Verilog testbench and save it.

Verify.

```bash
ls
```

Expected output

```text
mac_tb.v
```

---

# Creating config.json

Return to the project directory.

```bash
cd ..
```

Create the OpenLane configuration file.

```bash
gedit config.json
```

Paste the configuration and save it.

Verify.

```bash
ls
```

Expected output

```text
config.json
src
testbench
```

---

# RTL Functional Simulation

Before performing physical design, verify the functionality of the MAC Unit using **Icarus Verilog**.

Navigate to the project directory.

```bash
cd ~/OpenLane/designs/MAC_UNIT
```

Compile the RTL and testbench.

```bash
iverilog -o mac_sim \
src/accumulator.v \
src/adder.v \
src/multiplier.v \
src/mac.v \
testbench/mac_tb.v
```

Run the simulation.

```bash
vvp mac_sim
```

If the RTL is correct, the terminal displays the MAC operation results.

<p align="center">
<img src="terminal_sim.jpg" width="750">
</p>

<p align="center">
<b>Figure 2.</b> RTL Simulation Output
</p>

---

# GTKWave Verification

Generate the waveform file (`dump.vcd`) from the testbench and open it using GTKWave.

```bash
gtkwave dump.vcd
```

Inside GTKWave:

- Select the top-level module (`tb_mac_unit`)
- Add all required signals
- Zoom in to observe the timing relationships

Observe the following signals:

- Clock
- Reset
- Enable
- Input A
- Input B
- Multiplier Output
- Accumulator Output

---

### Adder Waveform

<p align="center">
<img src="Waveform_Adder.png" width="750">
</p>

<p align="center">
<b>Figure 3.</b> Carry Lookahead Adder Verification
</p>

---

### Multiplier Waveform

<p align="center">
<img src="Waveform_Multiplier.png" width="750">
</p>

<p align="center">
<b>Figure 4.</b> Multiplier Verification
</p>

---

### MAC Unit Waveform

<p align="center">
<img src="Waveform_MAC.png" width="750">
</p>

<p align="center">
<b>Figure 5.</b> MAC Unit Functional Verification
</p>

---

# RTL → GDSII ASIC Flow

After successful functional verification, perform the complete ASIC implementation using **OpenLane**.

Move to the OpenLane directory.

```bash
cd ~/OpenLane
```

Start the OpenLane Docker container.

```bash
make mount
```

Launch the complete RTL-to-GDSII flow.

```bash
./flow.tcl -design MAC_UNIT
```

OpenLane automatically performs the following stages:

| Step | Description |
|-------|-------------|
| 1 | Verilator Lint |
| 2 | Logic Synthesis |
| 3 | Static Timing Analysis |
| 4 | Floorplanning |
| 5 | IO Placement |
| 6 | Tap & Decap Cell Insertion |
| 7 | Power Distribution Network (PDN) |
| 8 | Global Placement |
| 9 | Placement Optimization |
| 10 | Detailed Placement |
| 11 | Clock Tree Synthesis (CTS) |
| 12 | Routing |
| 13 | SPEF Extraction |
| 14 | Multi-Corner STA |
| 15 | DRC |
| 16 | LVS |
| 17 | GDSII Generation |

---

## OpenLane Flow

<p align="center">
<img src="Layout_cmd.jpg" width="700">
</p>

<p align="center">
<b>Figure 6.</b> Starting the OpenLane Flow
</p>

---

<p align="center">
<img src="Layout_terminal.jpg" width="700">
</p>

<p align="center">
<b>Figure 7.</b> Synthesis and Floorplanning
</p>

---

<p align="center">
<img src="Layout_terminal_next.jpg" width="700">
</p>

<p align="center">
<b>Figure 8.</b> Placement and Clock Tree Synthesis
</p>

---

<p align="center">
<img src="Layout_terminal_next2.jpg" width="700">
</p>

<p align="center">
<b>Figure 9.</b> Routing and Timing Analysis
</p>

---

<p align="center">
<img src="Layout_terminal_next3.jpg" width="700">
</p>

<p align="center">
<b>Figure 10.</b> Successful RTL-to-GDSII Flow Completion
</p>

---

At the end of the flow, OpenLane displays:

```text
[SUCCESS]: Flow complete.
```

This indicates that the design has successfully passed:

- RTL Verification
- Logic Synthesis
- Floorplanning
- Placement
- Clock Tree Synthesis
- Routing
- Static Timing Analysis
- DRC
- LVS
- GDSII Generation

---

# Generated Design Files

After a successful run, OpenLane generates several implementation files.

```text
results/
│
├── final
│   ├── def
│   ├── gds
│   ├── lef
│   ├── sdc
│   ├── spef
│   └── verilog
│
└── signoff
```

These files are used for ASIC fabrication and post-layout verification.

---

# KLayout Visualization

After the successful completion of the OpenLane flow, locate the generated **GDSII** file.

```bash
find . -name "*.gds"
```

Example output:

```text
./designs/MAC_UNIT/runs/RUN_2026.07.15_07.19.01/results/final/gds/mac_unit.gds
```

Since the implementation was performed on an **Azure Virtual Machine**, the generated **GDSII** file was downloaded to the local system and opened using **KLayout**.

<p align="center">
<img src="GDS_view.jpg" width="850">
</p>

<p align="center">
<b>Figure 11.</b> Generated GDSII File
</p>

---

## KLayout Layout View

The final physical layout of the MAC Unit is visualized using **KLayout**, showing the placement of standard cells, routing, vias, and metal layers generated during the ASIC implementation flow.

<p align="center">
<img src="klayout_mac.jpg" width="750">
</p>

<p align="center">
<b>Figure 12.</b> Final Layout in KLayout
</p>

---

# 3D GDS Visualization

To better visualize the generated layout, upload the **mac_unit.gds** file to the online **Tiny Tapeout GDS Viewer**.

https://gds-viewer.tinytapeout.com/

---

### Top View

<p align="center">
<img src="GDS_3D_View_1.png" width="750">
</p>

<p align="center">
<b>Figure 13.</b> 3D Top View of the Final GDSII Layout
</p>

---

### Isometric View

<p align="center">
<img src="GDS_3D_View_2.png" width="750">
</p>

<p align="center">
<b>Figure 14.</b> 3D Isometric View of the Final GDSII Layout
</p>

---

# Generated Reports

OpenLane automatically generates various reports during the ASIC implementation process.

| Report | Purpose |
|---------|---------|
| `metrics.csv` | Overall design metrics |
| `manufacturability.rpt` | Manufacturability summary |
| `1-synthesis.log` | Logic synthesis report |
| `31-rcx_sta.checks.rpt` | Static Timing Analysis |
| `40-drc.log` | Design Rule Check |
| `39-lvs.log` | Layout Versus Schematic Verification |

These reports help evaluate the performance, timing, area, and correctness of the ASIC design.

---

# Final Results

The MAC Unit successfully completed the complete RTL-to-GDSII implementation flow.

| Design Stage | Status |
|---------------|--------|
| RTL Design | ✅ Completed |
| Functional Simulation | ✅ Passed |
| Verilator Lint | ✅ Passed |
| Logic Synthesis | ✅ Passed |
| Floorplanning | ✅ Passed |
| Power Distribution Network | ✅ Passed |
| Global Placement | ✅ Passed |
| Detailed Placement | ✅ Passed |
| Clock Tree Synthesis | ✅ Passed |
| Routing | ✅ Passed |
| Static Timing Analysis | ✅ Passed |
| SPEF Extraction | ✅ Passed |
| Design Rule Check (DRC) | ✅ No Violations |
| Layout Versus Schematic (LVS) | ✅ Passed |
| GDSII Generation | ✅ Successful |

---

# Source Files

The project consists of the following Verilog modules.

| File | Description |
|------|-------------|
| `multiplier.v` | 4-bit Sequential Shift-and-Add Multiplier |
| `adder.v` | 17-bit Carry Lookahead Adder |
| `accumulator.v` | 17-bit Accumulator |
| `mac.v` | Top-Level MAC Unit |
| `mac_tb.v` | Functional Testbench |
| `config.json` | OpenLane Configuration File |

---

# Tools Used

| Tool | Purpose |
|------|---------|
| Verilog HDL | RTL Design |
| Icarus Verilog | Functional Simulation |
| GTKWave | Waveform Analysis |
| OpenLane | RTL-to-GDSII Flow |
| OpenROAD | Physical Design |
| Sky130 PDK | Standard Cell Library |
| Magic | DRC & GDS Generation |
| KLayout | Layout Visualization |
| Tiny Tapeout GDS Viewer | 3D Layout Visualization |
| Azure Virtual Machine | Cloud-Based Development Environment |

---

# Conclusion

A complete **RTL-to-GDSII ASIC implementation** of a **4-bit Multiply–Accumulate (MAC) Unit** was successfully carried out using the **OpenLane** open-source ASIC flow and the **Sky130 Process Design Kit (PDK)** on an **Azure Virtual Machine (Ubuntu Linux)**.

The design was functionally verified using **Icarus Verilog**, followed by physical implementation through synthesis, floorplanning, placement, clock tree synthesis, routing, timing analysis, DRC, LVS, and GDSII generation. The final layout was successfully visualized using **KLayout** and the **Tiny Tapeout GDS Viewer**, demonstrating a complete open-source ASIC design workflow.

This project provides practical experience with the end-to-end digital ASIC implementation process and serves as a foundation for designing more complex VLSI systems.

---

# Future Scope

This MAC Unit can be extended for more advanced VLSI applications such as:

- ✅ Higher Bit-Width MAC Units (8-bit, 16-bit, 32-bit)
- ✅ Pipelined MAC Architectures
- ✅ High-Speed Carry Lookahead Adders
- ✅ FIR and IIR Digital Filters
- ✅ Systolic Array Architectures
- ✅ Matrix Multiplication Accelerators
- ✅ AI and CNN Hardware Accelerators
- ✅ FPGA-Based Implementations
- ✅ Low-Power ASIC Design Techniques
- ✅ Custom Standard Cell Design

---

# Author

**Abhishek Singh**

B.Tech – Electronics and Communication Engineering (VLSI Design)

Faculty of Technology, University of Delhi

---

## ⭐ If you found this project helpful, consider giving this repository a Star!

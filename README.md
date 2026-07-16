<h1 align="center">4-bit MAC Unit RTL → GDSII ASIC Implementation</h1>

<p align="center">
<b>RTL Design using Cadence • Physical Design using OpenLane & Sky130 PDK</b>
</p>

<p align="center">

![Verilog](https://img.shields.io/badge/Language-Verilog-blue)
![Cadence](https://img.shields.io/badge/EDA-Cadence-red)
![OpenLane](https://img.shields.io/badge/OpenLane-ASIC-green)
![Sky130](https://img.shields.io/badge/PDK-Sky130-orange)
![Azure VM](https://img.shields.io/badge/Platform-Azure_VM-blue)
![Ubuntu](https://img.shields.io/badge/OS-Ubuntu-E95420)

</p>

---

# Table of Contents

- [Overview](#overview)
- [Project Highlights](#project-highlights)
- [Development Workflow](#development-workflow)
- [ASIC Design Flow](#asic-design-flow)
- [MAC Unit Architecture](#mac-unit-architecture)
- [RTL Design using Cadence](#rtl-design-using-cadence)
- [Azure Virtual Machine Setup](#azure-virtual-machine-setup)
- [Project Setup](#project-setup)
- [RTL Verification](#rtl-verification)
- [GTKWave Verification](#gtkwave-verification)
- [RTL → GDSII Flow](#rtl--gdsii-flow)
- [KLayout Visualization](#klayout-visualization)
- [3D GDS Visualization](#3d-gds-visualization)
- [Generated Reports](#generated-reports)
- [Final Results](#final-results)
- [Project Directory](#project-directory)
- [Source Files](#source-files)
- [Tools Used](#tools-used)
- [Challenges Faced](#challenges-faced)
- [Learning Outcomes](#learning-outcomes)
- [Future Scope](#future-scope)
- [References](#references)
- [Author](#author)

---

# Overview

A **Multiply–Accumulate (MAC)** unit is one of the most important arithmetic building blocks used in **Digital Signal Processing (DSP)**, embedded systems, machine learning accelerators, and modern processor architectures. It performs multiplication followed by accumulation in a single operation, enabling high-speed arithmetic computations required in digital systems.

This repository demonstrates the complete **RTL-to-GDSII ASIC implementation** of a custom **4-bit Multiply–Accumulate (MAC) Unit**.

The project was completed in **two development phases**.

### Phase 1 – RTL Design & Functional Verification

The RTL modules were designed using **Verilog HDL** and initially verified in the **Cadence VLSI Design Suite**, where individual modules were developed, integrated, and functionally validated.

### Phase 2 – RTL-to-GDSII ASIC Implementation

Due to restricted access to the university Cadence environment outside the campus network, the verified RTL was migrated to an **Azure Virtual Machine (Ubuntu Linux)**. The complete ASIC implementation was then carried out using the **OpenLane** open-source RTL-to-GDSII flow together with the **Sky130 Process Design Kit (PDK)**.

The implementation includes

- RTL Design
- RTL Verification
- Logic Synthesis
- Floorplanning
- Power Distribution Network (PDN)
- Placement
- Clock Tree Synthesis (CTS)
- Routing
- Static Timing Analysis (STA)
- Design Rule Check (DRC)
- Layout Versus Schematic (LVS)
- GDSII Generation

---

# Project Highlights

- ✅ Custom 4-bit Multiply–Accumulate (MAC) Unit
- ✅ RTL Design using Verilog HDL
- ✅ RTL Schematic Generation using Cadence
- ✅ Functional Verification using Cadence
- ✅ Functional Simulation using Icarus Verilog
- ✅ Waveform Verification using GTKWave
- ✅ RTL-to-GDSII ASIC Flow using OpenLane
- ✅ Sky130 Open-Source Process Design Kit
- ✅ Physical Verification (DRC & LVS)
- ✅ GDSII Layout Generation
- ✅ KLayout Visualization
- ✅ 3D GDS Visualization using Tiny Tapeout Viewer

---

# Development Workflow

The MAC Unit was developed following the workflow shown below.

```text
             Specification
                   │
                   ▼
          RTL Design (Cadence)
                   │
                   ▼
      RTL Schematic Generation
                   │
                   ▼
      Functional Verification
                   │
                   ▼
       Azure Virtual Machine
                   │
                   ▼
             OpenLane Flow
                   │
                   ▼
           Logic Synthesis
                   │
                   ▼
            Floorplanning
                   │
                   ▼
         Power Distribution
                   │
                   ▼
             Placement
                   │
                   ▼
      Clock Tree Synthesis
                   │
                   ▼
              Routing
                   │
                   ▼
      Static Timing Analysis
                   │
                   ▼
             DRC & LVS
                   │
                   ▼
          GDSII Generation
```

---

# ASIC Design Flow

```text
RTL Design
      │
      ▼
RTL Verification
      │
      ▼
Logic Synthesis
      │
      ▼
Floorplanning
      │
      ▼
Power Planning (PDN)
      │
      ▼
Placement
      │
      ▼
Clock Tree Synthesis
      │
      ▼
Routing
      │
      ▼
Static Timing Analysis
      │
      ▼
Design Rule Check
      │
      ▼
Layout Versus Schematic
      │
      ▼
GDSII Generation
```

---

# MAC Unit Architecture

<p align="center">
<img src="mac_architecture.jpg" width="450">
</p>

<p align="center">
<b>Figure 1.</b> Block Diagram of the 4-bit MAC Unit
</p>

The MAC Unit consists of three major hardware blocks.

- **4-bit Shift-and-Add Multiplier**
- **17-bit Carry Lookahead Adder**
- **17-bit Accumulator**

The multiplier computes the product of two 4-bit operands. The Carry Lookahead Adder adds the multiplication result to the accumulated value, while the accumulator stores the intermediate result for the next clock cycle.

---

# RTL Design using Cadence

The RTL modules were initially developed and verified using the **Cadence VLSI Design Suite**. Each module was individually designed and verified before integrating them into the complete MAC Unit.

The RTL schematics generated using Cadence are shown below.

---

## 4-bit Shift-and-Add Multiplier RTL

<p align="center">
<img src="Multiplier_RTL.png" width="800">
</p>

<p align="center">
<b>Figure 2.</b> RTL Schematic of the 4-bit Shift-and-Add Multiplier generated using Cadence
</p>

---

## 17-bit Carry Lookahead Adder RTL

<p align="center">
<img src="Adder_RTL.png" width="800">
</p>

<p align="center">
<b>Figure 3.</b> RTL Schematic of the 17-bit Carry Lookahead Adder generated using Cadence
</p>

---

## 17-bit Accumulator RTL

<p align="center">
<img src="Accumulator_RTL.png" width="800">
</p>

<p align="center">
<b>Figure 4.</b> RTL Schematic of the 17-bit Accumulator generated using Cadence
</p>

---

## Top-Level MAC Unit RTL

<p align="center">
<img src="MAC_RTL.png" width="850">
</p>

<p align="center">
<b>Figure 5.</b> RTL Schematic of the Complete MAC Unit generated using Cadence
</p>

---

# Azure Virtual Machine Setup

The complete **RTL-to-GDSII ASIC implementation** was carried out on an **Azure Virtual Machine (Ubuntu Linux)** with **OpenLane** and the **Sky130 Process Design Kit (PDK)** installed.

Connect to the Azure VM using SSH.

```bash
ssh -i "<path-to-your-key>.pem" abhishek@<vm-public-ip>
```

Replace the placeholder values with your own:

- `<path-to-your-key>.pem`
- `<vm-public-ip>`

Once connected, all remaining commands in this repository are executed inside the Azure Virtual Machine.

---

# Project Setup

Navigate to the **OpenLane** directory and follow the steps below.

<table>

<tr>
<th width="15%">Step</th>
<th>Description</th>
</tr>

<tr>
<td><b>Step 1</b></td>
<td>

Navigate to the **OpenLane** designs directory and create a new project.

```bash
cd ~/OpenLane
cd designs
mkdir MAC_UNIT
cd MAC_UNIT
```

</td>
</tr>

<tr>
<td><b>Step 2</b></td>
<td>

Create the required project directories.

```bash
mkdir src
mkdir testbench
```

</td>
</tr>

<tr>
<td><b>Step 3</b></td>
<td>

Move into the **src** directory and create the RTL modules.

```bash
cd src

nano multiplier.v
nano adder.v
nano accumulator.v
nano mac.v
```

Copy the corresponding Verilog code into each file, save it, and exit the editor.

</td>
</tr>

<tr>
<td><b>Step 4</b></td>
<td>

Return to the project directory and create the testbench.

```bash
cd ..
cd testbench

nano mac_tb.v
```

Copy the testbench code into the file, save it, and exit the editor.

</td>
</tr>

<tr>
<td><b>Step 5</b></td>
<td>

Return to the project directory and create the OpenLane configuration file.

```bash
cd ..

nano config.json
```

Copy the OpenLane configuration into the file, save it, and exit the editor.

</td>
</tr>

<tr>
<td><b>Step 6</b></td>
<td>

Verify that all project files have been created successfully.

```bash
tree
```

</td>
</tr>

</table>

> **Note:** While using `nano`, press **Ctrl + O** to save the file, press **Enter** to confirm, and then press **Ctrl + X** to exit the editor.

---

# RTL Verification

Before beginning the ASIC implementation, the RTL modules were verified to ensure correct functionality.

The verification process consisted of:

- RTL compilation
- Functional simulation
- Waveform generation
- Output verification

The complete MAC Unit was simulated using **Icarus Verilog**.

---

# RTL Compilation

Navigate to the project directory.

```bash
cd ~/OpenLane/designs/MAC_UNIT
```

Compile all RTL source files together with the testbench.

```bash
iverilog -o mac_sim \
src/accumulator.v \
src/adder.v \
src/multiplier.v \
src/mac.v \
testbench/mac_tb.v
```

If the compilation is successful, no errors will be displayed.

---

# Functional Simulation

Execute the compiled simulation.

```bash
vvp mac_sim
```

The terminal displays the multiplication and accumulation results generated by the testbench.

<p align="center">
<img src="terminal_sim.jpg" width="750">
</p>

<p align="center">
<b>Figure 6.</b> Functional Simulation Output
</p>

---

# Simulation Workflow

```text
Verilog RTL
      │
      ▼
Testbench
      │
      ▼
Icarus Verilog Compiler
      │
      ▼
Simulation
      │
      ▼
dump.vcd
      │
      ▼
GTKWave
```

---

# GTKWave Verification

The testbench generates a **dump.vcd** file that stores all signal transitions during simulation.

Open the waveform using GTKWave.

```bash
gtkwave dump.vcd
```

Within GTKWave,

- Select the top-level module **tb_mac_unit**
- Add the required signals
- Zoom appropriately
- Verify all outputs

Signals verified include:

- Clock
- Reset
- Enable
- Input A
- Input B
- Multiplier Output
- Accumulator Output
- MAC Output

---

## Carry Lookahead Adder Waveform

<p align="center">
<img src="Waveform_Adder.png" width="800">
</p>

<p align="center">
<b>Figure 7.</b> Functional Verification of the Carry Lookahead Adder
</p>

---

## Multiplier Waveform

<p align="center">
<img src="Waveform_Multiplier.png" width="800">
</p>

<p align="center">
<b>Figure 8.</b> Functional Verification of the 4-bit Shift-and-Add Multiplier
</p>

---

## MAC Unit Waveform

<p align="center">
<img src="Waveform_MAC.png" width="800">
</p>

<p align="center">
<b>Figure 9.</b> Functional Verification of the Complete MAC Unit
</p>

---

# Verification Summary

The RTL verification confirms that:

- The multiplier correctly computes the product of two 4-bit operands.
- The Carry Lookahead Adder performs high-speed addition.
- The accumulator correctly stores the accumulated result.
- The top-level MAC Unit performs multiplication followed by accumulation.
- All outputs match the expected functional behavior.

After successful RTL verification, the verified RTL design is ready for ASIC implementation using the OpenLane RTL-to-GDSII flow.

---

# RTL → GDSII ASIC Implementation

After successful RTL verification, the complete ASIC implementation was performed using the **OpenLane** open-source RTL-to-GDSII flow together with the **Sky130 Process Design Kit (PDK)**.

OpenLane integrates several open-source EDA tools, including **Yosys**, **OpenROAD**, **Magic**, **Netgen**, and **KLayout**, to automate the complete digital ASIC implementation process.

---

# OpenLane Design Flow

The complete physical implementation follows the sequence shown below.

```text
RTL Design
     │
     ▼
Logic Synthesis
     │
     ▼
Floorplanning
     │
     ▼
IO Placement
     │
     ▼
Power Distribution Network
     │
     ▼
Global Placement
     │
     ▼
Detailed Placement
     │
     ▼
Clock Tree Synthesis
     │
     ▼
Routing
     │
     ▼
Static Timing Analysis
     │
     ▼
DRC & LVS
     │
     ▼
GDSII Generation
```

---

# Launching OpenLane

Navigate to the OpenLane directory.

```bash
cd ~/OpenLane
```

Launch the Docker container.

```bash
make mount
```

Run the complete RTL-to-GDSII flow.

```bash
./flow.tcl -design MAC_UNIT
```

OpenLane automatically executes every stage of the ASIC implementation.

---

# OpenLane Execution

<p align="center">
<img src="Layout_cmd.jpg" width="850">
</p>

<p align="center">
<b>Figure 10.</b> Starting the OpenLane RTL-to-GDSII Flow
</p>

---

# ASIC Implementation Stages

## 1. Verilator Lint

The RTL source files are first checked using **Verilator** to identify syntax issues, unsupported constructs, and coding errors before synthesis.

✔ RTL Linting

✔ Syntax Checking

✔ Coding Style Verification

---

## 2. Logic Synthesis

The RTL design is synthesized into a gate-level netlist using **Yosys**.

Tasks performed:

- RTL Elaboration
- Logic Optimization
- Technology Mapping
- Standard Cell Mapping

<p align="center">
<img src="Layout_terminal.jpg" width="850">
</p>

<p align="center">
<b>Figure 11.</b> Logic Synthesis
</p>

---

## 3. Floorplanning

The physical dimensions of the ASIC are determined during floorplanning.

This stage defines:

- Core Area
- Die Area
- Cell Rows
- IO Locations
- Power Ring

---

## 4. IO Placement

The input and output pins are automatically placed around the boundary of the chip according to the OpenLane configuration.

---

## 5. Power Distribution Network (PDN)

Power rails are generated to distribute:

- VPWR
- VGND

throughout the complete design.

The generated PDN ensures reliable power delivery to every standard cell.

---

## 6. Global Placement

During placement, all synthesized standard cells are positioned inside the core area.

Objectives include:

- Reduced Wirelength
- Lower Congestion
- Better Timing

<p align="center">
<img src="Layout_terminal_next.jpg" width="850">
</p>

<p align="center">
<b>Figure 12.</b> Placement Stage
</p>

---

## 7. Clock Tree Synthesis (CTS)

A balanced clock distribution network is generated.

CTS minimizes

- Clock Skew
- Clock Delay

and improves synchronous operation of sequential elements.

---

## 8. Routing

Routing connects all standard cells using the available metal layers.

OpenLane performs

- Global Routing
- Detailed Routing

<p align="center">
<img src="Layout_terminal_next2.jpg" width="850">
</p>

<p align="center">
<b>Figure 13.</b> Routing Stage
</p>

---

## 9. Static Timing Analysis (STA)

Static Timing Analysis verifies that the design satisfies

- Setup Timing
- Hold Timing

The MAC Unit successfully completed timing analysis without setup or hold violations.

---

## 10. Design Rule Check (DRC)

Magic verifies that the final layout satisfies all manufacturing design rules.

Result

✔ No DRC Violations

---

## 11. Layout Versus Schematic (LVS)

Netgen compares

- Layout Netlist
- Schematic Netlist

to ensure functional equivalence.

Result

✔ LVS Passed

---

## 12. GDSII Generation

Finally, OpenLane generates the complete fabrication-ready **GDSII** layout.

<p align="center">
<img src="Layout_terminal_next3.jpg" width="850">
</p>

<p align="center">
<b>Figure 14.</b> Successful Completion of the OpenLane Flow
</p>

---

# Successful Flow Completion

The OpenLane terminal displays

```text
[SUCCESS]: Flow complete.
```

This indicates successful completion of

- RTL Elaboration
- Logic Synthesis
- Floorplanning
- IO Placement
- Power Distribution
- Placement
- Clock Tree Synthesis
- Routing
- Static Timing Analysis
- DRC
- LVS
- GDSII Generation

---

# Generated Design Files

The OpenLane flow automatically generates several implementation files.

```text
results/
│
├── final
│   ├── def
│   ├── gds
│   ├── lef
│   ├── sdc
│   ├── spef
│   ├── verilog
│   └── mag
│
├── routing
│
├── placement
│
└── signoff
```

The generated files are used for:

- Physical Verification
- Timing Analysis
- Layout Visualization
- ASIC Fabrication

---

# KLayout Visualization

Locate the generated GDSII file.

```bash
find . -name "*.gds"
```

Example output

```text
./designs/MAC_UNIT/runs/RUN_xxxxx/results/final/gds/mac_unit.gds
```

Since the project was implemented on an **Azure Virtual Machine**, the generated GDSII file was downloaded to the local machine and opened using **KLayout**.

<p align="center">
<img src="GDS_view.jpg" width="900">
</p>

<p align="center">
<b>Figure 15.</b> Generated GDSII File
</p>

---

## Final Physical Layout

The completed layout consists of

- Standard Cells
- Metal Layers
- Vias
- Power Rails
- Signal Routing

generated automatically by the OpenLane physical design flow.

<p align="center">
<img src="klayout_mac.jpg" width="800">
</p>

<p align="center">
<b>Figure 16.</b> Final MAC Unit Layout in KLayout
</p>

---

# 3D GDS Visualization

To further visualize the generated ASIC layout, the final **GDSII** file was uploaded to the **Tiny Tapeout GDS Viewer**, which provides an interactive three-dimensional representation of the fabricated layout.

Tiny Tapeout GDS Viewer

https://gds-viewer.tinytapeout.com/

---

## Top View

<p align="center">
<img src="GDS_3D_View_1.png" width="850">
</p>

<p align="center">
<b>Figure 17.</b> Top View of the Final GDSII Layout
</p>

---

## Isometric View

<p align="center">
<img src="GDS_3D_View_2.png" width="850">
</p>

<p align="center">
<b>Figure 18.</b> Isometric View of the Final GDSII Layout
</p>

---

# Generated Reports

During the OpenLane implementation, several reports were generated to verify the correctness and quality of the design.

| Report | Description |
|---------|-------------|
| `metrics.csv` | Overall implementation metrics |
| `manufacturability.rpt` | Manufacturability summary |
| `1-synthesis.log` | Logic synthesis report |
| `31-rcx_sta.checks.rpt` | Static Timing Analysis report |
| `40-drc.log` | Design Rule Check report |
| `39-lvs.log` | Layout Versus Schematic verification |

These reports provide information regarding:

- Logic synthesis
- Timing analysis
- Physical verification
- Routing statistics
- Manufacturability
- Layout correctness

---

# Final Results

The MAC Unit successfully completed the complete **RTL-to-GDSII ASIC implementation**.

| Stage | Status |
|--------|--------|
| RTL Design | ✅ Completed |
| RTL Verification | ✅ Passed |
| RTL Schematic Generation | ✅ Completed |
| Functional Simulation | ✅ Passed |
| GTKWave Verification | ✅ Passed |
| Logic Synthesis | ✅ Passed |
| Floorplanning | ✅ Passed |
| IO Placement | ✅ Passed |
| Power Distribution Network | ✅ Passed |
| Placement | ✅ Passed |
| Clock Tree Synthesis | ✅ Passed |
| Routing | ✅ Passed |
| Static Timing Analysis | ✅ Passed |
| SPEF Extraction | ✅ Passed |
| DRC | ✅ No Violations |
| LVS | ✅ Passed |
| GDSII Generation | ✅ Successful |

---

# Project Directory

```text
MAC_UNIT
│
├── config.json
│
├── src
│   ├── multiplier.v
│   ├── adder.v
│   ├── accumulator.v
│   └── mac.v
│
├── testbench
│   └── mac_tb.v
│
└── runs
    └── RUN_2026.xx.xx_xx.xx.xx
        ├── logs
        ├── reports
        └── results
```

---

# Source Files

| File | Description |
|------|-------------|
| `multiplier.v` | 4-bit Shift-and-Add Multiplier |
| `adder.v` | 17-bit Carry Lookahead Adder |
| `accumulator.v` | 17-bit Accumulator |
| `mac.v` | Top-Level MAC Unit |
| `mac_tb.v` | Functional Testbench |
| `config.json` | OpenLane Configuration |

---

# Tools Used

| Tool | Purpose |
|------|---------|
| Verilog HDL | RTL Design |
| Cadence VLSI Design Suite | RTL Design & Schematic Generation |
| Cadence Simulator | Functional Verification |
| Icarus Verilog | RTL Simulation |
| GTKWave | Waveform Verification |
| OpenLane | RTL-to-GDSII ASIC Flow |
| OpenROAD | Physical Design |
| Sky130 Process Design Kit (PDK) | Standard Cell Library |
| Magic | DRC & Layout Generation |
| Netgen | LVS Verification |
| KLayout | GDSII Visualization |
| Tiny Tapeout GDS Viewer | 3D Layout Visualization |
| Azure Virtual Machine (Ubuntu Linux) | Cloud-Based Development Environment |

---

# Challenges Faced

During the implementation of this project, several practical challenges were encountered and successfully resolved.

- Limited access to the university Cadence environment outside the campus network.
- Migration of the RTL design from Cadence to the Azure Virtual Machine.
- Configuration of the OpenLane design environment.
- Resolution of `DESIGN_NAME` mismatch during synthesis.
- Separation of the testbench from the synthesizable RTL.
- Configuration of the `pin_order.cfg` file.
- Debugging OpenLane configuration issues.
- Successful completion of the complete RTL-to-GDSII implementation.

These challenges provided valuable practical experience with debugging and ASIC implementation.

---

# Learning Outcomes

This project provided practical exposure to the complete digital ASIC implementation flow.

Key learning outcomes include:

- RTL Design using Verilog HDL
- RTL Schematic Generation using Cadence
- Functional Verification
- Testbench Development
- Waveform Analysis using GTKWave
- Logic Synthesis
- Floorplanning
- IO Placement
- Power Distribution Network Design
- Standard Cell Placement
- Clock Tree Synthesis
- Routing
- Static Timing Analysis
- Design Rule Checking (DRC)
- Layout Versus Schematic (LVS)
- GDSII Generation
- Physical Layout Visualization using KLayout

---

# Future Scope

The implemented MAC Unit can be extended for more advanced digital hardware applications.

Possible future enhancements include:

- Higher Bit-Width MAC Units (8-bit, 16-bit, and 32-bit)
- Fully Pipelined MAC Architectures
- High-Speed Arithmetic Units
- FIR and IIR Digital Filters
- Systolic Array Architectures
- Matrix Multiplication Engines
- DSP Accelerators
- CNN Hardware Accelerators
- FPGA-Based Implementations
- Low-Power ASIC Optimization
- Custom Standard Cell Design

---

# References

- OpenLane Documentation
- OpenROAD Documentation
- SkyWater SKY130 PDK Documentation
- Cadence VLSI Design Suite Documentation
- Tiny Tapeout Documentation
- KLayout Documentation

---

# Author

## Abhishek Singh

**B.Tech. Electronics and Communication Engineering (VLSI Design)**

Faculty of Technology

University of Delhi

---

## Acknowledgement

I would like to express my sincere gratitude to the **Faculty of Technology, University of Delhi**, for providing access to the Cadence VLSI Design Suite and the academic resources required for the initial stages of this project.

I also acknowledge the open-source ASIC community, particularly the developers of **OpenLane**, **OpenROAD**, **Sky130 PDK**, **Magic**, **Netgen**, **KLayout**, and **Tiny Tapeout**, whose tools made the complete RTL-to-GDSII implementation possible.

---

## ⭐ If you found this project useful, consider giving this repository a Star!

The verified RTL modules were then migrated to the Azure Virtual Machine for complete ASIC implementation using the OpenLane flow.

---

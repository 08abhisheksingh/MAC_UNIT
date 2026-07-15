# MAC_UNIT
This is MAC UNIT
<h1 align="center"> MAC Unit RTL → GDSII</h1>

<p align="center">
<b>Complete ASIC Implementation using Verilog HDL, OpenLane & Sky130 PDK</b>
</p>

<p align="center">

![Verilog](https://img.shields.io/badge/Language-Verilog-blue)
![OpenLane](https://img.shields.io/badge/OpenLane-ASIC-green)
![Sky130](https://img.shields.io/badge/PDK-Sky130-orange)
![Ubuntu](https://img.shields.io/badge/OS-Ubuntu-E95420)

</p>

---

# Overview

A **Multiply–Accumulate (MAC)** unit is a digital hardware block widely used in **Digital Signal Processing (DSP)** and computer architectures. 

This repository demonstrates the complete **RTL → GDSII** ASIC implementation flow of a custom **4-bit MAC Unit** using **Ubuntu**, **OpenLane**, and the **Sky130 Process Design Kit (PDK)**.

The overall ASIC implementation flow remains the same across platforms (Ubuntu, Azure VM, etc.); only the installation and terminal commands vary slightly.

---

# MAC Unit Architecture

<p align="center">
<img src="mac_architecture.jpg" width="350">
</p>

<p align="center">
<b>Figure 1.</b> MAC_UNIT Architecture.png
</p>

---

# Connecting to the Cloud VM

This project was implemented on a cloud VM running Ubuntu with OpenLane and the Sky130 PDK pre-installed. Connect to the VM over SSH using your private key before starting the setup steps below.

```bash
ssh -i "<path-to-your-key>.pem" abhishek@<vm-ip-address>
```

> **Note:** Replace `<path-to-your-key>.pem` and `<vm-ip-address>` with your own key file path and VM IP address. Keeping these as placeholders in the public README avoids exposing real connection details.

Once connected, all subsequent commands in this guide are run inside the VM's terminal.

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

Create a new project directory.

<pre><code>mkdir MAC_unit</code></pre>

</td>
</tr>

<tr>
<td><b>Step 2</b></td>
<td>

Move into the project directory.

<pre><code>cd MAC_unit</code></pre>

</td>
</tr>

<tr>
<td><b>Step 3</b></td>
<td>

Create the <code>src</code> directory.

<pre><code>mkdir src</code></pre>

</td>
</tr>

<tr>
<td><b>Step 4</b></td>
<td>

Move into the source directory and create the CLA module.

<pre><code>cd src
gedit cla.v</code></pre>

Paste the CLA Verilog code, save the file, and close the editor.

</td>
</tr>

<tr>
<td><b>Step 5</b></td>
<td>

Repeat the same process for:

<ul>

<li><code>multiplier.v</code></li>

<li><code>acc.v</code></li>

<li><code>mac.v</code></li>

<li><code>mac_tb.v</code></li>

</ul>

After creating each file, verify using

<pre><code>ls</code></pre>

</td>
</tr>

<tr>
<td><b>Step 6</b></td>
<td>

Return to the project directory.

<pre><code>cd ..</code></pre>

</td>
</tr>

<tr>
<td><b>Step 7</b></td>
<td>

Create the OpenLane configuration file.

<pre><code>gedit config.json</code></pre>

Paste the configuration code and save it.

</td>
</tr>

</table>

<td>
<img src="terminal_view.jpg" width="500">
</td>

<p align="center">
<b>Figure 2.</b> Terminal View
</p>
---

# RTL Simulation

Move into the **src** directory and compile the design.

```bash
iverilog -o mac_sim acc.v cla.v multiplier.v mac.v mac_tb.v
```

Run the simulation.

```bash
vvp mac_sim
```

After successful execution, the terminal should display the simulation output.

<p align="center">
<img src="terminal_sim.jpg" width="700">
</p>

<p align="center">
<b>Figure 3.</b> RTL Simulation Output
</p>

---

# GTKWave Verification

Open the waveform.

```bash
gtkwave dump.vcd
```

Inside GTKWave:

- Select **tb_mac_unit**
- Add the required signals
- Adjust the zoom level to inspect the waveform

<p align="center">
<img src="Waveform_Adder.png" width="700">
</p>

<p align="center">
<b>Figure 4.</b> Adder Waveform
</p>

<p align="center">
<img src="Waveform_Multiplier.png" width="700">
</p>

<p align="center">
<b>Figure 5.</b> Multiplier Waveform
</p>

<p align="center">
<img src="Waveform_MAC.png" width="700">
</p>

<p align="center">
<b>Figure 6.</b> MAC Waveform
</p>

---

# RTL → GDSII Flow

Return to the **OpenLane** directory.

```bash
cd ~/OpenLane
```

Launch the Docker container.

```bash
make mount
```

Run the complete OpenLane flow.

```bash
./flow.tcl -design MAC_unit
```

OpenLane will automatically perform:

- RTL Elaboration
- Logic Synthesis
- Floorplanning
- Placement
- Clock Tree Synthesis
- Routing
- DRC
- LVS
- GDSII Generation

<table>

<tr>

<td>
<img src="Layout_cmd.jpg" width="600">
</td>

<td>
<img src="Layout_terminal.jpg" width="600">
</td>

</tr>

<tr>

<td>
<img src="Layout_terminal_next.jpg" width="600">
</td>

<td>
<img src="Layout_terminal_next2.jpg" width="600">
</td>

</tr>

<tr>

<td colspan="2" align="center">
<img src="Layout_terminal_next3.jpg" width="600">
</td>

</tr>

</table>

> Ignore minor warnings if present. The important message is:

```text
SUCCESS : Flow Complete
```

---

# KLayout Visualization

Locate the generated GDSII file.

```bash
find . -name "*.gds"
```

Open the generated layout.

```bash
klayout <path_to_gds_file>
```

<p align="center">
<img src="GDS_view.jpg" width="850">
</p>

<p align="center">
<b>Figure 7.</b> Generated GDSII File
</p>

<p align="center">
<img src="klayout_mac.jpg" width="750">
</p>

<p align="center">
<b>Figure 8.</b> KLayout View
</p>

---

# 3D GDS Visualization

Copy the generated **.gds** file and upload it to

**Tiny Tapeout GDS Viewer**

https://gds-viewer.tinytapeout.com/

<p align="center">
<img src="GDS_3D_View_1.png" width="700">
</p>

<p align="center">
<b>Figure 9.</b> 3D Visualization of the Final GDSII Layout (Top View)
</p>

<p align="center">
<img src="GDS_3D_View_2.png" width="700">
</p>

<p align="center">
<b>Figure 10.</b> 3D Visualization of the Final GDSII Layout (Isometric View)
</p>

---

# Source Files

The project consists of the following Verilog modules.

| File | Description |
|------|-------------|
| `multiplier.v` | Sequential Shift-and-Add Multiplier |
| `cla.v` | 17-bit Carry Lookahead Adder |
| `acc.v` | 17-bit Accumulator |
| `mac.v` | Top-level MAC Module |
| `mac_tb.v` | Functional Testbench |
| `config.json` | OpenLane Configuration |

---

# Conclusion

The complete **RTL → GDSII** implementation of the **MAC Unit** has been successfully demonstrated.

This design can be further extended into:

- ✅ Multi-MAC Arrays
- ✅ Pipelined Architectures
- ✅ Systolic Arrays
- ✅ Matrix Multiplication Engines
- ✅ CNN / AI Accelerators
- ✅ FPGA Implementations

---

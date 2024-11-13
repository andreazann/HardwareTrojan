# HATE (HArdware Trojan Emulation Environment)

The project introduces HATE (HArdware Trojan Emulation Environment), a tool designed to emulate and analyze hardware Trojan Horses (HWTs) in microprocessor-based systems. 
HATE helps determine whether specific software can activate HWTs and evaluates the effectiveness of HWT detection techniques. It can generate and inject different types of 
HWTs into microprocessors and monitor their activation and effects during software execution, providing a comprehensive analysis framework for hardware security research.

Paper available here [HardwareTrojanPaper.pdf](https://github.com/user-attachments/files/17737564/HardwareTrojanPaper.pdf)

<img width="883" alt="hw-troj-image" src="https://github.com/user-attachments/assets/ea1f4f47-1ae2-46e8-9b89-af142363854e">

## Instructions for use:

1. Setup and Requirements:
* Ensure that the GNU Debugger (GDB) is installed for collecting execution dumps.
* The HATE environment should be configured on a system that can run Bash scripts and supports C and Java programs.

2. Execution Dump Generator (EDG):
- Generate the assembly code of the program you wish to analyze (in our case ordinaArray.s obtained from ordinaArray.c) and create a configuration file detailing the number of executions and input data for each run.
- Generate the a.out from the *.s file using gcc
- Run the EDG (SecondaVersione/DumpGenerator.java) to gather execution dumps from the microprocessor by interacting with GDB.

3. Hardware Trojan Generator (HTG):
- Provide an architecture description and specify configurations for HWT types (e.g., maximum number of registers or states in sequence or in combination in order to trigger a trojan).
- Run HTG to generate HWTs, which can be either random or custom-specified, output file is in "Programma c/GeneratedTrigger.txt".

4. Hardware Trojan Finder (HTF):
- Input the generated execution dumps (SecondaVersione/gdb.txt) and the list of HWTs (Programma c/GeneratedTrigger.txt) to check for activation conditions.
- HTF (Programma c/ricerca.c) will analyze the dumps and produce a report detailing activated HWTs and the conditions that triggered them.

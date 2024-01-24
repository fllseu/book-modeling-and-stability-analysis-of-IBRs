# Chapter 6 Grid forming (GFM) control

6.1 Multi-loop GFM: from GFL to GFM 

6.2 GFM1: advatanced GFL

6.3 GFM2: the conventiaonl design (based on Yazdani's green book chapter 9)

6.4 GFM3: minimal edits - a new design 

6.5 Virtual synchronous machines (VSM)

6.6 Summary

In this chapter, four testbeds (GFM1, GFM2, GM3, and VSM) are shown in Figs 6.2, 6.6, 6.9, 6.11.
The foler contains one testbed that can be quickly turned into four differnt testbeds.

testbed_overall.slx is the simscape model built in MATLAB 2022a. GFM1, GFM2, GFM3, VSM1 stand for the four types of control structures. Use either one of them and comment out the rest. GFM1 can be viewed as a GFL-IBR with additional frequency and voltage droop control. 
GFM_initial.m is the data file assigning parameters to the testbed. 

Fan, L., & Miao, Z. (2023). Modeling and Stability Analysis of Inverter-Based Resources. CRC Press.

@book{fan2023modeling,
  title={Modeling and Stability Analysis of Inverter-Based Resources},
  author={Fan, Lingling and Miao, Zhixin},
  year={2023},
  publisher={CRC Press}
}

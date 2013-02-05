

Chapter 1
====

This chapter aims to put the work in a real-world context as well as
briefly define the scope of the work. 

Chapter 2 - operation
====

This chapter provides background information relating to electrical power systems and how electricity markets operate. It does this in preparation for a more detailed discussion on likely changes in future powers systems in a later chapter. 

After briefly discussing some of the main issues that face electrical power systems the factors that affect generators are discussed. These are looked at further in the chapters on the future of power systems and simulation techniques. 

Chapter 3 - security
====

There is a lot of confusion surrounding definitions in the area of power system reliability and security. This chapter defines all the related terms and provides examples related to the work carried out. It also helps define the scope of the work. This work looks at security, hence, while adequacy is important, it is not a central theme of this work. Finally two different types of security assessment are defined; this will be revisited in detail in the chapter on simulation.

Chapter 4 - future
====

This chapter aims to provide the reader with a good understanding of the components of a future electrical power system. These are split into three areas: generation, demand side management, and network & operation. After looking at these components it is decided that large scale wind farms are the most interesting area of study both for their likelihood of being installed in large numbers, and the new challenges that they will bring. Smart appliances, including electrical vehicles, were identified as an interesting area of study but are beyond the scope of this work.

Chapter 5 - simulation
====

There are different techniques for reasoning about a power system. This chapter compares different methods. Two in particular, load-flow and dynamic simulations, are explored in detail. This is due to the fact that simulation accuracy and speed are vitally important to the success of the proposed work. There was extensive work done to try and create a very fast dynamic power system simulator. This presented a few promising areas of future work. The chapter ends with a detailed look at the specifics of modelling wind farms. 

Chapter 6 - SAS
====

This chapter sets out exactly what is required in a security assessment scheme. It then performs a thorough literature review of security assessment focusing on comparisons between deterministic and probabilistic methods. This leads to an analysis that forms the basis of the novel work presented in later chapters. The chapter finishes by detailing how N-1 security and by extension deterministic security assessment schemes have problems that are likely to worsen. 

Chapter 7 - comparing SAS
====

This chapter covers how security assessment schemes are themselves assessed. It then proceeds to detail the creation of a new method for comparing security assessment schemes. The possible applications and limitations are explored in detail. 

Chapter 8 - results
====

The testing of the Monte Carlo sampling program that is central to the work shows that it accurately represents the underling system. 

Chapter 9 - XYZ
====

\section{Chapter Summary}

Here, a new SAS is presented that takes into account three parameters. Firstly, outages on the system; secondly, errors in wind forecast; and finally, errors in load forecast. The method is applied by running a genetic algorithm to find the least stable state. If the system in the least stable state is still acceptable then the overall system is also acceptable. 

Chapter 10 - conclusion
====


Chapter 11 - further
====


------------------------------



There are four main data types each associated with a file type. 

 + The `PsatData` type is a Matlab file containing information for PSAT about a specific scenario to be simulated, this file is used by Matlab to produce a simulation report. The files end in `.m`. More information on this can be obtained from the PSAT documentation. 

 + `PsatReport` is the report produced my Matlab after a simulation is run. It contains power flows, losses and bus bar voltages. It is meant to be analysed by hand and hence it requires parsing to be interpreted by a computer. Report files end in `_XX.txt` where XX is a incrementing number. 

 + `NetworkProbability` is a data file containing the probability of failure of various components as well as joint failure of different components. It creates scenarios from a network probability data file. Probability files end in `.net`. 

 + `SimulationBatch` files hold a list of scenarios. Each scenario contains the changes that have occurred such as a line outage or a change in demand. Batch files can optionally contain simplified simulation results. Batch files end in `.bch`.

It was decided that communicating directly with PSAT inside Matlab would be too complex. Hence to run a simulation the data is saved to disk then Matlab is run as an external program and the results file are read back in from disk. This process, although complex and slow, worked correctly. It would make more sense to use a program that properly supported data streams to avoid the slow hard drive access and one that was meant to be run from a command line.

Due to the slow start-up and shutdown time of Matlab simulations were done in batches. By grouping simulations this way Matlab could process many simulations each time it was started. By programming in this way if multiple computer or multiple cores were available it would be trivial to parallelize the program.

[[flow diagram]]

In the flow diagram \ref{XXX} the process for Stage 1 is detailed. Here it includes simulation but that is not strictly necessary. In addition to the batch file it was possible to gather statistics about the samples and simulations. These statistics are analysed later.

---------------------------------------------


The IEEE-RTS supplied data for demand level that is based upon the season, hour and week. This section looks at how the load level fluctuates then uses the MCS to form aggregate data. 

[[Hour of Day]]
[[Week of year]]

With the changes over a day note how, as expected, the power use is much lower during the night, it ramps up rapidly from 5am reaching its first peak around 9am, then depending on the specific week observed it either tails off or hold steady until the evening peak between 6pm and 8pm. Week 1, being the start of January is notably higher than the other weeks due to extra energy usage for space heating and, in the evening, lights. 

The yearly changes appear much more stochastic. The most notable trends are a much lower energy usage at weekends as well as the seasonal variation causing higher energy use in winter periods. 

[[stage1 load forecast]]

When sampled this data-set give the probability density as shown in \ref{XXX}. In this graph the demand forecast has been quantised to the nearest 0.05. Note that only a very small percentage of samples are at the full demand level (only 603 out of one million samples in the run shown in the graph). Also note that there is a reasonable high probability that the system will be running at 35% of its maximum. It is not unreasonable to expect wind power alone to meet this demand level which could cause significant problems if not enough spinning reserve was available. As this graph shows the fraction of samples of a given power level it also serves as a good approximation to the probability of a sample having the given load forecast at the end of Stage 1. 

Stage 2 took the load forecast and create a forecast error. This was simple taken as a normal distribution. The results of quantisation give the graph in \ref{XXX}. It has a relatively small effect when compared to the forecast itself but a 10\% increase in power demand is significant both in it's frequency and effect.


---------------------------------------------

[[outage numbers]]
[[failure numbers]]

Looking at the number of components that have failed or are on outage in each sample give the graphs in \ref{XXX} and \ref{XXX}. Rather unexpectedly it says that up to 8 simultaneous component outages can occur in one million samples. This would seriously weaken the network. There is a 77\% change of at least one component outage, hence it is much more likely that the system is not at it's full generating capacity. Generator failures accounted for most of these outages with only 3\% of samples having at least one line failure and only 0.1\% of samples having any busbar failures. 

Stage 2 outages, or components failures, tell a similar story on a much smaller scale. These represent problems that occur to the system during delivery. This means that in 4 samples out of a million, three unrelated failures all occurred within the same half hour period. This will cause extreme stress to the system but it is an unlikely event. Though independent samples should not be though of as a time series, one millions half-hour samples represents a time period of about 60 years. Taken in the context that Edison set up the first ever power system about 130 years ago this million samples is bound to include some very unlikely events. 





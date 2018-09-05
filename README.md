# Automation-VM-Action

Tips to Lower Azure Pricing and Optimize Hosting Costs

1. Right-Size/Shut Down/Deallocate VMs

One of the things that Cost Management and Advisor may recommend is right-sizing or shutting down VMs. 

Changing VM size is easy on Azure, and if you have VMs that typically sit idle, this is a great way you can reduce your costs. 

Shutting down unused systems is important as well, as often times VMs are created for a test environment or a project that maybe never took off, but nobody went back and cleaned up the environment afterwards. Identifying these systems is important, as they drive up your bill unnecessarily. It's also important to take a look at the usage patterns of your systems. If you have systems that are primarily used during business hours (or another regular time period) you should evaluate if you can shut them down when they are not being used. I've had customers succefully use Azure Automation to run scripts that will stop/start VMs on a schedule. Below are a couple examples of this (both of which are avialble in Azure Automatin), you can use these scripts or modify them as appropriate. Bottom line, it's important to evauluate the size, usage and usage patterns of your VMs to ensure they are as cost effective as possible.

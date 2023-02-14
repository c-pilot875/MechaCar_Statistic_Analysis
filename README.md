# MechaCar_Statistic_Analysis

Programs used:
R , dplyr library

File Reference:
MechaCarChallenge_script.R
MechaCar_mpg.csv
Suspension_Coil.csv


## Overview
Project request: AutoRUs is requesting an analytical review of MPG and Suspension Coils on prototype vehicles to address current production issues. 

* Identify variables that predict the MPG of prototypes
* Produce summary stats on the PSI of suspension coils
* Determine if manufacturing lots differ from the mean population using stats
* Design a mock study to compare MechaCar performance against competitors

Using R, a Linear Regression model was calculated measuring the miles per gallon across multiple variables for the prototype dataset.

### Predicting MPG using Linear Regression Model

R was run to obtain the below coefficients.

![Mecha_LR](https://user-images.githubusercontent.com/115188500/218811674-3df988ce-f24b-4e09-b0b7-9bb6a5038015.png)

### Model Summary

Data set aligns with nominal parameters, median is close to zero.

![Mecha_LR_sum](https://user-images.githubusercontent.com/115188500/218812220-218e3d72-5c62-4bb1-bc6b-adf887e6ba98.png)

1. Which variables/coefficients provided a non-random amount of variance to the mpg values in the dataset?
* ***Vehicle Length*** and ***Ground Clearance*** show non-random effect on MPG.
2. Is the slope of the linear model considered to be zero? Why or why not?
* Linear model slope cannot be considered zero, as the p-value of 5.35x10-11 is lower than the level of significance. Null hypothesis must be rejected. 
3. Does this linear model predict mpg of MechaCar prototypes effectively? Why or why not?
* R-squared value is 71% accurate, meaning other factors could affect the prediction of mpg.

## Summary Statistics on Suspension Coils

![Mech_susp_median](https://user-images.githubusercontent.com/115188500/218832940-dcf76aef-189c-4d72-b632-c2b9014b4081.png)

### Findings
* Overall variance in Total Summary is under 100 psi and meets specifications.

## Summary of Manufacturing Lots

![Screen Shot 2023-02-10 at 1 24 04 PM](https://user-images.githubusercontent.com/115188500/218833069-4605e15c-6230-4e2e-9646-94a2f6147ab1.png)

### Findings
* Lot 3 is out of the overall acceptance threshold at 170.28. This does not meet the manufacturers design specification.

## T-Tests on Suspension Coils
### Cumulative T-Test - Suspension Coils

![Mecha_tt_total](https://user-images.githubusercontent.com/115188500/218834749-bed5ce83-cab5-4b22-bf44-751f4e8b845c.png)

### Results
* Cumulative T-Test for the suspension coils across all manufacturing lots generated no statistical difference from the population mean. P-value (0.0603) is not low enough to reject null hypothesis. 

### Lot1 T-Test
Results: Lot 1 T- Test generated no statistical difference from the population mean. P-value of (1) - cannot reject null hypothesis.

![Mech_Lot1](https://user-images.githubusercontent.com/115188500/218835664-058874cb-8900-4c30-a034-f85e78ad2b64.png)

### Lot2 T-Test
Results: Lot 2 T- Test generated no statistical difference from the population mean. P-value of (0.6072) - cannot reject null hypothesis.

![Mecha_lot2](https://user-images.githubusercontent.com/115188500/218835756-e29884e5-ba3d-402a-827a-fe932db912a1.png)

### Lot3 T-Test
Results: Lot 3 T-Test generated a slight statistical difference from the population mean. P-value at (0.0417) is low enough to reject the null hypothesis. Lot 3 will need to be evaluated to confirm manufacturing standards and identify anomaly's. 

![Mech_lot3](https://user-images.githubusercontent.com/115188500/218836472-7994ee89-5751-49b1-af56-a2a68b2a9f7f.png)

## Study Design: MechCar vs Competition 
Current statistics on vehicle collisions are on the rise with thousands of drivers and passengers injured or killed each year. This is in despite of the new and numerous collision avoidance systems that come standard on vehicles. Consumers looking to purchase a new car who drive long commutes, putting themselves at more risk, will be considering the safety ratings associated with each model. Side-impact and read-end collisions being the most common collisions, it is a shared belief by consumers that vehicle size has an effect on how safe a vehicle can actually be.


## Test Proposal
An evaluation on MechaCar's prototype crash tests in relation to vehicle size should be conducted using the two most common collision scenarios (side-impact and rear-end). Measurements of the impacted white-body crumple zones should be taken to compare with original vehicle length, while monitoring ATD (test dummy) impactions.

## Null and Alternate Hypothesis
H0: MechaCar's prototypes of the same vehicle length as competitors hold similar crash test ratings
HA: MechaCar's prototypes of the same vehicle length as competitors are statistically above or below the crash test ratings of competitors

## Statistical Test Used

Two-Sample t-tests should be used

## Data Needed
* Competitor vehicle length
* Competitor crash test ratings
* MechaCar prototype vehicle length
* MechaCar prototype white-body crumple zone measurements (pre-test and post-test)
* MechaCar prototype ATD impact results




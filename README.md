# Mental Health Disparities Among Immigrant and UK-Born Populations

This repository contains the code and analysis for a study investigating mental health disparities between immigrant and UK-born populations, and across immigrant sub-groups in the United Kingdom. The research uses data from wave 7 of the UK Household Longitudinal Study to assess the "healthy immigrant effect" and the hypothesized subsequent process of unhealthy assimilation.

## Research Overview

Addressing mental health needs has become a global public health priority, established as a prime objective within the United Nations Sustainable Development Agenda. With one in five adults in the UK reporting some evidence of depression or anxiety in 2022, understanding mental health disparities is crucial.

Immigrants have been found to be particularly at risk in many Western countries due to factors such as social exclusion, discrimination in the labor force, and difficulty accessing healthcare resources. As they increasingly drive population growth in the UK, understanding the determinants of immigrants' mental health challenges has become critical.

## Key Research Questions

This study examines:
1. Whether immigrants exhibit better mental health than UK-born individuals (Healthy Immigrant Effect)
2. If mental health differs among immigrant sub-groups based on migration reasons
3. Whether immigrants' mental health deteriorates over time (Unhealthy Assimilation Effect)
4. If the deterioration in mental health varies by ethnic background

## Methodology

- **Data Source**: Wave 7 of the UK Household Longitudinal Study (UKHLS), collected 2015-2017
- **Outcome Variable**: SF-12 Mental Component Summary (MCS) score (range 0-100, higher scores indicate better mental health)
- **Independent Variables**: Nativity status, recency of immigration, reason for migration, ethnicity
- **Controls**: Age, sex, education, unemployment
- **Analysis**: Linear regression models with survey weights

## Key Findings

### Healthy Immigrant Effect

Recent immigrants (≤15 years in UK) exhibit significantly better mental health than UK-born individuals (+2.8 points on the normalized 0-100 scale), supporting the healthy immigrant effect hypothesis.

![Figure: Healthy Immigrant Effect](./figures/healthy_immigrant_effect.png)

### Migration Reasons and Mental Health

No significant differences in mental health were found among immigrants with varying migration reasons. Whether immigrants moved for work/education, family reasons, political safety, or simply wanting to live in the UK did not significantly impact their mental health upon arrival.

### Unhealthy Assimilation Effect

Immigrants who have lived in the UK for over 15 years display significantly lower mental health scores than recent immigrants, supporting the unhealthy assimilation hypothesis.

![Figure: Unhealthy Assimilation Effect](./figures/unhealthy_assimilation.png)

This finding is robust across different thresholds for defining "recent" immigrants (from 10 to 25 years).

### Ethnic Differences

The study found no evidence that unhealthy assimilation varies by ethnicity. The mental health decline associated with longer UK residence was consistent across ethnic groups.

## Implications

The findings challenge implicit assumptions regarding immigrants' health outcomes, which have led researchers to view their observed advantages as 'paradoxical'. The results highlight the need to tackle the well-documented challenges that restrict immigrants' access to mental healthcare, including discrimination, language barriers, and insufficient cultural sensitivity training for healthcare professionals.

## Limitations

- The data's inability to capture the experiences of refugees, who have been found to report mental health problems substantially more often than other migrants
- The cross-sectional design limits the study's ability to disentangle the effects of assimilation from baseline differences between immigration cohorts

## Full Paper

For a complete discussion of methods, results, and implications, please refer to the [full paper](./Unpacking_mental_health_disparities.pdf) in this repository.

## Code

All code used in the data pre-processing, visualization, and analysis is available in this repository for transparency and replicability.

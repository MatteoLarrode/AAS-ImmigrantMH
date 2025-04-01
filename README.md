# Unpacking mental health disparities among immigrant and domestic-born populations in the UK

*Applied Analytical Statistics, Michaelmas Term 2024*

## Abstract

This study uses wave 7 of the UK Household Longitudinal Study to investigate mental health disparities between immigrant and UK-born populations, and across immigrant sub-groups. In turn, it assesses the "healthy immigrant effect" -- tendency of recent immigrants to be healthier than the native-born -- and the hypothesised subsequent process of unhealthy assimilation. Results from linear regressions used in this cross-sectional design reveal that recent immigrants do exhibit a mental health advantage over UK natives, which diminishes significantly for those who have lived in the UK for over 15 years. This study also addresses knowledge gaps left in the literature by the frequent aggregation of all immigrants into a single unit of analysis. I find no significant mental health disparities between immigrants with varying migration reasons, nor do I observe differences in mental health decline across distinct ethnic groups.

## Introduction

Addressing mental health needs has become a global public health priority, established as a prime objective within the United Nations Sustainable Development Agenda [1]. With one in five adults reporting some evidence of depression or anxiety in 2022, and a trend on the rise [2], the UK is not immune to this necessity to support the well-being of residents. In addition to its frailty, mental health in the UK is characterised by concerning inequalities, with disparities across sexual orientations [3], and ethnic groups [4].

Immigrants have been found to be particularly at risk in many Western countries due to factors such as social exclusion, discrimination in the labour force, and difficulty to access healthcare resources [5]. As they increasingly drive population growth in the UK [6], the need to understand the determinants of immigrants' mental health challenges has become critical. Research tackling this question has often been undermined by conceptual, study design, and measurement issues [7]. Studies tend to lack clarity in their definitions of immigrant and domestic-born groups, and often fall short in considering crucial differences within immigrant populations, based on ethnicity and migration context for example. These limitations have led to inconsistent evidence on the differences in mental health among immigrants, and between immigrants and domestic-born populations, as well as how they evolve over the life course.

This paper addresses these research questions in the UK via a cross-sectional approach. After outlining the main theories guiding the literature, I use data from wave 7 of the Understanding Society survey [8] to examine immigrants' mental health, how it differs among sub-groups and evolves over time. I find that immigrants in the UK generally exhibit better mental health than natives upon arrival, regardless of their reason to migrate. Additionally, I find that this advantage diminishes over time, and is not moderated by ethnicity. I then discuss how these findings compare to the literature and their implications, and conclude by laying out the limitations of my approach.

## Literature review

### Healthy immigrant effect

The "healthy immigrant effect" (HIE) refers to the observation that immigrants often display better health outcomes, both physical and mental, than the native-born populations of their destination country [9, 10]. This finding, often coined as "immigrant health paradox," seems discrepant with the stressors immigrants are likely to experience before and during the migration and settlement. To explain this conundrum, studies have called upon three processes [11]. First, the *selectivity hypothesis* argues that immigrants tend to be selected on health, personality, and socioeconomic factors which make them more resilient to the challenges associated with migration, and positively influence their current mental health [12]. Increasingly selective immigration policies, including in the UK, induce a selection on their end as well [13]. The second, so-called *cultural hypothesis*, posits that immigrants 'import' favourable health behaviours, such as lower smoking, which improve their health [14]. The third explanation regards the data gathering '*salmon bias*' resulting from the tendency of less healthy immigrants to return to their birth country [15, 16]. I examine the HIE hypothesis in the UK context.

**H1:** Immigrants exhibit better mental health than UK-born individuals (HIE).

The conceptualisation of a general immigrant health effect, present in many studies, is however deeply flawed due to the aggregation of immigrants with vastly different backgrounds. Compared to a voluntary immigrant, a refugee will have had more chances to be exposed to intense stressors, such as trauma or bad hygiene in camps, which deteriorate mental health [17]. However, as highlighted by [5] in their review, no study performs an immigrant mental health analysis by immigration status. The Understanding Society survey unfortunately does not contain data on refugees, but it includes immigrants' reasons for migrating. This variable can act as a proxy for the voluntary/refugee divide because it captures key elements of migration context that influence exposure to stressors. For instance, immigrants who cite safety concerns as their primary reason for migration are likely to have faced pre-migration stressors akin to those experienced by refugees, such as political persecution or the need to flee unsafe living conditions. In contrast, individuals who migrate for reasons such as education or employment are less likely to have endured such extreme circumstances and may have had greater control over the migration process. I therefore expect reason to migrate to moderate recent immigrants' mental health advantage.

**H2:** Immigrants who migrated because they did not feel safe in their country of birth have worse mental health than those who moved for education or work.

### Unhealthy assimilation effect

The literature has reached a consensus that the healthy immigrant effect deteriorates as immigrants assimilate, in Europe [18] and the North America [19, 20]. Studies find that immigrants' mental health worsens faster than that of domestic-born people, ultimately levelling across both populations. This "unhealthy assimilation" is usually explained by processes including the adoption of unhealthy habits, acculturation stress, discrimination, and poor economic and social conditions [11]. I therefore formulate the following "recency hypothesis", sometimes called "years since immigration effect".

**H3:** Non-recent immigrants display lower mental health levels than recent migrants.

Once again however, this general hypothesis obscures differences across immigrant sub-groups. The stress process model [21, 22] suggests that mental health is primarily shaped by exposure to stressors and the availability of coping strategies and social support. In the UK, many stressors disproportionately impact people from minority ethnic backgrounds. These include racial discrimination and harassment [23], and discrimination in the job market [24, 25]. Availability of social support is also disparate across ethnicities [26]. Consequently, I expect that the unhealthy assimilation effect will disproportionately affect immigrants from minority ethnic backgrounds.

**H4:** The deterioration in mental health between recent and non-recent immigrants is stronger for those from minority ethnic backgrounds than for White immigrants.

## Methods

### Data & variables

#### Dataset & study population

The UK Household Longitudinal Study (UKHLS), also known as Understanding Society [8], is a large-scale panel survey that started in 2009. I use data from wave 7, which contains data collected from January 2015 to May 2017. From this wave, about 60% of households were originally sampled at wave 1. Many others originate from the ethnic minority boost (EMB), and immigrant and ethnic minority boost (IEMB) samples respectively incorporated in waves 1 and 6. They have significantly improved the sample's representativeness of immigrants in terms of educational attainment, gender distribution, and migration reasons [27].

I excluded individuals (1) aged below 16 or above 80 (2) with missing information on the relevant variables (3) born in the UK but with at least one foreign born parent (2nd generation).

#### Variables

The outcome variable of mental health is operationalised using the SF-12 Mental Component Summary (PCS), which asks respondents to rate how different aspects of their mental health have impacted their recent daily life. Questions include the frequency of feeling down and gloomy, calm and relaxed or energetic, as well as limitations in achievement, sociality and carefulness in tasks due to mental health [28]. Scores are normalised, and range from 0 to 100, with a mean of 50 and standard deviation of 10, and higher values indicating better health.

The main independent variable is nativity, separating UK natives (born in the UK and both parents born in the UK), and immigrants (born abroad). Recency of immigration is dichotomised, using a threshold number of years since migration (ysm), into recent immigrants (ysm ≤ 15) and non-recent immigrants (ysm > 15), in line with other studies [29, 30, 31]. Recoding the variable as categorical, as done by [32], was considered but shrunk the number of cases within certain categories too severely.

Another independent variables categorises immigrants depending on their reason to migrate. The 8 categories of UKHLS were collapsed into 5, following the mapping given in Table 1, and missing values (29.5%) were coded as Unknown. Migration reasons include family, work and education, simply wanting to live in the UK, and feeling unsafe in the country of birth due to political reasons. Lastly, ethnicity was included as an independent variable of interest, following the UK Census mapping [33].

A set of controls, determined as factors consistently shown in the literature to influence mental health outcomes, and that may confound the relationship between immigration status and mental health, was included. Those consist of age (linear and quadratic terms), sex (binary), highest educational qualification (tertiary, lower than tertiary, secondary, lower), and unemployment. Table 2 presents descriptive statistics for the sample.

## References

[1] UN, "Transforming our world: The 2030 agenda for sustainable development," 2015.  
[2] ONS, "UK personal well-being, 1 April 2022 to 31 March 2023," 2024.  
[3] Bai et al., "Long-term trends in physical and mental health by sexual orientation in England: Evidence from 11 years of the Health Survey for England," 2024.  
[4] Bamford et al., "Social and structural determinants of health inequities in mental health," 2021.  
[5] Elshahat et al., "Mental health of immigrants and refugees: The association with length of stay in transit countries," 2022.  
[6] Sturge, "Migration statistics," 2024.  
[7] Elshahat et al., "Understanding immigrants' health challenges in high-income countries: a systematic review of empirical studies," 2022.  
[8] University of Essex, "Understanding Society: Waves 1-14, 2009-2023 and Harmonised BHPS: Waves 1-18, 1991-2009," 2024.  
[9] McDonald & Kennedy, "Insights into the 'healthy immigrant effect': health status and health service use of immigrants to Canada," 2004.  
[10] Kennedy et al., "The healthy immigrant effect: patterns and evidence from four countries," 2015.

*Note: References continue but are shortened for brevity in this README*
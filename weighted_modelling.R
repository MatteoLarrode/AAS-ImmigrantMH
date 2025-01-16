library(dplyr)
library(forcats)
library(survey)
options(survey.lonely.psu = "adjust")
library(effects)
library(broom)

# =================
# === Load data ===
# =================
df_wave_7 <- read.csv("data/wave7_data.csv")
df_wave_7_part1 <- read.csv("data/wave7_data_part1.csv")
df_wave_7_part2 <- read.csv("data/wave7_data_part2.csv")

# Prepare for robustness analysis
thresholds <- seq(5, 25, by = 5)

for (thresh in thresholds) {
  # Create a new binary variable for the current threshold in the main dataset
  df_wave_7_part2[[paste0("years_since_arrival_binary_", thresh)]] <- 
    ifelse(df_wave_7_part2$years_since_arrival > thresh, 1, 0)}

# ===============================
# === Recode factor variables ===
# ===============================
# Specify the categorical variables
categorical <- c(
  "years_since_arrival_binary","years_since_arrival_binary_5", 
  "years_since_arrival_binary_10", "years_since_arrival_binary_15", 
  "years_since_arrival_binary_20", "years_since_arrival_binary_25", 
  "sex", "ethn_dv_recoded",
  "hiqual_dv_recoded", "mreason", "unemployed"
)

# Recode specified columns as factors
df_wave_7_part1 <- df_wave_7_part1 |> 
  mutate(across(all_of(categorical), as.factor))

df_wave_7_part2 <- df_wave_7_part2 |> 
  mutate(across(all_of(categorical), as.factor))

# ===============================
# === Create adjusted samples ===
# ===============================
adj_sample_part1 <- svydesign(
  data = df_wave_7_part1,
  id = ~psu,
  weights = ~indscui_xw,
  strata = ~strata
)

adj_sample_part2 <- svydesign(
  data = df_wave_7_part2,
  id = ~psu,
  weights = ~indscui_xw,
  strata = ~strata
)

# ==============
# === Models ===
# ==============
# HEALTHY IMMIGRANT EFFECT
# Model 1
adj_model_1 <- svyglm(
  design = adj_sample_part1, 
  formula = sf12mcs_dv ~ immigrant,
  family = gaussian())

summary(adj_model_1)

# Model 2
adj_model_2 <- svyglm(
  design = adj_sample_part1, 
  formula = sf12mcs_dv ~ immigrant + age_dv + I(age_dv^2) + ethn_dv_recoded + sex + hiqual_dv_recoded + unemployed,
  family = gaussian())

summary(adj_model_2)

# Model 3
adj_model_3 <- svyglm(
  design = adj_sample_part1, 
  formula = sf12mcs_dv ~ immigrant + immigrant:mreason + age_dv + I(age_dv^2) + sex + ethn_dv_recoded + hiqual_dv_recoded + unemployed,
  family = gaussian())

summary(adj_model_3)

# UNHEALTHY ASSIMILATION
# Model 4
adj_model_4 <- svyglm(
  design = adj_sample_part2, 
  formula = sf12mcs_dv ~  years_since_arrival_binary + ethn_dv_recoded,
  family = gaussian())

summary(adj_model_4)

# Model 5
adj_model_5 <- svyglm(
  design = adj_sample_part2, 
  formula = sf12mcs_dv ~  years_since_arrival_binary + age_dv + I(age_dv^2) + ethn_dv_recoded + sex + hiqual_dv_recoded,
  family = gaussian())

summary(adj_model_5)

# Model 6
adj_model_6 <- svyglm(
  design = adj_sample_part2, 
  formula = sf12mcs_dv ~  years_since_arrival_binary*ethn_dv_recoded + age_dv + I(age_dv^2) + sex + hiqual_dv_recoded,
  family = gaussian())

summary(adj_model_6)

# ==============================
# === Robustness Analysis 1  ===
# ==============================
# Re-estimate the coefficient of model 6 for years_since_arrival_binary1 at different thresholds
# Initialize an empty data frame to store results
results <- data.frame(
  threshold = numeric(),
  estimate = numeric(),
  conf.low = numeric(),
  conf.high = numeric()
)

# Model 1: years_since_arrival_binary_5
model_5 <- svyglm(
  sf12mcs_dv ~ years_since_arrival_binary_5 * ethn_dv_recoded + age_dv + I(age_dv^2) + sex + hiqual_dv_recoded,
  design = adj_sample_part2,
  family = gaussian()
)
model_summary_5 <- tidy(model_5, conf.int = TRUE)
years_coeff_5 <- model_summary_5[model_summary_5$term == "years_since_arrival_binary_51", ]
results <- rbind(results, data.frame(threshold = 5, estimate = years_coeff_5$estimate, conf.low = years_coeff_5$conf.low, conf.high = years_coeff_5$conf.high))

# Model 2: years_since_arrival_binary_10
model_10 <- svyglm(
  sf12mcs_dv ~ years_since_arrival_binary_10 * ethn_dv_recoded + age_dv + I(age_dv^2) + sex + hiqual_dv_recoded,
  design = adj_sample_part2,
  family = gaussian()
)
model_summary_10 <- tidy(model_10, conf.int = TRUE)
years_coeff_10 <- model_summary_10[model_summary_10$term == "years_since_arrival_binary_101", ]
results <- rbind(results, data.frame(threshold = 10, estimate = years_coeff_10$estimate, conf.low = years_coeff_10$conf.low, conf.high = years_coeff_10$conf.high))

# Model 3: years_since_arrival_binary_15
model_15 <- svyglm(
  sf12mcs_dv ~ years_since_arrival_binary_15 * ethn_dv_recoded + age_dv + I(age_dv^2) + sex + hiqual_dv_recoded,
  design = adj_sample_part2,
  family = gaussian()
)
model_summary_15 <- tidy(model_15, conf.int = TRUE)
years_coeff_15 <- model_summary_15[model_summary_15$term == "years_since_arrival_binary_151", ]
results <- rbind(results, data.frame(threshold = 15, estimate = years_coeff_15$estimate, conf.low = years_coeff_15$conf.low, conf.high = years_coeff_15$conf.high))

# Model 4: years_since_arrival_binary_20
model_20 <- svyglm(
  sf12mcs_dv ~ years_since_arrival_binary_20 * ethn_dv_recoded + age_dv + I(age_dv^2) + sex + hiqual_dv_recoded,
  design = adj_sample_part2,
  family = gaussian()
)
model_summary_20 <- tidy(model_20, conf.int = TRUE)
years_coeff_20 <- model_summary_20[model_summary_20$term == "years_since_arrival_binary_201", ]
results <- rbind(results, data.frame(threshold = 20, estimate = years_coeff_20$estimate, conf.low = years_coeff_20$conf.low, conf.high = years_coeff_20$conf.high))

# Model 5: years_since_arrival_binary_25
model_25 <- svyglm(
  sf12mcs_dv ~ years_since_arrival_binary_25 * ethn_dv_recoded + age_dv + I(age_dv^2) + sex + hiqual_dv_recoded,
  design = adj_sample_part2,
  family = gaussian()
)
model_summary_25 <- tidy(model_25, conf.int = TRUE)
years_coeff_25 <- model_summary_25[model_summary_25$term == "years_since_arrival_binary_251", ]
results <- rbind(results, data.frame(threshold = 25, estimate = years_coeff_25$estimate, conf.low = years_coeff_25$conf.low, conf.high = years_coeff_25$conf.high))

# View the results
print(results)

# Save the results to a CSV file
write.csv(results, "tables/years_robustness_results.csv", row.names = FALSE)
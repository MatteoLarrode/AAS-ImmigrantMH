# ==========================================================
# === Helper functions for data cleaning & preprocessing ===
# ==========================================================
import numpy as np
import pandas as pd
from tqdm import tqdm

def recode_negative_as_missing(df):
    """Recode negative values in numeric columns as missing, handling NAs."""
    for column in tqdm(df.columns):
        if pd.api.types.is_numeric_dtype(df[column]):
            try:
                df[column] = df[column].apply(lambda x: x if pd.isna(x) or x >= 0 else np.nan)
            except Exception as e:
                print(f'Error processing column {column}: {e}')
    return df

def recode_binary_sex_column(df, column='sex'):
    """Recode a binary sex column into 'Male' and 'Female', handling NAs."""
    df[column] = df[column].apply(lambda x: 'Male' if x == 1 else ('Female' if x == 2 else np.nan))
    return df

def recode_binary_variables(df, variables):
    """Recode binary variables where 1 remains and 2 is recoded as 0, handling NAs."""
    for variable in variables:
        df[variable] = df[variable].apply(lambda x: 0 if x == 2 else (x if pd.notna(x) else np.nan))
    return df

def recode_ethnicity(df, column='ethn_dv'):
    """Recode ethnicity based on UK Census categories, handling NAs."""
    ethn_dv_mapping = {
        1: 'White',
        2: 'White',
        3: 'White',
        4: 'White',
        5: 'Mixed or Multiple',
        6: 'Mixed or Multiple',
        7: 'Mixed or Multiple',
        8: 'Mixed or Multiple',
        9: 'Asian or Asian British',
        10: 'Asian or Asian British',
        11: 'Asian or Asian British',
        12: 'Asian or Asian British',
        13: 'Asian or Asian British',
        14: 'Black, Black British, Caribbean or African',
        15: 'Black, Black British, Caribbean or African',
        16: 'Black, Black British, Caribbean or African',
        17: 'Other ethnic group',
        97: 'Other ethnic group'
    }
    df[f'{column}_recoded'] = pd.Categorical(df[column].map(ethn_dv_mapping).fillna(np.nan), 
                                             categories=['White', 'Mixed or Multiple', 'Asian or Asian British', 
                                                         'Black, Black British, Caribbean or African', 'Other ethnic group'])
    return df

def recode_migrant_generation(df, column='generation'):
    """Recode migrant generation, handling NAs."""
    migrant_gen_recode_dict = {
        1: '1st generation',
        2: '2nd generation',
        3: '3rd generation',
        4: '4+ generation',
        5: 'Other',
        6: 'Other'
    }
    df[f'{column}_recoded'] = pd.Categorical(df[column].map(migrant_gen_recode_dict).fillna(np.nan), 
                                             categories=['1st generation', '2nd generation', '3rd generation', '4+ generation', 'Other'])
    return df

def recode_education(df, column='hiqual_dv'):
    """Recode highest education level, handling NAs."""
    hiqual_dv_mapping = {
        1: 'Tertiary',
        2: 'Tertiary',
        3: 'L/t tertiary',
        4: 'Secondary',
        5: 'Lower',
        9: 'Lower'
    }
    df[f'{column}_recoded'] = pd.Categorical(df[column].map(hiqual_dv_mapping).fillna(np.nan), 
                                             categories=['Tertiary', 'L/t tertiary', 'Secondary', 'Lower'], ordered=True)
    return df

def recode_labour_force_status(df, column='jbstat'):
    """Recode labour force status into 'Employed', 'Unemployed', and 'Out of labour force', handling NAs."""
    labour_force_status_recode_dict = {
        1: 'Employed',  # Self employed
        2: 'Employed',  # Paid employment (ft/pt)
        3: 'Unemployed',  # Unemployed
        4: 'Out of labour force',  # Retired
        5: 'Employed',  # On maternity leave
        6: 'Out of labour force',  # Family care or home
        7: 'Out of labour force',  # Full-time student
        8: 'Out of labour force',  # LT sick or disabled
        9: 'Out of labour force',  # Govt training scheme
        10: 'Employed',  # Unpaid, family business
        11: 'Employed',  # On apprenticeship
        12: 'Employed',  # On furlough
        13: 'Employed',  # Temporarily laid off/short term working
        14: 'Employed',  # On shared parental leave
        15: 'Employed',  # On adoption leave
        97: 'Out of labour force'  # Doing something else
    }
    df[f'{column}_recoded'] = pd.Categorical(df[column].map(labour_force_status_recode_dict).fillna(pd.NA), 
                                             categories=['Employed', 'Unemployed', 'Out of labour force'])
    return df

# def recode_religious_attendance(df, column='oprlg2'):
#     """Recode religious attendance into reduced categories, handling NAs."""
#     recode_dict = {
#         1: 4,  # Once a week or more
#         2: 3,  # At least once a month
#         3: 2,  # At least once a year
#         4: 1,  # Never or practically never
#         5: 1   # Only at weddings, funerals etc.
#     }
#     df[f'{column}_recoded'] = df[column].map(recode_dict).fillna(np.nan)
#     return df

def recode_marital_status(df, column='mlstat'):
    """Recode marital status into 'Married', 'Previously Married', and 'Never married', handling NAs."""
    marital_status_recode_dict = {
        1: 'Never married',  # Single, never married/civil partner
        2: 'Married',        # Married
        3: 'Married',        # Civil Partner (legal)
        4: 'Previously Married',  # Separated legally married
        5: 'Previously Married',  # Divorced
        6: 'Previously Married',  # Widowed
        7: 'Previously Married',  # Separated from Civil Partner
        8: 'Previously Married',  # A former Civil Partner
        9: 'Previously Married'   # Surviving Civil Partner
    }
    df[f'{column}_recoded'] = pd.Categorical(df[column].map(marital_status_recode_dict).fillna(pd.NA), 
                                             categories=['Married', 'Previously Married', 'Never married'])
    return df

def recode_region(df, column='gor_dv'):
    """Recode region into specified categories, handling NAs."""
    region_recode_dict = {
        1: 'North East',
        2: 'North West',
        3: 'Yorkshire and the Humber',
        4: 'East Midlands',
        5: 'West Midlands',
        6: 'East of England',
        7: 'London',
        8: 'South East',
        9: 'South West',
        10: 'Wales',
        11: 'Scotland',
        12: 'Northern Ireland'
    }
    df[f'{column}_recoded'] = pd.Categorical(df[column].map(region_recode_dict).fillna(pd.NA), 
                                             categories=['North East', 'North West', 'Yorkshire and the Humber', 
                                                         'East Midlands', 'West Midlands', 'East of England', 
                                                         'London', 'South East', 'South West', 'Wales', 
                                                         'Scotland', 'Northern Ireland'])
    
    return df

def create_immigrant_variable(df, column='bornuk_dv'):
    """Create a new variable 'immigrant' as the reverse of 'bornuk_dv', handling NAs."""
    df['immigrant'] = df[column].apply(lambda x: 0 if x == 1 else (1 if x == 0 else np.nan))
    return df
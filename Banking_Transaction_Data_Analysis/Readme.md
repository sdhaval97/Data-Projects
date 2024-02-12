# Exploring Banking Transaction Data

This project explores banking transaction data, aiming to gain insights into customer behavior, account types, transaction patterns, and more. It includes data generation, analysis using dplyr, and visualization using ggplot2.

## Data Generation

The sample banking transaction data is generated with various attributes including customer ID, age, gender, account type, transaction type, amount, balance, income, credit score, and loan status.

## Analysis using dplyr

- **Select**: Subsetting the data to include specific columns such as customer ID, age, account type, and loan status.
- **Arrange**: Arranging the data by customer age.
- **Filter**: Filtering the data to include only withdrawal transactions.
- **Pipe**: Filtering the data for savings account transactions, arranging them by transaction amount, and selecting specific columns.
- **Mutate**: Creating a new variable `Transaction_Category` based on transaction amount.
- **Rank**: Ranking customers based on transaction amount.
- **Summarize**: Calculating the total amount for each account type.

## Visualization using ggplot2

- **Pie Chart**: Displays the distribution of account types among customers, with count labels for each category.
- **Bar Chart**: Shows the total amount for each account type, with labels on top of the bars indicating the total amount.
- **Histogram**: Represents the distribution of customer ages.

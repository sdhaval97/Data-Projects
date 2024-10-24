# Exploring Banking Transaction Data

# Loading the necessary libraries
library(dplyr)
library(ggplot2)

# Data Creation
set.seed(123)
customer_id <- 1:200
age <- sample(18:90, 200, replace = TRUE)
gender <- sample(c("Male", "Female"), 200, replace = TRUE)
account_type <- sample(c("Savings", "Checking"), 200, replace = TRUE)
transaction_type <- sample(c("Deposit", "Withdrawal"), 200, replace = TRUE)
amount <- round(runif(200, min = 100, max = 10000), 2)

# Calculate initial balance
initial_balance <- 10000  # Starting balance for all customers

# Adjust balance based on transaction type
balance <- ifelse(transaction_type == "Deposit", initial_balance + amount, initial_balance - amount)

# Additional variables
income <- round(runif(200, min = 20000, max = 150000), 2)
credit_score <- sample(300:850, 200, replace = TRUE)
loan_status <- case_when(
  credit_score >= 300 & credit_score < 550 ~ "Rejected",
  credit_score >= 550 & credit_score < 700 ~ "Pending",
  credit_score >= 700 & credit_score < 800 ~ "Approved",
  credit_score >= 800 & credit_score <= 850 ~ "Approved",
  TRUE ~ NA_character_
)

# Create Data Frame
bank_data <- data.frame(Customer_ID = customer_id,
                        Age = age,
                        Gender = gender,
                        Account_Type = account_type,
                        Transaction_Type = transaction_type,
                        Amount = amount,
                        Balance = balance,  # Use the adjusted balance
                        Income = income,
                        Credit_Score = credit_score,
                        Loan_Status = loan_status)

# Analysis using dplyr

# Select including subsetting
selected_customer_data <- bank_data %>%
  select(Customer_ID, Account_Type, Loan_Status)

selected_customer_data

# Arrange 
arranged_bank_data <- bank_data %>% 
  arrange(Age)

arranged_bank_data

# Filter
transaction_filter <- bank_data %>%
  filter(Transaction_Type == "Withdrawal")

transaction_filter

# Count of withdrawals and deposits based on transaction type
transaction_counts <- bank_data %>%
  count(Transaction_Type)

transaction_counts

# Pipe
piped_data <- bank_data %>%
  filter(Account_Type == "Savings") %>%
  arrange(desc(Amount)) %>%
  select(Customer_ID, Amount, Transaction_Type)

piped_data

# Mutate 
mutated_transaction_data <- bank_data %>%
  mutate(Transaction_Category = ifelse(Amount > 5000, "Large", "Small"))

mutated_transaction_data

# Count of large and small transactions
mutated_transaction_data_count <- bank_data %>%
  mutate(Transaction_Category = ifelse(Amount > 5000, "Large", "Small")) %>%
  count(Transaction_Category)

mutated_transaction_data_count

# Rank
ranked_amount <- bank_data %>%
  mutate(Rank = rank(Amount))

ranked_amount

# Calculate total amount for each account type
total_amount <- bank_data %>%
  group_by(Account_Type) %>%
  summarise(Total_Amount = sum(Amount))

total_amount

# Visualization using ggplot2

# Pie Chart
account_type <- ggplot(bank_data, aes(x = "", fill = Account_Type)) +
  geom_bar(width = 1) +
  coord_polar("y", start = 0) +
  labs(title = "Distribution of Account Types") +
  geom_text(aes(label = stat(count)), stat = "count", position = position_stack(vjust = 0.5))

loan_status <- ggplot(bank_data, aes(x = "", fill = Loan_Status)) +
  geom_bar(width = 1) +
  coord_polar("y", start = 0) +
  geom_text(aes(label = stat(count)), stat = "count", position = position_stack(vjust = 0.5)) +
  labs(title = "Proportion of Loan Status")

# Bar Chart
amount_by_account <- ggplot(bank_data, aes(x = Account_Type, y = Amount, fill = Account_Type)) +
  geom_bar(stat = "identity") +
  geom_text(data = total_amount, aes(label = Total_Amount, y = Total_Amount), vjust = -0.5, color = "black", size = 3, show.legend = FALSE) +  # Add labels on top of bars
  labs(title = "Total Amount by Account Type", x = "Account Type", y = "Total Amount") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))



# Histogram
customer_distribution <- ggplot(bank_data, aes(x = Age)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "black") + 
  labs(title = "Distribution of Customer Ages", x = "Age", y = "Frequency")

print(account_type)
print(loan_status)
print(amount_by_account)
print(customer_distribution)

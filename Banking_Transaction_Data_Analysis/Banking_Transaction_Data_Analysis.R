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
balance <- cumsum(ifelse(transaction_type == "Deposit", amount, -amount))

# Additional variables
income <- round(runif(200, min = 20000, max = 150000), 2)
credit_score <- sample(300:850, 200, replace = TRUE)
loan_status <- sample(c("Approved", "Pending", "Rejected"), 200, replace = TRUE)

# Create Data Frame
bank_data <- data.frame(Customer_ID = customer_id,
                        Age = age,
                        Gender = gender,
                        Account_Type = account_type,
                        Transaction_Type = transaction_type,
                        Amount = amount,
                        Balance = balance,
                        Income = income,
                        Credit_Score = credit_score,
                        Loan_Status = loan_status)

# Analysis using dplyr

# Select including subsetting
selected_data <- bank_data %>%
  select(Customer_ID, Age, Account_Type, Loan_Status)

# Arrange 
arranged_data <- bank_data %>% 
  arrange(Age)

# Filter
filtered_data <- bank_data %>%
  filter(Transaction_Type == "Withdrawal")

# Pipe
piped_data <- bank_data %>%
  filter(Account_Type == "Savings") %>%
  arrange(desc(Amount)) %>%
  select(Customer_ID, Amount)

# Mutate 
mutated_data <- bank_data %>%
  mutate(Transaction_Category = ifelse(Amount > 5000, "Large", "Small"))

# Rank
ranked_data <- bank_data %>%
  mutate(Rank = rank(Amount))

# Calculate total amount for each account type

total_amount <- bank_data %>%
  group_by(Account_Type) %>%
  summarise(Total_Amount = sum(Amount))

# Visualization using ggplot2

# Pie Chart
pie_chart <- ggplot(bank_data, aes(x = "", fill = Account_Type)) +
  geom_bar(width = 1) +
  coord_polar("y", start = 0) +
  labs(title = "Distribution of Account Types") +
  geom_text(aes(label = stat(count)), stat = "count", position = position_stack(vjust = 0.5))

# Bar Chart
bar_chart <- ggplot(bank_data, aes(x = Account_Type, y = Amount, fill = Account_Type)) +
  geom_bar(stat = "identity") +
  geom_text(data = total_amount, aes(label = Total_Amount, y = Total_Amount), vjust = -0.5, color = "black", size = 3, show.legend = FALSE) +  # Add labels on top of bars
  labs(title = "Total Amount by Account Type", x = "Account Type", y = "Total Amount") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Histogram
histogram <- ggplot(bank_data, aes(x = Age)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "black") + 
  labs(title = "Distribution of Customer Ages", x = "Age", y = "Frequency")

print(pie_chart)
print(bar_chart)
print(histogram)

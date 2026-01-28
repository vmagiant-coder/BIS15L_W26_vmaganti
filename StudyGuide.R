# BIS 015L — RStudio Commands with Example Problems (Labs + Homeworks)

This sheet lists **each command**, **what it does**, and an **example problem + example code** modeled after actual **lab/homework-style questions**.
Copy-paste friendly and exam-oriented.

---
  
  ## LAB 2 — Objects, Data Types, Missing Data
  
  `<-` : assigns a value to an object
Example problem: Store the value 12 in an object called `x`

```r
x <- 12
```

`+` : adds values
Example problem: Add `x` and `y`

```r
x + y
```

`mean()` : calculates the average
Example problem: Find the mean of 2, 4, and 6

```r
mean(c(2, 4, 6))
```

`length()` : counts number of elements
Example problem: How many observations are in the vector?
  
  ```r
length(c(5, 10, 15))
```

`class()` : returns data type
Example problem: Identify the type of object `x`

```r
class(x)
```

`as.numeric()` : converts to numeric
Example problem: Convert character "5" to numeric

```r
as.numeric("5")
```

`NA` : missing data value
Example problem: Create a vector with missing data

```r
v <- c(3, 5, NA, 7)
```

`mean(..., na.rm = TRUE)` : calculates mean ignoring NA
Example problem: Calculate the mean without NA values

```r
mean(v, na.rm = TRUE)
```

`is.na()` : checks for missing values
Example problem: Identify missing values in a vector

```r
is.na(v)
```

---
  
  ## LAB 3 — Vectors & Data Frames
  
  `c()` : combines values into a vector
Example problem: Create a vector of lengths

```r
lengths <- c(10.1, 9.8, 10.5)
```

`:` : creates a sequence
Example problem: Generate values from 1 to 50

```r
nums <- 1:50
```

`[]` : indexes elements
Example problem: Select values less than or equal to 10

```r
nums[nums <= 10]
```

`library(tidyverse)` : loads tidyverse packages
Example problem: Load tools needed for data wrangling

```r
library(tidyverse)
```

`tibble()` : creates a data frame
Example problem: Create a table of bird data

```r
df <- tibble(
  sex = c("M", "F", "F"),
  length = c(10.2, 9.7, 10.0),
  weight = c(5.1, 4.8, 5.0)
)
```

`$` : extracts a column
Example problem: Calculate mean weight

```r
mean(df$weight)
```

`write.csv()` : saves data
Example problem: Save dataset for submission

```r
write.csv(df, "birds.csv", row.names = FALSE)
```

---
  
  ## LAB 4 — Importing Data & dplyr
  
  `read.csv()` : imports CSV files
Example problem: Load data file provided in lab

```r
data <- read.csv("data.csv")
```

`filter()` : keeps rows meeting conditions
Example problem: Keep only birds heavier than 5g

```r
filter(df, weight > 5)
```

`select()` : chooses columns
Example problem: Select length and weight only

```r
select(df, length, weight)
```

`mutate()` : creates new columns
Example problem: Add BMI-style column

```r
mutate(df, ratio = weight / length)
```

`arrange()` : sorts rows
Example problem: Sort by weight (largest first)

```r
arrange(df, desc(weight))
```

`%>%` : pipes commands
Example problem: Filter then select

```r
df %>%
  filter(weight > 5) %>%
  select(length)
```

---
  
  ## LAB 5 — Grouping & Summaries
  
  `group_by()` : groups data
Example problem: Group birds by sex

```r
df %>% group_by(sex)
```

`summarize()` : summarizes data
Example problem: Find mean weight by sex

```r
df %>%
  group_by(sex) %>%
  summarize(avg_weight = mean(weight))
```

`count()` : counts observations
Example problem: Count birds by sex

```r
count(df, sex)
```

---
  
  ## LAB 6 — Data Visualization
  
  `ggplot()` : initializes plot
Example problem: Plot length vs weight

```r
ggplot(df, aes(x = length, y = weight)) +
  geom_point()
```

`geom_histogram()` : shows distribution
Example problem: Plot distribution of weights

```r
ggplot(df, aes(weight)) +
  geom_histogram()
```

`geom_boxplot()` : compares distributions
Example problem: Compare weights by sex

```r
ggplot(df, aes(x = sex, y = weight)) +
  geom_boxplot()
```

`labs()` : adds labels
Example problem: Add title and axes

```r
labs(title = "Bird Data", x = "Length", y = "Weight")
```

---
  
  ## LAB 7 — Statistics
  
  `mean()` : calculates average
Example problem: Calculate mean length

```r
mean(df$length)
```

`sd()` : calculates standard deviation
Example problem: Find variability in weight

```r
sd(df$weight)
```

`rnorm()` : generates random data
Example problem: Simulate 100 observations

```r
rnorm(100, mean = 0, sd = 1)
```

`t.test()` : performs hypothesis test
Example problem: Compare weights between sexes

```r
t.test(weight ~ sex, data = df)
```

---
  
  ## HOMEWORK-SPECIFIC COMMANDS
  
  `distinct()` : returns unique rows
Example problem: Remove duplicate observations

```r
distinct(df)
```

`across()` : applies functions to multiple columns
Example problem: Calculate means of all numeric columns

```r
df %>%
  summarize(across(where(is.numeric), mean))
```

`everything()` : selects all columns
Example problem: Move a column to the front

```r
select(df, weight, everything())
```

---
  
  END OF STUDY GUIDE


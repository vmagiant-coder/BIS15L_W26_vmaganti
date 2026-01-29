# BIS 015L — Study Guide

---
  
  ## LAB 2 — OBJECTS, OPERATORS, TYPES, MISSING DATA
  
  `<-` : assigns a value to an object
Example: Store 10 in x

```r
x <- 10
```

`=` : alternative assignment operator
Example: Store 4 in y

```r
y = 4
```

`+` : addition
Example: Add x and y

```r
x + y
```

`-` : subtraction
Example: Subtract y from x

```r
x - y
```

`*` : multiplication
Example: Multiply x and y

```r
x * y
```

`/` : division
Example: Divide x by y

```r
x / y
```

`^` : exponentiation
Example: Square x

```r
x ^ 2
```

`sum()` : adds values
Example: Add 1, 3, and 5

```r
sum(1, 3, 5)
```

`mean()` : arithmetic mean
Example: Mean of a vector

```r
mean(c(2, 4, 6))
```

`length()` : number of elements
Example: How many values?
  
  ```r
length(c(5, 10, 15))
```

`class()` : object type
Example: Identify data type

```r
class(x)
```

`is.numeric()` : numeric check
Example: Is x numeric?
  
  ```r
is.numeric(x)
```

`is.character()` : character check
Example: Is "bird" text?
  
  ```r
is.character("bird")
```

`is.logical()` : logical check
Example: Is TRUE logical?
  
  ```r
is.logical(TRUE)
```

`as.numeric()` : convert to numeric
Example: Convert "8"

```r
as.numeric("8")
```

`as.character()` : convert to character
Example: Convert 12 to text

```r
as.character(12)
```

`as.integer()` : convert to integer
Example: Convert 6.9

```r
as.integer(6.9)
```

`NA` : missing value
Example: Create vector with missing data

```r
v <- c(2, NA, 5)
```

`is.na()` : locate missing values
Example: Which values are missing?
  
  ```r
is.na(v)
```

`anyNA()` : check if any missing values exist
Example: Does v contain NA?
  
  ```r
anyNA(v)
```

`na.rm = TRUE` : removes NA during calculation
Example: Mean without NA

```r
mean(v, na.rm = TRUE)
```

`getwd()` : display working directory
Example: Check file location

```r
getwd()
```

`setwd()` : set working directory
Example: Set lab folder

```r
setwd("~/BIS015L")
```

---
  
  ## LAB 3 — VECTORS, INDEXING, LOGICALS, DATA FRAMES
  
  `c()` : combine values
Example: Create weight vector

```r
weights <- c(4.8, 5.0, 5.2)
```

`:` : create integer sequence
Example: Values 1–100

```r
1:100
```

`[]` : indexing operator
Example: Select weights > 5

```r
weights[weights > 5]
```

`==` : equals comparison
Example: Which weights equal 5?
  
  ```r
weights == 5
```

`!=` : not equal
Example: Which weights are not 5?
  
  ```r
weights != 5
```

`>` : greater than
Example: Values above 5

```r
weights > 5
```

`<` : less than
Example: Values below 5

```r
weights < 5
```

`>=` : greater than or equal to
Example: Values ≥ 5

```r
weights >= 5
```

`<=` : less than or equal to
Example: Values ≤ 5

```r
weights <= 5
```

`library(tidyverse)` : loads tidyverse packages
Example: Enable dplyr + ggplot

```r
library(tidyverse)
```

`tibble()` : create tibble
Example: Bird dataset

```r
df <- tibble(
  sex = c("M", "F", "F"),
  length = c(10.2, 9.8, 10.1),
  weight = c(5.1, 4.9, 5.0)
)
```

`names()` : column names
Example: View columns

```r
names(df)
```

`dim()` : rows and columns
Example: Dataset dimensions

```r
dim(df)
```

`str()` : structure of data frame
Example: Inspect df

```r
str(df)
```

`$` : extract column
Example: Mean length

```r
mean(df$length)
```

`write.csv()` : save CSV
Example: Export homework file

```r
write.csv(df, "birds.csv", row.names = FALSE)
```

---
  
  ## LAB 4 — IMPORTING DATA & DPLYR
  
  `read.csv()` : read CSV file
Example: Load lab dataset

```r
data <- read.csv("data.csv")
```

`read_tsv()` : read TSV file
Example: Load tab-separated file

```r
data <- read_tsv("data.tsv")
```

`filter()` : keep rows matching condition
Example: Birds heavier than 5

```r
filter(df, weight > 5)
```

`filter()` (multiple conditions) : AND logic
Example: Female birds heavier than 5

```r
filter(df, sex == "F", weight > 5)
```

`select()` : choose columns
Example: Keep length and weight

```r
select(df, length, weight)
```

`select(-)` : drop columns
Example: Remove sex column

```r
select(df, -sex)
```

`arrange()` : sort rows
Example: Sort by length

```r
arrange(df, length)
```

`desc()` : descending order
Example: Largest weight first

```r
arrange(df, desc(weight))
```

`%>%` : pipe operator
Example: Filter then select

```r
df %>% filter(weight > 5) %>% select(length)
```

---
  
  ## LAB 5 — GROUPING, SUMMARIES, MUTATE VARIANTS
  
  `group_by()` : group observations
Example: Group by sex

```r
df %>% group_by(sex)
```

`summarize()` : summary statistics
Example: Mean weight by sex

```r
df %>% group_by(sex) %>% summarize(avg_weight = mean(weight))
```

`count()` : count observations by group
Example: Count birds per sex

```r
count(df, sex)
```

`n()` : count rows inside summarize
Example: Sample size per group

```r
df %>% group_by(sex) %>% summarize(n = n())
```

`mutate()` : create new column
Example: Weight-length ratio

```r
mutate(df, ratio = weight / length)
```

`mutate(across())` : apply function to many columns
Example: Convert numeric columns to grams

```r
df %>% mutate(across(where(is.numeric), ~ . * 1000))
```

`mutate(across(where(is.numeric)))` : target numeric columns
Example: Round numeric columns

```r
df %>% mutate(across(where(is.numeric), round, 2))
```

`mutate(across(everything()))` : apply to all columns
Example: Convert everything to character

```r
df %>% mutate(across(everything(), as.character))
```

`mutate(across(between()))` : apply to column range
Example: Scale length through weight

```r
df %>% mutate(across(between(length, weight), scale))
```

---
  
  ## LAB 6 — GGPLOT (ALL COMPONENTS)
  
  `ggplot()` : initialize plot
Example: Base plot

```r
ggplot(df, aes(length, weight))
```

`aes()` : map variables to aesthetics
Example: Color by sex

```r
aes(color = sex)
```

`geom_point()` : scatter plot
Example: Length vs weight

```r
ggplot(df, aes(length, weight)) + geom_point()
```

`geom_histogram()` : distribution
Example: Weight distribution

```r
ggplot(df, aes(weight)) + geom_histogram()
```

`geom_boxplot()` : compare distributions
Example: Weight by sex

```r
ggplot(df, aes(sex, weight)) + geom_boxplot()
```

`geom_bar()` : bar chart of counts
Example: Count birds by sex

```r
ggplot(df, aes(sex)) + geom_bar()
```

`color` : outline color
Example: Color points

```r
ggplot(df, aes(length, weight, color = sex)) + geom_point()
```

`fill` : fill color
Example: Fill boxes

```r
ggplot(df, aes(sex, weight, fill = sex)) + geom_boxplot()
```

`labs()` : titles and labels
Example: Add labels

```r
ggplot(df, aes(length, weight)) + geom_point() + labs(title = "Bird Data", x = "Length", y = "Weight")
```

---
  
  ## LAB 7 — STATISTICS
  
  `median()` : median value
Example: Median weight

```r
median(df$weight)
```

`sd()` : standard deviation
Example: Weight variability

```r
sd(df$weight)
```

`var()` : variance
Example: Weight variance

```r
var(df$weight)
```

`rnorm()` : random normal data
Example: Simulate 100 observations

```r
rnorm(100, mean = 5, sd = 1)
```

`t.test()` : hypothesis test
Example: Compare weight by sex

```r
t.test(weight ~ sex, data = df)
```

---
  
  ## HOMEWORK HELPERS
  
  `distinct()` : keep unique rows
Example: Remove duplicates

```r
distinct(df)
```

`everything()` : select all remaining columns
Example: Move weight to front

```r
select(df, weight, everything())
```

`where()` : select columns by condition
Example: Select numeric columns

```r
select(df, where(is.numeric))
```

---
  
  
  ## `mutate()`, `distinct()`, `summarize()`
  
  ---
  
  
  These are **core `dplyr` verbs** used for data wrangling in R (via `tidyverse`).

* `mutate()` → **add or modify columns** (row-wise)
* `distinct()` → **remove duplicates**
  * `summarize()` → **collapse data into statistics**
  
almost always see them used with the pipe `%>%`.

---
  
  ##  `mutate()` — *Create or change columns*
  
  ### What it does
  
  * Adds **new variables (columns)**
  * Or **modifies existing columns**
  * **Does NOT change the number of rows**
  
  ---
  
  ### Basic structure
  
  ```r
mutate(data, new_column = calculation)
```

---
  
  ### Example: Create a new column
  
  ```r
students %>%
  mutate(avg_score = (exam1 + exam2) / 2)
```

What happens:
  
  * R looks **row by row**
  * Calculates the average for each row
* Adds `avg_score` as a new column

 Rows stay the same

---
  
  ### Example: Modify an existing column
  
  ```r
students %>%
  mutate(exam1 = exam1 + 5)
```

 Overwrites `exam1`

---
  
  ### Example: Conditional logic
  
  ```r
students %>%
  mutate(pass = if_else(exam1 >= 75, "Pass", "Fail"))
```

 Creates a new column based on a condition

---
  
  ### Example: Multiple columns at once
  
  ```r
students %>%
  mutate(
    total = exam1 + exam2,
    avg = total / 2
  )
```

---
  
  ### `mutate()` key takeaways
  
  *  Changes columns
*  Row-wise operations
*  Does NOT summarize
*  Does NOT remove rows

---
  
  ## `distinct()` — *Remove duplicate rows*
  
  ### What it does
  
  * Keeps **unique rows**
  * Removes **duplicate rows**
  
  ---
  
  ### Basic structure
  
  ```r
distinct(data, column_name)
```

---
  
  ### Example: Unique values in one column
  
  ```r
animals %>%
  distinct(species)
```

 One row per species
 Duplicate species removed

---
  
  ### Example: Unique combinations
  
  ```r
animals %>%
  distinct(species, location)
```

 Uniqueness depends on **both columns together**
  
  ---
  
  ### Example: Remove exact duplicate rows
  
  ```r
animals %>%
  distinct()
```

 Removes rows that are completely identical

---
  
  ### Example: Keep all columns
  
  ```r
animals %>%
  distinct(species, .keep_all = TRUE)
```

 One row per species
 Keeps other columns

---
  
  ### What “unique” means
  
  * Unique = **not duplicated**
  * Does NOT mean it appeared only once originally
* Means only one copy is kept

---
  
  ### `distinct()` key takeaways
  
  *  Removes duplicate rows
*  No math
*  No statistics
*  Used for cleaning data

---
  
  ## 3️⃣ `summarize()` — *Collapse data*
  
  ### What it does
  
  * Turns **many rows into fewer rows**
  * Computes **summary statistics**
  
  
  ---
  
  ### Basic structure
  
  ```r
summarize(data, new_column = summary_function())
```

---
  
  ### Example: One summary for all data
  
  ```r
students %>%
  summarize(mean_exam1 = mean(exam1))
```

✔ Output has **1 row**
  
  ---
  
  ### Example: Multiple summaries
  
  ```r
students %>%
  summarize(
    mean_exam1 = mean(exam1),
    max_exam2 = max(exam2),
    n = n()
  )
```

---
  
  ### `group_by()` + `summarize()` 
  
  ```r
students %>%
  group_by(name) %>%
  summarize(avg_exam1 = mean(exam1))
```

 Groups first
 Summarizes within each group
 One row per group

---
  
  ### Realistic example
  
  ```r
gabon %>%
  group_by(hunt_cat) %>%
  summarize(
    mean_distance = mean(distance),
    sd_distance = sd(distance),
    n = n()
  )
```

 One row per `hunt_cat`

---
  
  ### Common summary functions
  
  * `mean()`
* `median()`
* `sd()`
* `min()`, `max()`
* `sum()`
* `n()` (row count)

---
  
  ### `summarize()` key takeaways
  
  *  Reduces rows
*  Produces statistics
*  Usually paired with `group_by()`
*  Not for raw data

---
  
  ## Comparison Table
  
  | Function      | Changes rows? | Changes columns? | Purpose              |
  | ------------- | ------------- | ---------------- | -------------------- |
  | `mutate()`    |  No          |  Yes            | Add / modify columns |
  | `distinct()`  |  Yes         |  No             | Remove duplicates    |
  | `summarize()` |  Yes         |  Yes            | Compute statistics   |
  
  ---
  
  
  * `mutate()` → **row-wise math**
  * `distinct()` → **clean duplicates**
  * `summarize()` → **collapse to stats**
  
  ---
  
  * “Create a new variable” → `mutate()`
* “Get unique IDs / species / transects” → `distinct()`
* “Calculate mean / count / summary by group” → `group_by()` + `summarize()`

---
  summarize_all():
ex. 
  students %>%
  group_by(class) %>%
  summarize_all(mean)
One row per group, Mean of each numeric column within each group

also

students %>%
  summarize(across(everything(), mean))


Converting -999 to NA values
1) Replaces all -999 values with NA
data_clean <- data %>%
  mutate(across(everything(), ~ na_if(., -999)))

2) Remove NA values in summaries
data_clean %>%
  summarize(mean_value = mean(distance, na.rm = TRUE))

3) With grouping:
  data_clean %>%
  group_by(hunt_cat) %>%
  summarize(mean_distance = mean(distance, na.rm = TRUE))

4) Example problem:
  gabon %>%
  mutate(distance = na_if(distance, -999)) %>%
  group_by(hunt_cat) %>%
  summarize(mean_distance = mean(distance, na.rm = TRUE))
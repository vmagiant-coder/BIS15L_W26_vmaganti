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



BIS 015L MIDTERM PRACTICE + CHEAT SHEET

Load packages:
  
  library(tidyverse)
library(RColorBrewer)
library(paletteer)
library(lubridate)
library(ggmap)
library(sf)
library(shiny)
library(shinydashboard)

Create practice dataset:
  
  animals <- tibble(
    id = 1:10,
    species = c("cat","cat","dog","dog","dog","bird","bird","cat","dog","bird"),
    weight = c(8, 10, 20, 22, 25, 2, 3, NA, 18, 4),
    sex = c("F","M","F","M","F","F","M","F","M","M"),
    year = c(2020,2020,2021,2021,2022,2020,2021,2022,2022,2021)
  )

group_by() and summarize()

What they do:
  
  group_by() splits data into groups

summarize() calculates statistics per group

Example Question 1:
  Find the mean weight of each species.

animals %>%
  group_by(species) %>%
  summarize(mean_weight = mean(weight, na.rm = TRUE))

Example Question 2:
  How many animals of each species are there?
  
  animals %>%
  group_by(species) %>%
  summarize(count = n())

Example Question 3:
  Find the average weight by species AND sex.

animals %>%
  group_by(species, sex) %>%
  summarize(mean_weight = mean(weight, na.rm = TRUE))

pivot_longer() and pivot_wider()

Create wide dataset:
  
  wide_data <- tibble(
    id = 1:3,
    height_2020 = c(10,12,14),
    height_2021 = c(11,13,15)
  )

Example Question 1:
  Convert this wide dataset into long format.

long_data <- wide_data %>%
  pivot_longer(cols = height_2020:height_2021,
               names_to = "year",
               values_to = "height")

Example Question 2:
  Convert long_data back to wide format.

long_data %>%
  pivot_wider(names_from = year,
              values_from = height)

Barplots (geom_bar, geom_col)

Example Question 1:
  Make a barplot showing number of animals per species.

ggplot(animals, aes(x = species)) +
  geom_bar()

Example Question 2:
  Make a barplot showing average weight per species.

summary_data <- animals %>%
  group_by(species) %>%
  summarize(mean_weight = mean(weight, na.rm = TRUE))

ggplot(summary_data, aes(x = species, y = mean_weight)) +
  geom_col()

Stacked vs Dodged Barplots

Example Question 1:
  Create a stacked barplot showing species by sex.

ggplot(animals, aes(x = species, fill = sex)) +
  geom_bar()

Example Question 2:
  Create side-by-side barplot.

ggplot(animals, aes(x = species, fill = sex)) +
  geom_bar(position = "dodge")

Scatterplots, Boxplots, Line Plots

Example Question 1:
  Create scatterplot of weight vs year.

ggplot(animals, aes(x = year, y = weight)) +
  geom_point()

Example Question 2:
  Create boxplot of weight by species.

ggplot(animals, aes(x = species, y = weight)) +
  geom_boxplot()

Example Question 3:
  Create line plot of average weight per year.

animals %>%
  group_by(year) %>%
  summarize(mean_weight = mean(weight, na.rm = TRUE)) %>%
  ggplot(aes(x = year, y = mean_weight)) +
  geom_line()

Histograms and Density Plots

Example Question:
  Plot distribution of weight.

ggplot(animals, aes(x = weight)) +
  geom_histogram(bins = 5)
ggplot(animals, aes(x = weight)) +
  geom_density()

Colors and Aesthetics

Example Question:
  Improve readability using color.

ggplot(animals, aes(x = species, fill = species)) +
  geom_bar() +
  scale_fill_brewer(palette = "Set1") +
  theme_minimal()

Using paletteer:
  
  ggplot(animals, aes(x = species, fill = species)) +
  geom_bar() +
  scale_fill_paletteer_d("RColorBrewer::Set2")

case_when()

Example Question:
  Create weight category: small (<5), medium (5–15), large (>15).

animals <- animals %>%
  mutate(size_category = case_when(
    weight < 5 ~ "small",
    weight >= 5 & weight <= 15 ~ "medium",
    weight > 15 ~ "large",
    TRUE ~ NA_character_
  ))

Plot using new category:
  
  ggplot(animals, aes(x = size_category)) +
  geom_bar()

Faceting

Example Question:
  Create histogram of weight separated by species.

ggplot(animals, aes(x = weight)) +
  geom_histogram(bins = 5) +
  facet_wrap(~ species)

NA Handling (Important)

Definition:
  NA means missing value in R.

Example Question 1:
  Count total NAs.

sum(is.na(animals))

Example Question 2:
  Count NAs per column.

colSums(is.na(animals))

Example Question 3:
  Remove rows with NA.

animals_no_na <- drop_na(animals)

Example Question 4:
  Replace weight 0 with NA.

animals <- animals %>%
  mutate(weight = ifelse(weight == 0, NA, weight))

Important:
  Always use na.rm = TRUE in summaries.

Joins

Create second dataset:
  
  owners <- tibble(
    id = c(1,2,3,4,5),
    owner_name = c("A","B","C","D","E")
  )

Example Question 1:
  Left join owners to animals.

left_join(animals, owners, by = "id")

Example Question 2:
  Inner join.

inner_join(animals, owners, by = "id")

Dates

Example Question:
  Convert character to date and extract year.

animals$date <- ymd("2025-03-02")
year(animals$date)
month(animals$date)

Vector vs Raster

Vector:
  Points, lines, polygons.

Raster:
  Grid of pixels (continuous data like temperature).

Exam question example:
  Explain which data type is used for GPS coordinates.
Answer: Vector.

ggmap and Coordinates

Example dataset:
  
  locations <- data.frame(
    lon = c(-121.7, -122.4),
    lat = c(38.5, 37.7)
  )

Plot:
  
  ggplot(locations, aes(x = lon, y = lat)) +
  geom_point()

Bounding box:
  
  bbox(locations)

Basic Shiny App

Example Question:
  Build app with slider controlling histogram sample size.

ui <- fluidPage(
  sliderInput("num", "Sample Size", 10, 1000, 100),
  plotOutput("hist")
)

server <- function(input, output) {
  output$hist <- renderPlot({
    hist(rnorm(input$num))
  })
}

shinyApp(ui, server)

Add New Input to Shiny

selectInput("color", "Choose Color",
            choices = c("red","blue","green"))

shinydashboard Example

ui <- dashboardPage(
  dashboardHeader(title = "My Dashboard"),
  dashboardSidebar(
    sliderInput("num","Number",10,500,100)
  ),
  dashboardBody(
    plotOutput("hist")
  )
)

server <- function(input, output) {
  output$hist <- renderPlot({
    hist(rnorm(input$num))
  })
}

shinyApp(ui, server)


In RStudio, select plots based on data type and analysis goals: Use histograms for single continuous variable distributions, scatter plots for two-variable relationships, and line plots for trends over time. Bar/column charts compare categorical groups, while boxplots (distribution graphs) are best for comparing data spread and outliers. 
Bookdown
Bookdown
+5
Here is a guide to selecting plots in R (typically using ggplot2):
  1. Histograms (geom_histogram)
When to use: To visualize the shape, center, and spread of a single continuous numerical variable.
Example: Showing the distribution of employee salaries or age ranges.
Key Aspect: Data is divided into "bins" (intervals), and the height represents the frequency. 


2. Distribution Plots / Boxplots (geom_boxplot, geom_density)
When to use: To compare numerical data distributions across multiple categories, specifically highlighting the median, quartiles, and outliers.
Example: Comparing test scores (numeric) between different classes (categorical).
Alternative: Use geom_density() to show the smooth probability distribution instead of boxplots. 


3. Bar & Column Charts (geom_bar, geom_col)
When to use: To compare values across discrete categories.
geom_bar(): Used when you want R to count the frequency of occurrences for each category (e.g., number of cars per cylinder type).
geom_col(): Used when you have pre-calculated values and want the bar height to represent that exact value (e.g., total sales per region). 


4. Scatter Plots (geom_point) 
When to use: To determine the relationship or correlation between two numerical variables.
Example: Showing the relationship between advertising spend (x-axis) and sales revenue (y-axis).
Add-on: Use geom_smooth() to add a regression line to see the trend. 

5. Line Plots (geom_line)
When to use: To display trends over an ordered variable, most commonly time.
Example: Stock prices over the last 12 months or temperature changes over a day. 


geom_bar() automatically calculates the count of observations for each category on the X-axis and maps this count to the Y-axis. You only need to specify the x aesthetic.
geom_col() requires you to explicitly provide values for both the X and Y aesthetics, where the Y-value is a pre-calculated measure (e.g., mean, sum, or a value already present in your data).

Summary Table for R Selection
Plot Type 	Goal	Data Type (X)	Data Type (Y)
Histogram	Distribution/Shape	Continuous	Frequency
Boxplot	Distribution/Outliers	Categorical	Continuous
Bar/Column	Categorical Comparison	Categorical	Discrete/Total
Scatter	Relationship/Correlation	Continuous	Continuous
Line	Time Series/Trend	Time/Ordered	Continuous
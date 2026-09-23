# Zomato Restaurant Analytics

> End-to-end Zomato restaurant analytics project using Python, MySQL, and Power BI to analyze restaurant ratings, pricing, cuisines, locations, customer engagement, and service availability, with interactive dashboards and business insights.

---

## 📌 Project Overview

This project analyzes a Zomato restaurant dataset to understand patterns in restaurant ratings, pricing, cuisines, locations, customer engagement, online ordering, and table booking.

The project follows a complete data analytics workflow:

```text
Raw Dataset
    ↓
Data Cleaning & Preparation
    ↓
Exploratory Data Analysis (Python)
    ↓
Business Analysis (MySQL)
    ↓
Interactive Dashboard (Power BI)
    ↓
Insights & Conclusions
```

The objective is to transform raw restaurant data into meaningful insights that can help understand restaurant characteristics, customer engagement, pricing patterns, and service availability.

---

## 🎯 Objectives

The main objectives of this project are:

- Understand the distribution of restaurant ratings.
- Analyze restaurant pricing patterns.
- Examine the relationship between price and ratings.
- Compare ratings of restaurants with and without online ordering.
- Analyze the relationship between table booking and ratings.
- Identify locations with the highest number of restaurants.
- Compare average ratings across locations.
- Analyze restaurant types and their ratings.
- Identify the most frequently listed cuisines.
- Compare cuisine popularity and average ratings.
- Analyze the relationship between customer votes, price, and ratings.
- Build an interactive Power BI dashboard for business-oriented analysis.

---

## 📊 Dataset

The dataset contains restaurant-level information from Zomato.

### Dataset Size

- Original records: **51,717**
- Columns after removing the unnecessary `url` field: **16**
- Duplicate records removed: **40**
- Final records: **51,677**

### Important Columns

| Column | Description |
|---|---|
| `name` | Restaurant name |
| `online_order` | Whether online ordering is available |
| `book_table` | Whether table booking is available |
| `rate` | Restaurant rating |
| `votes` | Number of customer votes |
| `location` | Restaurant location |
| `rest_type` | Restaurant type |
| `cuisines` | Cuisines offered |
| `approx_cost(for two people)` | Approximate cost for two people |
| `listed_in(type)` | Restaurant listing/category type |
| `listed_in(city)` | City listing information |

---

## 🧹 Data Cleaning

Data cleaning was performed using **Python and Pandas**.

### Main Cleaning Steps

- Removed the unnecessary `url` column.
- Checked dataset structure and data types.
- Identified missing values.
- Standardized missing phone values.
- Cleaned restaurant ratings by:
  - Removing `/5` from rating values.
  - Converting `NEW` and `-` to missing values.
  - Converting ratings to numeric format.
- Cleaned restaurant cost values by:
  - Removing commas from values such as `1,200`.
  - Converting cost values to numeric format.
- Checked and removed **40 exact duplicate records**.
- Validated final data types and missing values.
- Preserved missing ratings instead of replacing them with the mean.

### Final Missing Values

The main remaining missing values were:

- `rate`: **10,037**
- `approx_cost(for two people)`: **345**

These values were retained as missing because replacing them could distort the analysis.

---

# 🔎 Exploratory Data Analysis

EDA was performed using:

- Pandas
- NumPy
- Matplotlib
- Seaborn

## 1. Rating Distribution

Restaurant ratings are concentrated mainly in the **3.2–4.2** range.

The mean and median rating are both approximately **3.70**.

The most frequently occurring exact rating is approximately **3.9**.

Very low ratings and near-perfect ratings are relatively uncommon.

---

## 2. Online Ordering vs Rating

Restaurants offering online ordering have a slightly higher average rating:

| Online Ordering | Average Rating |
|---|---:|
| No | 3.66 |
| Yes | 3.72 |

The difference is relatively small and the distributions overlap considerably.

Therefore, this analysis indicates an **association rather than causation**.

---

## 3. Price vs Rating

The correlation between approximate cost and restaurant rating is:

**Pearson correlation = 0.385**

This indicates a weak-to-moderate positive relationship.

Higher-priced restaurants tend to have somewhat higher ratings, but there is substantial variation in ratings at different price levels.

Therefore, price alone does not strongly determine restaurant ratings.

---

## 4. Restaurant Type Analysis

The most common restaurant types include:

- Quick Bites
- Casual Dining
- Cafe
- Delivery
- Dessert Parlor
- Takeaway, Delivery

**Quick Bites** has the largest number of records in the dataset.

---

## 5. Location Analysis

Locations with the highest number of restaurant records include:

| Location | Restaurant Records |
|---|---:|
| BTM | 5,114 |
| HSR | 2,522 |
| Koramangala 5th Block | 2,504 |
| JP Nagar | 2,234 |
| Whitefield | 2,142 |
| Indiranagar | 2,082 |
| Jayanagar | 1,926 |
| Marathahalli | 1,846 |
| Bannerghatta Road | 1,630 |
| Bellandur | 1,286 |

BTM has substantially more restaurant records than the other locations in the dataset.

---

## 6. Location vs Average Rating

Locations were compared using average ratings while requiring at least **100 rated restaurants** to reduce the effect of very small groups.

Some locations with relatively high average ratings include:

| Location | Rated Restaurants | Average Rating |
|---|---:|---:|
| Lavelle Road | 485 | 4.14 |
| Koramangala 3rd Block | 191 | 4.02 |
| St. Marks Road | 343 | 4.02 |
| Koramangala 5th Block | 2,319 | 4.01 |
| Church Street | 546 | 3.99 |
| Koramangala 4th Block | 841 | 3.92 |
| Cunningham Road | 475 | 3.90 |
| Residency Road | 604 | 3.86 |
| MG Road | 811 | 3.86 |
| Koramangala 7th Block | 1,060 | 3.85 |

These values describe differences in the dataset and should not be interpreted as evidence that location causes higher ratings.

---

## 7. Cuisine Analysis

Because restaurants can offer multiple cuisines, the `cuisines` column was split into individual cuisine records for analysis.

The most frequently listed cuisines include:

| Cuisine | Count |
|---|---:|
| North Indian | 21,069 |
| Chinese | 15,534 |
| South Indian | 8,638 |
| Fast Food | 8,091 |
| Biryani | 6,483 |
| Continental | 5,759 |
| Desserts | 5,631 |
| Cafe | 5,300 |
| Beverages | 4,743 |
| Italian | 3,386 |
| Bakery | 2,838 |
| Street Food | 2,593 |
| Pizza | 2,072 |
| Burger | 2,007 |
| Seafood | 1,810 |

**North Indian** is the most frequently listed cuisine.

> Cuisine counts can exceed the total number of restaurants because a single restaurant can offer multiple cuisines.

---

## 8. Cuisine vs Rating

Among commonly represented cuisines, some of the observed average ratings were:

| Cuisine | Average Rating |
|---|---:|
| Continental | 3.96 |
| Italian | 3.95 |
| Burger | 3.92 |
| Pizza | 3.91 |
| Cafe | 3.90 |
| Desserts | 3.86 |
| Beverages | 3.81 |
| Seafood | 3.80 |
| North Indian | 3.64 |
| Chinese | 3.61 |
| South Indian | 3.61 |
| Fast Food | 3.61 |
| Biryani | 3.55 |

These are restaurant-level associations within the dataset and should not be interpreted as customers universally preferring one cuisine over another.

---

## 9. Votes vs Rating

Customer votes have a moderate positive relationship with ratings.

**Correlation ≈ 0.435**

Restaurants with more votes tend to have somewhat higher ratings, but there is considerable variation.

Correlation does not establish causation.

---

## 10. Online Ordering + Table Booking

The combination of online ordering and table booking was also analyzed.

| Online Order | Table Booking | Average Rating |
|---|---|---:|
| No | No | 3.55 |
| Yes | No | 3.66 |
| No | Yes | 4.16 |
| Yes | Yes | 4.13 |

Table booking is associated with substantially higher average ratings in both online-ordering groups.

Again, this is a descriptive relationship and does not establish that table booking causes higher ratings.

---

## 11. Price Distribution

Restaurant prices are strongly right-skewed.

| Statistic | Approximate Cost for Two |
|---|---:|
| Minimum | ₹40 |
| 25th Percentile | ₹300 |
| Median | ₹400 |
| Mean | ₹555 |
| 75th Percentile | ₹650 |
| Maximum | ₹6,000 |

The difference between the median and mean indicates the influence of relatively expensive restaurants on the distribution.

---

## 12. Correlation Analysis

The main numeric relationships observed were:

| Variables | Correlation |
|---|---:|
| Rating vs Votes | 0.435 |
| Rating vs Cost | 0.385 |
| Cost vs Votes | 0.367 |

Customer votes have a slightly stronger correlation with ratings than approximate cost.

However, none of these relationships alone strongly explains restaurant ratings.

---

# 🗄️ SQL Analysis

The cleaned dataset was imported into **MySQL** for business-oriented analysis.

The SQL analysis covered:

1. Top locations by restaurant count.
2. Average restaurant rating by location.
3. Most common restaurant types.
4. Average rating by restaurant type.
5. Most frequently listed cuisines.
6. Online ordering vs average rating and votes.
7. Table booking vs average rating and votes.
8. Combined analysis of online ordering and table booking.

### SQL Techniques Used

- `SELECT`
- `WHERE`
- `GROUP BY`
- `HAVING`
- `ORDER BY`
- `COUNT()`
- `AVG()`
- `ROUND()`
- `LIMIT`
- Conditional filtering
- String manipulation
- Splitting multi-valued cuisine information

SQL files are available in the repository under:

```text
sql/
```

---

# 📈 Power BI Dashboard

An interactive Power BI dashboard was created using the cleaned dataset.

## Dashboard Page 1 — Overview

Contains:

- Total Restaurant Records
- Average Rating
- Average Cost for Two
- Average Votes
- Restaurant Rating Distribution
- Average Rating by Online Ordering

### Key KPIs

| KPI | Value |
|---|---:|
| Restaurant Records | 51,677 |
| Average Rating | 3.70 |
| Average Cost for Two | ₹555.44 |
| Average Votes | 283.8 |

---

## Dashboard Page 2 — Restaurant & Location Analysis

Contains:

- Top 10 Locations by Restaurant Count
- Average Rating by Location
- Top Restaurant Types
- Average Rating by Restaurant Type

This page helps compare restaurant concentration and rating patterns across locations and restaurant categories.

---

## Dashboard Page 3 — Cuisine Analysis

Contains:

- Top 15 Cuisines by Restaurant Count
- Average Rating by Cuisine
- Cuisine Popularity vs Average Rating

The scatter plot compares the number of restaurants associated with each cuisine against its average rating.

---

# 🛠️ Technologies Used

### Programming & Analysis

- Python
- Pandas
- NumPy

### Data Visualization

- Matplotlib
- Seaborn
- Power BI

### Database

- MySQL
- MySQL Workbench

### Development Tools

- Jupyter Notebook
- VS Code
- Git / GitHub

---

# 📁 Project Structure

```text
Zomato-Restaurant-Analytics/
│
├── data/
│   └── zomato_cleaned.csv
│
├── notebooks/
│   └── Zomato_EDA.ipynb
│
├── sql/
│   ├── Zomato_SQL_Analysis.sql
│   └── Zomato_SQL_Analysis.ipynb
│
├── powerbi/
│   └── Zomato_Restaurant_Analytics.pbix
│
├── README.md
│
└── requirements.txt
```

> File names may vary depending on the final repository organization.

---

# 🚀 How to Run the Project

## 1. Clone the Repository

```bash
git clone https://github.com/AarshK17/Zomato-Restaurant-Analytics.git
cd Zomato-Restaurant-Analytics
```

## 2. Install Python Dependencies

```bash
pip install pandas numpy matplotlib seaborn jupyter
```

## 3. Run the EDA Notebook

Open:

```text
notebooks/Zomato_EDA.ipynb
```

using Jupyter Notebook or VS Code.

## 4. SQL Analysis

Import:

```text
data/zomato_cleaned.csv
```

into MySQL and execute:

```text
sql/Zomato_SQL_Analysis.sql
```

The repository also contains the SQL analysis notebook:

```text
sql/Zomato_SQL_Analysis.ipynb
```

## 5. Power BI Dashboard

Open:

```text
powerbi/Zomato_Restaurant_Analytics.pbix
```

using Power BI Desktop.

---

# 💡 Key Business Insights

The analysis produced several notable observations:

1. Restaurant ratings are concentrated around the **mid-to-high 3s**, with an overall average of approximately **3.70**.

2. Restaurants offering online ordering have a slightly higher average rating than those without online ordering.

3. Restaurants offering table booking have substantially higher average ratings in this dataset.

4. Restaurant pricing is strongly right-skewed, with a **₹400 median cost for two** compared with a **₹555 mean**.

5. **BTM** has the highest number of restaurant records among the analyzed locations.

6. **North Indian** is the most frequently listed cuisine.

7. Restaurant ratings have moderate positive associations with both **customer votes** and **approximate cost**.

8. Restaurant type and location show noticeable differences in average ratings.

9. Cuisine popularity and cuisine-level average ratings do not necessarily move together, which can be explored using the Power BI scatter plot.

---

# ⚠️ Limitations

- The dataset represents restaurant records rather than necessarily unique physical restaurants in every analysis.
- Some restaurants have missing ratings.
- Cuisine values are multi-valued, so cuisine counts can exceed the total number of restaurant records.
- Approximate cost is an estimated cost for two people rather than an exact transaction value.
- Correlation and group comparisons show associations, not causal relationships.
- Restaurant types and locations can have very different sample sizes.
- Average ratings for small groups can be less representative, so minimum-count filters were used for some comparisons.

---

# 📌 Skills Demonstrated

This project demonstrates practical skills in:

- Data cleaning
- Missing-value handling
- Duplicate detection and removal
- Exploratory Data Analysis
- Statistical summaries
- Correlation analysis
- Data visualization
- Business question formulation
- SQL querying
- Aggregation and grouping
- Multi-valued categorical data handling
- Power BI dashboard development
- Data storytelling
- Business insight generation

---

# 👨‍💻 Author

**Aarsh Khadgi**

B.Tech — Electronics & Telecommunication Engineering  
YCCE, Nagpur

### Profiles

- GitHub: [AarshK17](https://github.com/AarshK17)
- LinkedIn: [Aarsh Khadgi](https://linkedin.com/in/aarsh-khadgi)

---

# ⭐ Project Summary

This project demonstrates an end-to-end data analytics workflow, starting from raw restaurant data and progressing through **Python-based data cleaning and EDA, MySQL business analysis, and Power BI dashboard development**.

The project focuses on converting raw data into interpretable business insights while maintaining appropriate statistical and analytical caveats.

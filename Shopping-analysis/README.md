Shopping Dataset Analysis

Objective
The goal of this project was to perform Exploratory Data Analysis (EDA) on a shopping dataset and understand patterns related to product ratings, pricing, discounts, popularity, and category-wise performance. This project helped me gain hands-on experience with data cleaning, feature engineering, visualization, and deriving meaningful insights from data.

Libraries Used
For this project, I used the following Python libraries:

Pandas
NumPy
Matplotlib
Seaborn
These libraries were used for data processing, visualization, file extraction, and file management tasks.

What I Did
Data Loading
Extracted the dataset from a ZIP file.
Loaded the dataset into a Pandas DataFrame.
Data Exploration
Checked the shape of the dataset.
Examined column names and data types.
Used head(), info(), and describe() to understand the dataset.
Data Cleaning
Identified missing values.
Handled null values where required.
Converted price-related columns into numeric format.
Removed duplicate records.
Feature Engineering
Created additional columns to improve the analysis:

Saved Amount = Initial Price − Final Price
Popularity Score = Rating × Ratings Count
Analysis Performed
Univariate Analysis
Bivariate Analysis
Category-wise Analysis
Visualizations
Created different visualizations to better understand the dataset:

Histograms
Bar Charts
Boxplots
Correlation Heatmap
Key Findings
During the analysis, I found that most products had ratings above 4.0, indicating generally positive customer satisfaction. Products with a higher number of reviews were usually more popular, highlighting the importance of customer feedback. Discounts played a major role in reducing product prices and attracting customers. I also observed that some categories consistently performed better than others in terms of ratings and popularity.

Project Structure
shopping-analysis/ │ ├── data/ │ └── combined_dataset.csv │ ├── notebook/ │ └── analysis.ipynb │ └── README.md

Files Included
combined_dataset.csv – Dataset used for analysis
analysis.ipynb – Jupyter Notebook containing the complete analysis
README.md – Project documentation
Conclusion
This project helped me strengthen my understanding of data analysis using Python. Through this work, I learned how to clean data, create meaningful features, visualize patterns, and extract useful insights from a real-world shopping dataset.

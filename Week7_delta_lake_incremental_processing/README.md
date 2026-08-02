# Delta Lake Incremental Data Processing

## Overview

This project demonstrates incremental data processing using **Delta Lake** with **Apache Spark (PySpark)**. The Superstore dataset is loaded into a Delta table, cleaned, and updated using the **MERGE** operation to simulate real-world incremental data loading. The final dataset is then validated to ensure data consistency.

---

## Objective

- Load the Superstore dataset into a Delta table.
- Perform basic data cleaning.
- Create an incremental dataset with updated and new records.
- Apply the Delta Lake **MERGE** operation.
- Validate the final dataset.
- Display the processed Delta table.

---

## Technologies Used

- Apache Spark (PySpark)
- Delta Lake
- Databricks
- Python

---

## Dataset

- **Sample - Superstore.csv**
- **Format:** CSV

---

## Project Structure

```text
Week-7-Delta-Lake-Incremental-Processing/
│
├── README.md
│
├── data/
│   └── Sample - Superstore.csv
│
├── notebooks/
│   └── delta_lake_incremental_processing.ipynb
│
└── screenshots/
    ├── data_loading/
    │   ├── 01_dataset_loaded.png
    │   ├── 02_columns_renamed.png
    │   └── 03_delta_table_created.png
    │
    ├── data_cleaning/
    │   ├── 04_missing_values_check.png
    │   └── 05_duplicates_removed.png
    │
    ├── merge_operation/
    │   ├── 06_incremental_dataset.png
    │   ├── 07_merge_query.png
    │   └── 08_merge_completed.png
    │
    ├── validation/
    │   ├── 09_row_count_validation.png
    │   └── 10_duplicate_validation.png
    │
    └── final_output/
        ├── 11_final_delta_table.png
        └── 12_assignment_summary.png
```

---

## Steps Performed

1. Loaded the Superstore dataset into a PySpark DataFrame.
2. Renamed column names by replacing spaces with underscores.
3. Created a Delta table from the dataset.
4. Checked for missing values.
5. Removed duplicate records.
6. Created an incremental dataset containing one updated record and one new record.
7. Applied the Delta Lake **MERGE** operation to update existing records and insert new records.
8. Validated the final dataset using row count and duplicate checks.
9. Displayed the final Delta table.

---

## Results

- Successfully loaded the Superstore dataset into a Delta table.
- Renamed all column names for easier processing.
- Found **2 null values** during data quality checks.
- Removed duplicate records before processing.
- Successfully updated one existing record and inserted one new record using the Delta Lake **MERGE** operation.
- Validated the final dataset and displayed the processed Delta table.

---

## Conclusion

This project demonstrates how Delta Lake supports efficient incremental data processing using the **MERGE** operation. The assignment successfully performed data cleaning, updates, inserts, and validation while maintaining data consistency.

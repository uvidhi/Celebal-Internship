# 🚀 Week 4 – Azure Data Factory Pipeline

> **End-to-End Data Pipeline using Azure Blob Storage & Azure Data Factory**

---

## 📖 Overview

This project demonstrates how to build an end-to-end data pipeline using **Microsoft Azure**. The pipeline validates the source file using the **Get Metadata** activity and copies a CSV file from the **input** Blob Storage container to the **output** container using **Azure Data Factory (ADF)**.

---

## 🎯 Objectives

- Create and configure Azure resources
- Store data in Azure Blob Storage
- Connect Azure Data Factory with Blob Storage
- Validate source file metadata
- Build and execute a Copy Data pipeline
- Monitor pipeline execution
- Verify successful data transfer

---

## ☁️ Azure Services Used

| Azure Service | Purpose |
|--------------|---------|
| 📁 Resource Group | Organizes Azure resources |
| 💾 Storage Account | Stores Blob containers |
| 📦 Blob Storage | Stores source & destination files |
| 🔄 Azure Data Factory | Builds and executes data pipelines |
| 🔐 Azure IAM | Manages access permissions |

---

## 🏗️ Project Architecture

```text
               Azure Blob Storage
             ┌────────────────────┐
             │      input          │
             │ Sample-Superstore   │
             └─────────┬───────────┘
                       │
                       ▼
              Get Metadata Activity
                       │
                       ▼
                Copy Data Activity
                       │
                       ▼
             ┌────────────────────┐
             │      output         │
             │      Copy.csv       │
             └────────────────────┘
```

---

## ⚙️ Implementation Workflow

- ✅ Created Azure Resource Group
- ✅ Created Azure Storage Account
- ✅ Created **input** and **output** Blob Containers
- ✅ Uploaded the CSV dataset
- ✅ Created Azure Data Factory
- ✅ Configured Linked Service
- ✅ Created Source & Destination Datasets
- ✅ Configured Get Metadata Activity
- ✅ Configured Copy Data Activity
- ✅ Executed and monitored the pipeline
- ✅ Verified successful data transfer

---

## 📂 Repository Structure

```text
Week-4-ADF-Pipeline/
│
├── README.md
├── Week-4_Azure_Data_Factory_Pipeline_Report.pdf
├── Sample-Superstore.csv
└── images/
    ├── 01-resource-group.png
    ├── 02-storage-account.png
    ├── 03-input-container.png
    ├── 04-linked-service.png
    ├── 05-source-dataset.png
    ├── 06-destination-dataset.png
    ├── 07-get-metadata.png
    ├── 08-pipeline-design.png
    ├── 09-pipeline-success.png
    ├── 10-output-container.png
    └── 11-iam-role.png
```

---

## 📸 Project Screenshots

| Task | Screenshot |
|------|------------|
| Resource Group | `images/01-resource-group.png` |
| Storage Account | `images/02-storage-account.png` |
| Input Container | `images/03-input-container.png` |
| Linked Service | `images/04-linked-service.png` |
| Source Dataset | `images/05-source-dataset.png` |
| Destination Dataset | `images/06-destination-dataset.png` |
| Get Metadata | `images/07-get-metadata.png` |
| Pipeline Design | `images/08-pipeline-design.png` |
| Pipeline Success | `images/09-pipeline-success.png` |
| Output Container | `images/10-output-container.png` |
| IAM Roles | `images/11-iam-role.png` |

---

## ✅ Results

- Successfully connected Azure Data Factory with Azure Blob Storage.
- Retrieved file metadata using the **Get Metadata** activity.
- Copied the CSV file from the **input** container to the **output** container.
- Verified successful pipeline execution.

---

## 📚 Key Learnings

- Azure Resource Management
- Azure Blob Storage
- Azure Data Factory
- Linked Services & Datasets
- Metadata Validation
- Copy Data Activity
- Pipeline Monitoring
- IAM Role Configuration

---

## 🔮 Future Improvements

- Add pipeline parameters
- Schedule execution using Triggers
- Integrate Azure SQL Database
- Process multiple files using ForEach
- Implement logging and monitoring

---

## 🎉 Project Status

**✔ Completed Successfully**

The Azure Data Factory pipeline was successfully executed, validating the source file metadata and copying the dataset from the **input** Blob container to the **output** Blob container.

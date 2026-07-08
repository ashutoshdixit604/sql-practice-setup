# SQL & MongoDB Interview Practice Kit

A complete interview preparation repository for **PostgreSQL**, **MongoDB**, and **Docker**.

The goal of this repository is to provide a reusable environment for practicing SQL queries, MongoDB queries, database design, aggregation, indexing, transactions, and interview questions without installing databases directly on your machine.

---

# Tech Stack

* PostgreSQL 17
* MongoDB 8
* Docker
* Docker Compose
* DBeaver (PostgreSQL)
* MongoDB Compass (MongoDB)

---

# Repository Structure

```text
.
├── docker-compose.yml
│
├── postgres
│   ├── init
│   │   ├── 01-create-schema.sql
│   │   ├── 02-insert-data.sql
│   │
│   └── data
│
└── mongodb
    ├── init
    │   ├── init.js
    │
    └── data
```

---

# Prerequisites

Install:

* Docker Desktop
* DBeaver Community Edition
* MongoDB Compass (Optional)

Verify Docker installation:

```bash
docker --version
docker compose version
```

---

# Start the Databases

```bash
docker compose up -d
```

Verify running containers:

```bash
docker ps
```

---

# Stop Containers

```bash
docker compose stop
```

---

# Start Existing Containers

```bash
docker compose start
```

---

# Remove Containers

```bash
docker compose down
```

---

# Remove Containers and Volumes

This resets everything and reruns the initialization scripts on the next startup.

```bash
docker compose down -v
```

---

# PostgreSQL

Connect using `psql`:

```bash
docker exec -it postgres-db psql -U postgres -d company
```

Useful commands:

```sql
\l
\c company
\dt
\d employees
```

---

# MongoDB

Connect using `mongosh`:

```bash
docker exec -it mongo-db mongosh
```

Switch database:

```javascript
use company
```

Show collections:

```javascript
show collections
```

---

# PostgreSQL Interview Topics

* SELECT
* WHERE
* DISTINCT
* ORDER BY
* LIMIT / OFFSET
* Aggregate Functions
* GROUP BY
* HAVING
* INNER JOIN
* LEFT JOIN
* RIGHT JOIN
* FULL JOIN
* SELF JOIN
* Subqueries
* Correlated Subqueries
* Common Table Expressions (CTE)
* Window Functions
* CASE
* UNION
* UNION ALL
* Transactions
* Indexes
* EXPLAIN ANALYZE
* Database Design

---

# MongoDB Interview Topics

* CRUD Operations
* Query Operators
* Projection
* Sorting
* Limit & Skip
* Aggregation Framework
* `$match`
* `$group`
* `$project`
* `$sort`
* `$lookup`
* `$unwind`
* `$facet`
* `$count`
* Indexes
* Transactions
* Replication
* Sharding

---

# SQL Query Execution Order

```text
FROM
JOIN
ON
WHERE
GROUP BY
HAVING
SELECT
DISTINCT
ORDER BY
LIMIT
OFFSET
```

---

# MongoDB Aggregation Pipeline

```text
Collection
    ↓
$match
    ↓
$group
    ↓
$project
    ↓
$sort
    ↓
$limit
    ↓
Result
```

---

# Reset the Environment

```bash
docker compose down -v
docker compose up -d
```

This recreates the databases and executes all initialization scripts.

---

# Interview Coverage

## PostgreSQL

* Basic SQL
* Advanced SQL
* Database Design
* Transactions
* Indexing
* Performance Optimization
* Window Functions
* Real Interview Questions

## MongoDB

* CRUD Operations
* Aggregation Framework
* Query Optimization
* Indexing
* Document Modeling
* `$lookup`
* Transactions
* Real Interview Questions

---

# Target Audience

This repository is suitable for:

* Backend Developers
* Go Developers
* Java Developers
* Node.js Developers
* Python Developers
* Full Stack Developers

---

# Learning Roadmap

### PostgreSQL

* [ ] Database Setup
* [ ] Basic Queries
* [ ] Filtering
* [ ] Sorting
* [ ] Aggregate Functions
* [ ] GROUP BY & HAVING
* [ ] JOINs
* [ ] Subqueries
* [ ] CTE
* [ ] Window Functions
* [ ] Transactions
* [ ] Indexes
* [ ] Mock Interview Questions

### MongoDB

* [ ] Database Setup
* [ ] CRUD
* [ ] Query Operators
* [ ] Projection
* [ ] Aggregation Framework
* [ ] `$lookup`
* [ ] Transactions
* [ ] Indexes
* [ ] Mock Interview Questions

---

# Goal

Build a reusable database practice environment that can be used to prepare for backend developer interviews at companies such as IBM, Kyndryl, EPAM, Capgemini, TCS, Oracle, Walmart, Adobe, Visa, Mastercard, and other product or service-based organizations.

Happy Learning! 🚀

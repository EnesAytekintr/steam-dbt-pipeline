# dbt pipeline for March 2025 Steam Games Dataset
![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![dbt](https://img.shields.io/badge/dbt-FF694B?style=for-the-badge&logo=dbt&logoColor=white)

  A dbt(data build tool) project for maintaining small sized Steam games dataset
  
---


<img width="1793" height="906" alt="image" src="https://github.com/user-attachments/assets/4d2b1aea-e102-42a6-8093-e76c0f854d0f" />


## Getting Started

### 1. Prerequisites
Make sure you have **Docker** and **Docker Compose** installed on your system.

### 2. Installation
Clone the repository and navigate into the project directory:
```bash
git clone [https://github.com/EnesAytekintr/steam-dbt-pipeline.git](https://github.com/EnesAytekintr/steam-dbt-pipeline.git)
cd steam
```

### 3. Environment Setup
Create a .env file in the root directory based on .env.example.

### 4. Running the Application via Docker Compose (Recommended)
You can compile the optimized image and orchestrate the live container container in detached mode with a single command:

```bash
docker compose up -d --build
```
The application will automatically initialize, bind the environment, set up active volume syncing for instant hot-reloads, and map the worker gateway.

Tear Down Infrastructure:
```bash
docker compose down
```
To see dbt DAG:
```bash
dbt deps
dbt docs generate
dbt docs serve
```

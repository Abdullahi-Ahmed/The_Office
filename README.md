<html>
    <p align="center"> 
        <img src="https://github.com/Abdullahi-Ahmed/The_Office/blob/main/resources/the_office.png" alt="the Office Profile" width="300">
    </p>
    <h1 align="center">
        Dbt Courses
    </h1>
    <p align="center">
        Open Source Repository for dbt on-demand Learning
    </p>
    <p align="center">
        <a href="https://www.getdbt.com/community/join-the-community/">
            <img src="https://img.shields.io/badge/slack-join_chat.svg?logo=slack&style=social" alt="Slack" />
        </a>
    </p>
</html> 

DBT (Data Build Tool) is an open-source tool used for managing and orchestrating SQL-based data transformation workflows. It allows users to write modular, well-tested SQL code and build data pipelines that are version-controlled, maintainable, and scalable.To obtain further details, refer to the blog post available at [Is dbt the right tool for my data transformations?](https://www.getdbt.com/blog/is-dbt-the-right-tool-for-my-data-transformations/).  
  
This repository contains source code intended for on-demand learning of DBT, a tool used for managing SQL-based data transformation workflows.  


## Themes of attention
* `Models`
* `Sources`
* `Tests`  
* `Documentations`
* `Deployments`  

## Models
dbt models are SQL-based queries that transform raw data into analytics-ready tables. Models are the core building blocks of DBT projects and provide a modular, organized way to transform data. One key advantage of using models in DBT is that they are version-controlled, allowing users to track changes and collaborate effectively.  

| **📝 Note** |
|:---------|
| You can review the naming conventions, structure, and code of basic dbt models, [here](https://github.com/Abdullahi-Ahmed/The_Office/tree/main/models). |  

Simple dbt model `Stg_Customers.sql`:

<details>

<summary>💻 Stg_Customers.sql</summary>

---

```sql
    with customers as (

        select 
            id as customer_id,
            first_name,
            last_name

        from raw.jaffle_shop.customer
    )

    select * from customers
```

---

</details>  


## Sources
A source refers to the data that is used as input for models. Dbt makes it easy to define and manage sources through YAML configuration files. [Sources](https://docs.getdbt.com/docs/build/sources)  

Here's an example of a direct source definition in dbt  
```yaml
version: 2

sources:
  - name: jaffle_shop
    database: raw
    schema: jaffle_shop
    tables:
      - name: customer
        description: Raw customers data.
        columns:
          - name: id
            description: Primary key for customers.

```
These helps in Standardization and reusability, Version control and collaboration, Documentation and transparency & Flexibility and modularity.  

## Test
Tests are used to validate the output of your data transformations and ensure that they meet expected criteria. Tests can be defined for individual models or across an entire DBT project, and they can be run as part of a DBT pipeline to ensure that data is transformed correctly and consistently. [Test](https://docs.getdbt.com/docs/build/tests)  

| **📝 Note** |
|:---------|
| To learn more interesting details, you can check out my blog post titled [5 DBT Test Lessons We Can Learn from The Office](https://medium.com/@aaomar/5-dbt-tests-lessons-we-can-learn-from-the-office-7b177b2eb031). |  

<details>

<summary> Here's an example of a dbt test </summary>

---

```yml
version: 2

models:
  - name: orders
    columns:
      - name: order_id
        tests:
          - unique
          - not_null

```

---

</details>  

## Documentations
Documentation is a critical aspect of any data transformation project. One of the primary ways to document your DBT project is through the use of YAML files, which allow you to define metadata about your models, such as their description, owner, and source. This metadata can be used to generate documentation and lineage diagrams automatically, making it easier for others to understand the purpose and structure of your code. 

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
Documentation is a critical aspect of any data transformation project. In dbt, models are documented in YAML files alongside generic tests in the same folder. Descriptions can be provided at the model, source, or column level, and doc blocks can be used for more detailed descriptions.  

Documentation can be generated and viewed through the  `dbt docs generate`  command, which provides a lineage graph, model and column descriptions, underlying SQL code, and more.  

## Deployment
process of moving your code from a development environment to a production environment. DBT does not have built-in deployment functionality, but it integrates with several deployment tools such as Jenkins, CircleCI, and GitLab.

To deploy your DBT code, you need to use a deployment tool that suits your needs and set up a deployment pipeline. Typically, a deployment pipeline includes several stages, such as building, testing, and deploying your code.

One common deployment workflow is to use a version control system like Git to store your DBT code, then use a continuous integration and continuous deployment (CI/CD) tool like Jenkins or CircleCI to build and deploy your code. The CI/CD tool can be configured to automatically build and test your code when changes are made, and then deploy it to a production environment when it passes all tests.

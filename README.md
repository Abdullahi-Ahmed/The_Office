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




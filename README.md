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
* `Tests`  
* `CI/CD`
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

## CI/CD
<details>

<summary>💻 .github/workflows/dbt-code-review.yml </summary>

---

```yaml
name: lint and test dbt project on pull request

on:
  pull_request:
    types: [opened, reopened, synchronize]

env:
  DBT_PROFILES_DIR: ./
  DTB_PROFILE_USER : ${{ secrets.DTB_PROFILE_USER  }}
  DTB_PROFILE_PW : ${{ secrets.DTB_PROFILE_PW  }}
  DTB_PROFILE_ROLE : ${{ secrets.DTB_PROFILE_ROLE  }}
  DTB_PROFILE_ACCOUNT: ${{ secrets.DTB_PROFILE_ACCOUNT }}
  DTB_PROFILE_DB : ${{ secrets.DTB_PROFILE_DB  }}
  DTB_PROFILE_WH  : ${{ secrets.DTB_PROFILE_WH   }}
  DTB_PROFILE_SCHEMA : ${{ secrets.DTB_PROFILE_SCHEMA  }}


jobs:
  lint_and_test_project:
    name: Lint and Test dbt project
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
        with:
          ref: ${{ github.event.pull_request.head.sha }}
      - name: Setup Python
        uses: actions/setup-python@v2
        with:
          python-version: '3.9'
      - name: Install SQLFluff and dbt
        run: |
          pip install sqlfluff
          pip install dbt-snowflake
      - name: Lint project
        run: sqlfluff lint models --dialect snowflake --rules L019,L020,L021,L022
#       - name: Test project
#         run: dbt test
      - name: Print success message
        run: echo "The Code Seems Good to GO!"
```

---

</details>    

This is a YAML file that defines a Github action with the name "lint and test dbt project on pull request". The purpose of this action is to perform SQL linting and dbt testing on a dbt project every time a pull request is opened, to ensure that the code meets certain quality standards before merging into the main branch.  
The on section defines the event that triggers the action, which in this case is a pull request with types opened, reopened, and synchronize. This means that the action will be triggered when a new pull request is created, an existing pull request is reopened, or changes are made to an existing pull request.

The env section defines environment variables that the action will use. These variables contain the credentials needed to authenticate with the Snowflake database, and they are stored as secrets in the repository settings.

The jobs section defines the job that the action will perform, which is named lint_and_test_project. This job runs on an Ubuntu virtual machine and has the following steps: 
1. Check out the pull request's head SHA using the actions/checkout action.
2. Setup Python 3.9 using the actions/setup-python action.
3. Install SQLFluff and dbt-Snowflake using pip.
4. Lint the dbt project using SQLFluff with the --dialect flag set to Snowflake and the following --rules options: L019,L020,L021,L022.
5. (Optional) Run the dbt test command to test the dbt project. This step is commented out by default due to your datawarehouse configurations.
6. Print a success message.   

| **📝 Note** |
|:---------|
| If you also run jobs using dbt Cloud’s built in scheduler, you now have 2 orchestration tools running jobs. The risk with this is that you could run into conflicts - you can imagine a case where you are triggering a pipeline on certain actions and running scheduled jobs in dbt Cloud, you would probably run into job clashes. The more tools you have, the more you have to make sure everything talks to each other. | 

## Deployment
process of moving your code from a development environment to a production environment. DBT does not have built-in deployment functionality, but it integrates with several deployment tools such as Jenkins, CircleCI, and GitLab.

To deploy your DBT code, you need to use a deployment tool that suits your needs and set up a deployment pipeline. Typically, a deployment pipeline includes several stages, such as building, testing, and deploying your code.

One common deployment workflow is to use a version control system like Git to store your DBT code, then use a continuous integration and continuous deployment (CI/CD) tool like Jenkins or CircleCI to build and deploy your code. The CI/CD tool can be configured to automatically build and test your code when changes are made, and then deploy it to a production environment when it passes all tests.

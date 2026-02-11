SELECT 
    skills,
    ROUND(AVG (job_postings_fact.salary_year_avg),0) AS avg_salary
FROM 
    job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
GROUP BY 
    skills
ORDER BY 
    avg_salary DESC
LIMIT 25


/*
Based on the data provided, these are the key insights and trends for the top-paying skills for data analysts:

1. AI and Machine Learning are High-Value Drivers

A significant portion of the list is dominated by AI and Machine Learning libraries and platforms. Skills like DataRobot ($155k), MXNet ($149k), Keras ($127k), PyTorch ($125k), and TensorFlow ($120k) indicate that data analysts who can transition into data science or machine learning engineering roles command much higher salaries. The inclusion of Hugging Face ($123k) highlights the growing demand for Natural Language Processing (NLP) expertise.

2. The "DataOps" and Infrastructure Trend

a)Data analysts are no longer just looking at spreadsheets; they are increasingly involved in the deployment and automation of data pipelines.

b)DevOps/IaC: Skills like Terraform ($146k), Ansible ($124k), and Puppet ($129k) suggest that "Infrastructure as Code" is becoming a premium skill for analysts who need to manage their own cloud environments.

c)Workflow Orchestration: Airflow ($116k) and Kafka ($129k) show a shift toward real-time data streaming and complex workflow management.

3. Specialized and Distributed Databases

General SQL knowledge is foundational, but high salaries are tied to specialized data storage and retrieval systems. Couchbase ($160k) and Cassandra ($118k) represent NoSQL and distributed database expertise, which are critical for handling "Big Data" at scale.

4. Niche and Legacy Systems (The SVN Outlier)

SVN (Subversion) at $400,000 is a statistical outlier. While it is an older version control system mostly replaced by Git, this high figure likely represents highly specialized roles in legacy industries (like banking or government) or specific "maintenance" roles for high-stakes systems where experts are rare and migration is costly.

5. Beyond Python and SQL

While Python is the standard, other programming languages show significant earning potential:

a)Golang ($155k): Known for its efficiency in building scalable data tools.
b)Scala ($115k): Often used in conjunction with Spark for big data processing.
c)Perl ($124k): Often used in legacy data processing and bioinformatics.
d)dplyr ($147k): Specifically highlights that high-level mastery of R for data manipulation remains extremely lucrative.

Summary of Salary Distribution

1)Top Tier ($150k+): Niche legacy skills, Blockchain (Solidity), and high-end AI automation (DataRobot).

2)Middle Tier ($125k - $150k): Cloud infrastructure, DevOps tools, and advanced ML frameworks.

3)Entry-Top Tier ($115k - $125k): Workflow orchestration, collaboration tools (Atlassian/Notion), and distributed big data tools.

*/
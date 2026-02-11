WITH top_paying_jobs AS (
    SELECT job_id,
        job_title,
        name AS company_name,
        salary_year_avg
    FROM job_postings_fact
        LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE job_title_short = 'Data Analyst'
        AND job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)
SELECT top_paying_jobs.*,
    skills
FROM top_paying_jobs
    INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC
  
  
  
  
  
    /*
     Based on the analysis of the top-paying data analyst roles in 2023, here are the key insights regarding the skills required:
     
     1. Most Frequent Skills
     
     The "Big Three" for high-paying data roles are clearly SQL, Python, and Tableau. 
     These skills appear most frequently across the top job postings, indicating they are foundational for reaching the highest salary brackets.
     
     a)SQL: Mentioned in 8 out of the top postings.
     b)Python: Mentioned in 7 postings.
     c)Tableau: Mentioned in 6 postings.
     d)R & Excel: Both remain highly relevant, appearing in 4 and 3 postings respectively.
     
     2. Technical Ecosystems
     Beyond the core languages, the data reveals a preference for specific tools:
     
     a)Cloud Platforms: Snowflake and AWS are the leading cloud skills.
     b)Libraries: Pandas and NumPy are specifically called out, highlighting the need for deep data manipulation expertise in Python.
     c)Collaboration: Tools like Confluence, Jira, and Bitbucket appear, suggesting that these high-paying roles are often in structured, agile engineering environments.
     
     3. Salary Insights by Skill
     While all these roles are "top-paying," certain skills are associated with slightly higher average benchmarks within this elite group:
     
     a)Cloud & Big Data: Skills like AWS ($222,569 avg) and Pandas ($215,609 avg) are linked to the very top of the pay scale.
     b)Traditional Stats: R and Excel actually maintain a very high average salary in these roles ($215k+), likely because they are often paired with senior-level domain expertise.
WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills, -- Added missing comma here
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM 
        job_postings_fact
        INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
        INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL -- Ensures consistency between both CTEs
    GROUP BY 
        skills_dim.skill_id,
        skills_dim.skills
), average_salary AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills, -- Added missing comma here
        ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
    FROM 
        job_postings_fact
        INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
        INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst' 
        AND salary_year_avg IS NOT NULL
    GROUP BY 
        skills_dim.skill_id,
        skills_dim.skills
)

SELECT 
    skills_demand.skills,
    skills_demand.skill_id,
    skills_demand.demand_count,
    average_salary.avg_salary
FROM skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
ORDER BY 
    avg_salary DESC
LIMIT 25;

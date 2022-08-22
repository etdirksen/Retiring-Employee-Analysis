# Challenge 7, Deliverable 3: Pewlett-Hackard Analysis
## Purpose and Background

The purpose of this analysis was to help our friend Bobby and our company Pewlett-Hackard find how many employees are going to be retiring soon. We needed to find who will be retiring and how many openings will be available when these workers do retire. We were able to find answers to these questions through creating a SQL database consisting of a connected web of several different tables of information about PH's employees.

Out of the employees who are getting ready to retire, we were also tasked with 
1. finding how many employees are only in the __Sales__ and __Development__ departments, and
2. finding out how many in total would be __eligible for an employee mentorship program__ that was going to be introduced - for those who would like to, employees could take on a mentor role part-time to those who may be filling their role in the company, instead of completely retiring.

## Results

For reference: employees who are getting ready to retire are counted as:
- those who were born between 1952-01-01 and 1955-12-31,
- who were hired between 1985-01-01 and 1988-12-31,
- current employees (a "to_date" of 9999-01-01).

and those who were eligible for the program were counted as:
- those born between 1965-01-01 and 1965-12-13,
- current employees (a "to_date" of 9999-01-01).

We were working with lists of the company's complete history of employees and ex-employees, meaning those who were no longer with the company anymore, so those people had to be filtered out. In finding these numbers, we also only counted the latest title of the employees if they held more than one at any point in time. 

The results of our analysis show that out of 240,124 total current employees, there are __41,380 employees that will be retiring soon__, and that there are __1,549 employees who are eligible for the mentorship program__. This means a few things:
- there is a high number of employees retiring at once (over 17.2% of the total current workforce!),
- there will be many spots open that need to be filled,
- there is a low number of employees that are eligible for the mentorship program (3.7%), and
- there is a relatively low percentage of employees from the Sales and Development departments that are retiring (36.6%).

## Summary

There are two questions that naturally arise when looking at the analysis:
1. How many roles will need to be filled as the "silver tsunami" begins to make it impact?
    - There are 41,380 roles that will need to be filled. This info comes from our `retirement_info` table that we created. It contains the employee number, first name, and last name of all of the employees that will be retiring soon. The query to filter the data for this table can be found in the image below:
    ![Schema: Retirement Eligibility](Resources/code_for_retirement_eligibility.png)
3. Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

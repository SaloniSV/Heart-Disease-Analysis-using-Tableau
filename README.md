# Heart-Disease-Analysis-using-Tableau
This project will integrate MS SQL with Tableau to analyze a dataset and the findings will be visualized on Tableau
Introduction:
In the dynamic landscape of data-driven decision-making, harnessing the power of structured query language (SQL) and visualization tools like Tableau has become imperative for organizations aiming to derive actionable insights from their vast datasets. This project, titled "Heart Disease Analysis" is a strategic initiative undertaken to harness the power of structured query language (SQL) and Tableau for in-depth exploration, analysis, and visualization of heart disease data. By combining the efficiency of SQL data management with the compelling visualization capabilities of Tableau, the objective is to empower healthcare professionals with a robust toolset to understand, predict, and address the complexities of heart diseases.
As an aspiring data scientist, it is important that I can manipulate and visualize any given data. SQL provides unlimited capabilities to manipulate and extract data from raw data. This will help me understand any dataset. After connecting it to a visualization tool such as Tableau, the information extracted using SQL can be well read and defined and passed on to others without them having to understand the entire context.
My pessimistic or minimal viable goal is to download MS SQL and get familiar with the tool. This will help me learn a tool I haven’t used before. It will also help me understand the differences between Oracle and MS SQL. 
My next step is to find a dataset that I will be able to work on. If I do not find a dataset that is compatible with MS SQL, I will need to perform data cleaning on the dataset before loading it on MS SQL.
After which I wanted to perform queries on the dataset and understand what information can be made available from it. 
My ambitious goal is to integrate the above findings into Tableau. 
I plan to download Tableau for Desktop and be able to connect the above findings into tableau for visualization of the results. To achieve this goal, I must become familiar with Tableau and learn its capabilities. The results from the SQL queries will be displayed on Tableau for easier understanding.


Exploring 
I never dealt with databases during my undergraduate coursework. During my prior work experience, I worked with Machine Learning for one of my projects. That’s when I developed an interest in Machine Learning and Data Science. I am currently pursuing my master’s in data science. 
For the final project, I was initially amazed by the extensive options. It was quite a task to narrow down to what I wanted to work on. I wanted to work on Data related to healthcare. I finally narrowed down to a project that would integrate both my love for the medical field and Data Science. I chose to perform data analysis on Heart Disease Prediction, but it would seem incomplete until we can visualize the results and hence, I chose to display the results on Tableau. 
For this project, I chose to work on Microsoft SQL Server Management Studio  (SSMS) and Tableau, two tools that I haven’t used before. This project helped me to get hands-on experience and learn two new tools. 


Building
The project completely depended on whether I was able to find a dataset to work on. The best alternative would be to use Mock-up data from sites like Mockaroo.
Most of the datasets available online are incompatible with database applications. For such datasets, I would need to perform some data cleaning before I can start working on it. This would be a deviation from our coursework for this semester. It was quite a task to get hold of a good dataset for my project. Incase, I failed to find anything good online, I could always use mock data. But my goal was to work on real data so that my findings can be used to accurately represent the complexity and variability of real-world data. I persisted in seeking real-world data for my analysis to ensure that the outcomes could be applicable and beneficial to a broader audience, allowing anyone to utilize the results. 
I came across Heart Failure Prediction Dataset on Kaggle. This dataset has the following attributes:
•	Age: Age of the patient 
•	Sex: Sex of the patient 
•	Chest Pain Type:  Chest pain type 
[The different types of Chest Pain Type in the dataset are –
TA: Typical Angina - Typical Angina is chest pain or discomfort caused when your heart muscle doesn't get enough oxygen-rich blood. It may feel like pressure or squeezing in your chest. The discomfort also can occur in your shoulders, arms, neck, jaw, abdomen or back.

ATA: Atypical Angina - Instead of being heart-related, most causes of atypical angina result from symptoms brought on by respiratory, musculoskeletal, or gastrointestinal diseases. Psychiatric causes may also be a causative factor.

NAP: Non-Anginal Pain - Nonanginal chest pain, which doctors may also call noncardiac chest pain, refers to pain a person without heart disease may feel behind the breastbone. The pain may feel like angina, but it occurs due to different causes.

ASY: Asymptomatic- Asymptomatic chest pain refers to chest pain or discomfort that occurs without any accompanying symptoms. Chest pain is a common symptom that can be associated with various medical conditions, including both cardiac and non-cardiac causes. When chest pain is described as asymptomatic, it means that the pain itself is not accompanied by other
typical symptoms that are often associated with heart-related issues.]

•	RestingBP: Resting blood pressure
•	Cholesterol: Serum cholesterol 
•	FastingBS: Fasting blood sugar [1: if FastingBS > 120 mg/dl, 0: otherwise]
•	RestingECG: Resting electrocardiogram results 
[Normal: Normal, 
ST: having ST-T wave abnormality (T wave inversions and/or ST elevation or depression of > 0.05 mV),
 LVH: showing probable or definite left ventricular hypertrophy by Estes' criteria]
•	MaxHR: Maximum heart rate achieved [Numeric value between 60 and 202]
•	Exercise Angina: Exercise-induced angina [Y: Yes, N: No]
•	Oldpeak: Oldpeak = ST [Numeric value measured in depression]
•	ST_Slope: The slope of the peak exercise ST segment [Up: upsloping, Flat: flat, Down: down sloping]
•	HeartDisease: Output class [1: heart disease, 0: Normal]

This dataset was created by combining different datasets already available independently but not combined before. In this dataset, 5 heart datasets are combined over 11 common features which makes it the largest heart disease dataset available so far for research purposes. The five datasets used for its curation are:
•	Cleveland: 303 observations
•	Hungarian: 294 observations
•	Switzerland: 123 observations
•	Long Beach VA: 200 observations
•	Stalog (Heart) Data Set: 270 observations


The project got me exposed to writing queries on datasets and performing data analysis on given datasets. I wrote the "CREATE TABLE" statement based on my familiarity gained through assignments. For this analytic project, I opted to design a single table. The rationale behind this decision is to optimize query performance, as I believe that normalization, in this context, might adversely impact query speed.
 
I used a python library called pypyodbc to connect python to SQL. This will give the ability to use the dynamic nature of Python to build and run SQL queries. This was done to automate the insertion of 918 rows into the table.
I installed pypyodbc by using pip install pypyodbc. This library is a bridge between SQL and python. The Driver_Name, Server_Name and the Database_Name are mentioned, and a connection is established. Next, the csv file is accessed from the file path and the data is inserted into the rows of the table Heart_Failure.
 
After the data is imported into the table. We run queries to analyze the data present. 
Here are some of the conclusions made after analyzing the dataset on SSMS –
1.	AGE DISTRIBUTION 
•	We can find that the average age of Individuals suffering from a heart disease is 55 whereas, the average age for healthy individuals is 50. It can be inferred that after the age of 50 the chances of developing heart disease increase greatly. However, there are other factors which can contribute to this which we will look at further.

2.	SEX DISTRIBUTION
•	After the analysis it is very clear that men are more susceptible to heart diseases. 
•	66% of the surveyed men were suffering from a heart disease, however this percentage is just 25% for women.
•	We can very safely assume that Sex of an individual plays a big role in determining their chance of suffering from a heart disease.

3.	CHEST PAIN DISTRIBUTION
•	We can conclude that the chances of having a heart disease when a person is experiencing Atypical Angina symptoms is just 13.8%. 
•	However, the chances of having heart disease are almost close to 50% if you experience symptoms of typical angina.
•	Also, it can be observed that even though Non Anginal Pain is not related to heart disease, about 35% of those who suffer from it do have heart disease.
•	The final and most important conclusion from the above is that there is an 80% chance that there is an underlying heart disease when you experience Asymptomatic Pain (also called Chest pain without any other symptoms included).

4.	CHOLESTEROL DISTRIBUTION 
•	According to the analysis of Cholesterol data, the impact of Cholesterol levels on heart disease is comparatively less pronounced in women. Conversely, for males, Cholesterol emerges as a crucial determinant, with the likelihood of heart disease increasing significantly from 45% to 60% as individuals transition from normal Cholesterol levels to high levels.

5.	RESTING BP ANALYSIS
•	From the queries, we find that until blood pressure is at Stage 1 there is a 50% chance of having heart disease, this includes Normal BP, Elevated BP, and Stage 1 BP. But once the BP reaches Stage 2, the chances of having a heart disease are twice as much as not having one. Hence, it can be advised to keep BP in check to avoid any heart related diseases.

6.	FASTING BLOOD SUGAR ANALYSIS 
•	We can conclude that there is a 50-50 chance of having heart disease even with no blood sugar.
•	But in the case where an individual has blood sugar, the chances of having a heart disease is almost 4x.


7.	RESTING ECG ANALYSIS 
•	Having a Normal ECG does not mean that you will not develop a heart disease, the chances are almost 50%.
•	Since LVH is related to BP, the chances of having a heart disease with a LVH in the ECG is high.
•	Abnormalities in ST or LVH wave in the ECG indicates about 60% chance of having a heart disease.

8.	EXERCISE ANGINA ANALYSIS 
•	Experiencing chest pain during exercise is an important indicator of heart disease. 
Almost 85% of cases of exercise angina are related to heart disease. Nevertheless, there is still a 20% chance of having heart disease even without Exercise Angina.

9.	ST SLOPE ANALYSIS
•	We can infer that if the ST_Slope is 'Flat' in the ECG it is most likely a symptom of a heart disease. Similarly, if the ST_Slope is 'Up' there is an 85% chance that you do not have a heart disease.



Finally, the results are visualized on Tableau. The dashboard is designed to be interactive and here are some of the snapshots from the Interactive dashboard.
 


Discovering
This project has broadened my understanding of databases significantly. Prior to the semester, I had no exposure to databases and hadn't attended any formal classes or training sessions. My initial knowledge was limited to crafting "CREATE" statements, which I learned out of personal interest through YouTube videos. Through this project, I had the opportunity to engage with a new tool, Microsoft SQL Server Management, allowing me to discern and appreciate the subtle differences between Oracle and SSMS. Although I have yet to fully explore all its facets, this experience has been instrumental in my database learning journey.
I also worked on Tableau to visualize the dataset and present the information in a powerful manner. Tableau enables the rapid development of visualizations. Users can quickly create dashboards and reports, reducing the time it takes to transform raw data into actionable insights. This speed is particularly valuable for agile decision-making. I was able to explore a few parts of it which helped me to complete this project. 
If I had more time to work on the dataset, it would be to make it as a “Heart Failure Prediction Model” which would use some Machine Learning models and predict if a person will experience heart failure from the given parameters. However, this would deviate from the topics in our coursework.

Topics from Class
Here are some of the topics covered from class – 
1.	Create Table: 
Create table statement is used to create a new table in database. I have created a table HEART_FAILURE for my project. A detailed explanation is provided in the building section.

 

2.	Alter Table:
In SQL, the ALTER TABLE statement is used to modify an existing table's structure. You can use it to add, modify, or drop columns, constraints, and other table attributes.

 

3.	Create View 
In SQL, a view is a virtual table based on the result-set of an SQL statement. A view contains rows and columns, just like a real table. The fields in a view are fields from one or more real tables in the database. You can add SQL statements and functions to a view and present the data as if the data were coming from one single table. A view is created with the CREATE VIEW statement.

 

4.	Aggregate Functions 
An SQL aggregate function calculates a set of values and returns a single value. For example, the average function (AVG) takes a list of values and returns the average. SQL aggregate functions accumulate data from multiple rows into a single summary row. The accumulated value is based on the values from the column passed as an argument. Here is a snippet from my project.

 

5.	Stored Procedure
A stored procedure in SQL is a precompiled collection of one or more SQL statements that are stored in the database server. It is a named and saved set of SQL statements that can be invoked with a single call. Stored procedures can be used to perform a variety of tasks, including data manipulation, data retrieval, and business logic processing.
 

I have used stored procedure to count the number of individuals above 20 years of age and Cholesterol within certain ranges. (Normal range: 125 – 200 mg/dL, Borderline range: 200 – 239 mg/dL, High: Greater than or equal to 239 mg/dL).  The above snippet is for Borderline Cholesterol.

6.	Nested Queries
Nested queries (also known as subqueries) in SQL refer to a SQL query embedded within another SQL query. These nested queries are used to retrieve data or perform operations by using the result of one query as a condition or value in another query. The result of the inner query is then used in the outer query. The snippet in Stored Procedure also highlights nested query implementation in my project.



ACKNOWLEDGMENTS:
https://www.kaggle.com/datasets/fedesoriano/heart-failure-prediction
https://www.kaggle.com/code/nadaemad2002/heart-failure-prediction/notebook#About-The-Data:
https://www.verywellhealth.com/cholesterol-levels-by-age-chart-5190176

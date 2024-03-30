/* 
This project titled 'Heart Disease Analysis' is set up to import data 
from Kaggle dataset with observations from 5 different hospitals around the world. 
Here we will run queries to understand the dataset better and obtain insightful information
about the different parameters contributing to Heart Diseases.
*/


--- The first step before analysing any dataset would be to know the size of it, hence we find the total count.
   SELECT COUNT(*) AS TOTAL FROM HEART_FAILURE;
--- This gives a total count of 918 individuals 


--- Let us now look at the database table's contents
SELECT * FROM HEART_FAILURE;



/*
AGE DISTRIBUTION
*/
---- Now, we will start analysing each parameters which can contribute to heart diseases.
---- First let us cnsider the Age Criteria
CREATE VIEW HEARTDISEASES_BY_AGE AS
SELECT AGE, HEARTDISEASE 
FROM HEART_FAILURE 
WHERE HEARTDISEASE=1 
 ;
 DROP VIEW HEARTDISEASES_BY_AGE;
---- Now, let us look at all the individuals who suffer from heart disease and their ages.


---- We want to find out the average age of these individuals. However, the coloumn age is created as a Varchar and hence needs to be altered to Int before we can get its average.
---- Creating Alter statements
ALTER TABLE HEART_FAILURE
ALTER COLUMN AGE INT;

---- Now, we can find the average age of the individuals suffering from heart disease -
SELECT AVG(AGE) AS AVERAGEAGE
FROM HEARTDISEASES_BY_AGE;
---- It is found that the average age of those suffering from a heart disease is 55 years in this dataset.


----Let us repeat the above steps of creating a view, getting a list and finding the average age for all those who do not suffer from a heart disease
CREATE VIEW NO_HEARTDISEASES_BY_AGE AS
SELECT AGE, HEARTDISEASE 
FROM HEART_FAILURE 
WHERE HEARTDISEASE=0;

SELECT * FROM NO_HEARTDISEASES_BY_AGE;

SELECT AVG(AGE) AS AVERAGEAGE2
FROM NO_HEARTDISEASES_BY_AGE;
/* 
                                             ****CONCLUSION****
From the results of the above query's we can find that the average age of Individuals suffering from a heart disease is 55 whereas, the average age for healthy individuals is 50.
It can be inferred that after the age of 50 the chances to develop a hart disease increases greatly. 
However, there are other factors which can contribute to this which we will look at further.
*/






/*
SEX DISTRIBUTION
*/
---- Now, let us look at how Sex of a person can play a factor in developing a heart disease.
---- Before starting the analysis the percentage of men and women in the dataset is very important before deriving any conclusions.
SELECT COUNT(*) AS TOTAL_MEN FROM HEART_FAILURE WHERE SEX='M';
SELECT COUNT(*) AS TOTAL_WOMEN FROM HEART_FAILURE WHERE SEX='F';
--- There are 725 men and 193 women in this dataset,hence, all conclusions made should be made keeping this disparity in mind.



---- We will start by finding the number of Males having a Heart Disease
SELECT COUNT(*) AS ALL_MALES FROM HEART_FAILURE WHERE HEARTDISEASE=1 AND SEX='M';
--- There are 458 men with a heart disease.
SELECT AVG(AGE) AS AVGAGE_MEN_HD FROM HEART_FAILURE WHERE HEARTDISEASE=1 AND SEX='M';
--- The Average age of these men is 55.


--- Let us now check the number of women with a heart disease and their average age
SELECT COUNT(*) AS ALL_FEMALES FROM HEART_FAILURE WHERE HEARTDISEASE=1 AND SEX='F';
SELECT AVG(AGE) AS AVGAGE_WOMEN_HD FROM HEART_FAILURE WHERE HEARTDISEASE=1 AND SEX='F';
--- There are about 50 women with an average age of 56 with a heart disease


--- Let us check the number of men who are healthy without a heart disease and their average age
SELECT COUNT(*) AS ALL_MALES_NO_HD FROM HEART_FAILURE WHERE HEARTDISEASE=0 AND SEX='M';
SELECT AVG(AGE) AS AVGAGE_MEN_NO_HD FROM HEART_FAILURE WHERE HEARTDISEASE=0 AND SEX='M';
--- There are 267 men with an average age of 50 who are healthy.

--- Let us now check the number of women and their average age who are healthy
SELECT COUNT(*) AS ALL_FEMALES_NO_HD FROM HEART_FAILURE WHERE HEARTDISEASE=0 AND SEX='F';
SELECT AVG(AGE) AS AVGAGE_WOMEN_NO_HD FROM HEART_FAILURE WHERE HEARTDISEASE=0 AND SEX='F';
--- There are 143 women with an average age of 51 who are healthy without a heart disease.
/*
                                             ****CONCLUSION****
After the above analysis it is very clear that men are more susceptible to heart diseases. 
66% of the surveyed men were suffering from a heart disease, however this percentage is just 25% for women.
We can very safely assume that Sex of an individual plays a big role in determining their chance of suffering from a heart disease.
*/



/*
CHEST PAIN DISTRIBUTION

Chest pain can be classified into 4 different kinds- 
1. Typical Angina(TA) - Typical Angina is chest pain or discomfort caused when your heart muscle doesn't get enough oxygen-rich blood. 
It may feel like pressure or squeezing in your chest. The discomfort also can occur in your shoulders, arms, neck, jaw, abdomen or back. 
Angina pain may even feel like indigestion.


2. Atypical Angina(ATA) - Instead of being heart-related, most causes of atypical angina result from symptoms brought on by respiratory, musculoskeletal, or gastrointestinal diseases. 
Psychiatric causes may also be a causative factor.

3. NonAnginal Pain(NAP) - Nonanginal chest pain, which doctors may also call noncardiac chest pain, refers to pain a person without heart disease may feel behind the breast bone. 
The pain may feel similar to angina, but it occurs due to different causes.

4. Asymptomatic(ASY) - Asymptomatic chest pain refers to chest pain or discomfort that occurs without any accompanying symptoms. Chest pain is a common symptom that can be associated with 
various medical conditions, including both cardiac and non-cardiac causes.When chest pain is described as asymptomatic, it means that the pain itself is not accompanied by other 
typical symptoms that are often associated with heart-related issues. Common symptoms of cardiac-related chest pain might include shortness of breath, nausea, sweating, lightheadedness, or pain radiating to the arm or jaw.

*/

--- To count the number of individuals who experienced Atypical Angina and had a heart disease
SELECT COUNT(*) AS ATA_COUNT_HD
FROM HEART_FAILURE
WHERE CHESTPAINTYPE='ATA' AND HEARTDISEASE=1;
--- There are 24 individuals with ATA and a heart disease.
--- To count the number of individuals who experienced Atypical Angina but did not have a heart disease
SELECT COUNT(*) AS ATA_COUNT_NO_HD
FROM HEART_FAILURE
WHERE CHESTPAINTYPE='ATA' AND HEARTDISEASE=0;
--- There are 149 individuals with ATA and no heart disease.



---Similarly, we will now check for Typical Angina
SELECT COUNT(*) AS TA_COUNT_HD
FROM HEART_FAILURE
WHERE CHESTPAINTYPE='TA' AND HEARTDISEASE=1;
--- The count is 20.
SELECT COUNT(*) AS TA_COUNT_NO_HD
FROM HEART_FAILURE
WHERE CHESTPAINTYPE='TA' AND HEARTDISEASE=0;
--- The count is 26




----We will now check for Non Anginal Pain
SELECT COUNT(*) AS NAP_COUNT_HD
FROM HEART_FAILURE
WHERE CHESTPAINTYPE='NAP' AND HEARTDISEASE=1;
--- The count is 72
SELECT COUNT(*) AS NAP_COUNT_NO_HD
FROM HEART_FAILURE
WHERE CHESTPAINTYPE='NAP' AND HEARTDISEASE=0;
---The count is 131



----Checking for Asymptomatic Pain
SELECT COUNT(*) AS ASY_COUNT_HD
FROM HEART_FAILURE
WHERE CHESTPAINTYPE='ASY' AND HEARTDISEASE=1;
---The count is 392
SELECT COUNT(*) AS ASY_COUNT_NO_HD
FROM HEART_FAILURE
WHERE CHESTPAINTYPE='ASY' AND HEARTDISEASE=0;
--- The count is 104.
/*
                                             ****CONCLUSION****
After the above analysis, we can conclude that the chances of having a heart diasease when a person is experiencing Atypical Angina symptoms is just 13.8%. 
Hence, as per the definition, it is a bit uncommon to having heart related problems if you experience Atypical Angina.
However, the chances of having a heart disease is almost close to 50% if you experience symptoms of typical angina.
Also, it can be observed that even though Non Anginal Pain is not related to heart disease, about 35% of those who suffer from it actually do have a heart disease.
The final and most important conclusion from the above is that there is a 80% chance that there is an underlying heart disease when you experience
Asymptomatic Pain also called Chest pain without any other symptoms included.
However, this conclusion is for a dataset with 918 participants only.
*/



/*
CHOLESTROL DISTRIBUTION
Cholesterol is a waxy substance found in your blood. Your body needs cholesterol to build healthy cells, 
but high levels of cholesterol can increase your risk of heart disease.
With high cholesterol, you can develop fatty deposits in your blood vessels. 
Eventually, these deposits grow, making it difficult for enough blood to flow through your arteries. 
Sometimes, those deposits can break suddenly and form a clot that causes a heart attack or stroke.
The below queries are executed based on the Cholestrol Levels Chart found on 
https://www.verywellhealth.com/cholesterol-levels-by-age-chart-5190176
*/

/* 
We will classify the dataset to get the count of Total Males and Females with Normal,Borderline and High Cholestrol Levels 
as found in the above website. Both males and females have different Cholestrol levels for Normal, Borderline and High.
We will use a nested query within a stored procedure to implement the above and check if they have a heart disease or not.
*/
 
--- Stored Procedure to get count of individuals of Age>20 and with a Normal Cholestrol Level
GO
CREATE PROCEDURE NORMAL_ADULTS
  @SEX VARCHAR(30), 
  @HEARTDISEASE VARCHAR(30)
AS 
BEGIN
   SELECT  COUNT(*) AS NORMAL
   FROM HEART_FAILURE
   WHERE AGE >20 AND CHOLESTEROL IN (
   SELECT CHOLESTEROL
   FROM HEART_FAILURE
   WHERE SEX=@SEX AND
   HEARTDISEASE= @HEARTDISEASE AND
   CHOLESTEROL BETWEEN 125 AND 200
)END;


EXEC NORMAL_ADULTS @SEX='M',@HEARTDISEASE=1; ---51
EXEC NORMAL_ADULTS @SEX='M',@HEARTDISEASE=0; ---60
EXEC NORMAL_ADULTS @SEX='F',@HEARTDISEASE=1; ---3
EXEC NORMAL_ADULTS @SEX='F',@HEARTDISEASE=0; ---29
/*
Here, we can see that in males, even though their cholestrol may lie in the normal levels they are more prone to have a heart disease.
From the above analysis 45% of men with normal cholestrol levels had a heart disease.
But it is not the same case for women, only 9% of women with normal cholesterol levels had an underlying heart disease.
*/


--- Stored Procedure to get count of individuals of Age>20 and with a  Borderline Cholestrol Level
GO
CREATE PROCEDURE BORDERLINE_ADULTS
  @SEX VARCHAR(30), 
  @HEARTDISEASE VARCHAR(30)
AS 
BEGIN
   SELECT  COUNT(*) AS BORDERLINE
   FROM HEART_FAILURE
   WHERE AGE >20 AND CHOLESTEROL IN (
   SELECT CHOLESTEROL
   FROM HEART_FAILURE
   WHERE SEX=@SEX AND
   HEARTDISEASE= @HEARTDISEASE AND
   CHOLESTEROL BETWEEN 200 AND 239 
 
)END;


EXEC BORDERLINE_ADULTS @SEX='M',@HEARTDISEASE=1; ---101
EXEC BORDERLINE_ADULTS @SEX='M',@HEARTDISEASE=0; ---85
EXEC BORDERLINE_ADULTS @SEX='F',@HEARTDISEASE=1; --7
EXEC BORDERLINE_ADULTS @SEX='F',@HEARTDISEASE=0; ---44
/*
From the above we can conclude that more than half of the men or 54% of them having cholesterol levels in borderline range already have a heart disease.
However, only 13% of women lying in the borderline range have a heart disease.
*/

--- Stored Procedure to get count of individuals of Age>20 and with a  High Cholestrol Level
GO
CREATE PROCEDURE HIGH_ADULTS
  @SEX VARCHAR(30), 
  @HEARTDISEASE VARCHAR(30)
AS 
BEGIN
   SELECT  COUNT(*) AS HIGH
   FROM HEART_FAILURE
   WHERE AGE >20 AND CHOLESTEROL IN (
   SELECT CHOLESTEROL
   FROM HEART_FAILURE
   WHERE SEX=@SEX AND
   HEARTDISEASE= @HEARTDISEASE AND
   CHOLESTEROL >239 
 
)END;


EXEC HIGH_ADULTS @SEX='M',@HEARTDISEASE=1; ---161
EXEC HIGH_ADULTS @SEX='M',@HEARTDISEASE=0; ---102
EXEC HIGH_ADULTS @SEX='F',@HEARTDISEASE=1; ---30
EXEC HIGH_ADULTS @SEX='F',@HEARTDISEASE=0; ---70
/*
From the above results, we can observe that 60% of men having high cholesterol levels have a heart disease.
The percentage is comparitvely less for women at just 30%.

                                             ****CONCLUSION****
From the Cholesterol analysis, it is clear that Cholesterol levels do not play much role in falling victim to heart disease in Women.
But, it plays as a deciding factor for males as the chances increases from 45% to 60% as they move from normal levels to high levels.
*/
----- Let us check if there is anyone below the age of 20.
SELECT COUNT(*) AS YOUNG_ADULTS
FROM HEART_FAILURE
WHERE AGE<20 AND (SEX='M' AND SEX='F');
--- Since, there is no one below this age,we will not be running any further queries for cholesterol.





/* 
RESTING BLOOD PRESSURE ANALYSIS

Resting blood pressure (BP) refers to the blood pressure measurement when a person is at rest, 
typically in a sitting or lying down position. Resting blood pressure is often used as a baseline measurement
because it reflects the cardiovascular system's status when a person is not actively engaged in physical activity or 
under stress. It is an essential parameter in assessing cardiovascular health and is commonly monitored during
routine health check-ups. Abnormal resting blood pressure levels may indicate underlying health issues, 
such as hypertension (high blood pressure) or hypotension (low blood pressure).
It can be divided into the following levels -
Below 120 - Normal blood pressure
120 - 129 - Elevated blood pressure
130 - 139 - Stage 1 high blood pressure
140 or higher - Stage 2 high blood pressure
*/
---- We will now be checking the number if indviduals who fall within each of these ranges and whether they have a heart disease or not.
--- Checking for Normal Blood Pressure
SELECT COUNT(*) AS Normal_BP
FROM HEART_FAILURE
WHERE RESTINGBP<120 AND HEARTDISEASE=1;
--- There are 88 individuals with a Normal BP but with a heart disease

SELECT COUNT(*) AS Normal_BP
FROM HEART_FAILURE
WHERE RESTINGBP<120 AND HEARTDISEASE=0;
--- There are 73 individuals with a Normal BP and no heart disease


--- Checking for Elevated Blood Pressure
SELECT COUNT(*) AS Elevated_BP
FROM HEART_FAILURE
WHERE RESTINGBP BETWEEN 120 AND 129 AND HEARTDISEASE=1;
--- There are 106 individuals with an Elevated Blood pressure and a heart disease

SELECT COUNT(*) AS Elevated_BP
FROM HEART_FAILURE
WHERE RESTINGBP BETWEEN 120 AND 129 AND HEARTDISEASE=0;
--- There are 108 individuals with an Elevated Blood pressure and no heart disease



--- Checking for Stage 1 high blood pressure
SELECT COUNT(*) AS Stage1_BP
FROM HEART_FAILURE
WHERE RESTINGBP BETWEEN 130 AND 139 AND HEARTDISEASE=1;
--- There are 109 individuals with an Stage 1 High Blood pressure and a heart disease


SELECT COUNT(*) AS Stage1_BP
FROM HEART_FAILURE
WHERE RESTINGBP BETWEEN 130 AND 139 AND HEARTDISEASE=0;
--- There are 107 individuals with an Stage 1 High Blood pressure and no heart disease


--- Checking for Stage 2 high blood pressure
SELECT COUNT(*) AS Stage2_BP
FROM HEART_FAILURE
WHERE RESTINGBP >140 AND HEARTDISEASE=1;
--- There are 150 individuals with an Stage 2 High Blood pressure and a heart disease

SELECT COUNT(*) AS Stage2_BP
FROM HEART_FAILURE
WHERE RESTINGBP >140 AND HEARTDISEASE=0;
--- There are 70 individuals with an Stage 2 High Blood pressure and no heart disease

/*
                                             ****CONCLUSION****
From the above queries, we find that until blood pressure is at Stage 1 there is a 50% chance of having a heart disease, this includes 
Normal BP, Elevted BP and Stage 1 BP. But once the BP reaches Stage 2 , the chances of having a heart disease is twice as much as not having one.
Hence, it can be advised to keep BP in check to avoid any heart related diseases.
*/




/*
FASTING BLOOD SUGAR ANALYSIS 
A fasting blood sugar test measures sugar (glucose) in your blood. 
It’s a simple, safe and common way to diagnose prediabetes, diabetes or gestational diabetes.
*/
--- Checking the presence of blood sugar and its relation to Heart Disease
SELECT COUNT(*) AS Fasting_BS
FROM HEART_FAILURE
WHERE FASTINGBS=0 AND HEARTDISEASE=0;
--- There are 366 individuals with no Blood Sugar and no Heart Disease

SELECT COUNT(*) AS Fasting_BS
FROM HEART_FAILURE
WHERE FASTINGBS=1 AND HEARTDISEASE=0;
--- There are 44 individuals with Blood Sugar and no Heart Disease

SELECT COUNT(*) AS Fasting_BS
FROM HEART_FAILURE
WHERE FASTINGBS=0 AND HEARTDISEASE=1;
--- There are 338 individuals with no Blood Sugar and Heart Disease

SELECT COUNT(*) AS Fasting_BS
FROM HEART_FAILURE
WHERE FASTINGBS=1 AND HEARTDISEASE=1;
--- There are 170 individuals with  Blood Sugar and Heart Disease
/*
                                             ****CONCLUSION****
We can conclude that there is a 50-50 chance of having a heartdisease even with no blood sugar.
But in the case where an individual has blood sugar, the chances of having a heart disease is almost 4x.
*/




/*
RESTING ECG ANALYSIS 
An electrocardiogram (ECG) is a simple test that can be used to check your heart's rhythm and electrical activity.
ECG results appear in a graph of spikes and valleys. The points on this graph represent different waves of electrical activity. 
There are three waves that make up this graph i.e. P wave, QRS wave and T wave. 

ST Wave- The ST segment appears in the ECG results.It corresponds to the area visible at the end of the QRS complex and the beginning of the T wave.
Abnormalities in the ST segment can indicate various cardiac conditions, and these abnormalities are often analyzed in the context of the entire ECG. 

LVH - Left ventricular hypertrophy, or LVH, is a term for a heart’s left pumping chamber that has thickened and may not be pumping efficiently. 
Sometimes problems such as aortic stenosis or high blood pressure overwork the heart muscle.
*/

--- Checking the relationship between Resting ECG status and heart disease
SELECT COUNT(*) AS NORMAL_ECG
FROM HEART_FAILURE
WHERE RESTINGECG='Normal' AND HEARTDISEASE=1;
---There are 285 individuals with Normal ECG and Heart Disease
SELECT COUNT(*) AS NORMAL_ECG
FROM HEART_FAILURE
WHERE RESTINGECG='Normal' AND HEARTDISEASE=0;
---There are 267 individuals with Normal ECG and no Heart Disease


SELECT COUNT(*) AS ST_ECG
FROM HEART_FAILURE
WHERE RESTINGECG='ST' AND HEARTDISEASE=1;
--- There are 117 individuals with ST ECG and Heart Disease
SELECT COUNT(*) AS ST_ECG
FROM HEART_FAILURE
WHERE RESTINGECG='ST' AND HEARTDISEASE=0;
--- There are 67 individuals with ST ECG and no Heart Disease


SELECT COUNT(*) AS LVH_ECG
FROM HEART_FAILURE
WHERE RESTINGECG='LVH' AND HEARTDISEASE=1;
--- There are 106 individuals with LVH ECG and Heart Disease
SELECT COUNT(*) AS LVH_ECG
FROM HEART_FAILURE
WHERE RESTINGECG='LVH' AND HEARTDISEASE=0;
--- There are 82 individuals with LVH ECG and no Heart Disease
/*
                                             ****CONCLUSION****
Having a Normal ECG does not mean that you will not develop a  Heart disease, the chances are almost 50%.
Since LVH is related to BP, the chances of having a heart disease with a LVH in the ECG is high.
Abnormalities in ST or LVH wave in the ECG indicates about 60% chance of having a heart disease.
*/




/* 
EXERCISE ANGINA ANALLYSIS 
Exercise angina, also known as exertional angina or stable angina, is a type of chest pain or discomfort that occurs when the heart muscle doesn't 
receive enough blood flow during physical activity or exertion. This condition is usually a symptom of underlying coronary artery disease (CAD), 
where the arteries that supply blood to the heart muscle become narrowed or blocked by atherosclerosis (the buildup of plaque
*/
SELECT COUNT(*) AS EXERCISE_ANGINA
FROM HEART_FAILURE
WHERE EXERCISEANGINA='N' AND HEARTDISEASE=1;
--- There are 192 individuals with no Exercise angina and Heart Disease
SELECT COUNT(*) AS EXERCISE_ANGINA
FROM HEART_FAILURE
WHERE EXERCISEANGINA='N' AND HEARTDISEASE=0;
--- There are 355 individuals with no Exercise angina and no Heart Disease
SELECT COUNT(*) AS EXERCISE_ANGINA
FROM HEART_FAILURE
WHERE EXERCISEANGINA='Y' AND HEARTDISEASE=1;
-- There are 366 individuals with Exercise angina and Heart Disease
SELECT COUNT(*) AS EXERCISE_ANGINA
FROM HEART_FAILURE
WHERE EXERCISEANGINA='Y' AND HEARTDISEASE=0;
--- There are 55 individuals with Exercise angina and no Heart Disease

/*
                                             ****CONCLUSION****
Experiencing chest pain during exercise is an important indicator of a heart disease. 
The probabilty of experiencing exercise angina and its correlation to having heart disease is equal to
not experiencing chest exercise angina and its correlation to having a heart disease. 
Almost 85% cases of exercise angina is related to a heart disease. Nevertheless, there is still a 20% chance of having a heart disease 
even without Exercise Angina.
*/



/*
ST SLOPE ANALYSIS 
In an electrocardiogram (ECG or EKG), the ST segment represents the period between ventricular depolarization (the QRS complex) and repolarization (the T wave). 
The ST segment is normally isoelectric, meaning it should be at the same baseline level as the P and T waves. 
The ST segment is important in assessing myocardial ischemia or injury.
ST Elevation: This occurs when the ST segment is elevated above the baseline. ST elevation is a critical sign and can be associated with conditions 
such as myocardial infarction (heart attack) or pericarditis.
Flat ST Segment: A flat ST segment, rather than being isoelectric, may also indicate cardiac abnormalities and is often assessed in conjunction with other parts of the ECG.
*/
--- We will look at the the kind of ST Slopes and its correlation to Heart disease

SELECT COUNT(*) AS STSLOPE
FROM HEART_FAILURE
WHERE ST_SLOPE='Up' AND HEARTDISEASE=1;
--- 78
SELECT COUNT(*) AS STSLOPE
FROM HEART_FAILURE
WHERE ST_SLOPE='Flat' AND HEARTDISEASE=1;
--381
SELECT COUNT(*) AS STSLOPE
FROM HEART_FAILURE
WHERE ST_SLOPE='Up' AND HEARTDISEASE=0;
---317
SELECT COUNT(*) AS STSLOPE
FROM HEART_FAILURE
WHERE ST_SLOPE='Flat' AND HEARTDISEASE=0;
---79

/*
                                             ****CONCLUSION****
We can infer that if the ST_Slope is 'Flat' in the ECG it is most linkely a symptom of a heart disease.
Similarly, if the ST_Slope is 'Up' there is a 85% chance that you do not have a heart disease.
*/



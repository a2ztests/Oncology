--This script is used for the second file sent by Renana
--O:\Amir_Shaked\Oncology\Line_treatments_from_renana_third_file.xlsx
-- - Amir - 13.5.19: Added the time diffrences request from Renana in file: O:\Amir_Shaked\Oncology\From_Renana_variables_first_treat_add_time_diffrences_request.xlsx

--Design docs at:
-- O:\Amir_Shaked\Oncology\Line_treatments_from_renana_second_file.xlsx
--O:\Amir_Shaked\Oncology\Line_treatments_from_renana_first_file.xlsx
--O:\Amir_Shaked\Oncology\מחקר קווי טיפול-רננה ברק - קודים לשליפה.xlsx

--Main population
--casenums starting with 003 - are elective - do not appear when searching Chameleon 
--------------------------------------------------------------------------------
--first upload the excel to bidwhdevby using IMPORT of sql server
--remember to change the ID format to number as Excel recommends & then change the id column to format=text
--------------------------------------------------------------------------------
/*
Run the following code in dev then run the next in prd (- this allows not to copy the excel file to prd)
added in this second script fields: number_of_treatments_first_line_treatment, source_tab
and changed the name of the tmp table to cln_tmp_oncology_second_file

select  'INSERT INTO #excel_data select ''' +replace([ID] ,'-','')+ ''', ' 
+''''+cast(date_of_birth as nvarchar(100))+ ''', '
--+''''+sex+ ''', '
+''''+ISNULL(type_of_cancer,'')+ ''', '
+''''+ISNULL(first_line_regimen,'')+ ''', '

--+''''+cast(date_of_first_treatment as nvarchar(100))+ ''', '
--+''''+cast(date_of_last_treatment as nvarchar(100))+ ''', '

+''''+cast(date_of_first_treatment_first_line_treatment as nvarchar(100))+ ''', '
+''''+cast(date_of_last_treatment_first_line_treatment as nvarchar(100))+ ''', '

+''''+ISNULL(number_of_treatments_first_line_treatment,'')+ ''', '
+''''+ISNULL(second_line_regimen,'')+ ''', '
+''''+cast(ISNULL(date_of_first_treatment_second_line_treatment,'') as nvarchar(100))+ ''', '
+''''+cast(isnull(date_of_last_treatment_second_line_treatment,'') as nvarchar(100))+ ''', '
+''''+ISNULL(number_of_treatments_second_line_treatment,'')+ ''', '
+''''+ISNULL(third_line_regimen,'')+ ''', '
+''''+cast(isnull(date_of_first_treatment_third_line_treatment,'') as nvarchar(100))+ ''', '
+''''+cast(isnull(date_of_last_treatment_third_line_treatment,'') as nvarchar(100))+ ''', '
+''''+ISNULL(number_of_treatments_third_line_treatment,'')+ ''','
+''''+ISNULL(source_tab,'')+ '''' 
FROM  [BI_Dev].[dbo].[cln_tmp_oncology_third_file]

*/

--Connect to prd from here:
begin try drop table #excel_data; end try begin catch end catch;
CREATE TABLE dbo.#excel_data  
(
Id varchar(25)  NULL,
date_of_birth	datetime NULL,	
--sex	nvarchar(255)	NULL, --all the valeus in Rennana's file were null for this field
type_of_cancer	nvarchar(255)	NULL,
first_line_regimen	nvarchar(255)	NULL,
date_of_first_treatment_first_line_treatment	nvarchar(255)	NULL,
date_of_last_treatment_first_line_treatment	nvarchar(255)	NULL,
number_of_treatments_first_line_treatment	nvarchar(255) NULL, --This is a change from the first file Renana sent
second_line_regimen	nvarchar(255)	NULL,
date_of_first_treatment_second_line_treatment	nvarchar(255) NULL,	
date_of_last_treatment_second_line_treatment	nvarchar(255)	NULL,
number_of_treatments_second_line_treatment	nvarchar(255)	NULL,
third_line_regimen	nvarchar(255)	NULL,
date_of_first_treatment_third_line_treatment	nvarchar(255)	NULL,
date_of_last_treatment_third_line_treatment	nvarchar(255)	NULL,
number_of_treatments_third_line_treatment	nvarchar(255)	NULL,
source_tab	nvarchar(255)	NULL --This is a change from the first file Renana sent
)

--The insert into code lines below, was pasted after running the "select  'INSERT INTO #excel_data..." part of code above in dev
--the folowing code from here on - can be ran in prd

INSERT INTO #excel_data select '10175040', 'Jun 18 1944 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 2', 'Nov  2 2015  3:55PM', 'Jan 25 2016  3:40PM', '', 'TASMC GI De Gramont + Bevacizumab - Version 2', 'Feb  8 2016  3:00PM', 'Oct 25 2016  2:02PM', '', 'TASMC GI De Gramont + Bevacizumab - Version 3', 'Nov  6 2016  3:32PM', 'Nov  6 2016  5:15PM', '','colon_src'
INSERT INTO #excel_data select '10293884', 'Jan  1 1943 12:00AM', 'Colon cancer', 'TASMC GI FOLFIRI + Cetuximab - Version 1', 'Nov 10 2015  1:05PM', 'Dec 22 2015  3:06PM', '', 'TASMC GI De Gramont (Infusor) +Mitomicin C - Version 2', 'Apr 19 2016 11:00AM', 'Apr 19 2016  2:40PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '10791747', 'Jul  3 1932 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 2', 'Dec  9 2015  6:15PM', 'Mar 18 2016  4:49PM', '', 'TASMC GI De Gramont (Inpatient) - Version 1', 'Apr  8 2016  4:10PM', 'Jul 11 2016 12:00PM', '', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Jul 28 2016  1:46PM', 'Aug 25 2016  3:43PM', '','colon_src'
INSERT INTO #excel_data select '14014823', 'Jul  2 1928 12:00AM', 'Colon cancer - Ascending colon', 'TASMC GI 5FU+leucovorin (Roswell-PARK) +Cetuximab - Version 1', 'Nov  2 2015  9:30AM', 'Dec 14 2015 11:30AM', '', 'TASMC BC Xeloda+Avastin - Version 1', 'Feb 15 2016 12:00PM', 'Jun 20 2016  9:16AM', '', 'TASMC GI XELIRI + ERBITUX - Version 1', 'Aug 24 2016 11:20AM', 'Sep 20 2016 10:47AM', '','colon_src'
INSERT INTO #excel_data select '1436286', 'Aug  8 1935 12:00AM', 'Colon cancer - Transverse colon', 'TASMC GI Panitumumab (Vectibix) - Version 1', 'Apr 22 2018 12:14PM', 'Sep 25 2018 10:54AM', '', 'TASMC GI 5FU + lcv weekly (Roswell-Park)-adjuvant - Version 2', 'Aug  8 2018  3:41PM', 'Sep 16 2018  6:24PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '16475600', 'Jan 15 1939 12:00AM', 'Colon cancer', 'TASMC GI FOLFIRI+ Panitumumab - Version 1', 'Nov  1 2015  1:20PM', 'Aug 30 2016  4:01PM', '', 'TASMC GI De Gramonte + Vectibix - Version 3', 'Jun  6 2017 10:02AM', 'Jan 21 2018 12:45PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '16649667', 'Dec 17 1940 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX 6 modified (infusor) + Panitumab (vectebix) - Version 1', 'Nov  2 2015  1:51PM', 'Feb 21 2016  4:15PM', '', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'Jun 19 2016 12:00PM', 'Jan 29 2017  6:56PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '16731515', 'Jan 24 1947 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 2', 'Nov 17 2015 11:05AM', 'Mar  7 2016 11:50AM', '', 'TASMC GI Rosweel -Park  +AVASTIN - Version 2', 'Apr 12 2016  4:15PM', 'Dec 19 2016 10:23AM', '', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Apr  3 2017  1:44PM', 'Apr 18 2017  5:30PM', '','colon_src'
INSERT INTO #excel_data select '16751364', 'Mar  8 1956 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Jan 31 2017 11:00AM', 'Sep 17 2017  4:35PM', '', 'TASMC GI  Mitomicin  + DE-gramonte +Avastin - Version 1', 'Dec 10 2017 12:00PM', 'Dec 10 2017  4:34PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '16831299', 'Sep  4 1944 12:00AM', 'Colon cancer', 'TASMC GI Folfiri (out  patient) +Panitumumab - Version 2', 'May  3 2016 12:35PM', 'Feb 20 2018  2:52PM', '', 'TASMC GI  Mitomicin  + DE-gramonte +Avastin - Version 1', 'Jul 15 2018 12:53PM', 'Oct 31 2018 12:00PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '1711753', 'Nov  8 1947 12:00AM', 'Breast cancer', 'TASMC GI Rosweel -Park  +AVASTIN - Version 1', 'Feb 22 2016  4:05PM', 'Mar 27 2016  4:00PM', '', 'TASMC GI De Gramont + Bevacizumab - Version 3', 'May 23 2016 10:17AM', 'Jun  6 2016 12:17PM', '', 'TASMC GI FOLFIRI (Infusor) - Version 2', 'Jul 19 2016  9:59AM', 'Jul 19 2016  9:59AM', '','colon_src'
INSERT INTO #excel_data select '17121104', 'Jun 13 1932 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 2', 'Nov  9 2015  1:51PM', 'Jan 25 2016 12:58PM', '', 'TASMC GI Folfox (infuser) new - Version 1', 'Feb 22 2016 11:50AM', 'Mar  7 2016  1:09PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '2010619', 'Sep 17 1928 12:00AM', 'Colon cancer', 'TASMC GI Panitumumab (Vectibix) - Version 1', 'May  9 2016  9:53AM', 'Jul 18 2016  9:12AM', '', 'TASMC GI Xeloda + Bevacizumab - Version 1', 'Aug 25 2016  9:38AM', 'Feb  9 2017 11:03AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '20314266', 'Jan  1 1942 12:00AM', 'Colon cancer', 'TASMC GI De Gramont + Bevacizumab - Version 1', 'Nov  8 2015 11:41AM', 'Jun  5 2016  1:37PM', '', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'Jul 10 2016 12:30PM', 'Jul 10 2016  5:22PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '20555900', 'Jan  1 1947 12:00AM', 'Breast cancer', 'TASMC GI Folfiri (out  patient) +Panitumumab - Version 2', 'Mar  6 2016  2:52PM', 'May 17 2016  4:19PM', '', 'TASMC GI Folfiri (out  patient) +Panitumumab - Version 2', 'Aug 16 2016 12:30PM', 'Nov  8 2016  2:48PM', '', 'TASMC GI Rosweel -Park  +AVASTIN - Version 3', 'Mar 21 2017 12:47PM', 'Apr 23 2017  4:30PM', '','colon_src'
INSERT INTO #excel_data select '21482401', 'Jan  1 1944 12:00AM', 'Colon cancer', 'TASMC GI Rosweel -Park  +AVASTIN - Version 1', 'Dec  6 2015  1:55PM', 'Dec 17 2015  3:46PM', '', 'TASMC GI -pancreas Gemzar+5FU - Version 1', 'Feb 25 2016  1:02PM', 'Feb 25 2016  3:20PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '22085146', 'Oct  4 1965 12:00AM', 'Colon cancer', 'TASMC GI De Gramont + Bevacizumab - Version 2', 'Nov 23 2015 12:10PM', 'Apr  4 2016 10:40AM', '', 'TASMC GI Rosweel -Park  +AVASTIN - Version 2', 'May  9 2016 12:38PM', 'Jun 27 2016 11:00AM', '', 'TASMC GI Xeloda + Bevacizumab - Version 1', 'Aug  8 2016  8:43AM', 'Nov 26 2018  7:45AM', '','colon_src'
INSERT INTO #excel_data select '22136477', 'Oct  7 1965 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 1', 'Oct 27 2015  1:17PM', 'Nov 24 2015  1:19PM', '', 'TASMC GI FOLFIRI D2-UGT1A1 mutant  + ERBITUX - Version 2', 'Jan 18 2016  2:00PM', 'Mar  2 2016  6:30PM', '', 'TASMC GI De Gramont (Infusor) +Mitomicin C - Version 2', 'Apr 26 2016 11:16AM', 'Jun 14 2016  3:49PM', '','colon_src'
INSERT INTO #excel_data select '22769608', 'Jun 10 1967 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Aug 21 2016  3:23PM', 'Oct  6 2016  4:28PM', '', 'TASMC GI 5FU + lcv weekly (Roswell-Park)-adjuvant - Version 2', 'Mar 30 2017  2:35PM', 'Jun 15 2017  3:55PM', '', 'TASMC GI 5FU + lcv weekly (Roswell-Park)-adjuvant - Version 2', 'Jun 22 2017 12:07PM', 'Jun 29 2017  1:49PM', '','colon_src'
INSERT INTO #excel_data select '22916605', 'Mar  8 1967 12:00AM', 'Colon cancer', 'TASMC GI Rosweel -Park  +AVASTIN - Version 3', 'Oct 20 2016  4:53PM', 'Apr  6 2017 11:30AM', '', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'May 14 2017 12:10PM', 'Jul 30 2017  5:09PM', '', 'TASMC GI Folfox 6 (infuser) - Version 3', 'Aug 27 2017 11:27AM', 'Oct  8 2017  2:57PM', '','colon_src'
INSERT INTO #excel_data select '25479353', 'Sep 28 1973 12:00AM', 'Colon cancer', 'TASMC GI XELOX + Bevacizumab - Version 1', 'Jul 24 2017  1:45PM', 'Aug 21 2017  1:30PM', '', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Sep 17 2017  2:00PM', 'Dec 11 2018  3:47PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '26454454', 'Nov 25 1973 12:00AM', 'Colon cancer - Sigmoid colon', 'TASMC GI  Mitomicin  + DE-gramonte +Avastin - Version 1', 'Nov 17 2017  2:30PM', 'Nov 17 2017  2:30PM', '', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Nov 17 2017  2:00PM', 'Dec 11 2017  1:55PM', '', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Dec 26 2017  2:51PM', 'Jan 10 2018  6:33PM', '','colon_src'
INSERT INTO #excel_data select '27058007', 'Jan  1 1959 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 2', 'Jan 10 2016 12:30PM', 'Jun 19 2016  1:45PM', '', 'TASMC GI FOLFOX desensitization (Infusor) - Version 2', 'Jul 31 2016  3:20PM', 'Jan  8 2017  1:30PM', '', 'TASMC GI FOLFIRI (Infusor) - Version 2', 'Feb 19 2017  5:45PM', 'Oct 22 2017  5:00PM', '','colon_src'
INSERT INTO #excel_data select '27409432', 'Jul 17 1974 12:00AM', 'Colon cancer', 'TASMC GI FOLFIRI D2-UGT1A1 mutant  + ERBITUX - Version 1', 'Oct 26 2015 11:15AM', 'Dec 21 2015  2:23PM', '', 'TASMC GI De Gramont (Infusor) +Mitomicin C - Version 1', 'Dec  7 2015  2:13PM', 'Dec 21 2015  2:00PM', '', 'TASMC Clinical   Trial   MK 1248 - Version 1', 'Apr  5 2016  1:10PM', 'Apr  5 2016  1:10PM', '','colon_src'
INSERT INTO #excel_data select '27718956', 'Aug 27 1970 12:00AM', 'Colon cancer', 'TASMC GI Folfiri (out  patient) +Panitumumab - Version 2', 'Feb 28 2016  1:22PM', 'Jul 26 2016  7:23PM', '', 'TASMC GI De Gramont (Infusor) +Mitomicin C - Version 2', 'Nov 23 2016  4:20PM', 'Dec 18 2016  5:34PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '28443547', 'Feb 15 1971 12:00AM', 'Colon cancer', 'TASMC GI FLOX +ERBITUX - Version 1', 'Nov 24 2015 10:15AM', 'Aug 30 2016 10:21AM', '', 'TASMC GI  IFL +ERBITUX - Version 1', 'Sep 13 2016  9:30AM', 'Jan 31 2017  9:46AM', '', 'TASMC GI IFL (Saltz)+AVASTIN - Version 1', 'Feb 28 2017 10:40AM', 'Aug 30 2017 10:23AM', '','colon_src'
INSERT INTO #excel_data select '2861664', 'Aug 31 1931 12:00AM', 'Colon cancer', 'TASMC GI Xeloda + Bevacizumab - Version 1', 'Aug  3 2016  1:41PM', 'Dec  7 2016  2:00PM', '', 'TASMC GI Rosweel -Park  +AVASTIN - Version 3', 'Dec 28 2016 12:53PM', 'Feb  1 2017  2:50PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '28649119', 'Jul 22 1971 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX 6 modified (infusor) + Panitumab (vectebix) - Version 2', 'Nov 10 2015  3:55PM', 'Jan 18 2017  2:20PM', '', 'TASMC BC Pembrolizumab (keytruda) - Version 1', 'Mar  7 2017 12:25PM', 'Apr 19 2017  3:39PM', '', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'Oct  2 2017  1:49PM', 'Mar 11 2018  7:19PM', '','colon_src'
INSERT INTO #excel_data select '29064086', 'Feb 27 1972 12:00AM', 'Colon cancer', 'TASMC GI FOLFIRI+ Panitumumab - Version 1', 'Oct 27 2015  4:41PM', 'May  3 2016  4:04PM', '', 'TASMC GI FOLFOX desensitization (Infusor) - Version 2', 'May 30 2016 11:26AM', 'Jun 13 2016  7:45PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '2958635', 'Sep  1 1930 12:00AM', 'Colon cancer', 'TASMC GI Rosweel -Park  +AVASTIN - Version 3', 'Feb  7 2018 12:40PM', 'Jul 11 2018 12:02PM', '', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Dec 10 2018 10:48AM', 'Dec 10 2018  1:20PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '30080766', 'Apr  1 1938 12:00AM', 'Colon cancer - Sigmoid colon', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Dec 11 2017  7:00PM', 'Sep 25 2018  9:40AM', '', 'TASMC GI FOLFIRI (Inpatient) - Version 1', 'Nov 11 2018  6:26PM', 'Dec  2 2018 11:20AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '30085229', 'Mar  1 1935 12:00AM', 'Colon cancer', 'TASMC GI Erbitux bi-weekly - Version 1', 'May 22 2018 10:00AM', 'Sep  9 2018  9:30AM', '', 'TASMC GI De Gramont + Bevacizumab - Version 3', 'Dec  3 2018 10:33AM', 'Dec  5 2018  1:11PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '303932925', 'Nov 10 1935 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Sep  5 2017 11:00AM', 'May  7 2018  3:46PM', '', 'TASMC GI Panitumumab (Vectibix) - Version 1', 'Jul  5 2018  2:00PM', 'Aug 16 2018  1:40PM', '', 'TASMC  GI/LUNG/all KEYTRUDA  200mg q21d - Version 1', 'Oct 22 2018  2:54PM', 'Dec  3 2018  8:45AM', '','colon_src'
INSERT INTO #excel_data select '304070139', 'Jun  1 1946 12:00AM', 'Colon cancer', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'Nov 11 2015  3:53PM', 'Oct  5 2016  5:12PM', '', 'TASMC GI Folfox 6 (infuser) - Version 3', 'Nov 27 2016 11:32AM', 'Dec 25 2016  2:33PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '304278955', 'Jul 17 1960 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Aug 14 2016 12:15PM', 'Sep 25 2016  3:35PM', '', 'TASMC GI Folfox 6 (infuser) - Version 3', 'Jan 24 2017 12:11PM', 'May 23 2017  3:45PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '304290901', 'May 31 1946 12:00AM', 'Colon cancer', 'TASMC GI FOLFIRI+ Panitumumab - Version 1', 'Nov  8 2015  2:00PM', 'Nov  8 2015  3:53PM', '', 'TASMC GI Panitumumab (Vectibix) - Version 1', 'Dec  6 2015 10:24AM', 'Mar 20 2016 10:22AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '304350960', 'Aug 11 1926 12:00AM', 'Colon cancer', 'TASMC GI FLOX +AVASTIN - Version 2', 'Nov 16 2015  1:22PM', 'Feb 15 2016 10:30AM', '', 'TASMC GI IFL (Saltz)+AVASTIN - Version 1', 'Mar 29 2016  1:00PM', 'May 16 2016  2:41PM', '', 'TASMC GI IFL (SALTZ) - Version 1', 'Jun  6 2016 11:20AM', 'Jul 11 2016  2:00PM', '','colon_src'
INSERT INTO #excel_data select '304460827', 'May 30 1953 12:00AM', 'Colon cancer - Sigmoid colon', 'TASMC GI FOLFOX 6 modified (infusor) + Panitumab (vectebix) - Version 3', 'Jan 11 2017  5:45PM', 'Jul 17 2017  1:15PM', '', 'TASMC GI De Gramonte + Vectibix - Version 3', 'Aug 22 2017 10:54AM', 'Oct  8 2017  2:13PM', '', 'TASMC GI FOLFOX 6 modified (infusor) + Panitumab (vectebix) - Version 3', 'Jul 24 2018 12:00PM', 'Aug 27 2018  4:33PM', '','colon_src'
INSERT INTO #excel_data select '306208422', 'Jul 26 1963 12:00AM', 'Colon cancer', 'TASMC GI FOLFIRI + Cetuximab - Version 1', 'Oct 26 2015 12:26PM', 'Feb 14 2016 10:40AM', '', 'TASMC GI Folfox 6 (infuser) - Version 3', 'Dec 18 2016 10:42AM', 'Aug 29 2017  2:48PM', '', 'TASMC Clinical Trial  CAN1001  JNJ-64457107 - Version 2', 'Dec  5 2017 10:07AM', 'Feb  1 2018  2:20PM', '','colon_src'
INSERT INTO #excel_data select '306318320', 'Aug 20 1947 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Jul 11 2017  6:46PM', 'Sep  2 2018  2:53PM', '', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'Apr 29 2018 10:22AM', 'Jun 10 2018 12:40PM', '', 'TASMC GI De Gramont (Infusor) +Mitomicin C - Version 2', 'Oct 14 2018  2:50PM', 'Nov 25 2018  1:39PM', '','colon_src'
INSERT INTO #excel_data select '306638719', 'Sep 15 1939 12:00AM', 'Colon cancer', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'Nov  4 2015 11:38AM', 'Dec 21 2015  2:25PM', '', 'TASMC GI FOLFOX 6 modified (infusor) + Panitumab (vectebix) - Version 2', 'Jan 25 2016 11:40AM', 'May 30 2016  2:49PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '307766881', 'Jun 20 1948 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 1', 'Oct 28 2015  3:34PM', 'Jan 10 2016 12:43PM', '', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'Aug 16 2016 12:57PM', 'Nov  8 2016  3:51PM', '', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'Feb  7 2017 12:00PM', 'Mar 21 2017  1:30PM', '','colon_src'
INSERT INTO #excel_data select '308584697', 'Sep 14 1937 12:00AM', 'Colon cancer', 'TASMC GI FLOX +AVASTIN - Version 2', 'Nov  9 2015  2:43PM', 'Dec 13 2015  4:40PM', '', 'TASMC GI FOLFIRI (Infusor) - Version 1', 'Jan 25 2016 12:07PM', 'Apr 26 2016  2:34PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '308833185', 'Jun 12 1935 12:00AM', 'Colon cancer', 'TASMC GI Panitumumab (Vectibix) - Version 1', 'Feb 12 2017 10:19AM', 'Apr 23 2017 11:30AM', '', 'TASMC GI Rosweel -Park  +AVASTIN - Version 3', 'May 28 2017  2:08PM', 'Nov 12 2017  3:52PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '308871391', 'Oct 30 1948 12:00AM', 'Colon cancer - Descending colon', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Mar 16 2017 12:07AM', 'May  9 2017  2:40PM', '', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'Jun 13 2017  4:17PM', 'Jun 13 2017  5:46PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '309673192', 'Oct  8 1959 12:00AM', 'Colon cancer', 'TASMC GI FOLFIRI + Cetuximab - Version 1', 'Dec  6 2015 11:25AM', 'Jul  1 2018 12:14PM', '', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Aug 12 2018 11:30AM', 'Dec  2 2018 12:57PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '31157266', 'Jun  5 1937 12:00AM', 'Colon cancer - Sigmoid colon', 'TASMC GI De Gramont + Bevacizumab - Version 1', 'Nov  2 2015  3:26PM', 'Nov  2 2015  3:52PM', '', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'Dec 14 2015  1:49PM', 'Feb  3 2016  4:36PM', '', 'TASMC GI 5FU+leucovorin (Roswell-PARK) +Cetuximab - Version 2', 'Mar  8 2016  1:58PM', 'May 10 2016  3:10PM', '','colon_src'
INSERT INTO #excel_data select '311722714', 'Oct 10 1945 12:00AM', 'Colon cancer', 'TASMC GI FOLFIRI D2-UGT1A1 mutant +AVASTIN - Version 1', 'Dec 20 2015  2:05PM', 'Jan 31 2016  6:10PM', '', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'Feb 28 2016 10:50AM', 'Jan  7 2018  1:56PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '312818891', 'Jun  1 1939 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 2', 'Feb 21 2016  3:05PM', 'May  2 2016  7:27PM', '', 'TASMC GI Folfiri (out  patient) +Panitumumab - Version 2', 'May 29 2016  2:00PM', 'Jul 11 2016 12:08PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '312943962', 'Feb 26 1955 12:00AM', 'Colon cancer - Sigmoid colon', 'TASMC GI XELOX + Erbitux (cetuximab) - Version 1', 'Feb  5 2017  1:26PM', 'Apr  2 2017  1:55PM', '', 'TASMC GI XELOX - Version 1', 'May 14 2017 12:35PM', 'Jun  4 2017 12:03PM', '', 'TASMC GI XELOX + Erbitux (cetuximab) - Version 1', 'Nov 28 2018 12:35PM', 'Dec 11 2018  8:14AM', '','colon_src'
INSERT INTO #excel_data select '317797413', 'Jul  9 1963 12:00AM', 'Colon cancer', 'TASMC GI De Gramont + Bevacizumab - Version 1', 'Oct 26 2015  2:43PM', 'Dec  7 2015  2:19PM', '', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 2', 'Jan 25 2016 11:40AM', 'Mar  7 2016  6:18PM', '', 'TASMC GI FOLFIRI (Infusor) - Version 2', 'Apr  4 2016  1:02PM', 'May 17 2016  4:16PM', '','colon_src'
INSERT INTO #excel_data select '317808186', 'Oct 15 1975 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Nov 22 2016  1:41PM', 'Mar 14 2017  4:33PM', '', 'TASMC GI FOLFIRI + Cetuximab - Version 1', 'May 24 2017 12:09PM', 'Jul  4 2017  5:02PM', '', 'TASMC BC Pembrolizumab (keytruda) - Version 1', 'Aug 10 2017 12:56PM', 'Oct 15 2017  1:08PM', '','colon_src'
INSERT INTO #excel_data select '320637655', 'May 18 1950 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 2', 'Feb 23 2016  1:21PM', 'May 24 2016 11:30AM', '', 'TASMC GI FOLFOX desensitization (Infusor) - Version 2', 'Jun  9 2016 11:48AM', 'Sep  7 2016  6:42PM', '', 'TASMC GI De Gramont + Bevacizumab - Version 3', 'Jan 17 2017  4:10PM', 'Mar 22 2017  6:48PM', '','colon_src'
INSERT INTO #excel_data select '323610790', 'Nov 19 1943 12:00AM', 'Colon cancer', 'TASMC GI De Gramont + Bevacizumab - Version 2', 'Jan 18 2016  1:44PM', 'Mar  1 2016  4:27PM', '', 'TASMC GI Erbitux bi-weekly - Version 1', 'Mar 30 2016  2:56PM', 'Jul 21 2016  2:53PM', '', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Nov 13 2016  2:29PM', 'Mar 14 2017  5:35PM', '','colon_src'
INSERT INTO #excel_data select '324495167', 'Sep 20 1938 12:00AM', 'Colon cancer - Sigmoid colon', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 2', 'Dec  7 2015 12:49PM', 'Jun 25 2018 11:25AM', '', 'TASMC GI De Gramont + Bevacizumab - Version 3', 'Aug  6 2018 11:49AM', 'Sep 25 2018  1:00PM', '', 'TASMC GI De Gramonte + Vectibix - Version 3', 'Dec  2 2018 11:37AM', 'Dec  2 2018  5:00PM', '','colon_src'
INSERT INTO #excel_data select '32808727', 'Jun  2 1978 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 2', 'Nov  1 2015  9:34AM', 'Feb 21 2016 12:28PM', '', 'TASMC GI De Gramont + Bevacizumab - Version 2', 'Feb  7 2016 11:30AM', 'Apr  3 2016  1:35PM', '', 'TASMC GI Folfiri (out  patient) +Panitumumab - Version 2', 'Apr 17 2016 12:20PM', 'Jun  5 2016  3:42PM', '','colon_src'
INSERT INTO #excel_data select '332727213', 'Dec 20 1956 12:00AM', 'Colon cancer', 'TASMC GI Xeloda + Bevacizumab - Version 1', 'Oct 28 2015 12:22PM', 'Feb 18 2016 11:44AM', '', 'TASMC GI XELOX + Bevacizumab - Version 1', 'Apr 12 2016  2:59PM', 'Sep  1 2016 11:29AM', '', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'Nov 13 2016 11:45AM', 'Jul  9 2017  2:07PM', '','colon_src'
INSERT INTO #excel_data select '336216775', 'Feb 26 1955 12:00AM', 'Colon cancer', 'TASMC GI XELOX + Bevacizumab - Version 1', 'May 11 2016 11:44AM', 'May 11 2016  2:36PM', '', 'TASMC GI FOLFIRI + Cetuximab - Version 1', 'May 31 2016  4:04PM', 'Jun 17 2016 10:16PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '337588362', 'May 17 1950 12:00AM', 'Colon cancer', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'Nov  2 2015  2:40PM', 'Apr 11 2016 11:59AM', '', 'TASMC GI Erbitux bi-weekly - Version 1', 'Mar  2 2017 10:03AM', 'Jun  7 2017  9:17AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '338044324', 'Jul 10 1942 12:00AM', 'Colon cancer', 'TASMC GI Rosweel -Park  +AVASTIN - Version 1', 'Oct 26 2015  2:48PM', 'Dec 14 2015 11:15AM', '', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 2', 'Jan 19 2016 10:14AM', 'Jul 10 2016 11:53AM', '', 'TASMC GI De Gramont + Bevacizumab - Version 3', 'Jul 31 2016 12:30PM', 'Nov  7 2016 12:22PM', '','colon_src'
INSERT INTO #excel_data select '340885730', 'Jan 30 1945 12:00AM', 'Colon cancer - Ascending colon', 'TASMC GI Folfiri (out  patient) +Panitumumab - Version 2', 'Nov  9 2015 12:08PM', 'Dec 21 2015  5:01PM', '', 'TASMC GI - pancreas MitomycinC+5FU+LCV - Version 1', 'Feb 24 2016  2:30PM', 'May  1 2016 11:00AM', '', 'TASMC trial  GI  Colon  cancer   MK3475 (pembrolizumab) - Version 2', 'Aug 24 2016  2:50PM', 'Aug 24 2016  2:50PM', '','colon_src'
INSERT INTO #excel_data select '34094623', 'Aug  3 1977 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 2', 'Nov  8 2015  4:43PM', 'Jan 22 2016  3:31PM', '', 'TASMC GI FOLFIRI (Inpatient) - Version 1', 'Mar  1 2016  2:12PM', 'Mar  1 2016  5:09PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '341217115', 'Aug 21 1959 12:00AM', 'Colon cancer - Sigmoid colon', 'TASMC GI FOLFOX 6 modified (infusor) + Panitumab (vectebix) - Version 3', 'Feb 16 2017 11:40AM', 'Mar  5 2017  6:00PM', '', 'TASMC GI FOLFOX 6 modified (infusor) + Panitumab (vectebix) - Version 3', 'Mar 19 2017 10:44AM', 'Jul 16 2017  1:55PM', '', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'Aug 20 2017  9:19AM', 'Feb 26 2018  1:53PM', '','colon_src'
INSERT INTO #excel_data select '39364922', 'Mar 19 1984 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 2', 'Nov  2 2015  2:30PM', 'Nov 30 2015  1:21PM', '', 'TASMC GI De Gramont + Bevacizumab - Version 2', 'Dec 14 2015  1:10PM', 'Jan 11 2016  3:38PM', '', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Apr  4 2016  1:07PM', 'Sep 11 2016  6:00PM', '','colon_src'
INSERT INTO #excel_data select '41324740', 'Jan  1 1947 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 2', 'Nov  2 2015  1:11PM', 'Jul  4 2017 10:10AM', '', 'TASMC GI Panitumumab (Vectibix) - Version 1', 'Jan 10 2018  9:40AM', 'May 23 2018 11:45AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '41606302', 'Feb 24 1941 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 2', 'Jan 11 2016 12:00PM', 'Feb 22 2016 10:25AM', '', 'TASMC GI FOLFIRI D2-UGT1A1 Mutant - Version 3', 'Apr  5 2016 10:00AM', 'May 17 2016 12:05PM', '', 'TASMC GI - pancreas MitomycinC+5FU+LCV - Version 1', 'Jul 12 2016 10:40AM', 'Nov  3 2016 10:03AM', '','colon_src'
INSERT INTO #excel_data select '45425436', 'May 27 1935 12:00AM', 'Colon / Rectum', 'TASMC BC Xeloda+Avastin - Version 1', 'Jan 28 2016  1:28PM', 'Jan 28 2016  1:28PM', '', 'TASMC BC Xeloda+Avastin - Version 1', 'Feb 11 2016 11:32AM', 'Jan 26 2017 12:31PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '45614419', 'Dec 30 1937 12:00AM', 'Colon cancer - Hepatic flexure', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 2', 'Jan 27 2016 12:35PM', 'Jun 11 2017  7:30PM', '', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'Sep 17 2017  2:33PM', 'Dec  3 2017  5:43PM', '', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Feb 23 2018  1:13PM', 'Mar 11 2018  7:50PM', '','colon_src'
INSERT INTO #excel_data select '48991046', 'Sep 10 1945 12:00AM', 'Colon cancer', 'TASMC GI De Gramont + Bevacizumab - Version 2', 'Dec  8 2015 12:30PM', 'Mar 29 2016  1:31PM', '', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'May 18 2016 10:00AM', 'Sep 13 2016  1:10PM', '', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'Oct 18 2016 10:40AM', 'Jun 20 2017  2:30PM', '','colon_src'
INSERT INTO #excel_data select '50473792', 'Feb 16 1951 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 2', 'Nov  3 2015  9:54AM', 'Dec  1 2015  1:49PM', '', 'TASMC GI Folfox (infuser) new - Version 1', 'Feb  9 2016  2:10PM', 'Feb 23 2016  1:42PM', '', 'TASMC GI FOLFIRI + Cetuximab - Version 1', 'Feb  7 2017 10:15AM', 'Feb  7 2017  4:17PM', '','colon_src'
INSERT INTO #excel_data select '50584291', 'May  4 1951 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 2', 'Apr 10 2016  3:20PM', 'Oct  9 2016  1:00PM', '', 'TASMC GI De Gramont + Bevacizumab - Version 3', 'Oct 23 2016 11:46AM', 'Jan 22 2017  4:35PM', '', 'TASMC GI FOLFIRI+ Panitumumab - Version 2', 'May  7 2017  1:45PM', 'Nov 25 2018 11:46AM', '','colon_src'
INSERT INTO #excel_data select '51013175', 'Dec  6 1951 12:00AM', 'Colon cancer - Sigmoid colon', 'TASMC BC Erbitux - Version 1', 'Aug 29 2017 12:30PM', 'Aug 12 2018 12:16PM', '', 'TASMC BC Erbitux - Version 1', 'Aug 19 2018 11:33AM', 'Oct  4 2018  1:16PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '51032761', 'Sep 12 1951 12:00AM', 'Colon cancer', 'TASMC GI XELOX + Bevacizumab - Version 1', 'Nov  2 2015  2:10PM', 'Dec 28 2015 12:48PM', '', 'TASMC GI XELOX + Bevacizumab - Version 1', 'Jun 27 2016 11:27AM', 'Nov  2 2016 11:39AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '51421204', 'Feb 20 1954 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 2', 'Dec  2 2015  3:10PM', 'Dec 20 2015  6:00PM', '', 'TASMC GI De Gramont (Infusor) +Mitomicin C - Version 1', 'Jan 18 2016  2:12PM', 'Feb 29 2016  5:10PM', '', 'TASMC GI FOLFIRI + Cetuximab - Version 1', 'May 30 2016  3:56PM', 'Jul 19 2016  5:00PM', '','colon_src'
INSERT INTO #excel_data select '52727740', 'Nov 26 1954 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 2', 'Oct 27 2015 11:58AM', 'Jan 12 2016  1:03PM', '', 'TASMC GI FOLFIRI + Cetuximab - Version 1', 'Feb  3 2016 12:30PM', 'Nov  1 2016  3:30PM', '', 'TASMC GI FOLFIRI + Cetuximab - Version 1', 'Jul 20 2017 12:40PM', 'Jan  9 2018  5:20PM', '','colon_src'
INSERT INTO #excel_data select '52914041', 'Aug  3 1954 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Nov  6 2017  2:55PM', 'Apr 16 2018  1:58PM', '', 'TASMC GI FOLFIRI (Inpatient) - Version 1', 'May 21 2018  5:39PM', 'Jun 19 2018  6:43PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '53265294', 'Jan 10 1955 12:00AM', 'Colon cancer', 'TASMC GI Xeloda + Bevacizumab - Version 1', 'Jan 28 2016 10:26AM', 'Mar 31 2016 10:56AM', '', 'TASMC GI XELOX + Bevacizumab - Version 1', 'May 19 2016 11:13AM', 'Mar 14 2017 12:15PM', '', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'Apr 24 2017  3:20PM', 'Jun  5 2017  5:13PM', '','colon_src'
INSERT INTO #excel_data select '53527644', 'Apr  2 1956 12:00AM', 'Colon cancer', 'TASMC GI De Gramont + Bevacizumab - Version 1', 'Nov  8 2015 10:03AM', 'Mar 13 2016 11:00AM', '', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Mar 26 2017 10:10AM', 'Jun 18 2017  3:29PM', '', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'Mar 11 2018 10:00AM', 'Apr  8 2018  2:00PM', '','colon_src'
INSERT INTO #excel_data select '53637849', 'Sep  9 1955 12:00AM', 'Colon cancer', 'TASMC GI Rosweel -Park  +AVASTIN - Version 3', 'Feb 26 2017 12:13PM', 'Mar 13 2017 10:20AM', '', 'TASMC GI De Gramont + Bevacizumab - Version 3', 'Apr 25 2017 10:45AM', 'Aug 15 2017  2:41PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '53974689', 'Jan 23 1956 12:00AM', 'Colon cancer', 'TASMC GI XELOX + Bevacizumab - Version 1', 'Oct 13 2016 11:52AM', 'Oct 13 2016 12:26PM', '', 'TASMC GI FLOX +AVASTIN - Version 2', 'Nov  3 2016 12:46PM', 'Dec  1 2016  1:59PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '54373782', 'Jun 11 1956 12:00AM', 'Colon cancer', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'Aug 28 2016 11:43AM', 'Jan 30 2017  2:26PM', '', 'TASMC GI FOLFIRI + Cetuximab - Version 1', 'May  1 2017 11:54AM', 'Oct 16 2017  3:16PM', '', 'TASMC Clinical Trial  CAN1001  JNJ-64457107 - Version 2', 'Feb 12 2018 11:51AM', 'Mar 19 2018  1:35PM', '','colon_src'
INSERT INTO #excel_data select '55482046', 'Sep  5 1958 12:00AM', 'Colon cancer - Ceacum', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Nov  5 2017 11:25AM', 'Jun 12 2018  3:31PM', '', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'Jun 26 2018  1:00PM', 'Sep  4 2018  6:24PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '55911911', 'Jul 21 1959 12:00AM', 'Colon cancer', 'TASMC GI FOLFIRI + Cetuximab - Version 1', 'Oct 27 2015 10:38AM', 'May 31 2016  2:20PM', '', 'TASMC GI FOLFIRI + Cetuximab - Version 1', 'Jun 14 2016 12:00PM', 'Sep 27 2016  3:05PM', '', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'Oct 25 2016  4:15PM', 'Jun 20 2017  1:50PM', '','colon_src'
INSERT INTO #excel_data select '56045362', 'Nov  1 1959 12:00AM', 'Colon cancer', 'TASMC GI XELOX + Bevacizumab - Version 1', 'Jan  6 2016 10:40AM', 'May  8 2016 12:42PM', '', 'TASMC BC Pembrolizumab (keytruda) - Version 1', 'Aug 21 2017 11:18AM', 'Dec  5 2018  8:08AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '56446875', 'Jun 30 1960 12:00AM', 'Colon cancer', 'TASMC GI De Gramont + Bevacizumab - Version 1', 'Nov  1 2015  3:20PM', 'May  1 2016  4:12PM', '', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'May 29 2016  1:00PM', 'Jul 24 2016  7:10PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '57140642', 'Mar 20 1961 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Jan 14 2018 10:15PM', 'Aug 27 2018  3:17PM', '', 'TASMC GI Folfiri (out  patient) +Panitumumab - Version 2', 'Sep 16 2018 12:54PM', 'Dec  4 2018  4:58PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '57280752', 'Dec 29 1961 12:00AM', 'Colon cancer', 'TASMC GI FOLFIRI D2-UGT1A1 mutant +AVASTIN - Version 1', 'Nov 24 2015  1:14PM', 'Sep  4 2016  4:15PM', '', 'TASMC GI - pancreas MitomycinC+5FU+LCV - Version 1', 'Nov 13 2016  1:20PM', 'Jan  1 2017  6:11PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '57403164', 'Jan 24 1962 12:00AM', 'Colon / Rectum', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Mar 27 2016 12:51PM', 'Mar 27 2016  6:39PM', '', 'TASMC GI FOLFOX-6 modified (infusor) + ERBITUX WEEKLY - Version 2', 'May 24 2016  1:41PM', 'Jan  8 2017  4:40PM', '', 'TASMC GI FOLFIRI + Cetuximab - Version 1', 'Nov 13 2017 11:41AM', 'Dec 11 2018  2:00PM', '','colon_src'
INSERT INTO #excel_data select '57404188', 'Feb 10 1962 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) + ERBITUX WEEKLY - Version 1', 'Nov  8 2015 11:53AM', 'Dec 20 2015  5:26PM', '', 'TASMC BC Erbitux - Version 1', 'Feb 25 2016 12:40PM', 'Mar 22 2016  1:18PM', '', 'TASMC GI FOLFIRI + Cetuximab - Version 1', 'Jun  7 2016 10:45AM', 'Jul 17 2016  4:46PM', '','colon_src'
INSERT INTO #excel_data select '58724600', 'Mar 27 1964 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 2', 'Mar 15 2016 11:11AM', 'Sep 20 2016  5:28PM', '', 'TASMC GI IRINOTECAN + AVASTIN - Version 1', 'Nov 29 2016  3:30PM', 'Feb  7 2017  3:14PM', '', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'May 22 2017  1:28PM', 'Nov 21 2017  1:30PM', '','colon_src'
INSERT INTO #excel_data select '60529534', 'Jan  1 1945 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 2', 'Nov  8 2015 11:34AM', 'Apr 27 2016  1:21PM', '', 'TASMC GI De Gramont + Bevacizumab - Version 3', 'Apr 13 2016 11:55AM', 'Jul 18 2016  1:13PM', '', 'TASMC GI Folfox 6 (infuser) - Version 3', 'Aug  1 2016 11:18AM', 'Apr  3 2017  5:40PM', '','colon_src'
INSERT INTO #excel_data select '60790631', 'Sep  4 1939 12:00AM', 'Colon cancer', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'Dec 21 2016 12:17PM', 'May  1 2017 12:37PM', '', 'TASMC GI De Gramonte + Vectibix - Version 3', 'Sep  6 2017 11:23AM', 'Sep  6 2017  4:34PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '63246748', 'Jan  8 1945 12:00AM', 'Colon cancer', 'TASMC GI Rosweel -Park  +AVASTIN - Version 1', 'Dec  7 2015  3:56PM', 'Feb 22 2016  2:45PM', '', 'TASMC GI FLOX +AVASTIN - Version 2', 'Apr 12 2016 10:46AM', 'Jun 21 2016  2:15PM', '', 'TASMC GI FOLFIRI (Inpatient) - Version 1', 'Jul 18 2016  4:02PM', 'Jul 19 2016 10:04PM', '','colon_src'
INSERT INTO #excel_data select '64213937', 'May 13 1926 12:00AM', 'Monoclonal gammopathy of undetermined significance', 'TASMC GI Rosweel -Park  +AVASTIN - Version 3', 'Apr  2 2017 11:05AM', 'May  8 2018  2:00PM', '', 'TASMC GI De Gramont + Bevacizumab - Version 3', 'Jun 12 2018 12:30PM', 'Jun 12 2018 12:30PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '65557944', 'Jan 26 1949 12:00AM', 'Colon cancer - Appendix', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Jul  2 2017 12:40PM', 'Nov 12 2017  1:43PM', '', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'Jan  8 2018  1:54PM', 'Mar 27 2018 12:20PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '67477786', 'Nov 26 1947 12:00AM', 'Colon cancer', 'TASMC GI IRINOTECAN + Vectibix (panitumab) - Version 1', 'Dec 16 2015  2:48PM', 'Apr  6 2016  4:43PM', '', 'TASMC GI FOLFOX desensitization (Infusor) - Version 2', 'May  9 2016 10:17AM', 'May 25 2016 12:37PM', '', 'TASMC GI Anal  canal Mitomycin + 5FU cont.+ Radiation therapy   (in-patient ) - Version 1', 'Jun 14 2016 12:20PM', 'Jun 16 2016  3:51PM', '','colon_src'
INSERT INTO #excel_data select '67674879', 'Jan  1 1940 12:00AM', 'Colon cancer - Ascending colon', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 2', 'Jan  4 2016  3:20PM', 'Feb 16 2016  3:51PM', '', 'TASMC GI Folfox (infuser) new - Version 1', 'Mar 15 2016 11:12AM', 'Mar 15 2016  1:29PM', '', 'TASMC GI De Gramont + Bevacizumab - Version 3', 'Sep  4 2016  1:20PM', 'Oct 18 2016 12:26PM', '','colon_src'
INSERT INTO #excel_data select '68340850', 'Mar 27 1948 12:00AM', 'Colon cancer', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'Nov  4 2015  3:50PM', 'Feb 16 2016  1:05PM', '', 'TASMC GI Folfox 6 (infuser) - Version 3', 'Oct 15 2017  1:38PM', 'Jan 28 2018  4:20PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '68582030', 'Jan  1 1942 12:00AM', 'Colon cancer', 'TASMC GI De Gramont + Bevacizumab - Version 3', 'Jun 15 2017  6:39PM', 'May  8 2018  9:50PM', '', 'TASMC GI FOLFIRI (Inpatient) - Version 1', 'Aug  6 2018  6:02PM', 'Dec 11 2018  6:35PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '68849678', 'Jun 29 1945 12:00AM', 'Colon cancer - Appendix', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'Nov  1 2015 12:13PM', 'Jan 20 2016 10:58AM', '', 'TASMC GI De Gramont + Bevacizumab - Version 2', 'Dec 23 2015 10:33AM', 'Mar 28 2017  2:32PM', '', 'TASMC GI FOLFIRI (Infusor) - Version 2', 'May  3 2017 12:47PM', 'Apr 11 2018  3:09PM', '','colon_src'
INSERT INTO #excel_data select '69672186', 'Nov  5 1939 12:00AM', 'Colon cancer', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'Jul  4 2016 11:51AM', 'Sep  4 2016  1:38PM', '', 'TASMC GI  ATEZOLIZUMAB biweekly  +COBI(cobimetinib)  daily  21d  q4week - Version 1', 'May 17 2018  1:11PM', 'Jun 28 2018  1:29PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '69704328', 'May  1 1936 12:00AM', 'Colon cancer', 'TASMC BC Xeloda+Avastin - Version 1', 'Nov  5 2015 12:08PM', 'Oct 13 2016 10:00AM', '', 'TASMC GI XELOX + Bevacizumab - Version 1', 'Nov 24 2016 11:02AM', 'Sep 28 2017 11:48AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '71599930', 'Jan  1 1950 12:00AM', 'Colon cancer', 'TASMC GI FOLFIRI + Cetuximab - Version 1', 'Dec  1 2015 10:00AM', 'Feb  8 2016 11:27AM', '', 'TASMC GI Folfox (infuser) new - Version 2', 'May 23 2016  1:34PM', 'Jun  7 2016 11:02AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '7289846', 'Oct  5 1945 12:00AM', 'Colon cancer', 'TASMC GI Panitumumab (Vectibix) - Version 1', 'Jan  8 2017  3:50PM', 'Apr  9 2017  3:06PM', '', 'TASMC GI FLOX - Version 3', 'May 23 2017  2:27PM', 'May 23 2017  6:05PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '7636434', 'Feb 15 1928 12:00AM', 'Colon cancer', 'TASMC GI Xeloda + Bevacizumab - Version 1', 'Nov  7 2016 12:58PM', 'Nov  7 2017  2:08PM', '', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Jan  2 2018  7:38PM', 'Feb 26 2018  5:33PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '7770357', 'Aug 29 1946 12:00AM', 'Colon cancer', 'TASMC GI FOLFOXIRI + Bevacizumab (AVASTIN) - Version 2', 'Dec 25 2016  5:55PM', 'Feb  5 2017  5:55PM', '', 'TASMC GI Erbitux bi-weekly - Version 1', 'May 16 2017  9:55PM', 'Feb  4 2018 11:25AM', '', 'TASMC GI De Gramont (Inpatient) - Version 1', 'May 17 2017  1:08AM', 'May 17 2017  3:41AM', '','colon_src'
INSERT INTO #excel_data select '8122723', 'Jul 27 1946 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX 6 modified (infusor) + Panitumab (vectebix) - Version 1', 'Nov  5 2015  5:12PM', 'Apr 28 2016  5:10PM', '', 'TASMC GI 5FU + lcv weekly (Roswell-Park)-adjuvant - Version 2', 'Jun 23 2016 10:50AM', 'Oct 16 2017 10:50AM', '', 'TASMC GI IFL (Saltz)+AVASTIN - Version 1', 'Dec 21 2017  9:30AM', 'Oct 11 2018  1:45PM', '','colon_src'
INSERT INTO #excel_data select '8202285', 'Aug  9 1947 12:00AM', 'Colon cancer', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'Nov 19 2015  4:41PM', 'Aug  7 2016  3:02PM', '', 'TASMC GI Folfox 6 (infuser) - Version 3', 'Sep 25 2016 11:30AM', 'Sep 25 2016  2:47PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '8441', 'Jan  1 1940 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'May 26 2016  1:50PM', 'Nov 30 2016  2:56PM', '', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'Dec 30 2016  3:32PM', 'Mar 10 2017 11:25PM', '', 'TASMC GI Pancreas MitomycinC+5FU+LCV - Version 2', 'Jun 29 2017  3:30PM', 'Aug 24 2017  2:00PM', '','colon_src'
INSERT INTO #excel_data select '8907701', 'Sep 15 1944 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Jun 28 2018  3:30PM', 'Oct 14 2018  4:12PM', '', 'TASMC GI Erbitux bi-weekly - Version 1', 'Oct  2 2018  1:44PM', 'Oct 17 2018  1:30PM', '', 'TASMC GI FOLFIRI + Cetuximab - Version 1', 'Nov 26 2018 11:19AM', 'Nov 26 2018  4:21PM', '','colon_src'
INSERT INTO #excel_data select '8934879', 'Feb  5 1932 12:00AM', 'Colon cancer', 'TASMC GI Panitumumab (Vectibix) - Version 1', 'Dec 24 2017  9:04AM', 'Oct 25 2018  2:18PM', '', 'TASMC GI FLOX +VECTIBIX - Version 1', 'Nov  1 2018  3:53PM', 'Dec  6 2018  2:20PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '26693762', 'Jun 30 1958 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 2', 'Mar 20 2016 10:46AM', 'Jul  4 2017  1:57PM', '', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Aug 22 2017 11:50AM', 'Oct 15 2017  5:54PM', '', 'TASMC GI FOLFIRI + Cetuximab - Version 1', 'Apr  9 2018  1:29PM', 'Aug  7 2018  4:43PM', '','colon_src'
INSERT INTO #excel_data select '29648532', 'Aug 19 1972 12:00AM', 'Colon cancer', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'Nov  3 2015 11:12AM', 'Sep  6 2016  2:15PM', '', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Dec 14 2016 10:35AM', 'Jun 19 2017  1:23PM', '', 'TASMC GI FOLFIRI+ Panitumumab - Version 2', 'Jul 24 2017 10:30AM', 'Sep 12 2018  1:27PM', '','colon_src'
INSERT INTO #excel_data select '306313404', 'May 16 1942 12:00AM', 'Colon / Rectum', 'TASMC GI Xeloda + Bevacizumab - Version 1', 'Jun 22 2016 11:29AM', 'Jul 13 2016 11:00AM', '', 'TASMC GI 5FU + lcv weekly (Roswell-Park)-adjuvant - Version 2', 'Jul 20 2016  1:14PM', 'Jul 27 2016 12:53PM', '', 'TASMC GI De-Gramont modified+Cis (inpatient) - Version 1', 'Aug  8 2016  4:45PM', 'Nov  6 2016  6:03PM', '','colon_src'
INSERT INTO #excel_data select '317419794', 'Sep 28 1954 12:00AM', 'Colon cancer', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'May  2 2016 10:55AM', 'Jun 22 2016  2:53PM', '', 'TASMC GI Mitomycin + Capecitibine conc. RTX - Version 1', 'Aug  4 2016  4:00PM', 'Sep 15 2016  2:37PM', '', 'TASMC Clinical   Trial   MK 1248 - Version 1', 'Nov  7 2016 11:15AM', 'Dec 19 2016 11:25AM', '','colon_src'
INSERT INTO #excel_data select '337927552', 'Oct 31 1947 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX 6 modified (infusor) + Panitumab (vectebix) - Version 3', 'Sep 18 2017  6:19PM', 'Feb 25 2018  4:07PM', '', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'Mar 19 2018 10:44AM', 'Oct 14 2018  2:11PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '5586003', 'Mar  3 1948 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Jul 30 2017 10:30AM', 'Dec  3 2017 10:27AM', '', 'TASMC GI Folfiri (out  patient) +Panitumumab - Version 2', 'Jan  7 2018 12:00PM', 'Feb 18 2018  2:19PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '306113002', 'Aug 22 1941 12:00AM', 'Colon cancer - Hepatic flexure', 'TASMC GI FLOX +AVASTIN - Version 2', 'Mar 31 2017  1:36PM', 'Oct 22 2017 11:35AM', '', 'TASMC clinial  trial CanStem303C TRial (BOSTON) FOLFIRI +BBI/608 arm 2 - Version 1', 'Dec 12 2017 11:03AM', 'Dec 25 2017  3:50PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '41380601', 'Jan  1 1949 12:00AM', 'Colon cancer', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'Nov  9 2015 11:59AM', 'Jun 20 2016  2:32PM', '', 'TASMC Trial solid tumor cCAM - Version 1', 'Sep 13 2016 12:20PM', 'Oct 25 2016  9:37AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '54850979', 'Oct 16 1957 12:00AM', 'Colon cancer', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'Feb 26 2017  3:58PM', 'Apr 18 2017  3:00PM', '', 'TASMC Clinical  Trial JNJ-64457107  d1-15 q28d - Version 3', 'Jul 31 2017  2:00PM', 'Sep 11 2017  1:00PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '9378266', 'Feb  7 1947 12:00AM', 'Colon cancer', 'TASMC GI FOLFIRI+ Panitumumab - Version 1', 'Oct 26 2015  9:43AM', 'Apr 10 2016  4:46PM', '', 'TASMC Clinical  Trial JNJ-64457107  d1-15 q28d - Version 1', 'Oct 19 2016 11:00AM', 'Nov 16 2016  2:05PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '10239739', 'Jan  1 1939 12:00AM', 'Basal cell carcinoma (BCC)', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Feb 19 2018  3:00PM', 'Apr  2 2018  3:00PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '10737161', 'Apr 13 1948 12:00AM', 'Colon cancer - Ascending colon', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Aug  8 2016 11:40AM', 'Mar 14 2017  2:36PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '10739654', 'Oct 25 1943 12:00AM', 'Colon cancer', 'TASMC GI Rosweel -Park  +AVASTIN - Version 3', 'Jan 28 2018  2:38PM', 'May  6 2018  2:40PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '11533098', 'Feb 19 1932 12:00AM', 'Adenocarcinoma of lung', 'TASMC HG Glioma Avastin - Version 1', 'Oct 27 2015  3:22PM', 'Mar  5 2018  8:02AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '12036356', 'Oct 18 1965 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Sep  7 2018  8:30PM', 'Dec  2 2018  2:14PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '12161584', 'Sep  1 1951 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Feb 19 2017  1:06PM', 'Jun  4 2017  2:56PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '12321782', 'Feb 14 1942 12:00AM', 'Colon cancer - Appendix', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Jan 22 2017 12:30PM', 'Jan  2 2018  4:40PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '12742789', 'May 13 1950 12:00AM', 'Colon cancer - Ascending colon', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'Apr 15 2018  1:39PM', 'Dec  9 2018  2:34PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '13821848', 'Feb 20 1942 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX 6 modified (infusor) + Panitumab (vectebix) - Version 3', 'Nov  9 2018  1:35PM', 'Nov 29 2018 10:28PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '14042857', 'May 28 1949 12:00AM', 'Colon cancer', 'TASMC GI Rosweel -Park  +AVASTIN - Version 1', 'Jan 25 2016  3:20PM', 'Apr  4 2016  2:40PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '16510232', 'Nov  6 1959 12:00AM', 'Colon cancer', 'TASMC GI FOLFIRI + Cetuximab - Version 1', 'May 29 2016 12:37PM', 'Aug  1 2017  5:36PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '16782781', 'Mar  7 1938 12:00AM', 'Colon cancer', 'TASMC GI Rosweel -Park  +AVASTIN - Version 1', 'Mar 22 2016 10:42AM', 'May  3 2016 10:23AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '17855198', 'Jul 22 1963 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Sep 25 2016  1:30PM', 'Nov  6 2016  1:49PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '20705646', 'Jan  1 1935 12:00AM', 'Colon cancer - Transverse colon', 'TASMC GI De Gramont + Bevacizumab - Version 3', 'Jan 30 2018  9:10AM', 'Aug 15 2018 11:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '23729544', 'Jul  6 1968 12:00AM', 'Colon cancer', 'TASMC GI FOLFOXIRI + Bevacizumab (AVASTIN) - Version 1', 'Feb 15 2016 11:23AM', 'Apr 11 2016  2:00PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '24256547', 'Apr  7 1969 12:00AM', 'Colon cancer', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'Jul 17 2017  1:47PM', 'Oct 16 2017  3:00PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '24923120', 'May 13 1970 12:00AM', 'Colon cancer - Sigmoid colon', 'TASMC GI FOLFOX 6 modified (infusor) + Panitumab (vectebix) - Version 3', 'Mar  7 2018  5:59PM', 'May  7 2018  1:21PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '25619958', 'Jan 23 1974 12:00AM', 'Colon cancer', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'Jun 17 2018  4:29PM', 'Nov 20 2018  1:59PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '26749838', 'Sep 13 1942 12:00AM', 'Colon cancer', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'Dec 19 2016 11:31AM', 'Dec 19 2016  4:13PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '26861286', 'Mar 23 1944 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Jun  8 2016  3:30PM', 'Mar 28 2017  7:21PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '26960468', 'Mar 15 1958 12:00AM', 'Colon cancer', 'TASMC GI Xeloda + Bevacizumab - Version 1', 'Nov 16 2015 12:27PM', 'Mar 23 2017  3:42PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '26978874', 'Jul 31 1958 12:00AM', 'Colon cancer', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'Nov 29 2015 10:11AM', 'Feb  7 2017 12:44PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '2916740', 'Mar 10 1938 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Aug 28 2018 12:00PM', 'Oct 21 2018 12:58PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '2951481', 'Jan 13 1929 12:00AM', 'Colon cancer - Sigmoid colon', 'TASMC GI Rosweel -Park  +AVASTIN - Version 3', 'Aug  6 2017 11:21AM', 'Nov 22 2018 11:11AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '29603693', 'Feb  5 1973 12:00AM', 'Colon cancer', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'Apr  9 2018  3:30PM', 'Dec  9 2018  5:02PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '30254494', 'Feb  3 1950 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'May  1 2018 10:00AM', 'Nov 29 2018  3:45PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '303337349', 'Nov 13 1937 12:00AM', 'Colon cancer', 'TASMC GI XELOX + Bevacizumab - Version 1', 'Dec 20 2016 10:57AM', 'Jul 18 2018 10:50AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '303882245', 'Aug 31 1956 12:00AM', 'Colon cancer', 'TASMC GI Folfiri (out  patient) +Panitumumab - Version 2', 'May  8 2016 11:17AM', 'Dec  2 2018  1:30PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '30668370', 'Jan  1 1945 12:00AM', 'Colon cancer', 'TASMC GI 5FU+leucovorin (Roswell-PARK) +Cetuximab - Version 1', 'Oct 26 2015  1:14PM', 'Dec 16 2015  1:40PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '307635904', 'Mar 10 1945 12:00AM', 'Colon cancer', 'TASMC GI XELOX + Bevacizumab - Version 1', 'Oct 28 2015 12:30PM', 'Jan  3 2016  1:00PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '30813166', 'Jun 14 1932 12:00AM', 'Colon cancer - Ceacum', 'TASMC GI Xeloda + Bevacizumab - Version 1', 'Jul 22 2018  2:07PM', 'Dec  4 2018  3:40PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '308965862', 'Apr  8 1956 12:00AM', 'Colon cancer - Ceacum', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 2', 'Nov  3 2015  4:29PM', 'Dec 13 2015  3:42PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '310724943', 'Oct 31 1925 12:00AM', 'Colon cancer', 'TASMC GI Rosweel -Park  +AVASTIN - Version 2', 'Apr 18 2016  1:42PM', 'May 17 2016  4:42PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '312764806', 'Oct 18 1954 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Mar 23 2018  7:48PM', 'Mar 26 2018  2:30PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '314121542', 'Dec 12 1929 12:00AM', 'Pulmonary embolism (PE)', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Dec 18 2016 12:40PM', 'Nov 30 2018 12:17AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '319243465', 'Jun 21 1951 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Aug  9 2018  2:23PM', 'Dec  4 2018 12:40PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '321052540', 'Jun 23 1942 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Apr 17 2018  6:15PM', 'Jun  6 2018  9:02PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '321927436', 'Dec 18 1939 12:00AM', 'Colon cancer', 'TASMC GI Xeloda + Bevacizumab - Version 1', 'Aug 13 2018  3:23PM', 'Nov 28 2018  2:47PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '332553288', 'Oct  8 1946 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Jan  8 2018 11:47AM', 'Jun 17 2018  1:22PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '332664762', 'Jun 25 1948 12:00AM', 'Colon cancer', 'TASMC GI Xeloda + Bevacizumab - Version 1', 'Aug  1 2018 11:45AM', 'Oct  4 2018  4:00PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '341016632', 'Jan 22 1948 12:00AM', 'Colon cancer', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'May  3 2017 12:57PM', 'Sep  6 2017 10:08PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '3848082', 'May 23 1931 12:00AM', '', 'TASMC GI Panitumumab (Vectibix) - Version 1', 'Aug  2 2018  1:48PM', 'Aug 16 2018 12:45PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '4112827', 'Nov 15 1926 12:00AM', 'Colon cancer', 'TASMC GI Rosweel -Park  +AVASTIN - Version 3', 'Apr  4 2018 10:09AM', 'May  2 2018  4:15PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '41724881', 'Mar  5 1932 12:00AM', 'Colon cancer', 'TASMC GI Rosweel -Park  +AVASTIN - Version 1', 'Feb 25 2016  1:20PM', 'Feb 25 2016  3:23PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '41886573', 'Nov 24 1948 12:00AM', 'Colon cancer', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'Jan 11 2016  3:04PM', 'Feb 28 2016  7:08PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '42096800', 'Jun 19 1945 12:00AM', 'Colon cancer - Sigmoid colon', 'TASMC GI Rosweel -Park  +AVASTIN - Version 1', 'Jan 17 2016 11:47AM', 'May  1 2016 10:31AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '45979440', 'Jan  1 1950 12:00AM', 'Colon cancer', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'Apr  6 2017  1:20PM', 'Dec 11 2018  2:04PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '47058615', 'Dec 20 1931 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Sep 12 2017  1:00PM', 'Nov 26 2017  2:59PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '48235345', 'Dec 31 1939 12:00AM', 'Colon cancer', 'TASMC GI Rosweel -Park  +AVASTIN - Version 3', 'May 27 2018  5:13PM', 'Jun 19 2018 12:10PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '50006832', 'May  2 1950 12:00AM', 'Colon cancer', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'Nov 17 2015 11:45AM', 'Jan 11 2016  1:51PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '50342401', 'Nov 18 1950 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Oct  1 2017 12:46PM', 'May 13 2018  1:16PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '51728566', 'Dec 18 1952 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Dec  9 2018 10:59AM', 'Dec 11 2018  5:34PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '52114170', 'Jan  1 1954 12:00AM', 'Colon cancer', 'TASMC GI Rosweel -Park  +AVASTIN - Version 2', 'Mar 31 2016  1:50PM', 'Aug  4 2016  3:00PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '5321070', 'Jun 20 1947 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Nov 19 2017  9:58AM', 'Dec  2 2018  6:38PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '54173687', 'Dec 31 1957 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Nov 21 2017 12:01PM', 'Jul 10 2018 11:06AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '54371398', 'Jun 16 1956 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Aug 21 2018  5:00PM', 'Dec  4 2018  8:50PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '54750831', 'Jul 27 1957 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 2', 'Nov  8 2015  4:31PM', 'Apr 17 2016  5:33PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '55193643', 'May 13 1958 12:00AM', 'Ovarian cancer', 'TASMC GI FOLFIRI + Cetuximab - Version 1', 'Mar 27 2016 11:00AM', 'Dec 11 2016  4:13PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '55681860', 'Jan 19 1959 12:00AM', 'Colon cancer', 'TASMC GI Folfiri (out  patient) +Panitumumab - Version 2', 'Feb 16 2016  4:27PM', 'Feb 16 2016  5:33PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '56092026', 'Oct 19 1959 12:00AM', 'Nodular lymphocyte-predominant Hodgkin lymphoma', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Nov 29 2018  2:32PM', 'Nov 29 2018  5:10PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '60475712', 'Jan  1 1940 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 1', 'Nov 22 2015 11:35AM', 'Jan 17 2016  2:35PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '63361240', 'Jan  1 1952 12:00AM', 'Colon cancer - Ascending colon', 'TASMC GI FOLFIRI + Bevacizumab - Version 1', 'Nov  8 2015 11:29AM', 'Dec 20 2015  2:00PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '63731541', 'Jan  1 1950 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Sep 18 2016 11:40AM', 'Sep 18 2016  4:23PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '6391379', 'Aug  7 1939 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'May 25 2016  7:00PM', 'Jul 25 2016 11:32AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '65115651', 'Sep 24 1947 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Aug 24 2018  6:21PM', 'Oct 15 2018  3:23PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '65832651', 'Dec 17 1948 12:00AM', 'Colon cancer', 'TASMC GI De Gramonte + Vectibix - Version 2', 'Nov  3 2015  3:28PM', 'Dec 14 2015  4:09PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '69885531', 'Aug 26 1931 12:00AM', 'Colon cancer', 'TASMC H&N  Carboplatin  + Erbitux + Radiation  therapy - Version 1', 'Sep 27 2016  3:24PM', 'Oct 13 2016  3:30PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '7154685', 'Oct 28 1943 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) + ERBITUX WEEKLY - Version 2', 'Oct 22 2017 12:20PM', 'Oct 29 2018  1:37PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '73998114', 'Jan  1 1928 12:00AM', 'Colon cancer', 'TASMC GI Rosweel -Park  +AVASTIN - Version 1', 'Nov 18 2015  1:34PM', 'Dec 17 2017  3:07PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '7562739', 'Sep 24 1929 12:00AM', 'Colon cancer', 'TASMC GI Panitumumab (Vectibix) - Version 1', 'May 10 2018  2:45PM', 'Dec  2 2018  1:44PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '7740145', 'Aug 21 1937 12:00AM', 'Colon cancer', 'TASMC GI FOLFIRI + Cetuximab - Version 1', 'Nov  8 2015 12:58PM', 'Nov 15 2015 12:15PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '7937295', 'Nov  4 1942 12:00AM', 'Transitional cell carcinoma (TCC) of ureter', 'TASMC GI FOLFIRI+ Panitumumab - Version 1', 'Nov  8 2015  3:30PM', 'Aug 16 2016  1:40PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '8463507', 'Jun  3 1933 12:00AM', 'Transitional cell carcinoma (TCC) of urinary bladder', 'TASMC GI Rosweel -Park  +AVASTIN - Version 3', 'Aug 23 2016 12:45PM', 'Sep 27 2016  3:05PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '8953416', 'Mar  4 1938 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Aug  2 2017  2:17PM', 'Mar  4 2018  1:23PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '901835546', 'Mar  9 1968 12:00AM', 'Colon cancer', 'TASMC BC Xeloda+Avastin - Version 1', 'Nov  3 2015  4:19PM', 'May 31 2016  2:00PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '9933573', 'Aug 21 1945 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Apr  1 2018  1:48PM', 'Oct 28 2018 10:30AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','colon_src'
INSERT INTO #excel_data select '14509707', 'Mar 17 1968 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI stomach  Cisplatin (100) d1 + 5FU (1000) d1-4 CI (in patient) - Version 1', 'Dec  1 2015  2:19PM', 'Dec 26 2015 12:43AM', '', 'TASMC - GI FOLFOX - Inpatient - Version 1', 'Jan 13 2016  5:46PM', 'Jan 31 2016 10:13PM', '', 'TASMC BC Herceptin (HERA trial) - Version 2', 'Feb 25 2016  3:33PM', 'Feb 25 2016  3:33PM', '','gastric_src'
INSERT INTO #excel_data select '22916357', 'Mar  2 1967 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI Folfox 6 (infuser) - Version 3', 'Apr  2 2018 12:15PM', 'Jul  8 2018  1:35PM', '', 'TASMC GI OPDIVO 240mg q 2week - Version 1', 'Sep  2 2018  4:47PM', 'Nov 11 2018 11:06AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '25370982', 'May 14 1973 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI XELOX - Version 1', 'Aug  7 2016  4:30PM', 'Nov 20 2016  4:03PM', '', 'TASMC BC Herceptin  q3w (HERA trial) - Version 2', 'Oct  9 2016  1:16PM', 'Jan  3 2017  2:30PM', '', 'TASMC BC Taxol weekly X12 - Version 2', 'Feb  1 2017  4:12PM', 'Jun 11 2017 12:17PM', '','gastric_src'
INSERT INTO #excel_data select '305977092', 'Feb 15 1954 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Nov 11 2016  7:47PM', 'Nov 11 2016 10:13PM', '', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Nov 24 2016  6:16PM', 'Jan 18 2017  8:22PM', '', 'TASMC Clinical  trial  D081kc00001  MEDI14736(anti  PDL-1) + Olaparib - Version 1', 'Jun  4 2017 12:15PM', 'Jun  4 2017 12:15PM', '','gastric_src'
INSERT INTO #excel_data select '306898628', 'Jun 14 1938 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Jul 18 2017  3:18PM', 'Aug 16 2017  6:25PM', '', 'TASMC BC Herceptin (weekly) - Version 1', 'Jul 24 2017  4:54PM', 'Aug 30 2017  4:10PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '309530640', 'Feb  9 1960 12:00AM', 'Gastric adenocarcinoma', 'TASMC BC Xeloda+Cisplatin - Version 1', 'Nov 15 2015  1:25PM', 'Dec  7 2015  1:38PM', '', 'TASMC BC Taxol (3/4) - Version 1', 'Jan 12 2016 12:37PM', 'Jan 26 2016 11:55AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '309818516', 'Feb  1 1952 12:00AM', 'Leiomyosarcoma', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Aug 10 2018 12:45PM', 'Sep  8 2018  8:00PM', '', 'TASMC GI Stomach/Eosophagus  Cisplatin(25) + 5FU(400)+leucovorin(20) (D1+8 ) q21d - Version 1', 'Oct  2 2018 12:53PM', 'Nov 28 2018  1:35PM', '', 'TASMC GI Esophagus /Stomach  Paciltaxel +Ramucirumab d1+8+15 q28d - Version 3', 'Dec  5 2018  5:47PM', 'Dec 12 2018  1:35PM', '','gastric_src'
INSERT INTO #excel_data select '311797526', 'Jun  1 1946 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Aug 27 2017  2:02PM', 'Jul 13 2018  7:10PM', '', 'TASMC BC Taxotere (3/4) - Version 1', 'Aug  8 2018  3:55PM', 'Aug 26 2018 12:48PM', '', 'TASMC GI Gastric Taxoter + IRINOTECA  d1+d8 q21d - Version 1', 'Sep 12 2018  1:59PM', 'Oct 10 2018 12:25PM', '','gastric_src'
INSERT INTO #excel_data select '317164424', 'Mar  7 1965 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI stomach  Cisplatin (100) d1 + 5FU (1000) d1-4 CI (in patient) - Version 1', 'Jan 14 2018 11:00AM', 'May  3 2018  9:48PM', '', 'TASMC GI FOLFOX - Inpatient - Version 2', 'May 31 2018  1:29PM', 'Jun 14 2018  6:33PM', '', 'TASMC BC Taxol (3/4) - Version 1', 'Jul 25 2018 12:00PM', 'Sep  5 2018  2:00PM', '','gastric_src'
INSERT INTO #excel_data select '317496552', 'Jan 31 1949 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Jul 13 2017  6:50PM', 'Oct  1 2018 11:49AM', '', 'TASMC GI Pancreas  Cisplatin+5FU+LCV - Version 2', 'Nov 21 2018 10:56AM', 'Dec 12 2018  2:22PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '321944878', 'May 15 1932 12:00AM', 'Gastric adenocarcinoma', 'TASMC - GI FOLFOX - Inpatient - Version 1', 'Mar 29 2016  5:25PM', 'Jun 23 2016  8:33PM', '', 'TASMC BC Taxol (3/4) - Version 1', 'Jul 31 2016  5:44PM', 'Jul 31 2016  5:44PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '322189127', 'Jun  3 1966 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Aug  7 2016  3:03PM', 'Feb  5 2017  1:55PM', '', 'TASMC GI FOLFIRI (Infusor) - Version 2', 'Mar 13 2017  9:23AM', 'Apr 25 2017 12:40PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '324710227', 'Apr  1 1968 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Jun 30 2017  2:18PM', 'Dec  6 2017 12:08PM', '', 'TASMC GI De Gramonte(infusor) - Version 2', 'Dec 20 2017 10:55AM', 'Jan 31 2018 11:00AM', '', 'TASMC Cinical trial MK-4280 + Pembrolizumab  Phase1 Gastric Cancer - Version 3', 'Mar 13 2018 10:00AM', 'Sep 17 2018  2:05PM', '','gastric_src'
INSERT INTO #excel_data select '324777986', 'Apr  9 1949 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI - stomac/eosophagus-  Cisplatin( 75) d1  + 5FU(1000)CI d1-5q21d (in patient) - Version 1', 'Jan  6 2016  1:17PM', 'Jan 30 2016  1:29AM', '', 'TASMC BC Herceptin (HERA trial) - Version 2', 'Jan 27 2016 10:00AM', 'Mar 22 2016  4:24PM', '', 'TASMC - GI FOLFOX - Inpatient - Version 1', 'Feb 19 2016  6:18PM', 'Mar 22 2016  9:35PM', '','gastric_src'
INSERT INTO #excel_data select '332507185', 'Apr 11 1949 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Jul 13 2016  7:19PM', 'Jul 29 2016  8:52PM', '', 'TASMC GI Folfox 6 (infuser) - Version 3', 'Aug 14 2016  3:07PM', 'Dec 25 2016  2:38PM', '', 'TASMC GI Folfox 6 (infuser) - Version 3', 'Jan  9 2017  5:47PM', 'Feb  7 2017  9:23PM', '','gastric_src'
INSERT INTO #excel_data select '33482175', 'Dec 20 1976 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI XELOX - Version 1', 'Apr 25 2017  1:05PM', 'Jul 18 2017  1:30PM', '', 'TASMC Clinical Trial  Keytruda 200 - Version 3', 'Sep 13 2017  1:30PM', 'Oct 25 2017 11:46AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '336241336', 'Sep 11 1969 12:00AM', 'Gastric adenocarcinoma', 'TASMC Clinical trial ChekMate 649 Arm 3 Nivolumab+FOLFOX - Version 3', 'Dec  6 2017  2:15PM', 'Sep 25 2018 12:35PM', '', 'TASMC GI FOLFIRI (Inpatient) - Version 1', 'Oct  9 2018  2:25PM', 'Nov 23 2018  7:05PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '345141063', 'Feb  4 1965 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI XELOX - Version 2', 'Jun 10 2018  3:06PM', 'Jul 22 2018 12:30PM', '', 'TASMC GI FOLFIRI (Inpatient) - Version 1', 'Aug 19 2018 11:51AM', 'Sep 28 2018  9:40PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '50288380', 'Nov 10 1950 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Nov  9 2016  6:08PM', 'Apr  7 2017  1:10AM', '', 'TASMC GI Esophagus /Stomach  Paciltaxel +Ramucirumab d1+8+15 q28d - Version 3', 'May 11 2017  2:36PM', 'Jun 26 2017  3:00PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '52277688', 'Apr 30 1954 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI XELOX - Version 2', 'Jan 29 2018  2:00PM', 'Feb 20 2018  3:00PM', '', 'TASMC GI Folfox 6 (infuser) - Version 3', 'Jul  3 2018  3:16PM', 'Nov 28 2018  4:03PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '52290327', 'May 15 1954 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI Folfox 6 (infuser) - Version 3', 'Aug 12 2018  4:20PM', 'Sep 23 2018 12:40PM', '', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Nov  6 2018  5:21PM', 'Nov 13 2018  4:18PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '54371919', 'Jun 29 1956 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI - stomac/eosophagus-  Cisplatin( 75) d1  + 5FU(1000)CI d1-5q21d (in patient) - Version 1', 'Dec  4 2015 11:48AM', 'Jul 20 2016  9:47AM', '', 'TASMC GI De Gramont (Inpatient) - Version 1', 'Jul 26 2016  3:40PM', 'Nov 29 2016 12:13PM', '', 'TASMC GI Esophagus/Stomach  Cisplatin(100) + 5FU cont  (out-patient) - Version 2', 'Feb 13 2017 12:00PM', 'Mar  5 2017  3:23PM', '','gastric_src'
INSERT INTO #excel_data select '56654833', 'Jul 11 1961 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Nov 30 2017  2:16PM', 'Apr 29 2018  2:42PM', '', 'TASMC GI Esophagus /Stomach  Paciltaxel +Ramucirumab d1+8+15 q28d - Version 3', 'May 31 2018 12:16PM', 'Jul 12 2018  1:45PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '57232704', 'Apr  9 1962 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI weekly Cis+5FU+Herceptin - Version 1', 'Feb 11 2016  1:30PM', 'Dec  8 2016  4:52PM', '', 'TASMC BC Taxol (175)&Herceptin  (q3weeks) - Version 2', 'Jan 12 2017  2:48PM', 'Dec  6 2018  3:22PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '57820847', 'Jun 12 1964 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI stomach  Cisplatin (100) d1 + 5FU (1000) d1-4 CI (in patient) - Version 1', 'Jan 28 2016 11:30AM', 'Mar 30 2016  8:39PM', '', 'TASMC BC Taxol (3/4) - Version 1', 'May  8 2016  3:58PM', 'Jun 15 2016  2:30PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '61881652', 'Jan  1 1950 12:00AM', 'Gastric adenocarcinoma', 'TASMC - GI FOLFOX - Inpatient - Version 1', 'Mar 27 2016  2:25PM', 'Aug  7 2016  8:53PM', '', 'TASMC GI De Gramonte(infusor) - Version 2', 'Sep 11 2016  3:40PM', 'Aug  6 2017  3:38PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '64866304', 'Mar 28 1956 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI FOLFOX - Inpatient - Version 2', 'May  3 2017  2:34PM', 'Aug 31 2017  5:00PM', '', 'TASMC GI Esophagus /Stomach  Paciltaxel +Ramucirumab d1+8+15 q28d - Version 3', 'Sep 28 2017  1:21PM', 'Nov  9 2017  2:52PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '66698846', 'Nov 16 1984 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Mar 31 2017 12:42PM', 'May  4 2017  6:00PM', '', 'TASMC GI FOLFIRI (Inpatient) - Version 1', 'May 18 2017  6:25PM', 'May 19 2017  7:27PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '68216688', 'Jan  1 1952 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI stomach  Cisplatin (100) d1 + 5FU (1000) d1-4 CI (in patient) - Version 1', 'Feb 24 2016  1:12AM', 'Feb 27 2016 12:20PM', '', 'TASMC - GI FOLFOX - Inpatient - Version 1', 'Mar 20 2016  8:18PM', 'Mar 20 2016 10:57PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '8353872', 'Nov 12 1948 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Oct 19 2018  7:23PM', 'Oct 19 2018 10:45PM', '', 'TASMC GI Folfox 6 (infuser) - Version 3', 'Nov  4 2018 11:08AM', 'Dec  2 2018  1:47PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '17498213', 'Jul 10 1938 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Apr 17 2018 12:29PM', 'Jun  8 2018 11:25PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '302102850', 'Jul  1 1962 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI stomach  Cisplatin (100) d1 + 5FU (1000) d1-4 CI (in patient) - Version 1', 'Dec 14 2017  9:09PM', 'Mar 20 2018  1:05AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '30532691', 'Feb  8 1949 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Aug 17 2018  2:34PM', 'Aug 17 2018  5:20PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '30583041', 'Nov 12 1949 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Sep 26 2018  5:20PM', 'Nov 25 2018 12:22PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '309345213', 'Jan  1 1964 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Oct 22 2018  3:23PM', 'Dec 10 2018  3:22PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '314032616', 'Nov 15 1936 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI FOLFOX - Inpatient - Version 2', 'May  7 2017  2:50PM', 'Jun 19 2017  6:02PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '320854540', 'Jul 24 1970 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Jun 13 2017  6:44PM', 'Aug 30 2017  7:45PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '32226243', 'Jun  4 1975 12:00AM', 'Gastric adenocarcinoma', 'TASMC Clinical trial ChekMate 649 Arm 3 Nivolumab+FOLFOX - Version 2', 'Nov 28 2017  1:45PM', 'Dec 10 2018  3:10PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '323716449', 'Nov  5 1953 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Apr  9 2018  4:41PM', 'Apr  9 2018  7:50PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '326843232', 'Oct  8 1937 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Aug 22 2017  4:14PM', 'Nov 20 2017  1:00PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '332478627', 'Apr 27 1953 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Nov 20 2018 12:41PM', 'Dec  5 2018  1:09PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '3401528', 'Oct 17 1946 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI FOLFOX-6 modified (infusor) +  AVASTIN - Version 3', 'Aug 28 2018 12:50PM', 'Dec 11 2018 11:05AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '342603156', 'Mar  1 1944 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI Esophagus/Stomac Cisplatin( 75) d1  + 5FU(1000)CI d1-5q21d (in patient) - Version 2', 'Oct 10 2018  4:40PM', 'Nov 30 2018  6:00PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '42225573', 'Jan  1 1943 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Jun  3 2018  3:57PM', 'Jun 18 2018  4:20PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '42909226', 'Jan  1 1935 12:00AM', 'Gastric adenocarcinoma', 'TASMC - GI FOLFOX - Inpatient - Version 1', 'Jan 24 2016  9:42PM', 'May 24 2016  3:06PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '50233816', 'Aug 16 1950 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI Folfox 6 (infuser) - Version 3', 'Aug 20 2018  1:40PM', 'Nov 18 2018  1:55PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '50843713', 'Aug 18 1951 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Jul 13 2017  4:30PM', 'Jul 13 2017  4:30PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '51733863', 'Feb 24 1953 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI FOLFOX +HERCEPTIN - Version 1', 'Apr 22 2018  2:29PM', 'Nov 27 2018  6:33PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '54530928', 'Oct 12 1956 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI stomach  Cisplatin (100) d1 + 5FU (1000) d1-4 CI (in patient) - Version 1', 'Jul  2 2017  5:41PM', 'Aug 17 2017  4:59PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '62571856', 'Jun 18 1955 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Nov  8 2018  6:04PM', 'Nov  8 2018  8:45PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '65015026', 'Jan  1 1944 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI weekly Cis+5FU+Herceptin - Version 1', 'Oct 26 2015 12:09PM', 'Dec 30 2015  4:45PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '67312264', 'Mar 17 1950 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Jul 10 2017  3:39PM', 'Aug 14 2017  9:10PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '69678647', 'Feb 23 1942 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Jul 22 2018  2:15PM', 'Aug  7 2018  2:05AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '72830243', 'Oct 26 1946 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI FOLFOX +HERCEPTIN - Version 1', 'Apr 23 2018  4:30PM', 'Oct 22 2018  8:10PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '9437369', 'Apr 24 1946 12:00AM', 'Gastric adenocarcinoma', 'TASMC GI Esophagus/Stomac Cisplatin( 75) d1  + 5FU(1000)CI d1-5q21d (in patient) - Version 2', 'Oct 21 2018  1:09PM', 'Nov 24 2018  1:20AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','gastric_src'
INSERT INTO #excel_data select '12248126', 'Sep 10 1956 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI Cisplatin(25) + Gemzar (1000) D1+8 q21d - Version 1', 'May  6 2018  3:25PM', 'May 13 2018  5:33PM', '', 'TASMC  GI/LUNG/all KEYTRUDA  200mg q21d - Version 1', 'Jun  6 2018  4:00PM', 'Jun  6 2018  4:00PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '12655387', 'Feb  4 1953 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI/GYN Gemzar+Cisplatin (d1+8) - Version 1', 'Nov  5 2015 10:31AM', 'Feb 17 2016 11:15AM', '', 'TASMC GI FOLFIRI (Infusor) - Version 1', 'Apr 11 2016 11:15AM', 'Jul 10 2016  1:32PM', '', 'TASMC GI FOLFIRI (Infusor) - Version 2', 'Sep 12 2016 10:55AM', 'May 28 2017  3:00PM', '','cholangio_src'
INSERT INTO #excel_data select '16015364', 'Jan  1 1958 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI GEMOX - Version 1', 'Mar 28 2016  2:36PM', 'May 19 2016  2:00PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '17521261', 'Dec  8 1964 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI GEMOX - Version 1', 'Jul 30 2018  4:30PM', 'Nov 19 2018  2:44PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '28120780', 'Apr 16 1971 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI Gemzar  3/4 - Version 1', 'Apr 19 2016 12:21PM', 'Sep 20 2016  1:30PM', '', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Oct 15 2017 11:41AM', 'Feb 18 2018  4:30PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '30459911', 'Jan 17 1950 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI GEMOX - Version 1', 'May 30 2017 10:12AM', 'Oct 30 2017 11:02AM', '', 'TASMC GI FOLFIRI (Inpatient) - Version 1', 'Nov 28 2017  7:32PM', 'Jan 11 2018  8:32PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '306080896', 'Jun  2 1945 12:00AM', '', 'TASMC GI Gemzar  3/4 - Version 1', 'Aug  1 2018  2:15PM', 'Nov 15 2018  4:08PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '306343005', 'Nov 10 1958 12:00AM', 'Meningioma', 'TASMC GI GEMOX - Version 1', 'Feb 26 2017  4:16PM', 'May 24 2017  1:29PM', '', 'TASMC GI Gemzar  3/4 - Version 1', 'Jun  7 2017 10:41AM', 'Jan  9 2018 10:21AM', '', 'TASMC BC Gemzar+Carboplatin AUC 2 - Version 1', 'Feb 15 2018  9:52AM', 'Mar 21 2018 10:00AM', '','cholangio_src'
INSERT INTO #excel_data select '306665969', 'Aug 23 1946 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI GEMOX - Version 1', 'Apr  8 2016  5:49PM', 'Nov  2 2016  3:18PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '306861360', 'Jul 22 1951 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI GEMOX - Version 1', 'Mar 28 2018 12:32PM', 'Jun  6 2018  3:10PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '307316315', 'Aug  3 1948 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI GEMOX - Version 1', 'Mar 14 2016  2:58PM', 'May 29 2016  3:00PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '307616151', 'Dec  2 1970 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC BC Gemzar+Cisplatin - Version 1', 'Jul  3 2018 11:30AM', 'Dec  4 2018  2:56PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '314128075', 'May 21 1954 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC AREDIA - Version 4', 'Aug  1 2016  1:57PM', 'Nov  2 2016  3:05PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '314440603', 'Nov 19 1973 12:00AM', 'Colon cancer', 'TASMC GI FOLFOX (Infusor) - Version 1', 'Jan  4 2016  1:31PM', 'Apr 18 2016  3:41PM', '', 'TASMC GI  Irinotecan +Gemzar - Version 1', 'Jun 22 2016  3:46PM', 'Aug 25 2016  1:15PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '316760396', 'Feb 27 1947 12:00AM', 'Ovarian cancer', 'TASMC GI - pancreas  Gemzar(800) + cisplatin modified - Version 1', 'Jun  8 2016  2:33PM', 'Mar 22 2017  4:40PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '316922814', 'Feb 23 1926 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI Gemzar  3/4 - Version 1', 'Apr 24 2017  4:21PM', 'Aug 10 2017 11:42AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '321308678', 'Jun 26 1958 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI GEMOX - Version 1', 'Jun  2 2016 10:20AM', 'Aug 24 2016  1:37PM', '', 'TASMC GI FOLFIRI (Inpatient) - Version 1', 'Nov 11 2016  4:38PM', 'Dec 30 2016  6:40PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '322079807', 'Oct 28 1940 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI biliary  tract  Gemzar D1+8+15 q28d - Version 1', 'May 15 2016 10:20AM', 'Dec  3 2017  2:07PM', '', 'TASMC GI biliary  tract  Gemzar D1+8+15 q28d - Version 1', 'Jul 25 2018  1:32PM', 'Nov 21 2018 11:01AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '323267591', 'Jun 28 1942 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI GEMOX - Version 1', 'Mar  9 2017  2:57PM', 'Mar 23 2017 11:34AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '323804211', 'Mar  2 1948 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI biliary  tract  Gemzar D1+8+15 q28d - Version 1', 'Feb  7 2017 10:24AM', 'Aug 27 2017  2:22PM', '', 'TASMC GI GEMOX - Version 1', 'Jan 10 2018  2:00PM', 'Mar 13 2018  2:00PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '324484930', 'Jun  8 1938 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI GEMOX - Version 1', 'May 13 2018  3:54PM', 'Dec  2 2018 12:23PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '324700186', 'Jan 12 1971 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Mar 16 2017 12:05PM', 'Mar 23 2017  5:33PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '327224523', 'Jun 22 1966 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC BC Gemzar+Cisplatin - Version 1', 'Nov  8 2015  1:33PM', 'Jun 14 2016  5:00PM', '', 'TASMC GI FOLFIRI (Inpatient) - Version 1', 'Aug 14 2016  4:06PM', 'Aug 14 2016  4:07PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '332734417', 'Mar 29 1945 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI biliary  tract  Gemzar D1+8+15 q28d - Version 1', 'Jun 28 2016  2:14PM', 'Jun 28 2016  2:14PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '332751726', 'May 17 1963 12:00AM', 'Adenocarcinoma of unknown primary site', 'TASMC AREDIA - Version 4', 'Jun 14 2018  3:17PM', 'Oct 15 2018 12:52PM', '', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Jul 19 2018  5:30PM', 'Jul 19 2018  5:30PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '35353853', 'Jan  1 1948 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI Cisplatin(25) + Gemzar (1000) D1+8 q21d - Version 1', 'Nov  8 2017 11:46AM', 'Mar 21 2018 12:47PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '37515020', 'Sep 26 1975 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI biliary  tract  Gemzar D1+8+15 q28d - Version 1', 'Oct 29 2017  5:11PM', 'May  7 2018  9:53AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '41412958', 'May 15 1946 12:00AM', '', 'TASMC GI Cisplatin(25) + Gemzar (1000) D1+8 q21d - Version 1', 'May 24 2018 11:30AM', 'Dec  6 2018 12:00PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '41459843', 'Jan  1 1939 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI Gemzar  3/4 - Version 1', 'May 10 2016 10:30AM', 'Jun 21 2016 12:03PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '42160267', 'Jan  1 1945 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI Cisplatin(25) + Gemzar (1000) D1+8 q21d - Version 1', 'Jan 15 2018 11:00AM', 'May 24 2018 11:30AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '42374694', 'Apr  1 1945 12:00AM', 'Squamous cell carcinoma of lung', 'TASMC GYN/BC Taxol (80)+Carbo (AUC2) 3/4 - Version 1', 'Aug 23 2017 12:10PM', 'Nov  5 2017 12:42PM', '', 'TASMC BC Navelbine 30mg d1+8 q21d IV - Version 1', 'Jan 22 2018 11:15AM', 'Jan 22 2018 11:15AM', '', 'TASMC NSCLC DURVALUMAB 10mg  /kg  q2week - Version 1', 'Jun 13 2018  1:40PM', 'Nov  1 2018  1:03PM', '','cholangio_src'
INSERT INTO #excel_data select '42610915', 'Jan  3 1948 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI GEMOX - Version 1', 'Feb 22 2018 12:20PM', 'Dec  6 2018  2:55PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '43187848', 'Sep 27 1981 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI XELOX - Version 2', 'Jun 14 2018 11:23AM', 'Oct  8 2018  1:39PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '4762894', 'Jan  1 1943 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI Cisplatin(25) + Gemzar (1000) D1+8 q21d - Version 1', 'Nov  8 2018  5:20PM', 'Dec 12 2018  2:58PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '50072222', 'Jul 15 1950 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI GEMOX - Version 1', 'Nov  5 2015 10:50PM', 'Jan 26 2016  2:05PM', '', 'TASMC GI Gemzar  3/4 - Version 1', 'Feb  8 2016 10:22AM', 'Dec 27 2016 10:06AM', '', 'TASMC GI GEMOX - Version 1', 'Feb 13 2018 11:13AM', 'Dec  3 2018 12:10PM', '','cholangio_src'
INSERT INTO #excel_data select '50232495', 'Jul 24 1950 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI GEMOX - Version 1', 'Jan  4 2017 10:13PM', 'Apr 19 2017 10:52AM', '', 'TASMC GI FOLFIRI (Infusor) - Version 2', 'May 14 2017 12:09PM', 'Nov 10 2017  3:39PM', '', 'TASMC BC Taxol weekly X12 - Version 2', 'Feb  1 2018 10:00AM', 'Apr  8 2018  4:21PM', '','cholangio_src'
INSERT INTO #excel_data select '50387687', 'Nov 10 1950 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI/GYN Gemzar+Cisplatin (d1+8) - Version 1', 'Feb 21 2017 11:15AM', 'Nov  7 2017  2:00PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '50606581', 'May 17 1951 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI GEMOX - Version 1', 'Feb 21 2017 11:00AM', 'Apr 30 2018  1:00PM', '', 'TASMC GI FOLFIRI (Inpatient) - Version 1', 'Sep 28 2018  5:41PM', 'Dec  2 2018  5:00PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '51050417', 'Aug 10 1951 12:00AM', 'Cervix uteri – Squamous', 'TASMC GI Cisplatin(25) + Gemzar (1000) D1+8 q21d - Version 1', 'Aug 15 2018  3:35PM', 'Dec 12 2018  3:26PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '51447068', 'Nov 27 1952 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI GEMOX - Version 1', 'Sep 16 2018 12:00PM', 'Nov 18 2018 12:45PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '51827756', 'Feb 10 1953 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI Cisplatin(25) + Gemzar (1000) D1+8 q21d - Version 1', 'Oct 22 2018 11:00AM', 'Nov 20 2018  4:28PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '52016250', 'Aug  1 1953 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI GEMOX - Version 1', 'May 14 2018  5:49PM', 'May 14 2018  8:42PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '53375937', 'Mar 11 1955 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI/GYN Gemzar+Cisplatin (d1+8) - Version 1', 'Aug  2 2018 10:19AM', 'Dec 12 2018  1:42PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '54094016', 'Aug  8 1956 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI GEMOX - Version 1', 'Sep 27 2016 11:02AM', 'Feb  2 2017 12:52PM', '', 'TASMC GI FOLFIRI (Infusor) - Version 2', 'Apr 26 2017  1:33PM', 'May 10 2017 10:16PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '54608542', 'Dec  9 1957 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI Cisplatin(25) + Gemzar (1000) D1+8 q21d - Version 1', 'Apr 11 2018  3:00PM', 'Aug 13 2018 12:57PM', '', 'TASMC GI FOLFIRI (Inpatient) - Version 1', 'Sep 17 2018  8:00PM', 'Oct 18 2018  4:34PM', '', 'TASMC GI FOLFIRI (Infusor) - Version 2', 'Oct 31 2018  2:56PM', 'Oct 31 2018  5:05PM', '','cholangio_src'
INSERT INTO #excel_data select '54747530', 'May 24 1957 12:00AM', 'DIFFUSE LARGE B-CELL LYMPHOMA (DLBCL), NOS', 'TASMC GI GEMOX - Version 1', 'Feb  7 2016 12:42PM', 'Feb 21 2016  4:30PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '55498968', 'Oct 16 1958 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC BC Gemzar+Carboplatin AUC 2 - Version 1', 'Jul  6 2017  3:53PM', 'Aug  9 2017  5:50PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '56661655', 'Oct  9 1960 12:00AM', 'Breast cancer', 'TASMC BC Gemzar+Cisplatin - Version 1', 'May  8 2017  3:23PM', 'Oct  1 2017  1:06PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '57675571', 'Aug 20 1962 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI GEMOX - Version 1', 'Oct 28 2015  2:59PM', 'Nov 11 2015  5:14PM', '', 'TASMC GI GEMOX - Version 1', 'Nov 25 2015  3:40PM', 'Jan 20 2016  3:40PM', '', 'TASMC GI FOLFIRI (Inpatient) - Version 1', 'Feb 10 2016  4:34PM', 'Mar 27 2016 11:15AM', '','cholangio_src'
INSERT INTO #excel_data select '59069997', 'Oct 19 1964 12:00AM', '', 'TASMC H&N  Carboplatin  + Erbitux + Radiation  therapy - Version 1', 'Feb 21 2018 11:03AM', 'Nov 28 2018 10:11AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '62655345', 'Jan  1 1946 12:00AM', 'Breast cancer', 'TASMC GI Cisplatin(25) + Gemzar (1000) D1+8 q21d - Version 1', 'Apr  2 2018 12:18PM', 'May  1 2018  1:00PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '64097165', 'Jul 28 1939 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI GEMOX - Version 1', 'Nov 20 2015  4:10PM', 'Dec 18 2015  1:08PM', '', 'TASMC GI Gemzar  3/4 - Version 1', 'Dec 31 2015 10:30AM', 'Mar 10 2016 11:54AM', '', 'TASMC BC Gemzar+Cisplatin - Version 1', 'Mar 23 2016 11:10AM', 'Apr 21 2016  2:30PM', '','cholangio_src'
INSERT INTO #excel_data select '64342306', 'Jul  3 1950 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI Gemzar(800)+Cisplatin 25 (d1+8)q21d  modified - Version 1', 'Jul 17 2018  2:20PM', 'Dec 10 2018  5:05PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '65932873', 'Feb  2 1984 12:00AM', 'Vertebral metastases', 'TASMC GI GEMOX - Version 1', 'Dec 19 2017  5:40PM', 'Feb 18 2018  4:15PM', '', 'TASMC GI FOLFIRI (Inpatient) - Version 1', 'Jul  9 2018  9:10PM', 'Jul  9 2018 11:30PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '67380352', 'Feb 19 1950 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI biliary  tract  Gemzar D1+8+15 q28d - Version 1', 'Nov  1 2016 11:28AM', 'Apr  4 2017  1:00PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '67594622', 'Jan  1 1942 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI GEMOX - Version 1', 'Jun 21 2017  1:19PM', 'Feb 19 2018  1:52PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '67651331', 'Jan  2 1956 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI GEMOX - Version 1', 'Nov  4 2015  2:00PM', 'Dec 27 2015  1:50PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '67788299', 'Jan  1 1955 12:00AM', 'Breast cancer', 'TASMC GI  cisplatin  (25)+gemzar (1000)  D1+8 q21d - Version 1', 'Apr 19 2016  3:02PM', 'Jun 23 2016  2:36PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '69135689', 'Mar 20 1948 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI GEMOX - Version 1', 'Nov  1 2015  4:58PM', 'Feb  7 2016  1:52PM', '', 'TASMC GI FOLFIRI (Inpatient) - Version 1', 'Mar 20 2016  2:02PM', 'Apr 17 2016 10:48PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '6937155', 'Jun 30 1947 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI GEMOX - Version 1', 'Oct 18 2017  3:02PM', 'Mar 25 2018  5:32PM', '', 'TASMC GI FOLFIRI (Inpatient) - Version 1', 'Aug 26 2018  2:39PM', 'Sep 13 2018  6:58PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '69659472', 'Aug  4 1955 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI Gemzar  3/4 - Version 1', 'Jan 17 2017 12:20PM', 'Jun 20 2017 11:04AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '70106737', 'Jan  1 1947 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI biliary  tract  Gemzar D1+8+15 q28d - Version 1', 'Jan  5 2017  1:30PM', 'May 21 2017  4:15PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '7022072', 'Feb  7 1934 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI Cisplatin(25) + Gemzar (1000) D1+8 q21d - Version 1', 'Sep  7 2017  3:06PM', 'Sep  7 2017  4:07PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '7437114', 'Feb 29 1936 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI Gemzar  3/4 - Version 1', 'May 24 2016 11:56AM', 'Feb 12 2017  3:00PM', '', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Mar 26 2017  8:37PM', 'Jul 15 2017 12:32AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '76352731', 'Jan  1 1950 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI - pancreas  Gemzar(800) + cisplatin modified - Version 1', 'Apr  3 2016  3:15PM', 'Jan 30 2017  5:15PM', '', 'TASMC GI FOLFIRI (Inpatient) - Version 1', 'Mar  9 2017  4:12PM', 'May 10 2017  2:10PM', '', 'TASMC GI - pancreas  Gemzar(800) + cisplatin modified - Version 1', 'Apr  3 2016  3:15PM', 'Jan 30 2017  5:15PM', '','cholangio_src'
INSERT INTO #excel_data select '76564830', 'Jun 15 1945 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC BC Gemzar+Cisplatin - Version 1', 'Jun 28 2018  1:30PM', 'Sep  6 2018  8:50PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '7887987', 'Aug  3 1940 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI Gemzar  3/4 - Version 1', 'Jan  9 2018 11:30AM', 'Jun 25 2018  1:00PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', 'TASMC GI Pancreas  Cisplatin+5FU+LCV - Version 2', 'Aug  7 2018 10:00AM', 'Sep 23 2018  9:55AM', '','cholangio_src'
INSERT INTO #excel_data select '78955838', 'Jan  1 1945 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI  cisplatin  (25)+gemzar (1000)  D1+8 q21d - Version 1', 'May 26 2016 12:30PM', 'Feb  8 2017  3:16PM', '', 'TASMC GI FOLFIRI (Inpatient) - Version 1', 'Mar 10 2017  5:06PM', 'Apr 16 2017  2:49PM', '', 'TASMC BC Taxol (3/4) - Version 1', 'Jun  7 2017  3:12PM', 'Aug 23 2017  1:50PM', '','cholangio_src'
INSERT INTO #excel_data select '7952831', 'Oct  6 1944 12:00AM', 'Hepatocellular-cholangiocarcinoma', 'TASMC GI/GYN Gemzar+Cisplatin (d1+8) - Version 1', 'May 15 2017 11:00AM', 'May 22 2017 12:58PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '8398372', 'Sep 23 1949 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI Cisplatin(25) + Gemzar (1000) D1+8 q21d - Version 1', 'May 28 2018  2:41PM', 'May 28 2018  4:00PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '8427437', 'Jan 19 1940 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI Cisplatin(25) + Gemzar (1000) D1+8 q21d - Version 1', 'Feb 28 2017 10:28AM', 'Apr  9 2017 11:00AM', '', 'TASMC GI Gemzar  3/4 - Version 1', 'May  9 2017  9:42AM', 'May 16 2017  9:11AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '8841322', 'May 14 1940 12:00AM', 'Hepatocellular-cholangiocarcinoma', 'TASMC GI biliary  tract  Gemzar D1+8+15 q28d - Version 1', 'Oct 27 2015  1:30PM', 'Jan 19 2016  2:23PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '9741992', 'Sep 14 1938 12:00AM', 'Hepatocellular-cholangiocarcinoma', 'TASMC GI GEMOX - Version 1', 'May  8 2018 10:48AM', 'Jul 17 2018 11:00AM', '', 'Clinical Trial MK-4830 - Version 2', 'Oct  7 2018  2:16PM', 'Oct 29 2018  1:55PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '9779844', 'Aug 16 1945 12:00AM', 'Cholangiocarcinoma (CC)', 'TASMC GI Gemzar  3/4 - Version 1', 'Jan 17 2018  3:00PM', 'Mar 12 2018  2:47PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','cholangio_src'
INSERT INTO #excel_data select '900324', 'Jan  1 1940 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Sep  3 2017 11:00AM', 'Jun 11 2018  3:20PM', '', 'TASMC  GI/LUNG/all KEYTRUDA  200mg q21d - Version 1', 'Oct 28 2018 12:00PM', 'Nov 19 2018  7:55AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '980649', 'Dec  6 1945 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jun 23 2016  5:23PM', 'Jun 23 2016  8:15PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '1130939', 'Jul  1 1932 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'May 18 2016 12:00AM', 'Jul 21 2016 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '1353788', 'May 30 1949 12:00AM', 'pancreatic cancer', 'TASMC GI Panceras FOLFIRINOX - Version 4', 'Aug 21 2018  1:33PM', 'Sep 20 2018  8:30PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '1397710', 'Jan 12 1949 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jan 17 2018  4:19PM', 'Nov  6 2018  3:00PM', '', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'May 28 2018  1:00PM', 'Sep 27 2018  1:15PM', '', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Dec  3 2018  6:13PM', 'Dec  3 2018  8:32PM', '','lung or pancreas'
INSERT INTO #excel_data select '1885094', 'Dec 30 1930 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Alimta - Version 1', 'May  8 2017 10:03AM', 'Jun  5 2017 10:39AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '3130481', 'Apr  6 1948 12:00AM', 'pancreatic cancer', 'TASMC Clinical Trial  HALO-109-301  ABRAXAN  + GEMZAR +PEGPH20/placebo q28d - Version 1', 'Nov 13 2017 12:00PM', 'Nov  5 2018  2:40PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '3194602', 'Jun  9 1944 12:00AM', 'pancreatic cancer', 'TASMC GI - Pancreas Folfirinox 80% - Version 1', 'May 10 2016  6:28PM', 'May  3 2017  4:37PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '3237781', 'Dec  6 1946 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'May 10 2018 12:00AM', 'May 28 2018 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '3268844', 'Nov  5 1942 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Apr  6 2016  4:30PM', 'May  5 2016 11:48PM', '', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Jun 29 2016  2:09PM', 'Nov  6 2016 12:37PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '3838125', 'Aug  4 1949 12:00AM', 'adenocarcinoma of lung', 'TASMC  GI/LUNG/all KEYTRUDA  200mg q21d - Version 1', 'Jan 16 2018 10:00AM', 'Apr 17 2018 12:02PM', '', 'TASMC AREDIA - Version 4', 'Jan  4 2018  3:12PM', 'Apr 17 2018 10:06AM', '', 'TASMC GYN/BC Taxol (80)+Carbo (AUC2) 3/4 - Version 1', 'Apr 23 2018  4:58PM', 'Jun 27 2018  1:30PM', '','lung or pancreas'
INSERT INTO #excel_data select '4414850', 'Jan  1 1941 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Apr 17 2016 12:00AM', 'Jul 18 2016 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '4497723', 'Jan  1 1948 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Nov 19 2017 12:00AM', 'Mar  8 2018 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '4735387', 'Jan  1 1937 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jun 27 2016  2:22PM', 'Sep  5 2016 12:36PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '4741724', 'Oct  5 1942 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Nov  1 2015  4:20PM', 'Dec 24 2015  4:15PM', '', 'TASMC NSCLC Alimta+Avastin+Zomera - Version 1', 'Jan 27 2016  2:30PM', 'Jun 15 2016 12:30PM', '', 'TASMC ZOMERA - Version 2', 'Jul  6 2016 11:05AM', 'Oct 24 2018 12:00PM', '','lung or pancreas'
INSERT INTO #excel_data select '4890406', 'Apr 11 1946 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Alimta - Version 1', 'Jun 23 2016 12:15PM', 'Jun 23 2016 12:15PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '5079165', 'Mar 25 1947 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Feb 11 2016  5:53PM', 'Jun 15 2016  8:05PM', '', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Jul 11 2016  5:20PM', 'Jul 18 2016  4:05PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '5367750', 'Feb  7 1950 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jul 23 2017  1:54PM', 'Sep 15 2017  5:32PM', '', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Dec 21 2017  3:00PM', 'Jan 29 2018 12:30PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '5394911', 'Aug 21 1945 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Apr 21 2017 11:56AM', 'Jun  9 2017  6:00PM', '', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Jul 10 2017  4:12PM', 'Jul 26 2017  4:25PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '6963219', 'Apr 28 1948 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  Cisplatin + alimta + avastin - Version 2', 'Dec 17 2017 12:00PM', 'Nov 18 2018 11:29AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '7036056', 'Nov 14 1942 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Jul 25 2017 11:38AM', 'Nov 15 2017  2:46PM', '', 'TASMC ZOMERA - Version 2', 'Dec  5 2017  1:30PM', 'Mar 13 2018 12:07PM', '', 'TASMC NSCLC Alimta+Avastin  maintenence - Version 2', 'Dec  5 2017  1:08PM', 'Dec  5 2017  1:08PM', '','lung or pancreas'
INSERT INTO #excel_data select '7147515', 'Oct 19 1934 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Alimta - Version 1', 'Nov  7 2018 12:00AM', 'Nov 28 2018 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '7157837', 'May 17 1948 12:00AM', 'pancreatic cancer', 'TASMC GI Pancras  FOLFIRINOX modified (Inpatient) - Version 2', 'Nov  8 2015  6:17PM', 'Nov 24 2015 10:32PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '7199516', 'Mar  1 1947 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Cis+Alimta+Avastin - Version 1', 'Feb  4 2016 10:57AM', 'May 23 2016  4:20PM', '', 'TASMC NSCLC Alimta - Version 1', 'Jun 20 2016 12:25PM', 'Jun 20 2016 12:25PM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Aug 29 2016  9:48AM', 'Sep 12 2016  2:00PM', '','lung or pancreas'
INSERT INTO #excel_data select '7432594', 'Jul  5 1949 12:00AM', 'adenocarcinoma of lung', 'TASMC  GI/LUNG/all KEYTRUDA  200mg q21d - Version 1', 'Apr  6 2017 11:08AM', 'Jul 17 2017  2:04PM', '', 'TASMC Denosumab - Version 1', 'Apr  6 2017  2:17PM', 'Nov 22 2018 10:55AM', '', 'TASMC  GI/LUNG/all KEYTRUDA  200mg q21d - Version 1', 'Aug 29 2017  1:00PM', 'Sep 19 2017  9:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '7570864', 'Oct 10 1939 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Feb  8 2018  2:28PM', 'Apr 17 2018 12:51PM', '', 'TASMC ZOMERA - Version 2', 'Feb  8 2018  2:03PM', 'Jun 27 2018 12:45PM', '', 'TASMC  GU   ATEZOLIZUMAB - Version 1', 'Jun  6 2018  2:11PM', 'Jul 18 2018  2:03PM', '','lung or pancreas'
INSERT INTO #excel_data select '7635675', 'May  7 1946 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Alimta - Version 1', 'Nov 14 2016 12:00AM', 'Nov 14 2016 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '7857410', 'Oct  5 1947 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Apr 23 2018 12:00AM', 'Sep 25 2018 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '7889595', 'Dec 16 1936 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Nov  8 2015  3:39PM', 'Aug  2 2016  2:20PM', '', 'TASMC GYN Gemzar 850 +Carboplatin (AUC5) - Version 1', 'Oct 16 2016 10:20AM', 'Jun 18 2017  1:10PM', '', 'TASMC NSCLC Carbo+Gemzar - Version 1', 'Jul 11 2017  1:00PM', 'Sep  3 2017 11:40AM', '','lung or pancreas'
INSERT INTO #excel_data select '8143901', 'Jun 23 1946 12:00AM', 'pancreatic cancer', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Jul  4 2018  1:50PM', 'Jul  4 2018  4:15PM', '', 'TASMC GI Panceras FOLFIRINOX - Version 4', 'Jul 20 2018 12:40PM', 'Aug 22 2018 12:31PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '8174641', 'Nov 11 1935 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Cis+Alimta+Avastin - Version 1', 'Nov  2 2015  3:14PM', 'Jan  4 2016 10:28AM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Feb 11 2016 10:45AM', 'Jan 22 2018  2:00PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '8362568', 'May 17 1936 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Oct 29 2015 12:00AM', 'Oct 29 2015 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '8452765', 'Dec  5 1949 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  Cisplatin + alimta + avastin - Version 2', 'Nov 15 2017 12:00AM', 'Feb 28 2018 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '8827115', 'Mar 22 1947 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Apr 17 2016  1:05PM', 'Jun 12 2016  9:11PM', '', 'TASMC GI Gemzar  3/4 - Version 1', 'Jul 25 2016  1:50PM', 'Jul 25 2016  1:50PM', '', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Aug  8 2016  4:15PM', 'Apr 23 2017  2:00PM', '','lung or pancreas'
INSERT INTO #excel_data select '9709700', 'Feb 10 1931 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Nov 18 2015  1:31PM', 'Jun  1 2016  2:27PM', '', 'TASMC NSCLC Alimta - Version 1', 'Jun 28 2016  1:18PM', 'Aug  9 2016  4:55PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '9814641', 'Jan 13 1948 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Feb 12 2017  2:29PM', 'Apr 24 2017  1:20AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '10080281', 'Jan  1 1938 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Nov  1 2015  3:17PM', 'Jan  5 2016  3:35PM', '', 'TASMC NSCLC Alimta - Version 1', 'Feb 22 2016 11:35AM', 'Mar 17 2016  2:10PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '10210193', 'Oct 24 1948 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Apr 30 2018  8:06PM', 'May 14 2018  8:00PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '10225514', 'Mar  5 1950 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jun 23 2016  4:51PM', 'Oct 25 2016  6:49PM', '', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Nov 16 2016  2:26PM', 'Dec 25 2016  4:09PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '10292993', 'Mar  1 1949 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Version 1', 'Nov  3 2015  6:14PM', 'Jan 18 2016 11:18AM', '', 'TASMC GI Folfox (infuser) new - Version 1', 'Feb 22 2016  2:30PM', 'Jan 23 2017 12:20PM', '', 'TASMC BC Gemzar+Carboplatin AUC 2 - Version 1', 'Apr 24 2017 11:37AM', 'May 15 2017 11:45AM', '','lung or pancreas'
INSERT INTO #excel_data select '10324457', 'Jan  1 1944 12:00AM', 'pancreatic cancer', 'TASMC GI -Pancreas Folfirinox-D2-UGT1A1 mutant - Version 1', 'Oct 28 2015  5:57PM', 'Nov 27 2015  1:16AM', '', 'TASMC GI Gemzar  3/4 - Version 1', 'Dec 24 2015  3:44PM', 'May 11 2016 12:54PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '10679413', 'Nov 13 1943 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  Cisplatin + alimta + avastin - Version 2', 'Nov 26 2017 12:31PM', 'Dec 18 2017  2:50PM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 2', 'Jan 31 2018  1:00PM', 'Jun 17 2018  2:37PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '11265881', 'Nov 11 1967 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Feb 20 2017  4:30PM', 'Apr  3 2017  6:27PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '11352663', 'Nov  7 1948 12:00AM', 'pancreatic cancer', 'TASMC GI FOLFIRI (Inpatient) - Version 1', 'Nov 22 2015  3:42PM', 'Feb 22 2016  4:55PM', '', 'TASMC GI FOLFIRI (Inpatient) - Version 1', 'Nov  8 2015  6:21PM', 'Nov  8 2015  9:00PM', '', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Oct  6 2016  4:30PM', 'Mar  5 2017  5:15PM', '','lung or pancreas'
INSERT INTO #excel_data select '11497831', 'Dec 28 1953 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Nov  4 2015  1:00PM', 'Nov  4 2015  2:24PM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Dec 16 2015  1:33PM', 'Aug 31 2016  9:45AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '11764073', 'Dec  7 1952 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Aug 19 2018 12:00AM', 'Dec  5 2018 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '12409124', 'May  8 1966 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Version 3', 'Jun 16 2016  6:52PM', 'Nov 24 2016 12:10AM', '', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Jan 19 2017 12:27PM', 'Jul 13 2017  4:48PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '12514121', 'Jul 20 1940 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Jun 19 2018  3:20PM', 'Jul 10 2018 11:54AM', '', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Jul 31 2018 11:00AM', 'Aug 21 2018 12:12PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '12593190', 'Dec 12 1955 12:00AM', 'adenocarcinoma of lung', 'TAASMC  NSCLC  Cisplatin + alimta + avastin - Version 1', 'Nov  2 2015 12:00AM', 'Dec 14 2015 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '12720496', 'Oct 23 1954 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'May  3 2016 12:00AM', 'Jul  6 2016 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '13454491', 'Jan  1 1959 12:00AM', 'pancreatic cancer', 'TASMC GI Pancras  FOLFIRINOX modified (Inpatient) - Version 2', 'Oct 23 2016 10:32AM', 'Nov 27 2016  5:54PM', '', 'TASMC GI Panceras FOLFIRINOX - Version 4', 'Dec 11 2016 12:30PM', 'Jan 15 2017  6:56PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '13619614', 'Apr 30 1952 12:00AM', 'pancreatic cancer', 'TASMC GI Panceras FOLFIRINOX - Version 4', 'Jan 22 2017 11:26AM', 'May 15 2018  3:00PM', '', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Jun 18 2018 12:30PM', 'Sep 13 2018  7:35PM', '', 'TASMC Clinical Trial  CAN1001  JNJ-64457107 - Version 2', 'Dec  3 2018 11:19AM', 'Dec  3 2018 12:55PM', '','lung or pancreas'
INSERT INTO #excel_data select '14095574', 'Aug  8 1938 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Mar  8 2018 12:52PM', 'Aug 23 2018 10:25AM', '', 'TASMC  GI/LUNG/all KEYTRUDA  200mg q21d - Version 1', 'Oct 24 2018 10:45AM', 'Dec  5 2018  8:11AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '14443196', 'Jan  1 1951 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jun  8 2016  5:46PM', 'Jul  8 2016 12:11AM', '', 'TASMC GI Panceras FOLFIRINOX - Version 4', 'Jul 31 2016  1:21PM', 'Mar 28 2017 10:02AM', '', 'TASMC GI Gemzar  3/4 - Version 1', 'Apr 12 2017  2:00PM', 'Feb 20 2018 12:17PM', '','lung or pancreas'
INSERT INTO #excel_data select '14586192', 'Apr 19 1938 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jan 27 2016  3:52PM', 'Mar 17 2016  8:14PM', '', 'TASMC - GI FOLFOX - Inpatient - Version 1', 'Apr 18 2016 12:54PM', 'May 23 2016 12:21AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '14613673', 'Jan 11 1947 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  Cisplatin + alimta + avastin - Version 2', 'Jun 13 2018  3:31PM', 'Jul  4 2018 11:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '14714166', 'Apr  1 1966 12:00AM', 'adenocarcinoma of lung', 'TAASMC  NSCLC  Cisplatin + alimta + avastin - Version 1', 'Jan 13 2016 11:45AM', 'Mar 16 2016 11:45AM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Aug  2 2016  1:00PM', 'Oct 16 2016 10:00AM', '', 'TASMC ZOMERA - Version 2', 'Nov 24 2016 10:25AM', 'Dec 28 2017 12:33PM', '','lung or pancreas'
INSERT INTO #excel_data select '14782999', 'Sep  5 1947 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Nov  1 2016  2:13PM', 'Dec  7 2016  9:14PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '15129067', 'Nov  5 1940 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Alimta - Version 1', 'Jan 31 2017  9:35AM', 'Oct 16 2017 12:39PM', '', 'TASMC  GU   ATEZOLIZUMAB - Version 1', 'Jun 14 2018  1:49PM', 'Jul 26 2018 12:00PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '15428428', 'Feb 14 1949 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Mar  1 2017  3:00PM', 'Apr 25 2017  2:09PM', '', 'TASMC ZOMERA - Version 2', 'Mar 22 2017  3:20PM', 'Jun 24 2018  2:24PM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 2', 'Jun 14 2017  2:19PM', 'Jul  8 2018  2:37PM', '','lung or pancreas'
INSERT INTO #excel_data select '15782022', 'Jan  1 1955 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Oct 10 2016 11:37AM', 'Feb  8 2017 11:02AM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 2', 'May 18 2017 12:01PM', 'Jun 28 2017  1:42PM', '', 'TASMC ZOMERA - Version 2', 'May 11 2017 12:00PM', 'Jun 14 2017 11:58AM', '','lung or pancreas'
INSERT INTO #excel_data select '16551590', 'Jan  8 1934 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Feb 27 2018 11:27AM', 'Mar 20 2018 11:31AM', '', 'TASMC  GU   ATEZOLIZUMAB - Version 1', 'May  2 2018  2:00PM', 'May 23 2018  6:40PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '17881020', 'Mar 10 1943 12:00AM', 'adenocarcinoma of lung', 'TASMC  GI/LUNG/all KEYTRUDA  200mg q21d - Version 1', 'Aug 30 2017 10:07AM', 'Jan 15 2018 11:46AM', '', 'TASMC ZOMERA - Version 2', 'Dec  3 2017  2:58PM', 'Dec  3 2017  2:58PM', '', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Mar 20 2018  1:53PM', 'Jun 18 2018 12:30PM', '','lung or pancreas'
INSERT INTO #excel_data select '22527329', 'Jul 30 1966 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Alimta - Version 1', 'Jan  3 2016  4:02PM', 'May 25 2016  3:42PM', '', 'TASMC ZOMERA - Version 2', 'Apr 13 2016  2:30PM', 'May 25 2016  4:06PM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Jan  4 2017  2:08PM', 'Jan 18 2017 12:07PM', '','lung or pancreas'
INSERT INTO #excel_data select '22757546', 'May 12 1967 12:00AM', 'adenocarcinoma of lung', 'TASMC  GI/LUNG/all KEYTRUDA  200mg q21d - Version 1', 'Sep 28 2017  8:57AM', 'Mar 28 2018  9:39AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '22995443', 'Jul 22 1967 12:00AM', 'adenocarcinoma of lung', 'TASMC Clinical Trial EMR100070-005 - ArmB (NonSCC): Cis+Alimta - Version 1', 'Mar 28 2016 11:35AM', 'Mar 28 2016  1:35PM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Aug  4 2016  1:30PM', 'Oct  2 2017  3:24PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '23741457', 'Oct 11 1968 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Dec 11 2017  6:55PM', 'Jan  1 2018  1:08AM', '', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Jan 21 2018  3:40PM', 'Nov 15 2018  2:35PM', '', 'TASMC GI Pancreas  Gemzar(800) + cisplatin modified - Version 2', 'Dec 11 2018 12:53PM', 'Dec 11 2018 12:53PM', '','lung or pancreas'
INSERT INTO #excel_data select '23896186', 'Oct  3 1968 12:00AM', 'pancreatic cancer', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Feb 19 2018  2:41PM', 'Feb 19 2018  4:55PM', '', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Mar  5 2018 11:37AM', 'Apr  3 2018 10:58PM', '', 'TASMC GI Pancreas Folfirinox 80% - Version 2', 'May 21 2018 12:06PM', 'Sep 12 2018  7:22PM', '','lung or pancreas'
INSERT INTO #excel_data select '24320749', 'Jan 18 1969 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Version 2', 'Dec 13 2015  3:19PM', 'May 29 2016  5:24PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '25273947', 'May 28 1973 12:00AM', 'adenocarcinoma of lung', 'TAASMC  NSCLC  Cisplatin + alimta + avastin - Version 1', 'Oct 28 2015  3:17PM', 'Oct 28 2015  5:00PM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 2', 'Aug 10 2017 10:51AM', 'Dec  4 2018 12:19PM', '', 'TASMC HG Glioma Avastin - Version 1', 'Oct  4 2017 11:00AM', 'Oct  9 2018 10:15AM', '','lung or pancreas'
INSERT INTO #excel_data select '26012393', 'Oct 26 1951 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Cis+Alimta+Avastin - Version 1', 'Jul 14 2016  9:40AM', 'Oct 26 2016  3:34PM', '', 'TASMC NSCLC Alimta+Avastin  maintenence - Version 2', 'Nov 30 2016  9:54AM', 'May 10 2017 12:18PM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 2', 'Nov  6 2017  7:37AM', 'Jan 15 2018  7:40AM', '','lung or pancreas'
INSERT INTO #excel_data select '26038356', 'Sep  1 1952 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Oct 20 2017  6:15PM', 'Jan 15 2018  5:20PM', '', 'TASMC GI Panceras FOLFIRINOX - Version 4', 'Jan 29 2018  4:16PM', 'Dec  2 2018  4:45PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '26737411', 'Nov  7 1951 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jan  4 2017  1:17PM', 'May 19 2017  1:42PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '26962282', 'Jan 31 1937 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Nov  9 2015  1:15PM', 'Dec  7 2015 10:51AM', '', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Feb  2 2016  1:02PM', 'Mar 15 2016 12:25PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '28018745', 'Aug 31 1970 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Nov 16 2015  2:40PM', 'Nov 16 2015  2:40PM', '', 'TASMC NSCLC Alimta - Version 1', 'Jan  7 2016 12:07PM', 'Jan 27 2016 12:15PM', '', 'TASMC ZOMERA - Version 2', 'Mar 22 2018  2:30PM', 'May 13 2018 12:39PM', '','lung or pancreas'
INSERT INTO #excel_data select '28722775', 'Jun  8 1971 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jan  5 2018 12:45PM', 'Jun 20 2018  2:14PM', '', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Jul 11 2018 11:35AM', 'Dec  9 2018 10:20AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '29740875', 'Dec 10 1972 12:00AM', 'pancreatic cancer', 'TASMC GI Panceras FOLFIRINOX - Version 4', 'Jun  7 2017  5:55PM', 'Sep  5 2017  6:12PM', '', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Oct 18 2017  3:53PM', 'Jul 22 2018  4:50PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '30037055', 'Jul 18 1949 12:00AM', 'pancreatic cancer', 'TASMC GI Pancreas Folfirinox 80% - Version 2', 'May  3 2018  1:30PM', 'May  3 2018  1:30PM', '', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'May 24 2018  3:43PM', 'Jul 26 2018 12:22PM', '', 'TASMC GI FLOX - Version 3', 'Aug  5 2018  6:45PM', 'Sep 30 2018 12:02PM', '','lung or pancreas'
INSERT INTO #excel_data select '30223671', 'Sep  1 1949 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Alimta - Version 1', 'Oct 26 2015 11:26AM', 'Dec 21 2015  1:14PM', '', 'TASMC BC Pembrolizumab (keytruda) - Version 1', 'Jan 25 2016  3:20PM', 'Dec 26 2017 11:00AM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 2', 'Jan 16 2018 11:42AM', 'Dec  4 2018  7:36AM', '','lung or pancreas'
INSERT INTO #excel_data select '30412340', 'Jul 15 1949 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'May 23 2016  9:58PM', 'Sep  6 2016  7:23PM', '', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Sep 25 2016  5:35PM', 'Jun 22 2017 12:34PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '30483176', 'Feb  1 1949 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Nov 27 2017  3:15PM', 'Jan  1 2018  6:51PM', '', 'TASMC GI Panceras FOLFIRINOX - Version 4', 'Jan 15 2018 12:55PM', 'Mar 18 2018  4:04PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '30545149', 'Oct 13 1947 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Aug  7 2017  3:36PM', 'Aug  2 2018  9:25AM', '', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Nov 18 2018  3:03PM', 'Dec  4 2018  5:53PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '30554828', 'Feb 24 1929 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Alimta - Version 1', 'Mar 16 2016 11:07AM', 'Jul 20 2016 10:16AM', '', 'TASMC ZOMERA - Version 2', 'Mar 16 2016 11:57AM', 'Oct 19 2016 10:33AM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Oct 19 2016  9:47AM', 'Nov  2 2016  9:24AM', '','lung or pancreas'
INSERT INTO #excel_data select '30625735', 'Jan  1 1947 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Mar  6 2018 12:12PM', 'Aug  9 2018 10:00AM', '', 'TASMC NSCLC OPDIVO 3mg/kg q2week - Version 1', 'Oct 17 2018 11:31AM', 'Dec 12 2018  7:45AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '30656656', 'Jan  1 1946 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Version 3', 'Jan 25 2016  9:50AM', 'Mar 14 2016  1:43PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '34465948', 'Dec 26 1977 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jul  4 2018  6:20PM', 'Aug  2 2018  6:26PM', '', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Aug 14 2018  4:25PM', 'Nov 21 2018  1:00PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '41600339', 'Jan  1 1947 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'May 17 2018 11:04AM', 'Jul 19 2018 11:10AM', '', 'TASMC ZOMERA - Version 2', 'Oct 11 2018  2:00PM', 'Oct 11 2018  2:00PM', '', 'TASMC  GU   ATEZOLIZUMAB - Version 1', 'Sep 20 2018 11:00AM', 'Oct 11 2018  9:34AM', '','lung or pancreas'
INSERT INTO #excel_data select '42022418', 'Jan  1 1940 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Alimta - Version 1', 'Jun  7 2017 12:00AM', 'Jun  7 2017 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '42241299', 'Jan  1 1949 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Mar  8 2016 11:39AM', 'Mar 29 2016  2:48PM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Apr 21 2016  8:58AM', 'Jun  2 2016 10:41AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '42518555', 'Jul 21 1943 12:00AM', 'adenocarcinoma of lung', 'TAASMC  NSCLC  Cisplatin + alimta + avastin - Version 1', 'Dec 29 2015 11:54AM', 'May  3 2016  1:25PM', '', 'TASMC NSCLC Alimta+Avastin  maintenence - Version 2', 'Sep 20 2016 11:41AM', 'Oct 18 2016 11:07AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '42644245', 'Nov  1 1936 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Jun 16 2016  9:35AM', 'Sep 11 2016 11:33AM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Feb 22 2017 10:30AM', 'Apr 26 2017  4:47PM', '', 'TASMC ZOMERA - Version 2', 'Feb 22 2017 11:10AM', 'Apr  3 2017  2:18PM', '','lung or pancreas'
INSERT INTO #excel_data select '46625547', 'Jan  1 1946 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Nov  6 2017  2:31PM', 'Nov 27 2017  3:00PM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 2', 'Feb  5 2018  4:28PM', 'Feb  5 2018  4:28PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '46722948', 'Jan  1 1947 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Jun 12 2018 12:45PM', 'Aug 15 2018  4:39PM', '', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Sep 25 2018 10:20AM', 'Oct 16 2018 10:55AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '46924239', 'Apr 24 1948 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Dec 29 2016 12:00AM', 'Mar  2 2017 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '47100235', 'Jan  1 1945 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Jul 11 2017 12:00AM', 'Feb  6 2018 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '48740138', 'Jan  1 1949 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Jun  9 2016  1:12PM', 'Aug 15 2016 11:00AM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Feb  1 2017 11:21AM', 'Mar 16 2017  1:59PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '49181415', 'Jun 29 1926 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Jul 26 2016 12:10PM', 'Dec 11 2016 11:32AM', '', 'TASMC ZOMERA - Version 2', 'Oct 30 2016 11:15AM', 'May 11 2017 10:43AM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Feb  2 2017 10:59AM', 'Apr 27 2017 10:23AM', '','lung or pancreas'
INSERT INTO #excel_data select '49440548', 'Jan  1 1948 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Nov 14 2017 12:00AM', 'Jan 16 2018 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '50306810', 'Oct 22 1950 12:00AM', 'pancreatic cancer', 'TASMC GI Pancras  FOLFIRINOX modified (Inpatient) - Version 2', 'Nov  6 2015  2:43PM', 'Jun 19 2016  8:40PM', '', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Jul 11 2016  2:37PM', 'Oct  7 2016 12:55PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '50695279', 'Sep 13 1951 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  Cisplatin + alimta + avastin - Version 2', 'Dec  1 2016  2:57PM', 'Jun 15 2017  2:42PM', '', 'TASMC ZOMERA - Version 2', 'Nov 29 2016  4:00PM', 'Mar 28 2018  3:24PM', '', 'TASMC GI/GYN Gemzar+Cisplatin (d1+8) - Version 1', 'Jul  9 2017 12:50PM', 'Aug 23 2017  2:36PM', '','lung or pancreas'
INSERT INTO #excel_data select '50783950', 'Aug 30 1951 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Oct 24 2018 12:00AM', 'Nov 14 2018 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '51113306', 'Mar 31 1952 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'May 15 2016  3:58PM', 'Jun 15 2017  8:08PM', '', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Jul 16 2017 11:45AM', 'Aug  3 2017 12:23PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '51170157', 'Jan 23 1952 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  Cisplatin + alimta + avastin - Version 2', 'Dec  2 2018 12:00AM', 'Dec  2 2018 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '51210664', 'Apr  8 1952 12:00AM', 'adenocarcinoma of lung', 'TASMC  GI/LUNG/all KEYTRUDA  200mg q21d - Version 1', 'Sep 28 2017  1:20PM', 'Nov 30 2017 11:08AM', '', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Mar  5 2018 10:21AM', 'Oct  8 2018 11:44AM', '', 'TASMC NSCLC Navelbine - Version 1', 'Nov 21 2018 11:49AM', 'Dec  5 2018  2:01PM', '','lung or pancreas'
INSERT INTO #excel_data select '51216257', 'Jun  2 1952 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Oct 18 2017  2:17PM', 'Dec 25 2017  1:01PM', '', 'TASMC NSCLC OPDIVO 3mg/kg q2week - Version 1', 'Aug 27 2018  4:02PM', 'Oct 10 2018  4:10PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '51403103', 'Jul  3 1953 12:00AM', 'pancreatic cancer', 'TASMC GI Pancras  FOLFIRINOX modified (Inpatient) - Version 2', 'Jun  1 2016  8:23PM', 'Jul  3 2016  6:03PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '52109097', 'Nov  2 1953 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Nov  3 2015 12:00AM', 'Jan  3 2016 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '52265774', 'Dec 22 1953 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Jan 29 2017 11:29AM', 'Jan 29 2017 12:32PM', '', 'TASMC ZOMERA - Version 2', 'Mar 19 2017 11:02AM', 'Nov 18 2018 10:20AM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Mar 19 2017  9:32AM', 'Nov 18 2018  9:23AM', '','lung or pancreas'
INSERT INTO #excel_data select '52410206', 'Mar 10 1953 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jan 10 2018  5:08PM', 'Jan 10 2018  7:50PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '52754074', 'Jul 20 1954 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Nov 16 2015  1:53PM', 'Dec 28 2015  1:17PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '52764321', 'Nov 17 1954 12:00AM', 'adenocarcinoma of lung', 'TAASMC  NSCLC  Cisplatin + alimta + avastin - Version 1', 'Nov  5 2015 11:23AM', 'Jun 23 2016 12:00PM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Aug  3 2016 11:40AM', 'Oct 27 2016  9:39AM', '', 'TASMC ZOMERA - Version 2', 'Oct 25 2016 10:15AM', 'Oct 25 2016 10:15AM', '','lung or pancreas'
INSERT INTO #excel_data select '52889128', 'Jun  5 1954 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Aug 21 2016  3:22PM', 'Oct  9 2016  6:05PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '53278917', 'Apr 19 1955 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Mar 29 2017  6:12PM', 'May 24 2017  7:30PM', '', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Jun 22 2017 12:15PM', 'Sep 24 2017  2:20PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '53386231', 'Feb  5 1955 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jun  9 2017 12:50PM', 'Oct 22 2017  8:15PM', '', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Nov 16 2017  2:21PM', 'Jan  7 2018  5:10PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '53458006', 'Jun 26 1955 12:00AM', 'pancreatic cancer', 'TASMC GI Panceras FOLFIRINOX - Version 4', 'Jul 10 2016  3:03PM', 'Apr 22 2018  1:13PM', '', 'TASMC GI biliary  tract  Gemzar D1+8+15 q28d - Version 1', 'May  6 2018  7:02PM', 'Jun 11 2018 12:09PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '53504379', 'Feb 14 1958 12:00AM', 'pancreatic cancer', 'TASMC GI FOLFIRI (Infusor) - Version 1', 'Nov  8 2015 11:56AM', 'Aug 18 2016  9:30AM', '', 'TASMC GI Panceras FOLFIRINOX - Version 4', 'Aug 30 2016 10:00AM', 'Jan 31 2017  1:00PM', '', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Feb 21 2017 11:20AM', 'Jul 20 2017  1:18PM', '','lung or pancreas'
INSERT INTO #excel_data select '53569174', 'Oct  9 1955 12:00AM', 'pancreatic cancer', 'TASMC GI Pancreas Folfirinox 80% - Version 2', 'Dec 18 2016  5:08PM', 'Jan 22 2017  4:14PM', '', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Feb 19 2017 11:30AM', 'May 21 2017  1:03PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '53604450', 'Oct 15 1955 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Version 3', 'May 20 2016  4:22PM', 'Jun 24 2016 11:32PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '53651667', 'Oct 29 1955 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Dec 27 2017  1:15PM', 'Apr 20 2018  4:52PM', '', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'May 14 2018  5:56PM', 'May 27 2018  2:00PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '53888210', 'Dec 19 1955 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Mar  6 2016 12:27PM', 'Apr 18 2016  3:08AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '53892303', 'Jan 10 1956 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Oct 10 2017  9:52AM', 'Jun 14 2018 11:32AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '53897807', 'Feb 19 1956 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Version 3', 'May 15 2016  7:10PM', 'Oct 16 2017  5:02PM', '', 'TASMC GI Panceras FOLFIRINOX - Version 4', 'Nov 12 2017 11:38AM', 'Dec 12 2017  6:19PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '53936977', 'Jan 27 1956 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Nov 16 2017 12:00AM', 'Jan 28 2018 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '54070206', 'Mar 28 1956 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Apr  9 2018 10:17AM', 'Aug 16 2018  1:00PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '54076633', 'Mar 24 1956 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Apr 26 2016 11:24AM', 'Jun 15 2016  3:01PM', '', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Jun 15 2016  1:47PM', 'Jul 11 2016 11:32AM', '', 'TASMC NSCLC Alimta+Avastin  maintenence - Version 2', 'Aug  8 2016 10:24AM', 'Oct 26 2016 11:44AM', '','lung or pancreas'
INSERT INTO #excel_data select '54211735', 'Jun 20 1957 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  Cisplatin + alimta + avastin - Version 2', 'Apr  1 2018  1:15PM', 'Jun  4 2018  1:36PM', '', 'TASMC BC Pembrolizumab (keytruda) - Version 1', 'Jul 25 2018 10:40AM', 'Dec  4 2018 10:55AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '54309026', 'Jun 23 1956 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Feb  5 2017 12:03PM', 'Apr 12 2017 12:15PM', '', 'Radionecrosis - Avastin 7.5mg/kg X4 q3w - Version 1', 'Oct 22 2018  5:00PM', 'Dec  5 2018  2:41PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '54350582', 'Jan 29 1957 12:00AM', 'pancreatic cancer', 'TASMC GI -pancreas Gemzar Burris - Version 1', 'Oct 27 2015  2:00PM', 'Oct 27 2015  2:00PM', '', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Dec 21 2015  2:03PM', 'Jan 24 2016  5:11PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '54934427', 'Dec 18 1957 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Nov 13 2016 10:25AM', 'Mar 22 2017 12:54PM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 2', 'May 14 2017  1:18PM', 'Dec 10 2017  1:08PM', '', 'TASMC BC/GYN Taxol q3weeks - Version 1', 'Jul 10 2018  3:15PM', 'Sep 20 2018  1:34PM', '','lung or pancreas'
INSERT INTO #excel_data select '55014310', 'Jan 12 1958 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Feb 22 2016  2:46PM', 'Jun  5 2017  5:40PM', '', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Jul 26 2017  1:41PM', 'Sep 13 2017 11:15AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '55246714', 'Apr 17 1958 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Aug 19 2018 12:00AM', 'Oct 31 2018 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '55871537', 'Apr 16 1959 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Mar 22 2018 11:54AM', 'May  9 2018  4:50PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '55943906', 'Sep 14 1959 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Cis+Alimta+Avastin - Version 1', 'Jan 12 2016 10:59AM', 'Nov 17 2016 10:57AM', '', 'TASMC ZOMERA - Version 2', 'Feb  2 2016  3:05PM', 'Feb  2 2016  3:05PM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Feb 15 2017  1:25PM', 'May 10 2017 10:20AM', '','lung or pancreas'
INSERT INTO #excel_data select '56111891', 'Nov  2 1959 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Oct 11 2018 11:08AM', 'Nov 28 2018 11:54AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '56226913', 'Apr 26 1960 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Nov 27 2016  4:27PM', 'Jan 30 2017  6:00PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '56268790', 'Jun  4 1960 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Nov 24 2017  5:02PM', 'Dec  8 2017  9:36PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '56616360', 'Aug 18 1960 12:00AM', 'pancreatic cancer', 'TASMC GI FOLFIRI (Infusor) - Version 1', 'Nov  5 2015 10:45AM', 'Mar  3 2016  2:13PM', '', 'TASMC GI- panceras FOLFIRINOX - Version 3', 'Mar 31 2016 12:20PM', 'May 19 2016  2:30PM', '', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Jun 16 2016  4:31PM', 'Sep 21 2016  1:50PM', '','lung or pancreas'
INSERT INTO #excel_data select '57308421', 'Aug 26 1961 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Dec 29 2016 12:00AM', 'Mar  2 2017 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '57461923', 'May  1 1962 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jul 27 2016  4:08PM', 'Mar  1 2017  3:49PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '57801813', 'Nov 11 1962 12:00AM', 'adenocarcinoma of lung', 'TAASMC  NSCLC  Cisplatin + alimta + avastin - Version 1', 'Dec 28 2015 11:43AM', 'Feb 15 2016 11:31AM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Jun 27 2016 11:41AM', 'Apr  3 2017  2:19PM', '', 'TASMC ZOMERA - Version 2', 'Jun 27 2016 12:15PM', 'Apr 17 2018 11:30AM', '','lung or pancreas'
INSERT INTO #excel_data select '57991143', 'Dec 27 1962 12:00AM', 'adenocarcinoma of lung', 'Clinical Trial bTMB cohort C - Carbo+Alimta - Version 1', 'Apr 26 2018 12:00AM', 'Dec 12 2018 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '57996894', 'Jan 15 1963 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  Cisplatin + alimta + avastin - Version 2', 'Nov 16 2016 11:20AM', 'Jun 28 2017 12:45PM', '', 'TASMC ZOMERA - Version 2', 'Dec  7 2016  4:52PM', 'Jun 28 2017  2:00PM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 2', 'Jul 12 2017 10:03AM', 'Jul 26 2017 12:46PM', '','lung or pancreas'
INSERT INTO #excel_data select '58123571', 'Apr 27 1963 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Apr 21 2017  7:32PM', 'May 22 2017 12:42AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '58274069', 'Sep 30 1963 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Dec  6 2015  2:31PM', 'Feb  3 2016  1:17AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '58279043', 'Nov  2 1963 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Apr  3 2017  6:18PM', 'May 30 2017  5:51PM', '', 'TASMC GI Panceras FOLFIRINOX - Version 4', 'Jun 13 2017  1:19PM', 'Jul 27 2017  3:30PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '58425398', 'Oct  3 1963 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Feb  5 2017  5:56PM', 'Feb  5 2017  9:02PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '58621491', 'Mar 18 1964 12:00AM', 'adenocarcinoma of lung', 'TASMC BC Pembrolizumab (keytruda) - Version 1', 'Mar 16 2017 10:39AM', 'Jan 10 2018  7:45AM', '', 'TASMC NSCLC  Cisplatin + alimta + avastin - Version 2', 'Jan 31 2018  1:18PM', 'Aug  9 2018  3:30PM', '', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Sep 26 2018  1:50PM', 'Oct 17 2018  2:39PM', '','lung or pancreas'
INSERT INTO #excel_data select '58626284', 'Apr  9 1964 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Sep 28 2017 12:46PM', 'Oct 26 2017 10:38AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '58718800', 'Jun  3 1964 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Apr  6 2016 12:00AM', 'Jun 15 2016 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '59097113', 'Sep 20 1964 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Nov 11 2015  1:34PM', 'Dec 23 2015  2:44PM', '', 'TASMC NSCLC Alimta - Version 1', 'Mar 21 2016 12:18PM', 'May  2 2016 11:30AM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Feb 15 2017 11:57AM', 'Apr  2 2017 10:07AM', '','lung or pancreas'
INSERT INTO #excel_data select '59276659', 'Apr  1 1965 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Nov  5 2015  3:00PM', 'Nov 30 2015  1:39PM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Jan 21 2016 11:01AM', 'Dec  5 2018  5:36PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '60178431', 'Jan  1 1946 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jan 20 2016  6:35PM', 'Mar 10 2016  7:54AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '60550134', 'Aug 16 1955 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'May  6 2018  1:44PM', 'Jul 11 2018 12:43PM', '', 'TASMC NSCLC DURVALUMAB 10mg  /kg  q2week - Version 1', 'Oct 23 2018 10:48AM', 'Nov 20 2018 10:41AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '61816039', 'Jan  1 1944 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Alimta+Avastin+Zomera - Version 1', 'Nov 18 2015 10:13AM', 'Mar 16 2016 10:21AM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Aug 10 2016  9:11AM', 'Oct  6 2016  2:00PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '61923348', 'Jan  1 1950 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Apr 13 2017 12:21PM', 'Sep 11 2017  4:30PM', '', 'TASMC  GU   ATEZOLIZUMAB - Version 1', 'Nov  1 2017  2:40PM', 'Jan 10 2018  2:00PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '62095161', 'Nov 27 1952 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Nov  8 2015  2:10PM', 'Mar  2 2016 11:16AM', '', 'TASMC NSCLC Alimta+Avastin+Zomera - Version 1', 'Mar 23 2016  9:18AM', 'Feb  6 2017 12:02PM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Mar 14 2017  9:40AM', 'Jun 26 2018  7:43AM', '','lung or pancreas'
INSERT INTO #excel_data select '62507199', 'Jan  1 1952 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Version 1', 'Oct 26 2015  6:56PM', 'Oct 28 2015  1:36AM', '', 'TASMC GI Pancras  FOLFIRINOX modified (Inpatient) - Version 2', 'Nov  9 2015  6:26PM', 'Feb 19 2016 10:30PM', '', 'TASMC GI FOLFIRI (Infusor) - Version 1', 'Mar  6 2016 12:00PM', 'Mar  6 2016  3:05PM', '','lung or pancreas'
INSERT INTO #excel_data select '64404163', 'Jan 22 1938 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jul 24 2017  2:01PM', 'Jul 24 2017  4:41PM', '', 'TASMC GI Gemzar  3/4 - Version 1', 'Aug 16 2017  3:07PM', 'Sep 19 2017  2:44PM', '', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Oct  3 2017  4:03PM', 'Jun 12 2018  3:23PM', '','lung or pancreas'
INSERT INTO #excel_data select '64440860', 'Mar  3 1949 12:00AM', 'pancreatic cancer', 'TASMC GI Pancras  FOLFIRINOX modified (Inpatient) - Version 2', 'Nov 13 2015  3:16PM', 'Feb 19 2016 10:20PM', '', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Mar 30 2016  2:41PM', 'May 10 2016  2:29PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '64607971', 'Jan  1 1943 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jun 24 2016  7:13PM', 'Jan 22 2017  5:52PM', '', 'TASMC GI FOLFIRI (Inpatient) - Version 1', 'Apr 14 2017  1:22PM', 'May 25 2017  7:45PM', '', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Jun 22 2017 12:01PM', 'Jul 30 2017 11:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '64676109', 'Feb  2 1946 12:00AM', 'pancreatic cancer', 'TASMC GI -Pancreas Folfirinox-D2-UGT1A1 mutant - Version 1', 'Nov  1 2015  3:03PM', 'Nov 15 2016  1:58PM', '', 'TASMC GI De Gramont (Inpatient) - Version 1', 'Dec 25 2016 10:26AM', 'Feb  5 2017 12:04PM', '', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Oct 22 2017 11:00AM', 'Dec 14 2017  2:28PM', '','lung or pancreas'
INSERT INTO #excel_data select '64685050', 'Sep 19 1942 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jun 30 2017  1:55PM', 'Aug 20 2017  7:16PM', '', 'TASMC GI Pancreas Folfirinox 80% - Version 2', 'Sep 27 2017  4:49PM', 'Jan 21 2018 12:20PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '65598815', 'Jul 22 1951 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Cis+Alimta+Avastin - Version 1', 'Nov  5 2015  1:10PM', 'Dec 14 2016  2:22PM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Feb  8 2017  1:00PM', 'May 24 2017 12:46PM', '', 'TASMC ZOMERA - Version 2', 'Feb 22 2017  3:21PM', 'Feb 22 2017  3:21PM', '','lung or pancreas'
INSERT INTO #excel_data select '65888372', 'Nov 13 1953 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'May 31 2016 12:00AM', 'Nov  7 2016 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '67458455', 'Apr 14 1944 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Feb 21 2018 11:26AM', 'Jul 11 2018 10:55AM', '', 'TASMC ZOMERA - Version 2', 'Mar 14 2018  3:30PM', 'May  7 2018  9:25AM', '', 'TASMC  GI/LUNG/all KEYTRUDA  200mg q21d - Version 1', 'Sep  3 2018  7:49AM', 'Nov 26 2018  7:46AM', '','lung or pancreas'
INSERT INTO #excel_data select '68538248', 'Jan 24 1944 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Apr  3 2016 11:15AM', 'Jul 17 2016 12:59PM', '', 'TASMC NSCLC Alimta+Avastin  maintenence - Version 2', 'Aug  9 2016  2:57PM', 'Nov 27 2016 12:24PM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 2', 'May 18 2017  2:02PM', 'Jul 19 2017  1:45PM', '','lung or pancreas'
INSERT INTO #excel_data select '68692888', 'Jan  1 1954 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Feb  8 2017 12:35PM', 'May  3 2017  1:54PM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 2', 'Jul 11 2017 11:56AM', 'Aug 22 2017 11:26AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '69209609', 'Aug 19 1953 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Feb 29 2016  3:40PM', 'Jul 27 2016  7:31PM', '', 'TASMC GI FOLFIRI (Infusor) - Version 2', 'Aug 16 2016  4:37PM', 'Feb 28 2017  2:01PM', '', 'TASMC GI Panceras FOLFIRINOX - Version 4', 'Mar 28 2017 12:55PM', 'May 16 2017  5:19PM', '','lung or pancreas'
INSERT INTO #excel_data select '69226256', 'Oct 15 1946 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Nov 13 2016  3:40PM', 'Dec  5 2016 12:00AM', '', 'TASMC GI Panceras FOLFIRINOX - Version 4', 'Dec 25 2016 10:47AM', 'Nov 14 2017  3:32PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '69338713', 'Feb 17 1948 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Aug 21 2018 10:49AM', 'Nov 21 2018 10:22AM', '', 'TASMC  GI/LUNG/all KEYTRUDA  200mg q21d - Version 1', 'Aug 21 2018  3:08PM', 'Nov 21 2018  9:34AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '69792166', 'Dec 11 1951 12:00AM', 'adenocarcinoma of lung', 'TAASMC  NSCLC  Cisplatin + alimta + avastin - Version 1', 'Jan 14 2016 12:55PM', 'Feb  4 2016  3:04PM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Mar 30 2016  2:45PM', 'Apr 27 2016  1:12PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '70875786', 'Jan  1 1944 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'May 24 2016  1:01PM', 'Jun  9 2016  3:06AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '71687438', 'Jan  1 1950 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Version 2', 'Nov  9 2015  7:16PM', 'Nov  9 2015 10:14PM', '', 'TASMC SCLC CIS(100) d1 +VP16(100)d1-3 q21d - Version 1', 'Nov 24 2015  4:39PM', 'Nov 24 2015 11:24PM', '', 'irinotecan + cisplatin - Version 1', 'Nov 26 2015  4:58PM', 'Nov 26 2015  4:58PM', '','lung or pancreas'
INSERT INTO #excel_data select '78262086', 'Jan  1 1948 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'May 24 2017  2:48PM', 'Jun 20 2017 12:10PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '79554937', 'Feb  8 1950 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Jun 22 2016  1:37PM', 'Jul 18 2016 12:02PM', '', 'TASMC NSCLC  Cisplatin + alimta + avastin - Version 2', 'Aug  8 2016  1:34PM', 'Jan  9 2017  2:46PM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Mar  9 2017 12:04PM', 'Jul 20 2017  2:09PM', '','lung or pancreas'
INSERT INTO #excel_data select '79867461', 'Jan  1 1950 12:00AM', 'pancreatic cancer', 'TASMC GI Pancras  FOLFIRINOX modified (Inpatient) - Version 2', 'Dec 26 2016  5:25PM', 'Feb 16 2017  1:30AM', '', 'TASMC GI biliary  tract  Gemzar D1+8+15 q28d - Version 1', 'Mar  1 2017  2:29PM', 'Apr 14 2017  2:16PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '303900260', 'Sep  5 1946 12:00AM', 'pancreatic cancer', 'TASMC GI Pancras  FOLFIRINOX modified (Inpatient) - Version 2', 'Mar 22 2017  7:13PM', 'Jun  1 2017  6:53PM', '', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Jul  4 2017  2:05PM', 'Jul 17 2017  2:51PM', '', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Aug 25 2017  2:05PM', 'Aug 25 2017  4:04PM', '','lung or pancreas'
INSERT INTO #excel_data select '304269566', 'Apr 14 1949 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Nov  8 2015  1:57PM', 'Jan 11 2016  4:56PM', '', 'TAASMC  NSCLC  Cisplatin + alimta + avastin - Version 1', 'Feb  7 2016  1:12PM', 'Mar 22 2016  2:18PM', '', 'TASMC  NSCLC  AVASTIN  maintenence - Version 1', 'Apr 12 2016  3:06PM', 'May  3 2016  1:38PM', '','lung or pancreas'
INSERT INTO #excel_data select '304341654', 'Sep 19 1947 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Apr  9 2016  4:15PM', 'May 22 2016  8:57PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '305856411', 'Feb 15 1954 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'May  5 2016 11:56AM', 'Jul 13 2016 11:36AM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Oct 10 2016  2:12PM', 'Nov  7 2017 12:40PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '306038951', 'Oct 29 1947 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'May 19 2016 11:20AM', 'Jun 30 2016  1:43PM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Jul 21 2016 10:39AM', 'Dec 15 2016 11:07AM', '', 'TASMC GI Gemzar  3/4 - Version 1', 'Jan  5 2017 11:14AM', 'Jan 19 2017  2:45PM', '','lung or pancreas'
INSERT INTO #excel_data select '306218439', 'Feb 10 1953 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Alimta - Version 1', 'Nov 12 2015  2:46PM', 'Feb 14 2016 10:35AM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Apr 10 2016  9:48AM', 'Dec  3 2018  7:35AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '306976960', 'Dec 18 1942 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jul 12 2017  6:30PM', 'Jan  3 2018 10:45PM', '', 'TASMC GI FOLFIRI (Inpatient) - Version 1', 'Jan 23 2018 12:19PM', 'Feb 12 2018  8:19PM', '', 'TASMC GI FOLFIRI (Infusor) - Version 2', 'Mar 27 2018  1:29PM', 'Dec  3 2018 11:12AM', '','lung or pancreas'
INSERT INTO #excel_data select '307186858', 'Jun  8 1953 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Jul 15 2018 12:00AM', 'Oct  7 2018 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '307507053', 'Aug  9 1947 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Dec 12 2018  2:13PM', 'Dec 12 2018  2:13PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '307580282', 'Oct 25 1959 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jun  2 2016  6:42PM', 'Jun 19 2016 11:55PM', '', 'TASMC GI Panceras FOLFIRINOX - Version 4', 'Jul  3 2016  4:52PM', 'Jul 18 2016  8:48PM', '', 'TASMC GI Gemzar  3/4 - Version 1', 'Aug  4 2016  2:45PM', 'Aug 18 2016 10:16AM', '','lung or pancreas'
INSERT INTO #excel_data select '308611623', 'Apr 17 1938 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Nov 30 2015 11:44AM', 'Nov 30 2015 11:54AM', '', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'May  8 2016 10:25AM', 'Jun  1 2016 12:02PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '308728617', 'Apr 14 1966 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Jul  4 2017 12:14PM', 'Oct 24 2017  1:52PM', '', 'TASMC NSCLC Alimta+Avastin  maintenence - Version 2', 'Nov 16 2017 12:34PM', 'Dec  7 2017 12:45PM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 2', 'Jan  4 2018 10:48AM', 'Mar 11 2018 12:55PM', '','lung or pancreas'
INSERT INTO #excel_data select '308949411', 'May 20 1954 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Dec 17 2015 12:00AM', 'Jan  7 2016 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '309115384', 'Nov 19 1948 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Dec 13 2015 10:00AM', 'Feb 17 2016 10:22AM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 2', 'Mar  7 2017  2:00PM', 'May  3 2017 11:20AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '309158384', 'Nov 24 1954 12:00AM', 'pancreatic cancer', 'TASMC GI Pancras  FOLFIRINOX modified (Inpatient) - Version 1', 'Nov  3 2015 12:14PM', 'Jun  6 2016  9:40AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '309569754', 'Aug  2 1939 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Dec 27 2016 12:57PM', 'Jan 22 2017  4:58PM', '', 'TASMC GYN/BC Taxol (80)+Carbo (AUC2) 3/4 - Version 1', 'Feb 12 2017  1:45PM', 'Apr  3 2017  2:30PM', '', 'TASMC  GU   ATEZOLIZUMAB - Version 1', 'Feb 27 2018 10:25AM', 'Nov 28 2018 10:22AM', '','lung or pancreas'
INSERT INTO #excel_data select '310267265', 'Jun 22 1941 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Oct 19 2017  1:16PM', 'Nov  9 2017  2:12PM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 2', 'Dec 10 2017 11:00AM', 'Mar 13 2018  1:15PM', '', 'TASMC ZOMERA - Version 2', 'Jan  7 2018  3:14PM', 'Jan  7 2018  3:14PM', '','lung or pancreas'
INSERT INTO #excel_data select '310280474', 'Sep 12 1936 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Sep 13 2017 11:03AM', 'Nov 27 2017  1:34PM', '', 'TASMC NSCLC DURVALUMAB 10mg  /kg  q2week - Version 1', 'May 10 2018 10:41AM', 'Dec  5 2018  2:45PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '310353065', 'Sep 25 1948 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jul 12 2017  6:39PM', 'Aug 24 2017  2:54PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '310585666', 'Mar 24 1967 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  Cisplatin + alimta + avastin - Version 2', 'Apr 20 2017  9:19AM', 'Jun 26 2017 12:57PM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 2', 'Aug 28 2017  7:48AM', 'Oct  9 2017  9:37AM', '', 'TASMC NSCLC Cis+Gemzar - Version 1', 'Oct 25 2017 11:13AM', 'Mar 12 2018 11:49AM', '','lung or pancreas'
INSERT INTO #excel_data select '310765748', 'Sep 12 1940 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Nov  1 2015 12:14PM', 'Feb 11 2016  1:49PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '311996433', 'Sep  5 1946 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Jul 21 2016 11:46AM', 'Oct 13 2016  4:04PM', '', 'TASMC NSCLC Alimta - Version 1', 'Dec 15 2016 12:50PM', 'Jan 26 2017 11:32AM', '', 'TASMC NSCLC Alimta - Version 1', 'Sep  7 2017  3:19PM', 'Nov  2 2017 11:41AM', '','lung or pancreas'
INSERT INTO #excel_data select '312033772', 'Mar 19 1966 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Feb 25 2018  3:31PM', 'Apr 11 2018  1:04AM', '', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'May 17 2018  5:02PM', 'May 24 2018  2:51PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '313798514', 'Mar  3 1951 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'May  8 2016  3:57PM', 'Apr 18 2017  2:45PM', '', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'May  9 2017 11:36AM', 'Oct 14 2018 11:30AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '314151986', 'Jun 22 1959 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jun 14 2017  1:07PM', 'Jul 30 2017  4:55PM', '', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Aug 30 2017  4:34PM', 'Oct 10 2017  5:36PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '314235672', 'May 30 1965 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'May 23 2018  5:09PM', 'Jul  4 2018  9:20PM', '', 'TASMC GI Panceras FOLFIRINOX - Version 4', 'Jul 29 2018 11:24AM', 'Nov 28 2018  3:30PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '314590571', 'Aug 19 1958 12:00AM', 'pancreatic cancer', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Oct 16 2016  2:42PM', 'Oct 16 2016  5:00PM', '', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Oct 30 2016  5:19PM', 'Nov 15 2016  7:47PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '316695360', 'Jan 18 1949 12:00AM', 'pancreatic cancer', 'TASMC GI Panceras FOLFIRINOX - Version 4', 'Feb 22 2018  2:26PM', 'Jun 13 2018  3:17AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '316817709', 'Feb 20 1948 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Feb 23 2018 11:46AM', 'Jun  2 2018  3:15AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '317292340', 'Jan 19 1942 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Oct 29 2017 10:27AM', 'Apr 16 2018 12:49PM', '', 'TASMC AREDIA - Version 4', 'Oct 29 2017 12:53PM', 'Mar 19 2018  4:00PM', '', 'TASMC  GU   ATEZOLIZUMAB - Version 1', 'Aug 22 2018  3:15PM', 'Nov  1 2018  9:48AM', '','lung or pancreas'
INSERT INTO #excel_data select '320513666', 'Oct 15 1956 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'May  5 2016 10:34AM', 'May  5 2016 11:03AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '320551955', 'May 12 1968 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Sep  3 2017  5:40PM', 'Oct  4 2017  5:06PM', '', 'TASMC BC/GYN Gemzar d1,8 q21d - Version 1', 'Oct 26 2017  5:41PM', 'Jan  7 2018  3:35PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '321440943', 'Jan 29 1947 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Version 1', 'Nov  1 2015  6:38PM', 'Nov 16 2015  3:19AM', '', 'TASMC GI FOLFIRI (Inpatient) - Version 1', 'Jan 10 2016  6:14PM', 'Mar  6 2016  9:01PM', '', 'TASMC - GI FOLFOX - Inpatient - Version 1', 'May  8 2016  7:12PM', 'May 25 2016 12:30AM', '','lung or pancreas'
INSERT INTO #excel_data select '321860538', 'Sep 17 1946 12:00AM', 'pancreatic cancer', 'TASMC GI Pancras  FOLFIRINOX modified (Inpatient) - Version 2', 'Apr  3 2018  2:47PM', 'Oct 12 2018  9:02PM', '', 'TASMC BC/GYN Gemzar - Version 1', 'Nov  8 2018  2:15PM', 'Dec 12 2018  2:58PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '323323170', 'Jan 30 1950 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Alimta - Version 1', 'Oct 29 2017 12:00AM', 'Nov 19 2017 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '323387605', 'Feb  2 1943 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Jul 30 2017  2:46PM', 'Oct 29 2017  1:14PM', '', 'TASMC BC Taxol+Carboplatin weekly - Version 1', 'Jan  1 2018  1:10PM', 'Feb  5 2018  3:47PM', '', 'TASMC NSCLC DURVALUMAB 10mg  /kg  q2week - Version 1', 'Aug 14 2018  2:43PM', 'Dec  5 2018 10:40AM', '','lung or pancreas'
INSERT INTO #excel_data select '323411702', 'Dec  9 1938 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Jan 17 2016 12:06PM', 'Jun 21 2016  9:30AM', '', 'TASMC ZOMERA - Version 2', 'Jan 17 2016 12:06PM', 'Jun 21 2016 10:02AM', '', 'TASMC ZOMERA - Version 2', 'Aug  3 2016  9:44AM', 'Apr 25 2017  8:46AM', '','lung or pancreas'
INSERT INTO #excel_data select '323480830', 'Feb 21 1958 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'May 27 2018 12:00AM', 'Jul 29 2018 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '324485697', 'Nov 25 1962 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jan 10 2018 10:44AM', 'Mar 29 2018  8:21PM', '', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Apr 17 2018 11:28AM', 'May 15 2018  3:03PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '328741764', 'Mar  5 1949 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Dec 27 2015 11:00AM', 'Apr 17 2016  2:59PM', '', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Apr 29 2018 12:31PM', 'Dec  9 2018 10:20AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '332319094', 'Apr 26 1944 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Feb  1 2018 10:24AM', 'Jun  5 2018  2:24PM', '', 'TASMC AREDIA - Version 4', 'Mar 15 2018  1:40PM', 'Apr 15 2018  3:14PM', '', 'TASMC NSCLC OPDIVO 3mg/kg q2week - Version 1', 'Jul 29 2018  1:59PM', 'Aug 12 2018  2:24PM', '','lung or pancreas'
INSERT INTO #excel_data select '333784163', 'Jan 31 1945 12:00AM', 'pancreatic cancer', 'TASMC GI Panceras FOLFIRINOX - Version 4', 'Jul 31 2017 11:37AM', 'Sep 13 2017  4:30PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '336553649', 'Jul 28 1965 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Dec 12 2016 12:40PM', 'Feb 13 2017  3:31PM', '', 'TASMC ZOMERA - Version 2', 'Feb 22 2017  2:35PM', 'Dec 19 2017  7:41PM', '', 'TASMC AREDIA - Version 4', 'Jan 31 2017 12:43PM', 'Jan 31 2017 12:43PM', '','lung or pancreas'
INSERT INTO #excel_data select '337863104', 'May 15 1941 12:00AM', 'pancreatic cancer', 'TASMC GI Pancreas Folfirinox 80% - Version 2', 'Aug 29 2016  1:30PM', 'Aug 29 2016  4:02PM', '', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Oct 26 2016  2:58PM', 'Nov 13 2016  9:24PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '340885995', 'Apr  6 1948 12:00AM', 'pancreatic cancer', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Oct 28 2015  3:59PM', 'Apr 27 2016  1:00PM', '', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'May 11 2016  2:23PM', 'Oct 14 2016  3:20PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '341016665', 'Dec  6 1949 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Version 3', 'May 30 2016  2:38PM', 'Jul 15 2016  7:06PM', '', 'TASMC GI Gemzar  3/4 - Version 1', 'Aug  2 2016 12:28PM', 'Sep 13 2016 12:37PM', '', 'TASMC BC Taxol (3/4) - Version 1', 'Oct  6 2016  1:55PM', 'Dec 26 2016  3:25PM', '','lung or pancreas'
INSERT INTO #excel_data select '341314557', 'Feb 21 1949 12:00AM', 'adenocarcinoma of lung', 'TASMC  GI/LUNG/all KEYTRUDA  200mg q21d - Version 1', 'Nov 28 2017 10:45AM', 'Apr 12 2018  1:45PM', '', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'May 28 2018 12:30PM', 'Jul 12 2018  1:13PM', '', 'TASMC NSCLC Alimta - Version 1', 'Aug 22 2018 10:53AM', 'Oct 21 2018 12:52PM', '','lung or pancreas'
INSERT INTO #excel_data select '342623691', 'Feb 20 1961 12:00AM', 'pancreatic cancer', 'TASMC GI Panceras FOLFIRINOX - Version 4', 'Mar 27 2018 10:40AM', 'Jul 17 2018  5:32PM', '', 'TASMC GI Folfox 6 (infuser) - Version 3', 'Aug  7 2018  2:47PM', 'Oct  2 2018  2:30PM', '', 'TASMC GI Gemzar  3/4 - Version 1', 'Dec 12 2018  2:56PM', 'Dec 12 2018  2:56PM', '','lung or pancreas'
INSERT INTO #excel_data select '345077598', 'Jul  1 1941 12:00AM', 'pancreatic cancer', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Mar 18 2018  6:04PM', 'Mar 18 2018  8:16PM', '', 'TASMC GI Panceras FOLFIRINOX - Version 4', 'Apr  5 2018  1:44PM', 'May 19 2018 12:16AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '345240261', 'May 17 1980 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jul 17 2018  5:28PM', 'Aug 29 2018 11:40PM', '', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Nov  7 2018  4:00PM', 'Dec 10 2018  4:15PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '410052781', 'Feb 15 1958 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Apr 14 2017  2:07PM', 'Aug 20 2017 10:15PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
INSERT INTO #excel_data select '410215602', 'Jul 12 1948 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Dec  7 2018 12:00AM', 'Dec  7 2018 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '','lung or pancreas'
--Test the data
--select * from #excel_data e  where e.Id is null
--select id, count(1) from #excel_data e  group by id having count(1)>1
--select * from #excel_data e 

/*
select e.date_of_first_treatment_first_line_treatment, 
DATEADD(day,3,CONVERT(datetime, e.date_of_first_treatment_first_line_treatment))  AS DateAdd 
from #excel_data e
*/

------------------------------------------------------------------------------------------------------------
----------------------------------EXCEL DATA                ------------------------------------------------
------------------------------------------------------------------------------------------------------------
/*
--if the first & last treatment dates (NOT datetime) are the same, we want to get the same casenum for first & last casenums
UPDATE #excel_data
SET date_of_last_treatment = CONVERT(datetime, [date_of_first_treatment])
FROM #excel_data
WHERE CONVERT(date, [date_of_last_treatment])= CONVERT(date, [date_of_first_treatment])
*/

--Find the cycles - run in Chameleon_MRR
/*
SELECT *   FROM sys.tables t
where [object_id] in (
  SELECT object_id
  FROM sys.columns
  --where name = 'Clinic_Necessary')
  where name like lower('%cycle%'))
    and t.name like lower('%Cato%')

	Chameleon_MRR.[dbo].[Chameleon_MRR_CatoTherapyPlan].Cycles_Performed_Today





select  
fact.id
,ctp.Cycles_Performed_Today
,ctp.[Protocol_Name]
,*
from Chameleon_MRR.[dbo].[Chameleon_MRR_CatoTherapyPlan] ctp
              join
              DWH_PRD.dbo.Chameleon_Fact_MedicalRecords mr
              on ctp.Medical_Record=mr.Medical_Record
              join
              Chameleon_MRR.[dbo].[Chameleon_MRR_CatoPlanMedicine] cpm
              on ctp.Cato_TherapyPlan_ID=cpm.Cato_TherapyPlan_ID
              join
              Chameleon_MRR.[dbo].[Chameleon_MRR_CatoMedExecution] cme
              on cpm.Cato_Med_Id=cme.Cato_Med_Id
                     and cpm.Cato_TherapyPlan_ID=cme.Cato_TherapyPlan_ID

              join
              bi_dev..[CLN_Ishpuzim_Indicators] ind
              on ind.PatNum=mr.PatNum

			  join
              #excel_data fact
              on fact.id = ind.PatId 
where fact.id = '57675571'

order by fact.id,ctp.[Medical_Record],StartDate asc

*/
--select * from Chameleon_Fact_MedicalRecords
------------------------------------------------------------------------------------------------------------

--Find the cycles
begin try drop table #cycles; end try begin catch end catch;
select  
		fact.id
		,ctp.Medical_Record
		,ctp.[Protocol_Name]
		,min(cme.Giving_Date) as date_of_first_treatment --for each cycle
		,max(cme.Giving_Date) as date_of_last_treatment --for each cycle
		,max(ctp.Cycles_Performed_Today) as cycle
		--,ROW_NUMBER() OVER( PARTITION BY fact.id, ctp.Medical_Record,max(cme.Giving_Date)  order by max(cme.Giving_Date) ) rnk
		,ROW_NUMBER() OVER( PARTITION BY fact.id  order by max(cme.Giving_Date) ) rnk

INTO #cycles
from Chameleon_MRR.[dbo].[Chameleon_MRR_CatoTherapyPlan] ctp
              join
              DWH_PRD.dbo.Chameleon_Fact_MedicalRecords mr
              on ctp.Medical_Record=mr.Medical_Record
              join
              Chameleon_MRR.[dbo].[Chameleon_MRR_CatoPlanMedicine] cpm
              on ctp.Cato_TherapyPlan_ID=cpm.Cato_TherapyPlan_ID
              join
              Chameleon_MRR.[dbo].[Chameleon_MRR_CatoMedExecution] cme
              on cpm.Cato_Med_Id=cme.Cato_Med_Id
                     and cpm.Cato_TherapyPlan_ID=cme.Cato_TherapyPlan_ID

              join
              bi_dev..[CLN_Ishpuzim_Indicators] ind
              on ind.PatNum=mr.PatNum

			  join
              #excel_data fact
              on fact.id = ind.PatId 

			  
--where fact.id = '3838125'
group by
		fact.id
		,ctp.Medical_Record
		,ctp.[Protocol_Name]
		--,cme.Giving_Date

--order by fact.id,ctp.[Medical_Record],cme.Giving_Date,ctp.[Protocol_Name] asc
order by fact.id,ctp.[Medical_Record],ctp.[Protocol_Name] asc

--select * from #cycles c where c.id = '57675571'  --c.id = 10080281 
--select * from #cycles c where c.rnk is null
--select max(c.rnk) from #cycles c  
/*

/*
select * 
from #cycles 
order by id,  date_of_first_treatment ,date_of_last_treatment , rnk
--order by id, Medical_Record, date_of_first_treatment ,date_of_last_treatment , rnk
*/ 

--select *  from #cycles where #cycles.rnk=1

select id, date_of_last_treatment , count(rnk) cnt
from #cycles
where #cycles.rnk=1
group by id, date_of_last_treatment 
having  count(rnk)>1
*/

--------------------------------------------------------------------------------
--Build each cycle's data
--#cycles_per_id_per_protocol_first_line_treatment
begin try drop table #cycles_per_id_per_protocol_first_line_treatment; end try begin catch end catch;
select 
		fact.id
		,c.Medical_Record
		,c.Protocol_Name
		,c.date_of_first_treatment 
		,c.date_of_last_treatment 
		,c.cycle as number_of_treatments_per_line_treatment
		,c.rnk
into #cycles_per_id_per_protocol_first_line_treatment
from #excel_data fact
			  left join #cycles c
              --on fact.id = c.Id and c.rnk=1
			  
			  -- changed 13.5.19 in order to take the protocol provided by Renana accordig to the dates Renana provided in the Excel
			  on fact.id = c.Id 
			  --and fact.date_of_first_treatment_first_line_treatment = c.date_of_first_treatment 
			  and CONVERT(date, fact.date_of_first_treatment_first_line_treatment) = CONVERT(date, c.date_of_first_treatment) 
			  and lower(fact.first_line_regimen) = lower(c.Protocol_Name)
			  --and c.rnk=1

--select c.id, count(c.Protocol_Name) cnt from #cycles_per_id_per_protocol_first_line_treatment c group by c.id having count(c.Protocol_Name)=0
--select c.* from #cycles_per_id_per_protocol_first_line_treatment c where c.id = '323411702'
--select c.* from #cycles_per_id_per_protocol_first_line_treatment c where c.id = '1130939'
-----------------
--#cycles_per_id_per_protocol_second_line_treatment
begin try drop table #cycles_per_id_per_protocol_second_line_treatment; end try begin catch end catch;
select 
		fact.id
		,c.Medical_Record
		,c.Protocol_Name
		,c.date_of_first_treatment 
		,c.date_of_last_treatment 
		,c.cycle as number_of_treatments_per_line_treatment
		,c.rnk
into #cycles_per_id_per_protocol_second_line_treatment
from #excel_data fact
			  left join #cycles c
              --on fact.id = c.Id and c.rnk=2

			  -- changed 13.5.19 in order to take the protocol provided by Renana accordig to the dates Renana provided in the Excel
			  on fact.id = c.Id 
			  and CONVERT(date, fact.date_of_first_treatment_second_line_treatment) = CONVERT(date, c.date_of_first_treatment)
			  and lower(fact.second_line_regimen) = lower(c.Protocol_Name)
			  --and c.rnk=2

--where c.rnk=2

--select c.id, count(c.Protocol_Name) cnt from #cycles_per_id_per_protocol_second_line_treatment c group by c.id having count(c.Protocol_Name)=0
--select c.* from #cycles_per_id_per_protocol_second_line_treatment c where c.id = '323411702'

--#cycles_per_id_per_protocol_third_line_treatment
begin try drop table #cycles_per_id_per_protocol_third_line_treatment; end try begin catch end catch;
select  
		fact.id
		,c.Medical_Record
		,c.Protocol_Name
		,c.date_of_first_treatment 
		,c.date_of_last_treatment 
		,c.cycle as number_of_treatments_per_line_treatment
		,c.rnk
into #cycles_per_id_per_protocol_third_line_treatment
from #excel_data fact
			  left join #cycles c
              --on fact.id = c.Id and c.rnk=3

			  -- changed 13.5.19 in order to take the protocol provided by Renana accordig to the dates Renana provided in the Excel
			  on fact.id = c.Id 
			  and CONVERT(date, fact.date_of_first_treatment_third_line_treatment) = CONVERT(date, c.date_of_first_treatment)
			  and lower(fact.third_line_regimen) = lower(c.Protocol_Name)
			  --and c.rnk=3

--select c.id, count(c.Protocol_Name) cnt from #cycles_per_id_per_protocol_third_line_treatment c group by c.id having count(c.Protocol_Name)=0
--select * from #cycles_per_id_per_protocol_first_line_treatment
--select * from #cycles_per_id_per_protocol_second_line_treatment
--select * from #cycles_per_id_per_protocol_third_line_treatment
--select * from  #excel_data fact
/*
select * 
from #cycles_per_id_per_protocol_third_line_treatment 
order by id, Medical_Record, date_of_first_treatment ,date_of_last_treatment 
*/ 
--------------------------------------------------------------------------------
--Main population 
--------------------------------------------------------------------------------
--Find first_line_treatment - first treatement's casenum
-- הגדרת אוכלוסיה ראשית ע"פ קוד קובץ מהלקוח
begin try drop table #main_pop_round_one_first; end try begin catch end catch;
SELECT distinct A.* 
--,ROW_NUMBER() OVER( PARTITION BY id, CASENUM order by A.BeginDate+A.BeginTime ) rnk
INTO #main_pop_round_one_first
FROM ( 
select   'Renana' AS 'DataSource'
	 ,'round_one_first' AS 'round'
	  ,fact.[ID]
      ,fact.[date_of_birth]
      ,fact.[type_of_cancer]
      ,fact.[first_line_regimen]
      ,CONVERT(datetime, fact.[date_of_first_treatment_first_line_treatment])  as date_of_first_treatment_first_line_treatment  -- was date_of_first_treatment - 7.5.19
	  ,CONVERT(datetime, fact.[date_of_last_treatment_first_line_treatment])  as date_of_last_treatment_first_line_treatment -- was date_of_last_treatment - 7.5.19

	  --,fact.[number_of_treatments_first_line_treatment] --added 7.5.19
    

      ,fact.[second_line_regimen]
      ,CONVERT(datetime,fact.[date_of_first_treatment_second_line_treatment]) as date_of_first_treatment_second_line_treatment
      ,CONVERT(datetime,fact.[date_of_last_treatment_second_line_treatment]) as date_of_last_treatment_second_line_treatment
      --,fact.[number_of_treatments_second_line_treatment]--added 7.5.19
      ,fact.[third_line_regimen]
      ,CONVERT(datetime,fact.[date_of_first_treatment_third_line_treatment]) as date_of_first_treatment_third_line_treatment
      ,CONVERT(datetime,fact.[date_of_last_treatment_third_line_treatment]) as date_of_last_treatment_third_line_treatment
	  --,fact.[number_of_treatments_third_line_treatment]--added 7.5.19
	  ,dim_sex.Sextype as sex
	  ,ii.EnterDate
	   ,ii.CaseNum 

		--,DATEDIFF(hour, ii.EnterDate, fact.date_of_first_treatment_first_line_treatment) HourDifference_first -- changed 7.5.19
	 -- ,DATEDIFF(hour, ii.EnterDate, fact.date_of_first_treatment) HourDifference_first -- changed 7.5.19
	  --,ROW_NUMBER() OVER(PARTITION BY fact.id ORDER BY abs(DATEDIFF(hour, ii.EnterDate, fact.date_of_first_treatment_first_line_treatment)) ASC) AS row_num
	 -- ,ROW_NUMBER() OVER(PARTITION BY fact.id ORDER BY abs(DATEDIFF(hour, ii.EnterDate, fact.date_of_first_treatment)) ASC) AS row_num
	
	 
	,DATEDIFF(hour, fact.date_of_first_treatment_first_line_treatment, ii.EnterDate) HourDifference_first -- changed 13.5.19
  	,ROW_NUMBER() OVER(PARTITION BY fact.id ORDER BY abs(DATEDIFF(hour, fact.date_of_first_treatment_first_line_treatment, ii.EnterDate)) ASC) AS row_num -- changed 13.5.19


FROM   #excel_data fact-- טבלה מהלקוח
	left JOIN bi_dev..[CLN_Ishpuzim_Indicators] ii
	ON  fact.id = ii.PatId --or fact.id = DIM_CASES.PatIdNum
	
	join DWH_PRD..PRD_DIM_SEX dim_sex
		on dim_sex.SexCode = ii.SexCode

where ii.CaseNum is not null


)A
where A.row_num=1


/* 
select * from #main_pop_round_one_first --where casenum  = 0035779391 --28018745
select * from #main_pop_round_one_last --where casenum  = 0035779391 
select * from  bi_dev..[CLN_Ishpuzim_Indicators] ii where PatId = 23896186

select * 
	  ,abs(DATEDIFF(hour, ii.EnterDate, '2018-02-19 14:41:00.000')) abs_dif
	  ,DATEDIFF(hour, ii.EnterDate, '2018-02-19 14:41:00.000') HourDifference_first
	  ,ROW_NUMBER() OVER(PARTITION BY ii.PatId ORDER BY abs(DATEDIFF(hour, ii.EnterDate, '2018-02-19 14:41:00.000')) ASC) AS row_num
	  from  bi_dev..[CLN_Ishpuzim_Indicators] ii 
	  where PatId = 23896186
	 -- and  row_num=1
	  order by abs_dif asc
*/
--select id, count(1) from #main_pop_round_one_first e  group by id having count(1)>1
--select casenum, count(1) from #main_pop_round_one_first e  group by casenum having count(1)>1

--select * from #main_pop_round_one_first order by id
--select id, count(casenum) cnt from #main_pop_round_one_first where id = 10080281  group by id having count(casenum)>1
--select * from #main_pop_round_one_first where id = 1130939 
--select * from #main_pop_round_one_first where id = 50306810 
--select * from #main_pop_round_one_first where HourDiff >72
--select top 100 * from DWH_PRD..PRD_DIM_CASES DIM_CASES
--------------------------------------------------------------------------------
--Find first_line_treatment - last treatement's casenum
begin try drop table #main_pop_round_one_last; end try begin catch end catch;
SELECT distinct A.* 
--,ROW_NUMBER() OVER( PARTITION BY id, CASENUM order by A.BeginDate+A.BeginTime ) rnk
INTO #main_pop_round_one_last
FROM ( 
select   'Renana' AS 'DataSource'
	 ,'round_one_last' AS 'round'
	  ,fact.[ID]
      ,fact.[date_of_birth]
      ,fact.[type_of_cancer]
      ,fact.[first_line_regimen]
	  
      --,CONVERT(datetime, fact.[date_of_first_treatment]) as date_of_first_treatment
      --,CONVERT(datetime, fact.[date_of_last_treatment]) as date_of_last_treatment

	  ,CONVERT(datetime, fact.[date_of_first_treatment_first_line_treatment]) as date_of_first_treatment_first_line_treatment -- was date_of_first_treatment - 7.5.19
	  ,CONVERT(datetime, fact.[date_of_last_treatment_first_line_treatment])  as date_of_last_treatment_first_line_treatment -- was date_of_last_treatment - 7.5.19

	 -- ,fact.[number_of_treatments_first_line_treatment] --added 7.5.19
      ,fact.[second_line_regimen]
      ,CONVERT(datetime,fact.[date_of_first_treatment_second_line_treatment]) as date_of_first_treatment_second_line_treatment
      ,CONVERT(datetime,fact.[date_of_last_treatment_second_line_treatment]) as date_of_last_treatment_second_line_treatment
      ,fact.[number_of_treatments_second_line_treatment]
      ,fact.[third_line_regimen]
      ,CONVERT(datetime,fact.[date_of_first_treatment_third_line_treatment]) as date_of_first_treatment_third_line_treatment
      ,CONVERT(datetime,fact.[date_of_last_treatment_third_line_treatment]) as date_of_last_treatment_third_line_treatment
	 -- ,fact.[number_of_treatments_third_line_treatment]  --added 7.5.19
	  ,dim_sex.Sextype as sex
	  ,ii.EnterDate
	   ,ii.CaseNum 

	 -- ,DATEDIFF(hour, ii.EnterDate, fact.date_of_last_treatment_first_line_treatment) HourDifference_last
	  --,DATEDIFF(hour, ii.EnterDate, fact.date_of_last_treatment) HourDifference_last
	  --,ROW_NUMBER() OVER(PARTITION BY fact.id ORDER BY abs(DATEDIFF(hour, ii.EnterDate, fact.date_of_last_treatment_first_line_treatment)) ASC) AS row_num
	  --,ROW_NUMBER() OVER(PARTITION BY fact.id ORDER BY abs(DATEDIFF(hour, ii.EnterDate, fact.date_of_last_treatment)) ASC) AS row_num
 
 ,DATEDIFF(hour, fact.date_of_last_treatment_first_line_treatment, ii.EnterDate ) HourDifference_last -- changed 13.5.19
 ,ROW_NUMBER() OVER(PARTITION BY fact.id ORDER BY abs(DATEDIFF(hour, fact.date_of_last_treatment_first_line_treatment, ii.EnterDate)) ASC) AS row_num -- changed 13.5.19

FROM   #excel_data fact-- טבלה מהלקוח
	
	left JOIN bi_dev..[CLN_Ishpuzim_Indicators] ii
	ON  fact.id = ii.PatId --or fact.id = DIM_CASES.PatIdNum
	
	join DWH_PRD..PRD_DIM_SEX dim_sex
		on dim_sex.SexCode = ii.SexCode

where ii.CaseNum is not null

)A
where A.row_num=1

--select * from #main_pop_round_one_last
--select id, count(1) from #main_pop_round_one_last e  group by id having count(1)>1
--select casenum, count(1) from #main_pop_round_one_last e  group by casenum having count(1)=1

--select * from #main_pop_round_one_last where id = 51210664 
--------------------------------------------------------------------------------combine first & last treatement's casenum
/*
begin try drop table #main_pop_round_one_all; end try begin catch end catch;
SELECT distinct A.* 
INTO #main_pop_round_one_all
from 
(
select * from #main_pop_round_one_first
union
select * from #main_pop_round_one_last

)
A
--select * from #main_pop_round_one_all where id = 1130939 
*/
----------------------------------------------------------------------------
--vital signs round_one_first
----------------------------------------------------------------------------
--select * from #vit_signs_round_one_first
--Amir - BMI from Namer
begin try drop table #vit_signs_round_one_first; end try begin catch end catch;
select a.*,CAST(Parameter_EnteredValue AS NUMERIC(8,2)) Parameter_CastedValue
--row_num should be performed on the unioned data set from namer & chameleon
,ROW_NUMBER() OVER( PARTITION BY a.casenum,a.Parameter_Name order by abs(DATEDIFF(hour, a.vit_sig_date, a.date_of_first_treatment_first_line_treatment)) ) as row_num -- becuase of the abs, the order of the dates is irrlelevant
--,ROW_NUMBER() OVER( PARTITION BY a.casenum,a.Parameter_Name order by abs(DATEDIFF(hour, a.vit_sig_date, a.date_of_first_treatment)) ) as row_num

INTO #vit_signs_round_one_first
from 
(
	SELECT
	        'Namer' AS 'DataSourceVit',
			main.ID, 
			main.CaseNum, 
			sig_namer.Parameter_Name, 
			sig_namer.Parameter_EnteredValue, 
			sig_namer.MONITOR_DATE as vit_sig_date,
			main.date_of_first_treatment_first_line_treatment,
			--main.date_of_first_treatment,
			
			-- changed 13.5.19 in order to capture the correct datediff (changed so treatment is first date in the datediff function)
	        --DATEDIFF(hour, sig_namer.MONITOR_DATE, main.date_of_first_treatment_first_line_treatment) AS HourDiff
			DATEDIFF(hour, main.date_of_first_treatment_first_line_treatment, sig_namer.MONITOR_DATE) AS HourDiff
			
			--DATEDIFF(hour, sig_namer.MONITOR_DATE, main.date_of_first_treatment) AS HourDiff
	--,ROW_NUMBER() OVER( PARTITION BY main.casenum,sig_namer.Parameter_Name order by DATEDIFF(hour, sig_namer.MONITOR_DATE, main.date_of_first_treatment) ) as row_num
	FROM #main_pop_round_one_first main --#main_pop_round_one_all main
	left join bi_dev..CLN_Vital_Signals_namer sig_namer
	on main.CaseNum = sig_namer.CaseNum
 
	
	and (sig_namer.Parameter_Name = 'BMI' or sig_namer.Parameter_Name = 'Height' or sig_namer.Parameter_Name = 'Weight')
	--and DATEDIFF(hour, sig_namer.MONITOR_DATE, main.date_of_first_treatment)>=0 -- the required test is to be perfromed prior to the treatment
	--or DATEDIFF(hour, sig_namer.MONITOR_DATE, main.date_of_first_treatment) between -72 and 0 --or the required test was perfromed three days after the treatment
	
	-- changed 13.5.19 in order to capture the correct datediff (changed so treatment is first date in the datediff function)
	--and DATEDIFF(hour, sig_namer.MONITOR_DATE, main.date_of_first_treatment_first_line_treatment) between -72 and 72 --or the required test was perfromed three days after the treatment
	and sig_namer.MONITOR_DATE <= DATEADD(day,3,CONVERT(datetime, main.date_of_first_treatment_first_line_treatment))

/*
select e.date_of_first_treatment_first_line_treatment, 
DATEADD(day,3,CONVERT(datetime, e.date_of_first_treatment_first_line_treatment))  AS DateAdd 
from #excel_data e
*/
--	and DATEDIFF(hour, sig_namer.MONITOR_DATE, main.date_of_first_treatment) between -72 and 72 --or the required test was perfromed three days after the treatment

	where main.id is not null
	and sig_namer.Parameter_Name is not null
	--where main.id  = 1130939


--) a
--group by a.CaseNum
Union

--case num existing in chameleon but not in namer
  SELECT 
		'Chameleon' AS 'DataSourceVit',
		 main.ID,
		main.CaseNum,
		c.Parameter_Name,
		c.Parameter_EnteredValue,
		c.MONITOR_DATE as vit_sig_date,
		main.date_of_first_treatment_first_line_treatment,
		--main.date_of_first_treatment,
		DATEDIFF(hour, c.MONITOR_DATE, main.date_of_first_treatment_first_line_treatment) AS HourDiff
		--DATEDIFF(hour, c.MONITOR_DATE, main.date_of_first_treatment) AS HourDiff


	FROM #main_pop_round_one_first main --#main_pop_round_one_all main

	left join bi_dev..CLN_Vital_Signals_chameleon c on main.CaseNum = c.CaseNum
	and (c.Parameter_Name = 'BMI' or c.Parameter_Name = 'Height' or c.Parameter_Name = 'Weight')
	
	-- changed 13.5.19 in order to capture the correct datediff (changed so treatment is first date in the datediff function)
	--and DATEDIFF(hour, c.MONITOR_DATE, main.date_of_first_treatment_first_line_treatment) between -72 and 72 --or the required test was perfromed three days after the treatment
	and c.MONITOR_DATE <= DATEADD(day,3,CONVERT(datetime, main.date_of_first_treatment_first_line_treatment))



	left join bi_dev..CLN_Vital_Signals_namer n 	on c.CaseNum = n.CaseNum
	--where c.Parameter_Name = 'BMI'
	
	--and DATEDIFF(hour, sig_namer.MONITOR_DATE, main.date_of_first_treatment)>=0 -- the required test is to be perfromed prior to the treatment
	--or DATEDIFF(hour, sig_namer.MONITOR_DATE, main.date_of_first_treatment) between -72 and 0 --or the required test was perfromed three days after the treatment

	where
	n.CaseNum is null
	and c.CaseNum is not null
	and c.Parameter_Name is not null
	-- and (c.Parameter_Name = 'BMI' or c.Parameter_Name = 'Height' or c.Parameter_Name = 'Weight')
	--and DATEDIFF(hour, c.MONITOR_DATE, main.date_of_first_treatment)>=0 -- the required test is to be perfromed prior to the treatment - 
 	--or DATEDIFF(hour, c.MONITOR_DATE, main.date_of_first_treatment) between-72 and 0 --or the required test was perfromed three days after the treatment
	

	)a
	
--select * from #vit_signs_round_one_first  order by id, parameter_name 
--select * from #vit_signs_round_one_first where id=  50072222 order by id, parameter_name 
--select id, casenum, count(parameter_name) cnt from #vit_signs_round_one_first group by id, casenum having count(parameter_name) >4
--select * from #vit_signs_round_one_first where datasourcevit = 'Namer' and  parameter_name is not null

--select id, count(1) from #vit_signs_round_one_first group by id order by count(1) desc

	--select ID, count(1) cnt from #vit_signs_round_one_first group by id

	--select * from #vit_signs_round_one_first where id = 10210193 
	--select * from #vit_signs_round_one_first where datasourcevit = 'Namer'

	--select * from #vit_signs_round_one_first where hourdiff<0
	--select * from #vit_signs_round_one_last where hourdiff<0
	-- select * from #vit_signs_round_one_first where casenum='0011653944' order by casenum, row_num
	--select * from #vit_signs_round_one_first where  row_num>1 --casenum='0011653944'
	
	--select * from #vit_signs_round_one_first where  row_num=1  order by casenum--add this constraint to final table
----------------------------------------------------------------------------
--vital signs round_one_last

----------------------------------------------------------------------------
--Amir - BMI from Namer
begin try drop table #vit_signs_round_one_last; end try begin catch end catch;
select a.*,CAST(Parameter_EnteredValue AS NUMERIC(8,2)) Parameter_CastedValue
--row_num should be performed on the unioned data set from namer & chameleon
,ROW_NUMBER() OVER( PARTITION BY a.casenum,a.Parameter_Name order by abs(DATEDIFF(hour, a.vit_sig_date, a.date_of_last_treatment_first_line_treatment)) ) as row_num -- becuase of the abs, the order of the dates is irrlelevant
--,ROW_NUMBER() OVER( PARTITION BY a.casenum,a.Parameter_Name order by abs(DATEDIFF(hour, a.vit_sig_date, a.date_of_last_treatment)) ) as row_num

INTO #vit_signs_round_one_last
from 
(
	SELECT
	        'Namer' AS 'DataSourceVit',
			main.ID, 
			main.CaseNum, 
			sig_namer.Parameter_Name, 
			sig_namer.Parameter_EnteredValue, 
			sig_namer.MONITOR_DATE as vit_sig_date, 
			main.date_of_last_treatment_first_line_treatment,
			--main.date_of_last_treatment,

			-- changed 13.5.19 in order to capture the correct datediff (changed so treatment is first date in the datediff function)
	        -- DATEDIFF(hour, sig_namer.MONITOR_DATE, main.date_of_last_treatment_first_line_treatment) AS HourDiff
			DATEDIFF(hour, main.date_of_last_treatment_first_line_treatment, sig_namer.MONITOR_DATE) AS HourDiff

	       
			--DATEDIFF(hour, sig_namer.MONITOR_DATE, main.date_of_last_treatment) AS HourDiff
	--,ROW_NUMBER() OVER( PARTITION BY main.casenum,sig_namer.Parameter_Name order by DATEDIFF(hour, sig_namer.MONITOR_DATE, main.date_of_first_treatment) ) as row_num
	FROM #main_pop_round_one_last main -- #main_pop_round_one_all main
	left join bi_dev..CLN_Vital_Signals_namer sig_namer
	on main.CaseNum = sig_namer.CaseNum
 	and (sig_namer.Parameter_Name = 'BMI' or sig_namer.Parameter_Name = 'Height' or sig_namer.Parameter_Name = 'Weight')
	--and DATEDIFF(hour, sig_namer.MONITOR_DATE, main.date_of_first_treatment)>=0 -- the required test is to be perfromed prior to the treatment
	--or DATEDIFF(hour, sig_namer.MONITOR_DATE, main.date_of_first_treatment) between -72 and 0 --or the required test was perfromed three days after the treatment
	
	-- changed 13.5.19 in order to capture the correct datediff (changed so treatment is first date in the datediff function)
	--and DATEDIFF(hour, sig_namer.MONITOR_DATE, main.date_of_last_treatment_first_line_treatment) between -72 and 72 --or the required test was perfromed three days after the treatment
	and sig_namer.MONITOR_DATE <= DATEADD(day,3,CONVERT(datetime, main.date_of_last_treatment_first_line_treatment))
	
	
	
	--and DATEDIFF(hour, sig_namer.MONITOR_DATE, main.date_of_last_treatment) between -72 and 72 --or the required test was perfromed three days after the treatment

	where main.id is not null
	and sig_namer.Parameter_Name is not null
	--where main.id  = 1130939


--) a
--group by a.CaseNum
Union

--case num existing in chameleon but not in namer
  SELECT 
		'Chameleon' AS 'DataSourceVit',
		 main.ID,
		main.CaseNum,
		c.Parameter_Name,
		c.Parameter_EnteredValue,
		c.MONITOR_DATE as vit_sig_date,
		main.date_of_last_treatment_first_line_treatment,
		--main.date_of_last_treatment,


			-- changed 13.5.19 in order to capture the correct datediff (changed so treatment is first date in the datediff function)
	        --DATEDIFF(hour, c.MONITOR_DATE, main.date_of_last_treatment_first_line_treatment) AS HourDiff
			DATEDIFF(hour, main.date_of_last_treatment_first_line_treatment, c.MONITOR_DATE) AS HourDiff

		
		--DATEDIFF(hour, c.MONITOR_DATE, main.date_of_last_treatment) AS HourDiff


	FROM #main_pop_round_one_last main 
	
	left join bi_dev..CLN_Vital_Signals_chameleon c on main.CaseNum = c.CaseNum
	and (c.Parameter_Name = 'BMI' or c.Parameter_Name = 'Height' or c.Parameter_Name = 'Weight')
	
	
		-- changed 13.5.19 in order to capture the correct datediff (changed so treatment is first date in the datediff function)
	--and DATEDIFF(hour, c.MONITOR_DATE, main.date_of_last_treatment_first_line_treatment) between -72 and 72 --or the required test was perfromed three days after the treatment
	and c.MONITOR_DATE <= DATEADD(day,3,CONVERT(datetime, main.date_of_last_treatment_first_line_treatment))


	left join bi_dev..CLN_Vital_Signals_namer n 	on c.CaseNum = n.CaseNum
	--where c.Parameter_Name = 'BMI'
	
	--and DATEDIFF(hour, sig_namer.MONITOR_DATE, main.date_of_first_treatment)>=0 -- the required test is to be perfromed prior to the treatment
	--or DATEDIFF(hour, sig_namer.MONITOR_DATE, main.date_of_first_treatment) between -72 and 0 --or the required test was perfromed three days after the treatment

	where
	n.CaseNum is null
	and c.CaseNum is not null
	and c.Parameter_Name is not null
	-- and (c.Parameter_Name = 'BMI' or c.Parameter_Name = 'Height' or c.Parameter_Name = 'Weight')
	--and DATEDIFF(hour, c.MONITOR_DATE, main.date_of_first_treatment)>=0 -- the required test is to be perfromed prior to the treatment - 
 	--or DATEDIFF(hour, c.MONITOR_DATE, main.date_of_first_treatment) between-72 and 0 --or the required test was perfromed three days after the treatment
	

	)a
--where row_num=1

--select* from #vit_signs_round_one_last  where  id = 51210664
--select * from #vit_signs_round_one_last where id =15428428 order by id, parameter_name 
--select id, casenum, count(parameter_name) cnt from #vit_signs_round_one_last group by id, casenum having count(parameter_name) >4
--select * from #vit_signs_round_one_last where datasourcevit = 'Namer' and  parameter_name is not null
--select id, count(1) cnt from #vit_signs_round_one_last group by id having count(1)>1


--select* from #vit_signs_round_one_last  where id = 15428428 --and row_num>1
----------------------------------------------------------------------------
--#vit_signs_round_one_all_flat

----------------------------------------------------------------------------
begin try drop table #vit_signs_round_one_all_flat; end try begin catch end catch;
--#vit_signs_round_one_all_flat will be constracted by breaking #vit_signs_round_one_first + #vit_signs_round_one_last by fields & re-constracting it
--this will give 1 record per id
select A.*
into #vit_signs_round_one_all_flat
from 
	(SELECT 
		main_pop_round_one_first.id,
		main_pop_round_one_first.casenum as round_one_first_casenum,
		main_pop_round_one_last.round_one_last_casenum,

		main_pop_round_one_first.date_of_first_treatment_first_line_treatment,
		--main_pop_round_one_first.date_of_first_treatment,
		main_pop_round_one_last.date_of_last_treatment_first_line_treatment,
		--main_pop_round_one_last.date_of_last_treatment,
		
		bmi_round_one_first.bmi_round_one_first_value,
		bmi_round_one_first.bmi_round_one_first_value_HourDiff,--added 14.5.19 on Renana's request
        
		height_round_one_first.height_round_one_first_value,
		height_round_one_first.height_round_one_first_value_HourDiff,--added 14.5.19 on Renana's request
		
		weight_round_one_first.weight_round_one_first_value,
		weight_round_one_first.weight_round_one_first_value_HourDiff,--added 14.5.19 on Renana's request

		bmi_round_one_last.bmi_round_one_last_value,
		bmi_round_one_last.bmi_round_one_last_value_HourDiff,--added 14.5.19 on Renana's request
        
		height_round_one_last.height_round_one_last_value,
		height_round_one_last.height_round_one_last_value_HourDiff,--added 14.5.19 on Renana's request
		
		weight_round_one_last.weight_round_one_last_value,
		weight_round_one_last.weight_round_one_last_value_HourDiff--added 14.5.19 on Renana's request


		from #main_pop_round_one_first as main_pop_round_one_first --this is th leading table in the left join select becuase it contains all the required population (last round treatment must have had first rount treatment as well)
		 
		 left join ( --get round_one_last_casenum 
				select 
				id,
				casenum as round_one_last_casenum,
				date_of_last_treatment_first_line_treatment				
				--date_of_last_treatment
				from #main_pop_round_one_last
				) main_pop_round_one_last
				on main_pop_round_one_first.id = main_pop_round_one_last.id
	

		 left join (
				select 
				casenum,
				date_of_first_treatment_first_line_treatment,
				--date_of_first_treatment,
				Parameter_EnteredValue as bmi_round_one_first_value,
				HourDiff as bmi_round_one_first_value_HourDiff
				from #vit_signs_round_one_first
				where Parameter_Name = 'BMI' and row_num=1) BMI_round_one_first
				on main_pop_round_one_first.casenum = BMI_round_one_first.casenum
				and main_pop_round_one_first.date_of_first_treatment_first_line_treatment = BMI_round_one_first.date_of_first_treatment_first_line_treatment
				--and main_pop_round_one_first.date_of_first_treatment = BMI_round_one_first.date_of_first_treatment


		 left join (
				select 
				casenum,
				date_of_first_treatment_first_line_treatment,
				--date_of_first_treatment,
				Parameter_EnteredValue as height_round_one_first_value,
				HourDiff as height_round_one_first_value_HourDiff
				from #vit_signs_round_one_first
				where Parameter_Name = 'Height' and row_num=1) Height_round_one_first
				on main_pop_round_one_first.casenum = Height_round_one_first.casenum
				and main_pop_round_one_first.date_of_first_treatment_first_line_treatment = Height_round_one_first.date_of_first_treatment_first_line_treatment
				--and main_pop_round_one_first.date_of_first_treatment = Height_round_one_first.date_of_first_treatment

		 left join (
				select 
				casenum,
				date_of_first_treatment_first_line_treatment,
				--date_of_first_treatment,
				Parameter_EnteredValue as weight_round_one_first_value,
				HourDiff as weight_round_one_first_value_HourDiff
				from #vit_signs_round_one_first
				where Parameter_Name = 'Weight' and row_num=1) Weight_round_one_first
				on main_pop_round_one_first.casenum = Weight_round_one_first.casenum
				and main_pop_round_one_first.date_of_first_treatment_first_line_treatment = Weight_round_one_first.date_of_first_treatment_first_line_treatment
				--and main_pop_round_one_first.date_of_first_treatment = Weight_round_one_first.date_of_first_treatment


		left join (
				select 
				casenum,
				date_of_last_treatment_first_line_treatment,
				--date_of_last_treatment,
				Parameter_EnteredValue as bmi_round_one_last_value,
				HourDiff as bmi_round_one_last_value_HourDiff
				from #vit_signs_round_one_last
				where Parameter_Name = 'BMI' and row_num=1) BMI_round_one_last
				on main_pop_round_one_last.round_one_last_casenum = BMI_round_one_last.casenum
				and main_pop_round_one_last.date_of_last_treatment_first_line_treatment = BMI_round_one_last.date_of_last_treatment_first_line_treatment
				--and main_pop_round_one_last.date_of_last_treatment = BMI_round_one_last.date_of_last_treatment


		 left join (
				select 
				casenum,
				date_of_last_treatment_first_line_treatment,
--				date_of_last_treatment,
				Parameter_EnteredValue as height_round_one_last_value,
				HourDiff as height_round_one_last_value_HourDiff
				from #vit_signs_round_one_last
				where Parameter_Name = 'Height' and row_num=1) Height_round_one_last
				on main_pop_round_one_last.round_one_last_casenum = Height_round_one_last.casenum
				and main_pop_round_one_last.date_of_last_treatment_first_line_treatment = Height_round_one_last.date_of_last_treatment_first_line_treatment
				--and main_pop_round_one_last.date_of_last_treatment = Height_round_one_last.date_of_last_treatment

		 left join (
				select 
				casenum,
				date_of_last_treatment_first_line_treatment,
				--date_of_last_treatment,
				Parameter_EnteredValue as weight_round_one_last_value,
				HourDiff as weight_round_one_last_value_HourDiff
				from #vit_signs_round_one_last
				where Parameter_Name = 'Weight' and row_num=1) Weight_round_one_last
				on main_pop_round_one_last.round_one_last_casenum = Weight_round_one_last.casenum
				and main_pop_round_one_last.date_of_last_treatment_first_line_treatment = Weight_round_one_last.date_of_last_treatment_first_line_treatment
				--and main_pop_round_one_last.date_of_last_treatment = Weight_round_one_last.date_of_last_treatment
)A
--select id, count(1) cnt from #vit_signs_round_one_all_flat group by id having count(1)>1
--select * from #vit_signs_round_one_all_flat where round_one_last_casenum = 0035779391
--select * from #vit_signs_round_one_last where casenum = 0035779391
--select * from #vit_signs_round_one_all_flat f where f.weight_round_one_last_value is null and f.weight_round_one_last_value_HourDiff is not null

--select *  from #vit_signs_round_one_all_flat where id =15428428
--select *  from #vit_signs_round_one_first where id =15428428
--select *  from #vit_signs_round_one_last where id =15428428
------------------------------------------------------------------
--Handeling Tests
------------------------------------------------------------------
--create tmp tables for the tests
begin try drop table #albumin; end try begin catch end catch;
CREATE TABLE #albumin
(
    test_code INT,
    name VARCHAR(60)     
 )

 INSERT INTO #albumin 
 VALUES
(1882040010, 'Albumin - routine  '),
(1882040012, 'Albumin - StatGel')


 
 --select * from #albumin
 ------------------------------------------------------------------
 begin try drop table #hemoglobin; end try begin catch end catch;
 CREATE TABLE #hemoglobin
(
    test_code INT,
    name VARCHAR(60)     
 )

 INSERT INTO #hemoglobin 
 VALUES
 (885018010, 'Hemoglobin')

------------------------------------------------------------------
begin try drop table #WBC; end try begin catch end catch;
 CREATE TABLE #WBC
(
    test_code INT,
    name VARCHAR(60)     
 )

 INSERT INTO #WBC 
 VALUES 
 (805001010, 'WBC'),
(805255920, 'WBC count+diffrential - blood')

 ------------------------------------------------------------------
  begin try drop table #calcium; end try begin catch end catch;
  CREATE TABLE #calcium
(
    test_code INT,
    name VARCHAR(60)     
 )

 INSERT INTO #calcium 
 VALUES
 (882310010, 'Calcium, total - blood'),
(882330010, 'Calcium, ionized - blood'),
(882330140, 'Calcium, ionized - whole blood'),
(882330150, 'Calcium, ionized -Ar'),
(1882310010, 'Calcium total - routine '),
(1882310012, 'Calcium total - StatGel ')

------------------------------------------------------------------
  begin try drop table #glucose; end try begin catch end catch;
  CREATE TABLE #glucose
(
    test_code INT,
    name VARCHAR(60)     
 )

 INSERT INTO #glucose 
 VALUES
 (802194140, 'Glucose (glucometer) - whole blood'),
(803583010, 'Glucose, direct - blood'),
(882947010, 'Glucose - blood'),
(882947140, 'Glucose, quantitative - whole blood'),
(882947150, 'Glucose, quantitative Ar'),
(1882947010, 'Glucose - routine ')

 ------------------------------------------------------------------
  begin try drop table #creatinine; end try begin catch end catch;
  CREATE TABLE #creatinine
(
    test_code INT,
    name VARCHAR(60)     
 )

 INSERT INTO #creatinine 
 VALUES
 (802219010, 'Creatinine , blood, enzymatic method'),
(882565010, 'Creatinine'),
(1882565010, 'Creatinine - routine  '),
(1882565012, 'Creatinine - StatGel')

 ------------------------------------------------------------------union all_desired_tests to one table
 begin try drop table #all_desired_tests; end try begin catch end catch;
select a.*
INTO #all_desired_tests
 
 
from
(
    select test_code, name from #albumin
    union all
    select test_code, name from #hemoglobin
    union all
    select test_code, name from #WBC
    union all
    select test_code, name from #calcium
    union all
    select test_code, name from #glucose
	union all
    select test_code, name from #creatinine
	
) a

-- select * from #all_desired_tests
------------------------------------------------------------------
--The pop of #round_one_first_tests 

--select count(1) from #round_one_first_tests
begin try drop table #round_one_first_tests; end try begin catch end catch; 
select A.* --, cast(test_result as numeric(8,2)) as casted_test_result
into #round_one_first_tests
from 
(
select 
	main.ID, 
	main.casenum, 
	fact_tests.Test_Code as test_code, 
	#all_desired_tests.name as test_name, 
	fact_tests.Result as test_result,
	main.date_of_first_treatment_first_line_treatment  as treatment_date,
	--main.date_of_first_treatment  as treatment_date,
	fact_tests.Entry_Date+fact_tests.Entry_Time as first_test_date,
	'First_treatment_tests' AS 'tests_order',
CASE 
    WHEN fact_tests.test_code in (select test_code  from #albumin)
	THEN 'Albumin'

	WHEN fact_tests.test_code in (select test_code  from #hemoglobin)
	THEN 'hemoglobin'

	when fact_tests.test_code in (select test_code  from #WBC)
	then 'WBC'
/*
	when
	fact_tests.test_code in (
	191065447)      --Ascitis - number of neutrophiles

	then 'neutrophile'
*/
	when fact_tests.test_code in (select test_code  from #calcium)
	then 'calcium'
	
	when fact_tests.test_code in (select test_code  from #glucose)
	then 'glucose'
	
	when fact_tests.test_code in (select test_code  from #creatinine)
 	then 'creatinine'
	
	--else 'NR'				    

END AS test_class
--,CONVERT(date, main.date_of_first_treatment) tr_dt, CONVERT(date, fact_tests.Entry_Date) colect_dt
--,DATEDIFF(DAY, fact_tests.Entry_Date, main.date_of_first_treatment) AS DayDiff
 
-- changed 13.5.19 in order to capture the correct datediff (changed so treatment is first date in the datediff function)
--,DATEDIFF(hour, fact_tests.Entry_Date+fact_tests.Entry_Time, main.date_of_first_treatment_first_line_treatment) AS HourDiff
,DATEDIFF(hour, main.date_of_first_treatment_first_line_treatment, fact_tests.Entry_Date+fact_tests.Entry_Time) AS HourDiff
 
 

 -- ,DATEDIFF(hour, fact_tests.Entry_Date+fact_tests.Entry_Time, main.date_of_first_treatment) AS HourDiff

--,ROW_NUMBER() OVER(PARTITION BY main.casenum,fact_tests.Test_Code  ORDER BY DATEDIFF(DAY, fact_tests.Entry_Date, main.date_of_first_treatment) ASC) AS Row#
,ROW_NUMBER() OVER(PARTITION BY main.casenum,fact_tests.Test_Code  ORDER BY abs(DATEDIFF(hour, fact_tests.Entry_Date+fact_tests.Entry_Time, main.date_of_first_treatment_first_line_treatment)) ASC) AS row_num -- becuase of the abs, the order of the dates is irrlelevant
--,ROW_NUMBER() OVER(PARTITION BY main.casenum,fact_tests.Test_Code  ORDER BY abs(DATEDIFF(hour, fact_tests.Entry_Date+fact_tests.Entry_Time, main.date_of_first_treatment)) ASC) AS row_num
	
	FROM #main_pop_round_one_first main --#main_pop_round_one_all main
	left join [DWH_PRD].[dbo].[AUTODB_Labs_Fact_Tests] fact_tests on main.CaseNum = fact_tests.CaseNum
	
	-- changed 13.5.19 in order to capture the correct datediff (changed so treatment is first date in the datediff function)
	--and DATEDIFF(hour, fact_tests.Entry_Date+fact_tests.Entry_Time, main.date_of_first_treatment_first_line_treatment) between -72 and 72  -- the required test was perfromed three days before / after the treatment
	and fact_tests.Entry_Date+fact_tests.Entry_Time <= DATEADD(day,3,CONVERT(datetime, main.date_of_first_treatment_first_line_treatment))
	
	
	
	--and DATEDIFF(hour, fact_tests.Entry_Date+fact_tests.Entry_Time, main.date_of_first_treatment) between -72 and 72  -- the required test was perfromed three days before / after the treatment

	JOIN #all_desired_tests --get only the relevnt tests
	ON fact_tests.test_code = #all_desired_tests.Test_code


	--LEFT JOIN [DWH_PRD].[dbo].[AUTODB_Dim_Tests] dim_tests
	--ON dim_tests.test_code = fact_tests.Test_code

	--left JOIN #all_desired_tests --get only the relevnt tests
	--ON dim_tests.test_code = #all_desired_tests.Test_code

	where  main.CaseNum is not null and fact_tests.Is_cancelled=0 and  ISNUMERIC(fact_tests.Result)=1

)A
where A.row_num=1





--select casenum,test_class,test_code, count(1) cnt from #round_one_first_tests group by casenum,test_class,test_code having count(1)=1
--select * from #round_one_first_tests where casenum = 0011100572
--select * from #round_one_first_tests where id = 26861286 --id is not the connection here - casenum is because of 3 rounds of treatments

---------------------------------
--The pop of #round_one_last_tests
--select count(1) from #round_one_last_tests
begin try drop table #round_one_last_tests; end try begin catch end catch; 
select A.* --,  cast(test_result as numeric(8,2)) as casted_test_result
into #round_one_last_tests
from 
(



select 
	main.ID, 
	main.casenum, 
	fact_tests.Test_Code as test_code, 
	#all_desired_tests.name as test_name, 
	fact_tests.Result as test_result,
	main.date_of_last_treatment_first_line_treatment as treatment_date,
	--main.date_of_last_treatment as treatment_date,

	fact_tests.Entry_Date+fact_tests.Entry_Time as last_test_date,
	'Last_treatment_tests' AS 'tests_order',


CASE 
    WHEN fact_tests.test_code in (select test_code  from #albumin)
	THEN 'Albumin'

	WHEN fact_tests.test_code in (select test_code  from #hemoglobin)
	THEN 'hemoglobin'

	when fact_tests.test_code in (select test_code  from #WBC)
	then 'WBC'
/*
	when
	fact_tests.test_code in (
	191065447)      --Ascitis - number of neutrophiles

	then 'neutrophile'
*/
	when fact_tests.test_code in (select test_code  from #calcium)
	then 'calcium'
	
	when fact_tests.test_code in (select test_code  from #glucose)
	then 'glucose'
	
	when fact_tests.test_code in (select test_code  from #creatinine)
 	then 'creatinine'

	--else 'NR'				    
				    
END AS test_class

-- changed 13.5.19 in order to capture the correct datediff (changed so treatment is first date in the datediff function)
 --,DATEDIFF(hour, fact_tests.Entry_Date+fact_tests.Entry_Time, main.date_of_last_treatment_first_line_treatment) AS HourDiff
 ,DATEDIFF(hour, main.date_of_last_treatment_first_line_treatment, fact_tests.Entry_Date+fact_tests.Entry_Time) AS HourDiff

,ROW_NUMBER() OVER(PARTITION BY main.casenum,fact_tests.Test_Code  ORDER BY abs(DATEDIFF(hour, fact_tests.Entry_Date+fact_tests.Entry_Time, main.date_of_last_treatment_first_line_treatment)) ASC) AS row_num -- becuase of the abs, the order of the dates is irrlelevant
--,ROW_NUMBER() OVER(PARTITION BY main.casenum,fact_tests.Test_Code  ORDER BY abs(DATEDIFF(hour, fact_tests.Entry_Date+fact_tests.Entry_Time, main.date_of_last_treatment)) ASC) AS row_num
	
	FROM #main_pop_round_one_last main -- #main_pop main
	left join [DWH_PRD].[dbo].[AUTODB_Labs_Fact_Tests] fact_tests on main.CaseNum = fact_tests.CaseNum
	
	-- changed 13.5.19 in order to capture the correct datediff (changed so treatment is first date in the datediff function)
	--and DATEDIFF(hour, fact_tests.Entry_Date+fact_tests.Entry_Time, main.date_of_last_treatment_first_line_treatment) between -72 and 72  -- the required test was perfromed three days before / after the treatment
	and fact_tests.Entry_Date+fact_tests.Entry_Time <= DATEADD(day,3,CONVERT(datetime, main.date_of_last_treatment_first_line_treatment))

		
	JOIN #all_desired_tests --get only the relevnt tests
	ON fact_tests.test_code = #all_desired_tests.Test_code

	--LEFT JOIN [DWH_PRD].[dbo].[AUTODB_Dim_Tests] dim_tests
	--ON dim_tests.test_code = fact_tests.Test_code

	--LEFT JOIN [DWH_PRD].[dbo].[AUTODB_Dim_Tests] dim_tests
	--ON dim_tests.test_code = fact_tests.Test_code

	--JOIN #all_desired_tests  --get only the relevnt tests
	--ON fact_tests.test_code = #all_desired_tests.Test_code

	where  main.CaseNum is not null and fact_tests.Is_cancelled=0 and  ISNUMERIC(fact_tests.Result)=1
	--and main.date_of_first_treatment>= fact_tests.Entry_Date -- the test is to be perfromed prior to the treatment
	--and DATEDIFF(hour, fact_tests.Entry_Date+fact_tests.Entry_Time, main.date_of_last_treatment)>=0 -- the required test was perfromed prior to the treatment
	--or DATEDIFF(hour, fact_tests.Entry_Date+fact_tests.Entry_Time, main.date_of_last_treatment) BETWEEN -72 and 0  --or the required test was perfromed three days after the treatment
	--and DATEDIFF(hour, fact_tests.Entry_Date+fact_tests.Entry_Time, main.date_of_last_treatment) between -72 and 72  -- the required test was perfromed three days before / after the treatment

	--)
)A
where A.row_num=1
--select * from #round_one_last_tests where ID = 51210664 --aaa
--select id, count(1) cnt from #round_one_last_tests group by id


--select casenum,test_class,test_code, count(1) cnt from #round_one_last_tests group by casenum,test_class,test_code having count(1)>1
--select * from #round_one_last_tests where casenum = 0011100572 --id is not the connection here - casenum is because of 3 rounds of treatments

 

---------------------------------------------------------------------------------------------------
--#round_one_all_tests_flat -- in this table we'll have one row per id & casenum & treatment_date (NOT test_date)
begin try drop table #round_one_all_tests_flat; end try begin catch end catch;
--#round_one_first_tests_flat_final will be constracted by breaking #round_one_first_tests by fields & re-constracting it
select A.*
into #round_one_all_tests_flat
from
	(
		select 
		main_pop_round_one_first.id,
		main_pop_round_one_first.casenum as round_one_first_casenum,
		main_pop_round_one_last.round_one_last_casenum,
		main_pop_round_one_first.date_of_first_treatment_first_line_treatment,
		--main_pop_round_one_first.date_of_first_treatment,
		main_pop_round_one_last.date_of_last_treatment_first_line_treatment,
		--main_pop_round_one_last.date_of_last_treatment,
	
		Albumin_routine_round_one_first.Albumin_routine_round_one_first,
		Albumin_routine_round_one_first.Albumin_routine_round_one_first_HourDiff,--added 14.5.19 on Renana's request

		Albumin_StatGel_round_one_first.Albumin_StatGel_round_one_first,
		Albumin_StatGel_round_one_first.Albumin_StatGel_round_one_first_HourDiff,--added 14.5.19 on Renana's request

		Hemoglobin_round_one_first.Hemoglobin_round_one_first,
		Hemoglobin_round_one_first.Hemoglobin_round_one_first_HourDiff,--added 14.5.19 on Renana's request

		WBC_round_one_first.WBC_round_one_first,
		WBC_round_one_first.WBC_round_one_first_HourDiff,--added 14.5.19 on Renana's request

		WBC_count_diffrential_blood_round_one_first.WBC_count_diffrential_blood_round_one_first,
		WBC_count_diffrential_blood_round_one_first.WBC_count_diffrential_blood_round_one_first_HourDiff,--added 14.5.19 on Renana's request

		Calcium_total_blood_round_one_first.Calcium_total_blood_round_one_first,
		Calcium_total_blood_round_one_first.Calcium_total_blood_round_one_first_HourDiff,--added 14.5.19 on Renana's request

		Calcium_ionized_blood_round_one_first.Calcium_ionized_blood_round_one_first,
		Calcium_ionized_blood_round_one_first.Calcium_ionized_blood_round_one_first_HourDiff,--added 14.5.19 on Renana's request

		Calcium_ionized_whole_blood_round_one_first.Calcium_ionized_whole_blood_round_one_first,
		Calcium_ionized_whole_blood_round_one_first.Calcium_ionized_whole_blood_round_one_first_HourDiff,--added 14.5.19 on Renana's request

		Calcium_ionized_Ar_round_one_first.Calcium_ionized_Ar_round_one_first,
		Calcium_ionized_Ar_round_one_first.Calcium_ionized_Ar_round_one_first_HourDiff,--added 14.5.19 on Renana's request

		Calcium_total_routine_round_one_first.Calcium_total_routine_round_one_first,
		Calcium_total_routine_round_one_first.Calcium_total_routine_round_one_first_HourDiff,--added 14.5.19 on Renana's request

		Calcium_total_StatGel_round_one_first.Calcium_total_StatGel_round_one_first,
		Calcium_total_StatGel_round_one_first.Calcium_total_StatGel_round_one_first_HourDiff,--added 14.5.19 on Renana's request

		Glucose_glucometer_whole_blood_round_one_first.Glucose_glucometer_whole_blood_round_one_first,
		Glucose_glucometer_whole_blood_round_one_first.Glucose_glucometer_whole_blood_round_one_first_HourDiff,--added 14.5.19 on Renana's request

		Glucose_direct_blood_round_one_first.Glucose_direct_blood_round_one_first,
		Glucose_direct_blood_round_one_first.Glucose_direct_blood_round_one_first_HourDiff,--added 14.5.19 on Renana's request

		Glucose_blood_round_one_first.Glucose_blood_round_one_first,
		Glucose_blood_round_one_first.Glucose_blood_round_one_first_HourDiff,--added 14.5.19 on Renana's request

		Glucose_quantitative_whole_blood_round_one_first.Glucose_quantitative_whole_blood_round_one_first,
		Glucose_quantitative_whole_blood_round_one_first.Glucose_quantitative_whole_blood_round_one_first_HourDiff,--added 14.5.19 on Renana's request

		Glucose_quantitative_Ar_round_one_first.Glucose_quantitative_Ar_round_one_first,
		Glucose_quantitative_Ar_round_one_first.Glucose_quantitative_Ar_round_one_first_HourDiff,--added 14.5.19 on Renana's request

		Glucose_routine_round_one_first.Glucose_routine_round_one_first,
		Glucose_routine_round_one_first.Glucose_routine_round_one_first_HourDiff,--added 14.5.19 on Renana's request

		Creatinine_blood_enzymatic_method_round_one_first.Creatinine_blood_enzymatic_method_round_one_first,
		Creatinine_blood_enzymatic_method_round_one_first.Creatinine_blood_enzymatic_method_round_one_first_HourDiff,--added 14.5.19 on Renana's request

		Creatinine_round_one_first.Creatinine_round_one_first,
		Creatinine_round_one_first.Creatinine_round_one_first_HourDiff,--added 14.5.19 on Renana's request

		Creatinine_routine_round_one_first.Creatinine_routine_round_one_first,
		Creatinine_routine_round_one_first.Creatinine_routine_round_one_first_HourDiff,--added 14.5.19 on Renana's request

		Creatinine_StatGel_round_one_first.Creatinine_StatGel_round_one_first,
		Creatinine_StatGel_round_one_first.Creatinine_StatGel_round_one_first_HourDiff,--added 14.5.19 on Renana's request

		Albumin_routine_round_one_last.Albumin_routine_round_one_last,
		Albumin_routine_round_one_last.Albumin_routine_round_one_last_HourDiff,--added 14.5.19 on Renana's request

		Albumin_StatGel_round_one_last.Albumin_StatGel_round_one_last,
		Albumin_StatGel_round_one_last.Albumin_StatGel_round_one_last_HourDiff,--added 14.5.19 on Renana's request

		Hemoglobin_round_one_last.Hemoglobin_round_one_last,
		Hemoglobin_round_one_last.Hemoglobin_round_one_last_HourDiff,--added 14.5.19 on Renana's request

		WBC_round_one_last.WBC_round_one_last,
		WBC_round_one_last.WBC_round_one_last_HourDiff,--added 14.5.19 on Renana's request

		WBC_count_diffrential_blood_round_one_last.WBC_count_diffrential_blood_round_one_last,
		WBC_count_diffrential_blood_round_one_last.WBC_count_diffrential_blood_round_one_last_HourDiff,--added 14.5.19 on Renana's request

		Calcium_total_blood_round_one_last.Calcium_total_blood_round_one_last,
		Calcium_total_blood_round_one_last.Calcium_total_blood_round_one_last_HourDiff,--added 14.5.19 on Renana's request

		Calcium_ionized_blood_round_one_last.Calcium_ionized_blood_round_one_last,
		Calcium_ionized_blood_round_one_last.Calcium_ionized_blood_round_one_last_HourDiff,--added 14.5.19 on Renana's request

		Calcium_ionized_whole_blood_round_one_last.Calcium_ionized_whole_blood_round_one_last,
		Calcium_ionized_whole_blood_round_one_last.Calcium_ionized_whole_blood_round_one_last_HourDiff,--added 14.5.19 on Renana's request

		Calcium_ionized_Ar_round_one_last.Calcium_ionized_Ar_round_one_last,
		Calcium_ionized_Ar_round_one_last.Calcium_ionized_Ar_round_one_last_HourDiff,--added 14.5.19 on Renana's request

		Calcium_total_routine_round_one_last.Calcium_total_routine_round_one_last,
		Calcium_total_routine_round_one_last.Calcium_total_routine_round_one_last_HourDiff,--added 14.5.19 on Renana's request

		Calcium_total_StatGel_round_one_last.Calcium_total_StatGel_round_one_last,
		Calcium_total_StatGel_round_one_last.Calcium_total_StatGel_round_one_last_HourDiff,--added 14.5.19 on Renana's request

		Glucose_glucometer_whole_blood_round_one_last.Glucose_glucometer_whole_blood_round_one_last,
		Glucose_glucometer_whole_blood_round_one_last.Glucose_glucometer_whole_blood_round_one_last_HourDiff,--added 14.5.19 on Renana's request

		Glucose_direct_blood_round_one_last.Glucose_direct_blood_round_one_last,
		Glucose_direct_blood_round_one_last.Glucose_direct_blood_round_one_last_HourDiff,--added 14.5.19 on Renana's request

		Glucose_blood_round_one_last.Glucose_blood_round_one_last,
		Glucose_blood_round_one_last.Glucose_blood_round_one_last_HourDiff,--added 14.5.19 on Renana's request

		Glucose_quantitative_whole_blood_round_one_last.Glucose_quantitative_whole_blood_round_one_last,
		Glucose_quantitative_whole_blood_round_one_last.Glucose_quantitative_whole_blood_round_one_last_HourDiff,--added 14.5.19 on Renana's request

		Glucose_quantitative_Ar_round_one_last.Glucose_quantitative_Ar_round_one_last,
		Glucose_quantitative_Ar_round_one_last.Glucose_quantitative_Ar_round_one_last_HourDiff,--added 14.5.19 on Renana's request

		Glucose_routine_round_one_last.Glucose_routine_round_one_last,
		Glucose_routine_round_one_last.Glucose_routine_round_one_last_HourDiff,--added 14.5.19 on Renana's request

		Creatinine_blood_enzymatic_method_round_one_last.Creatinine_blood_enzymatic_method_round_one_last,
		Creatinine_blood_enzymatic_method_round_one_last.Creatinine_blood_enzymatic_method_round_one_last_HourDiff,--added 14.5.19 on Renana's request

		Creatinine_round_one_last.Creatinine_round_one_last,
		Creatinine_round_one_last.Creatinine_round_one_last_HourDiff,--added 14.5.19 on Renana's request

		Creatinine_routine_round_one_last.Creatinine_routine_round_one_last,
		Creatinine_routine_round_one_last.Creatinine_routine_round_one_last_HourDiff,--added 14.5.19 on Renana's request

		Creatinine_StatGel_round_one_last.Creatinine_StatGel_round_one_last,
		Creatinine_StatGel_round_one_last.Creatinine_StatGel_round_one_last_HourDiff--added 14.5.19 on Renana's request
		

		from #main_pop_round_one_first as main_pop_round_one_first --this is th leading table in the left join select becuase it contains all the required population (last round treatment must have had first rount treatment as weel)
		 
		 left join ( --get round_one_last_casenum 
				select 
				id,
				casenum as round_one_last_casenum,
				date_of_last_treatment_first_line_treatment
				--date_of_last_treatment
				from #main_pop_round_one_last
				) main_pop_round_one_last
				on main_pop_round_one_first.id = main_pop_round_one_last.id
				
		
		 left join (
				select 
				casenum,
				treatment_date,
				test_result as Albumin_routine_round_one_first,
				HourDiff as Albumin_routine_round_one_first_HourDiff 
				from #round_one_first_tests
				where test_code = 1882040010) Albumin_routine_round_one_first
				on main_pop_round_one_first.casenum = Albumin_routine_round_one_first.casenum
				and main_pop_round_one_first.date_of_first_treatment_first_line_treatment = Albumin_routine_round_one_first.treatment_date
				--and main_pop_round_one_first.date_of_first_treatment = Albumin_routine_round_one_first.treatment_date
		
		 left join (
				select 
				casenum,
				treatment_date,
				test_result as Albumin_StatGel_round_one_first,
				HourDiff as Albumin_StatGel_round_one_first_HourDiff
				from #round_one_first_tests
				where test_code = 1882040012) Albumin_StatGel_round_one_first
				on main_pop_round_one_first.casenum = Albumin_StatGel_round_one_first.casenum
				and main_pop_round_one_first.date_of_first_treatment_first_line_treatment = Albumin_StatGel_round_one_first.treatment_date
				--and main_pop_round_one_first.date_of_first_treatment = Albumin_StatGel_round_one_first.treatment_date
		
		left join (
				select 
				casenum,
				treatment_date,
				test_result as Hemoglobin_round_one_first,
				HourDiff as Hemoglobin_round_one_first_HourDiff
				from #round_one_first_tests
				where test_code = 885018010) Hemoglobin_round_one_first
				on main_pop_round_one_first.casenum = Hemoglobin_round_one_first.casenum
				and main_pop_round_one_first.date_of_first_treatment_first_line_treatment = Hemoglobin_round_one_first.treatment_date
				--and main_pop_round_one_first.date_of_first_treatment = Hemoglobin_round_one_first.treatment_date

		left join (
				select 
				casenum,
				treatment_date,
				test_result as WBC_round_one_first,
				HourDiff as WBC_round_one_first_HourDiff
				from #round_one_first_tests
				where test_code = 805001010) WBC_round_one_first
				on main_pop_round_one_first.casenum = WBC_round_one_first.casenum
				and main_pop_round_one_first.date_of_first_treatment_first_line_treatment = WBC_round_one_first.treatment_date
				--and main_pop_round_one_first.date_of_first_treatment = WBC_round_one_first.treatment_date

		left join (
				select 
				casenum,
				treatment_date,
				test_result as WBC_count_diffrential_blood_round_one_first,
				HourDiff as WBC_count_diffrential_blood_round_one_first_HourDiff
				from #round_one_first_tests
				where test_code = 805255920) WBC_count_diffrential_blood_round_one_first
				on main_pop_round_one_first.casenum = WBC_count_diffrential_blood_round_one_first.casenum
				and main_pop_round_one_first.date_of_first_treatment_first_line_treatment = WBC_count_diffrential_blood_round_one_first.treatment_date
				--and main_pop_round_one_first.date_of_first_treatment = WBC_count_diffrential_blood_round_one_first.treatment_date

		left join (
				select 
				casenum,
				treatment_date,
				test_result as Calcium_total_blood_round_one_first,
				HourDiff as Calcium_total_blood_round_one_first_HourDiff
				from #round_one_first_tests
				where test_code = 882310010) Calcium_total_blood_round_one_first
				on main_pop_round_one_first.casenum = Calcium_total_blood_round_one_first.casenum
				and main_pop_round_one_first.date_of_first_treatment_first_line_treatment = Calcium_total_blood_round_one_first.treatment_date
				--and main_pop_round_one_first.date_of_first_treatment = Calcium_total_blood_round_one_first.treatment_date

		left join (
				select 
				casenum,
				treatment_date,
				test_result as Calcium_ionized_blood_round_one_first,
				HourDiff as Calcium_ionized_blood_round_one_first_HourDiff
				from #round_one_first_tests
				where test_code = 882330010) Calcium_ionized_blood_round_one_first
				on main_pop_round_one_first.casenum = Calcium_ionized_blood_round_one_first.casenum
				and main_pop_round_one_first.date_of_first_treatment_first_line_treatment = Calcium_ionized_blood_round_one_first.treatment_date
				--and main_pop_round_one_first.date_of_first_treatment = Calcium_ionized_blood_round_one_first.treatment_date

		left join (
				select 
				casenum,
				treatment_date,
				test_result as Calcium_ionized_whole_blood_round_one_first,
				HourDiff as Calcium_ionized_whole_blood_round_one_first_HourDiff
				from #round_one_first_tests
				where test_code = 882330140) Calcium_ionized_whole_blood_round_one_first
				on main_pop_round_one_first.casenum = Calcium_ionized_whole_blood_round_one_first.casenum
				and main_pop_round_one_first.date_of_first_treatment_first_line_treatment = Calcium_ionized_whole_blood_round_one_first.treatment_date
				--and main_pop_round_one_first.date_of_first_treatment = Calcium_ionized_whole_blood_round_one_first.treatment_date

		left join (
				select 
				casenum,
				treatment_date,
				test_result as Calcium_ionized_Ar_round_one_first,
				HourDiff as Calcium_ionized_Ar_round_one_first_HourDiff
				from #round_one_first_tests
				where test_code = 882330150) Calcium_ionized_Ar_round_one_first
				on main_pop_round_one_first.casenum = Calcium_ionized_Ar_round_one_first.casenum
				and main_pop_round_one_first.date_of_first_treatment_first_line_treatment = Calcium_ionized_Ar_round_one_first.treatment_date
				--and main_pop_round_one_first.date_of_first_treatment = Calcium_ionized_Ar_round_one_first.treatment_date

		left join (
				select 
				casenum,
				treatment_date,
				test_result as Calcium_total_routine_round_one_first,
				HourDiff as Calcium_total_routine_round_one_first_HourDiff
				from #round_one_first_tests
				where test_code = 1882310010) Calcium_total_routine_round_one_first
				on main_pop_round_one_first.casenum = Calcium_total_routine_round_one_first.casenum
				and main_pop_round_one_first.date_of_first_treatment_first_line_treatment = Calcium_total_routine_round_one_first.treatment_date
				--and main_pop_round_one_first.date_of_first_treatment = Calcium_total_routine_round_one_first.treatment_date

		left join (
				select 
				casenum,
				treatment_date,
				test_result as Calcium_total_StatGel_round_one_first,
				HourDiff as Calcium_total_StatGel_round_one_first_HourDiff
				from #round_one_first_tests
				where test_code = 1882310012) Calcium_total_StatGel_round_one_first
				on main_pop_round_one_first.casenum = Calcium_total_StatGel_round_one_first.casenum
				and main_pop_round_one_first.date_of_first_treatment_first_line_treatment = Calcium_total_StatGel_round_one_first.treatment_date
				--and main_pop_round_one_first.date_of_first_treatment = Calcium_total_StatGel_round_one_first.treatment_date

		left join (
				select 
				casenum,
				treatment_date,
				test_result as Glucose_glucometer_whole_blood_round_one_first,
				HourDiff as Glucose_glucometer_whole_blood_round_one_first_HourDiff
				from #round_one_first_tests
				where test_code = 802194140) Glucose_glucometer_whole_blood_round_one_first
				on main_pop_round_one_first.casenum = Glucose_glucometer_whole_blood_round_one_first.casenum
				and main_pop_round_one_first.date_of_first_treatment_first_line_treatment = Glucose_glucometer_whole_blood_round_one_first.treatment_date
				--and main_pop_round_one_first.date_of_first_treatment = Glucose_glucometer_whole_blood_round_one_first.treatment_date
	
		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Glucose_direct_blood_round_one_first,
				  HourDiff as Glucose_direct_blood_round_one_first_HourDiff
				   from #round_one_first_tests 
				where test_code =803583010) Glucose_direct_blood_round_one_first 
				on main_pop_round_one_first.casenum =Glucose_direct_blood_round_one_first.casenum 
				and main_pop_round_one_first.date_of_first_treatment_first_line_treatment = Glucose_direct_blood_round_one_first.treatment_date
				--and main_pop_round_one_first.date_of_first_treatment = Glucose_direct_blood_round_one_first.treatment_date


		left join(
					select  
					casenum,
					  treatment_date,
					  test_result as Glucose_blood_round_one_first,
					  HourDiff as Glucose_blood_round_one_first_HourDiff
					   from #round_one_first_tests 
					where test_code =882947010) Glucose_blood_round_one_first 
					on main_pop_round_one_first.casenum =Glucose_blood_round_one_first.casenum 
					and main_pop_round_one_first.date_of_first_treatment_first_line_treatment = Glucose_blood_round_one_first.treatment_date
					--and main_pop_round_one_first.date_of_first_treatment = Glucose_blood_round_one_first.treatment_date

		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Glucose_quantitative_whole_blood_round_one_first,
				  HourDiff as Glucose_quantitative_whole_blood_round_one_first_HourDiff
				   from #round_one_first_tests 
				where test_code =882947140) Glucose_quantitative_whole_blood_round_one_first 
				on main_pop_round_one_first.casenum =Glucose_quantitative_whole_blood_round_one_first.casenum 
				and main_pop_round_one_first.date_of_first_treatment_first_line_treatment = Glucose_quantitative_whole_blood_round_one_first.treatment_date
				--and main_pop_round_one_first.date_of_first_treatment = Glucose_quantitative_whole_blood_round_one_first.treatment_date

		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Glucose_quantitative_Ar_round_one_first,
				  HourDiff as Glucose_quantitative_Ar_round_one_first_HourDiff
				   from #round_one_first_tests 
				where test_code =882947150) Glucose_quantitative_Ar_round_one_first 
				on main_pop_round_one_first.casenum =Glucose_quantitative_Ar_round_one_first.casenum 
				and main_pop_round_one_first.date_of_first_treatment_first_line_treatment = Glucose_quantitative_Ar_round_one_first.treatment_date
				--and main_pop_round_one_first.date_of_first_treatment = Glucose_quantitative_Ar_round_one_first.treatment_date

		left join(
				select  
				casenum,
				  treatment_date,
				  test_result as Glucose_routine_round_one_first,
				  HourDiff as Glucose_routine_round_one_first_HourDiff
				  from #round_one_first_tests 
				where test_code =1882947010) Glucose_routine_round_one_first 
				on main_pop_round_one_first.casenum =Glucose_routine_round_one_first.casenum 
				and main_pop_round_one_first.date_of_first_treatment_first_line_treatment = Glucose_routine_round_one_first.treatment_date
				--and main_pop_round_one_first.date_of_first_treatment = Glucose_routine_round_one_first.treatment_date

		left join(
			 select  
			casenum,
			  treatment_date,
			  test_result as Creatinine_blood_enzymatic_method_round_one_first,
			  HourDiff as Creatinine_blood_enzymatic_method_round_one_first_HourDiff
			   from #round_one_first_tests 
			where test_code =802219010) Creatinine_blood_enzymatic_method_round_one_first 
			on main_pop_round_one_first.casenum =Creatinine_blood_enzymatic_method_round_one_first.casenum 
			and main_pop_round_one_first.date_of_first_treatment_first_line_treatment = Creatinine_blood_enzymatic_method_round_one_first.treatment_date
			--and main_pop_round_one_first.date_of_first_treatment = Creatinine_blood_enzymatic_method_round_one_first.treatment_date

		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Creatinine_round_one_first,
				  HourDiff as Creatinine_round_one_first_HourDiff
				   from #round_one_first_tests 
				where test_code =882565010) Creatinine_round_one_first 
				on main_pop_round_one_first.casenum =Creatinine_round_one_first.casenum 
				and main_pop_round_one_first.date_of_first_treatment_first_line_treatment = Creatinine_round_one_first.treatment_date
				--and main_pop_round_one_first.date_of_first_treatment = Creatinine_round_one_first.treatment_date
		
		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Creatinine_routine_round_one_first,
				  HourDiff as Creatinine_routine_round_one_first_HourDiff
				   from #round_one_first_tests 
				where test_code =1882565010) Creatinine_routine_round_one_first 
				on main_pop_round_one_first.casenum =Creatinine_routine_round_one_first.casenum 
				and main_pop_round_one_first.date_of_first_treatment_first_line_treatment = Creatinine_routine_round_one_first.treatment_date
				--and main_pop_round_one_first.date_of_first_treatment = Creatinine_routine_round_one_first.treatment_date

		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Creatinine_StatGel_round_one_first,
				  HourDiff as Creatinine_StatGel_round_one_first_HourDiff
				   from #round_one_first_tests 
				where test_code =1882565012) Creatinine_StatGel_round_one_first 
				on main_pop_round_one_first.casenum =Creatinine_StatGel_round_one_first.casenum 
				and main_pop_round_one_first.date_of_first_treatment_first_line_treatment = Creatinine_StatGel_round_one_first.treatment_date
				--and main_pop_round_one_first.date_of_first_treatment = Creatinine_StatGel_round_one_first.treatment_date


		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Albumin_routine_round_one_last,
				  HourDiff as Albumin_routine_round_one_last_HourDiff
				   from #round_one_last_tests 
				where test_code =1882040010) Albumin_routine_round_one_last 
				on main_pop_round_one_last.round_one_last_casenum =Albumin_routine_round_one_last.casenum 
				and main_pop_round_one_last.date_of_last_treatment_first_line_treatment = Albumin_routine_round_one_last.treatment_date
				--and main_pop_round_one_last.date_of_last_treatment = Albumin_routine_round_one_last.treatment_date
		
		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Albumin_StatGel_round_one_last,
				  HourDiff as Albumin_StatGel_round_one_last_HourDiff
				   from #round_one_last_tests 
				where test_code =1882040012) Albumin_StatGel_round_one_last 
				on main_pop_round_one_last.round_one_last_casenum =Albumin_StatGel_round_one_last.casenum 
				and main_pop_round_one_last.date_of_last_treatment_first_line_treatment = Albumin_StatGel_round_one_last.treatment_date
				--and main_pop_round_one_last.date_of_last_treatment = Albumin_StatGel_round_one_last.treatment_date
		
		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Hemoglobin_round_one_last,
				  HourDiff as Hemoglobin_round_one_last_HourDiff
				   from #round_one_last_tests 
				where test_code =885018010) Hemoglobin_round_one_last 
				on main_pop_round_one_last.round_one_last_casenum =Hemoglobin_round_one_last.casenum 
				and main_pop_round_one_last.date_of_last_treatment_first_line_treatment = Hemoglobin_round_one_last.treatment_date
				--and main_pop_round_one_last.date_of_last_treatment = Hemoglobin_round_one_last.treatment_date
		
		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as WBC_round_one_last,
				  HourDiff as WBC_round_one_last_HourDiff
				   from #round_one_last_tests 
				where test_code =805001010) WBC_round_one_last 
				on main_pop_round_one_last.round_one_last_casenum =WBC_round_one_last.casenum 
				and main_pop_round_one_last.date_of_last_treatment_first_line_treatment = WBC_round_one_last.treatment_date
				--and main_pop_round_one_last.date_of_last_treatment = WBC_round_one_last.treatment_date
		
		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as WBC_count_diffrential_blood_round_one_last,
				  HourDiff as WBC_count_diffrential_blood_round_one_last_HourDiff
				   from #round_one_last_tests 
				where test_code =805255920) WBC_count_diffrential_blood_round_one_last 
				on main_pop_round_one_last.round_one_last_casenum =WBC_count_diffrential_blood_round_one_last.casenum 
				and main_pop_round_one_last.date_of_last_treatment_first_line_treatment = WBC_count_diffrential_blood_round_one_last.treatment_date
				--and main_pop_round_one_last.date_of_last_treatment = WBC_count_diffrential_blood_round_one_last.treatment_date

		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Calcium_total_blood_round_one_last,
				  HourDiff as Calcium_total_blood_round_one_last_HourDiff
				   from #round_one_last_tests 
				where test_code =882310010) Calcium_total_blood_round_one_last 
				on main_pop_round_one_last.round_one_last_casenum =Calcium_total_blood_round_one_last.casenum 
				and main_pop_round_one_last.date_of_last_treatment_first_line_treatment = Calcium_total_blood_round_one_last.treatment_date
				--and main_pop_round_one_last.date_of_last_treatment = Calcium_total_blood_round_one_last.treatment_date
		
		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Calcium_ionized_blood_round_one_last,
				  HourDiff as Calcium_ionized_blood_round_one_last_HourDiff
				   from #round_one_last_tests 
				where test_code =882330010) Calcium_ionized_blood_round_one_last 
				on main_pop_round_one_last.round_one_last_casenum =Calcium_ionized_blood_round_one_last.casenum 
				and main_pop_round_one_last.date_of_last_treatment_first_line_treatment = Calcium_ionized_blood_round_one_last.treatment_date
				--and main_pop_round_one_last.date_of_last_treatment = Calcium_ionized_blood_round_one_last.treatment_date

		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Calcium_ionized_whole_blood_round_one_last,
				  HourDiff as Calcium_ionized_whole_blood_round_one_last_HourDiff
				   from #round_one_last_tests 
				where test_code =882330140) Calcium_ionized_whole_blood_round_one_last 
				on main_pop_round_one_last.round_one_last_casenum =Calcium_ionized_whole_blood_round_one_last.casenum 
				and main_pop_round_one_last.date_of_last_treatment_first_line_treatment = Calcium_ionized_whole_blood_round_one_last.treatment_date
				--and main_pop_round_one_last.date_of_last_treatment = Calcium_ionized_whole_blood_round_one_last.treatment_date

		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Calcium_ionized_Ar_round_one_last,
				  HourDiff as Calcium_ionized_Ar_round_one_last_HourDiff
				   from #round_one_last_tests 
				where test_code =882330150) Calcium_ionized_Ar_round_one_last 
				on main_pop_round_one_last.round_one_last_casenum =Calcium_ionized_Ar_round_one_last.casenum 
				and main_pop_round_one_last.date_of_last_treatment_first_line_treatment = Calcium_ionized_Ar_round_one_last.treatment_date
				--and main_pop_round_one_last.date_of_last_treatment = Calcium_ionized_Ar_round_one_last.treatment_date

		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Calcium_total_routine_round_one_last,
				  HourDiff as Calcium_total_routine_round_one_last_HourDiff
				   from #round_one_last_tests 
				where test_code =1882310010) Calcium_total_routine_round_one_last 
				on main_pop_round_one_last.round_one_last_casenum =Calcium_total_routine_round_one_last.casenum 
				and main_pop_round_one_last.date_of_last_treatment_first_line_treatment = Calcium_total_routine_round_one_last.treatment_date
				--and main_pop_round_one_last.date_of_last_treatment = Calcium_total_routine_round_one_last.treatment_date
		
		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Calcium_total_StatGel_round_one_last,
				  HourDiff as Calcium_total_StatGel_round_one_last_HourDiff
				   from #round_one_last_tests 
				where test_code =1882310012) Calcium_total_StatGel_round_one_last 
				on main_pop_round_one_last.round_one_last_casenum =Calcium_total_StatGel_round_one_last.casenum 
				and main_pop_round_one_last.date_of_last_treatment_first_line_treatment = Calcium_total_StatGel_round_one_last.treatment_date
				--and main_pop_round_one_last.date_of_last_treatment = Calcium_total_StatGel_round_one_last.treatment_date
		
		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Glucose_glucometer_whole_blood_round_one_last,
				  HourDiff as Glucose_glucometer_whole_blood_round_one_last_HourDiff
				   from #round_one_last_tests 
				where test_code =802194140) Glucose_glucometer_whole_blood_round_one_last 
				on main_pop_round_one_last.round_one_last_casenum =Glucose_glucometer_whole_blood_round_one_last.casenum 
				and main_pop_round_one_last.date_of_last_treatment_first_line_treatment = Glucose_glucometer_whole_blood_round_one_last.treatment_date
				--and main_pop_round_one_last.date_of_last_treatment = Glucose_glucometer_whole_blood_round_one_last.treatment_date

		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Glucose_direct_blood_round_one_last,
				  HourDiff as Glucose_direct_blood_round_one_last_HourDiff
				   from #round_one_last_tests 
				where test_code =803583010) Glucose_direct_blood_round_one_last 
				on main_pop_round_one_last.round_one_last_casenum =Glucose_direct_blood_round_one_last.casenum 
				and main_pop_round_one_last.date_of_last_treatment_first_line_treatment = Glucose_direct_blood_round_one_last.treatment_date
				--and main_pop_round_one_last.date_of_last_treatment = Glucose_direct_blood_round_one_last.treatment_date
		
		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Glucose_blood_round_one_last,
				  HourDiff as Glucose_blood_round_one_last_HourDiff
				   from #round_one_last_tests 
				where test_code =882947010) Glucose_blood_round_one_last 
				on main_pop_round_one_last.round_one_last_casenum =Glucose_blood_round_one_last.casenum 
				and main_pop_round_one_last.date_of_last_treatment_first_line_treatment = Glucose_blood_round_one_last.treatment_date
				--and main_pop_round_one_last.date_of_last_treatment = Glucose_blood_round_one_last.treatment_date

		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Glucose_quantitative_whole_blood_round_one_last,
				  HourDiff as Glucose_quantitative_whole_blood_round_one_last_HourDiff
				   from #round_one_last_tests 
				where test_code =882947140) Glucose_quantitative_whole_blood_round_one_last 
				on main_pop_round_one_last.round_one_last_casenum =Glucose_quantitative_whole_blood_round_one_last.casenum 
				and main_pop_round_one_last.date_of_last_treatment_first_line_treatment = Glucose_quantitative_whole_blood_round_one_last.treatment_date
				--and main_pop_round_one_last.date_of_last_treatment = Glucose_quantitative_whole_blood_round_one_last.treatment_date

		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Glucose_quantitative_Ar_round_one_last,
				  HourDiff as Glucose_quantitative_Ar_round_one_last_HourDiff
				   from #round_one_last_tests 
				where test_code =882947150) Glucose_quantitative_Ar_round_one_last 
				on main_pop_round_one_last.round_one_last_casenum =Glucose_quantitative_Ar_round_one_last.casenum 
				and main_pop_round_one_last.date_of_last_treatment_first_line_treatment = Glucose_quantitative_Ar_round_one_last.treatment_date
				--and main_pop_round_one_last.date_of_last_treatment = Glucose_quantitative_Ar_round_one_last.treatment_date
	
		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Glucose_routine_round_one_last,
				  HourDiff as Glucose_routine_round_one_last_HourDiff
				   from #round_one_last_tests 
				where test_code =1882947010) Glucose_routine_round_one_last 
				on main_pop_round_one_last.round_one_last_casenum =Glucose_routine_round_one_last.casenum 
				and main_pop_round_one_last.date_of_last_treatment_first_line_treatment = Glucose_routine_round_one_last.treatment_date
				--and main_pop_round_one_last.date_of_last_treatment = Glucose_routine_round_one_last.treatment_date
		
		left join(
			 select  
			casenum,
			  treatment_date,
			  test_result as Creatinine_blood_enzymatic_method_round_one_last,
			  HourDiff as Creatinine_blood_enzymatic_method_round_one_last_HourDiff
			   from #round_one_last_tests 
			where test_code =802219010) Creatinine_blood_enzymatic_method_round_one_last 
			on main_pop_round_one_last.round_one_last_casenum =Creatinine_blood_enzymatic_method_round_one_last.casenum 
			and main_pop_round_one_last.date_of_last_treatment_first_line_treatment = Creatinine_blood_enzymatic_method_round_one_last.treatment_date
			--and main_pop_round_one_last.date_of_last_treatment = Creatinine_blood_enzymatic_method_round_one_last.treatment_date

		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Creatinine_round_one_last,
				  HourDiff as Creatinine_round_one_last_HourDiff
				   from #round_one_last_tests 
				where test_code =882565010) Creatinine_round_one_last 
				on main_pop_round_one_last.round_one_last_casenum =Creatinine_round_one_last.casenum 
				and main_pop_round_one_last.date_of_last_treatment_first_line_treatment = Creatinine_round_one_last.treatment_date
				--and main_pop_round_one_last.date_of_last_treatment = Creatinine_round_one_last.treatment_date
		
		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Creatinine_routine_round_one_last,
				  HourDiff as Creatinine_routine_round_one_last_HourDiff
				   from #round_one_last_tests 
				where test_code =1882565010) Creatinine_routine_round_one_last 
				on main_pop_round_one_last.round_one_last_casenum =Creatinine_routine_round_one_last.casenum 
				and main_pop_round_one_last.date_of_last_treatment_first_line_treatment = Creatinine_routine_round_one_last.treatment_date
				--and main_pop_round_one_last.date_of_last_treatment = Creatinine_routine_round_one_last.treatment_date

		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Creatinine_StatGel_round_one_last,
				  HourDiff as Creatinine_StatGel_round_one_last_HourDiff
				   from #round_one_last_tests 
				where test_code =1882565012) Creatinine_StatGel_round_one_last 
				on main_pop_round_one_last.round_one_last_casenum =Creatinine_StatGel_round_one_last.casenum 
				and main_pop_round_one_last.date_of_last_treatment_first_line_treatment = Creatinine_StatGel_round_one_last.treatment_date
				--and main_pop_round_one_last.date_of_last_treatment = Creatinine_StatGel_round_one_last.treatment_date

--select * from #round_one_all_tests_flat
--select * from #main_pop_round_one_first
--select * from #main_pop_round_one_last
--where Hemoglobin_round_one_first is not NULL

)A


--select * from #round_one_all_tests_flat
--select * from #round_one_all_tests_flat where 
--select id, count(1) cnt from #round_one_all_tests_flat group by id
--------------------------------------------------------------------
--Final 
--------------------------------------------------------------------
begin try drop table #final; end try begin catch end catch;
--select * from  cln_amir_fact_oncology
--select * from #main_pop_round_one_first
--select * from #main_pop_round_one_last

SELECT 
--#main_pop_round_one_first.*,
 
#excel_data.ID,
#main_pop_round_one_first.CaseNum as first_casenum,
#main_pop_round_one_last.CaseNum as last_casenum,

#excel_data.date_of_birth,
#main_pop_round_one_first.sex,
#excel_data.type_of_cancer,
#excel_data.first_line_regimen,
--#excel_data.date_of_first_treatment,
CONVERT(datetime, #excel_data.date_of_first_treatment_first_line_treatment) as date_of_first_treatment_first_line_treatment,
--CONVERT(datetime, #excel_data.date_of_first_treatment) as date_of_first_treatment,

--#main_pop_round_one_first.HourDifference_first,
#main_pop_round_one_first.round as first_round,
--#main_pop_round_one_first.CaseNum as first_casenum,

--vit_signs.vit_sig_date_round_one_first,
--_HourDiff
vit_signs.bmi_round_one_first_value,
vit_signs.bmi_round_one_first_value_HourDiff,
vit_signs.height_round_one_first_value,
vit_signs.height_round_one_first_value_HourDiff,
vit_signs.weight_round_one_first_value,
vit_signs.weight_round_one_first_value_HourDiff,

#round_one_all_tests_flat.Albumin_routine_round_one_first,
#round_one_all_tests_flat.Albumin_routine_round_one_first_HourDiff,
#round_one_all_tests_flat.Albumin_StatGel_round_one_first,
#round_one_all_tests_flat.Albumin_StatGel_round_one_first_HourDiff,
#round_one_all_tests_flat.Hemoglobin_round_one_first,
#round_one_all_tests_flat.Hemoglobin_round_one_first_HourDiff,
#round_one_all_tests_flat.WBC_round_one_first,
#round_one_all_tests_flat.WBC_round_one_first_HourDiff,
#round_one_all_tests_flat.WBC_count_diffrential_blood_round_one_first,
#round_one_all_tests_flat.WBC_count_diffrential_blood_round_one_first_HourDiff,
#round_one_all_tests_flat.Calcium_total_blood_round_one_first,
#round_one_all_tests_flat.Calcium_total_blood_round_one_first_HourDiff,
#round_one_all_tests_flat.Calcium_ionized_blood_round_one_first,
#round_one_all_tests_flat.Calcium_ionized_blood_round_one_first_HourDiff,
#round_one_all_tests_flat.Calcium_ionized_whole_blood_round_one_first,
#round_one_all_tests_flat.Calcium_ionized_whole_blood_round_one_first_HourDiff,
#round_one_all_tests_flat.Calcium_ionized_Ar_round_one_first,
#round_one_all_tests_flat.Calcium_ionized_Ar_round_one_first_HourDiff,
#round_one_all_tests_flat.Calcium_total_routine_round_one_first,
#round_one_all_tests_flat.Calcium_total_routine_round_one_first_HourDiff,
#round_one_all_tests_flat.Calcium_total_StatGel_round_one_first,
#round_one_all_tests_flat.Calcium_total_StatGel_round_one_first_HourDiff,
#round_one_all_tests_flat.Glucose_glucometer_whole_blood_round_one_first,
#round_one_all_tests_flat.Glucose_glucometer_whole_blood_round_one_first_HourDiff,
#round_one_all_tests_flat.Glucose_direct_blood_round_one_first,
#round_one_all_tests_flat.Glucose_direct_blood_round_one_first_HourDiff,
#round_one_all_tests_flat.Glucose_blood_round_one_first,
#round_one_all_tests_flat.Glucose_blood_round_one_first_HourDiff,
#round_one_all_tests_flat.Glucose_quantitative_whole_blood_round_one_first,
#round_one_all_tests_flat.Glucose_quantitative_whole_blood_round_one_first_HourDiff,
#round_one_all_tests_flat.Glucose_quantitative_Ar_round_one_first,
#round_one_all_tests_flat.Glucose_quantitative_Ar_round_one_first_HourDiff,
#round_one_all_tests_flat.Glucose_routine_round_one_first,
#round_one_all_tests_flat.Glucose_routine_round_one_first_HourDiff,
#round_one_all_tests_flat.Creatinine_blood_enzymatic_method_round_one_first,
#round_one_all_tests_flat.Creatinine_blood_enzymatic_method_round_one_first_HourDiff,
#round_one_all_tests_flat.Creatinine_round_one_first,
#round_one_all_tests_flat.Creatinine_round_one_first_HourDiff,
#round_one_all_tests_flat.Creatinine_routine_round_one_first,
#round_one_all_tests_flat.Creatinine_routine_round_one_first_HourDiff,
#round_one_all_tests_flat.Creatinine_StatGel_round_one_first,
#round_one_all_tests_flat.Creatinine_StatGel_round_one_first_HourDiff,

--#excel_data.date_of_last_treatment,
CONVERT(datetime, #excel_data.date_of_last_treatment_first_line_treatment) as date_of_last_treatment_first_line_treatment,
--CONVERT(datetime, #excel_data.date_of_last_treatment) as date_of_last_treatment,
--#main_pop_round_one_last.HourDifference_last,
#main_pop_round_one_last.round as last_round,


--vit_signs.vit_sig_date_round_one_last,
vit_signs.bmi_round_one_last_value,
vit_signs.bmi_round_one_last_value_HourDiff,
vit_signs.height_round_one_last_value,
vit_signs.height_round_one_last_value_HourDiff,
vit_signs.weight_round_one_last_value,
vit_signs.weight_round_one_last_value_HourDiff,
#round_one_all_tests_flat.Albumin_routine_round_one_last,
#round_one_all_tests_flat.Albumin_routine_round_one_last_HourDiff,
#round_one_all_tests_flat.Albumin_StatGel_round_one_last,
#round_one_all_tests_flat.Albumin_StatGel_round_one_last_HourDiff,
#round_one_all_tests_flat.Hemoglobin_round_one_last,
#round_one_all_tests_flat.Hemoglobin_round_one_last_HourDiff,
#round_one_all_tests_flat.WBC_round_one_last,
#round_one_all_tests_flat.WBC_round_one_last_HourDiff,
#round_one_all_tests_flat.WBC_count_diffrential_blood_round_one_last,
#round_one_all_tests_flat.WBC_count_diffrential_blood_round_one_last_HourDiff,
#round_one_all_tests_flat.Calcium_total_blood_round_one_last,
#round_one_all_tests_flat.Calcium_total_blood_round_one_last_HourDiff,
#round_one_all_tests_flat.Calcium_ionized_blood_round_one_last,
#round_one_all_tests_flat.Calcium_ionized_blood_round_one_last_HourDiff,
#round_one_all_tests_flat.Calcium_ionized_whole_blood_round_one_last,
#round_one_all_tests_flat.Calcium_ionized_whole_blood_round_one_last_HourDiff,
#round_one_all_tests_flat.Calcium_ionized_Ar_round_one_last,
#round_one_all_tests_flat.Calcium_ionized_Ar_round_one_last_HourDiff,
#round_one_all_tests_flat.Calcium_total_routine_round_one_last,
#round_one_all_tests_flat.Calcium_total_routine_round_one_last_HourDiff,
#round_one_all_tests_flat.Calcium_total_StatGel_round_one_last,
#round_one_all_tests_flat.Calcium_total_StatGel_round_one_last_HourDiff,
#round_one_all_tests_flat.Glucose_glucometer_whole_blood_round_one_last,
#round_one_all_tests_flat.Glucose_glucometer_whole_blood_round_one_last_HourDiff,
#round_one_all_tests_flat.Glucose_direct_blood_round_one_last,
#round_one_all_tests_flat.Glucose_direct_blood_round_one_last_HourDiff,
#round_one_all_tests_flat.Glucose_blood_round_one_last,
#round_one_all_tests_flat.Glucose_blood_round_one_last_HourDiff,
#round_one_all_tests_flat.Glucose_quantitative_whole_blood_round_one_last,
#round_one_all_tests_flat.Glucose_quantitative_whole_blood_round_one_last_HourDiff,
#round_one_all_tests_flat.Glucose_quantitative_Ar_round_one_last,
#round_one_all_tests_flat.Glucose_quantitative_Ar_round_one_last_HourDiff,
#round_one_all_tests_flat.Glucose_routine_round_one_last,
#round_one_all_tests_flat.Glucose_routine_round_one_last_HourDiff,
#round_one_all_tests_flat.Creatinine_blood_enzymatic_method_round_one_last,
#round_one_all_tests_flat.Creatinine_blood_enzymatic_method_round_one_last_HourDiff,
#round_one_all_tests_flat.Creatinine_round_one_last,
#round_one_all_tests_flat.Creatinine_round_one_last_HourDiff,
#round_one_all_tests_flat.Creatinine_routine_round_one_last,
#round_one_all_tests_flat.Creatinine_routine_round_one_last_HourDiff,
#round_one_all_tests_flat.Creatinine_StatGel_round_one_last,
#round_one_all_tests_flat.Creatinine_StatGel_round_one_last_HourDiff,

#cycles_per_id_per_protocol_first_line_treatment.number_of_treatments_per_line_treatment as number_of_treatments_first_line_treatment,

#excel_data.second_line_regimen,
--#excel_data.date_of_first_treatment_second_line_treatment,
CONVERT(datetime, #excel_data.date_of_first_treatment_second_line_treatment) as date_of_first_treatment_second_line_treatment,

--#excel_data.date_of_last_treatment_second_line_treatment,
CONVERT(datetime, #excel_data.date_of_last_treatment_second_line_treatment) as date_of_last_treatment_second_line_treatment,
--#excel_data.number_of_treatments_second_line_treatment,
#cycles_per_id_per_protocol_second_line_treatment.number_of_treatments_per_line_treatment as number_of_treatments_second_line_treatment,



#excel_data.third_line_regimen,
--#excel_data.date_of_first_treatment_third_line_treatment,
CONVERT(datetime, #excel_data.date_of_first_treatment_third_line_treatment) as date_of_first_treatment_third_line_treatment,

--#excel_data.date_of_last_treatment_third_line_treatment,
CONVERT(datetime, #excel_data.date_of_last_treatment_third_line_treatment) as date_of_last_treatment_third_line_treatment,
--#excel_data.number_of_treatments_third_line_treatment,
#cycles_per_id_per_protocol_third_line_treatment.number_of_treatments_per_line_treatment as number_of_treatments_third_line_treatment,

#excel_data.source_tab

/*
#cycles_per_id_per_protocol_first_line_treatment.Protocol_Name as first_line_treatment_Protocol_Name_amir,
#cycles_per_id_per_protocol_first_line_treatment.Medical_Record as first_line_treatment_Medical_Record_amir,
#cycles_per_id_per_protocol_first_line_treatment.date_of_first_treatment as date_of_first_treatment_first_line_treatment_amir,
#cycles_per_id_per_protocol_first_line_treatment.date_of_last_treatment as date_of_last_treatment_first_line_treatment_amir,
#cycles_per_id_per_protocol_first_line_treatment.number_of_treatments_per_line_treatment as number_of_treatments_first_line_treatment,

#cycles_per_id_per_protocol_second_line_treatment.Protocol_Name  as second_line_treatment_Protocol_Name_amir,
#cycles_per_id_per_protocol_second_line_treatment.Medical_Record as second_line_treatment_Medical_Record_amir,
#cycles_per_id_per_protocol_second_line_treatment.date_of_first_treatment as date_of_first_treatment_second_line_treatment_amir,
#cycles_per_id_per_protocol_second_line_treatment.date_of_last_treatment  as date_of_last_treatment_second_line_treatment_amir,
#cycles_per_id_per_protocol_second_line_treatment.number_of_treatments_per_line_treatment as number_of_treatments_second_line_treatment,

#cycles_per_id_per_protocol_third_line_treatment.Protocol_Name as third_line_treatment_Protocol_Name_amir,
#cycles_per_id_per_protocol_third_line_treatment.Medical_Record as third_line_treatment_Medical_Record_amir,
#cycles_per_id_per_protocol_third_line_treatment.date_of_first_treatment as date_of_first_treatment_third_line_treatment_amir,
#cycles_per_id_per_protocol_third_line_treatment.date_of_last_treatment  as date_of_last_treatment_third_line_treatment_amir,
#cycles_per_id_per_protocol_third_line_treatment.number_of_treatments_per_line_treatment as number_of_treatments_third_line_treatment
*/		

into #final

FROM #excel_data 
left join #main_pop_round_one_first on #excel_data.ID =  #main_pop_round_one_first.ID
left join  #main_pop_round_one_last on #excel_data.ID =  #main_pop_round_one_last.ID

left join #vit_signs_round_one_all_flat vit_signs on #main_pop_round_one_first.CaseNum =  vit_signs.round_one_first_casenum
and #main_pop_round_one_last.CaseNum =  vit_signs.round_one_last_casenum

--left join  #main_pop_round_one_last on #excel_data.ID =  #main_pop_round_one_last.ID
--left join #vit_signs_round_one_all_flat  on #main_pop_round_one_last.CaseNum =  #vit_signs_round_one_last_flat.CaseNum

left join #round_one_all_tests_flat 
on #main_pop_round_one_first.CaseNum =  #round_one_all_tests_flat.round_one_first_casenum
and  #main_pop_round_one_last.CaseNum = #round_one_all_tests_flat.round_one_last_casenum


left join #cycles_per_id_per_protocol_first_line_treatment
 on #excel_data.ID =  #cycles_per_id_per_protocol_first_line_treatment.ID

left join #cycles_per_id_per_protocol_second_line_treatment
 on #excel_data.ID =  #cycles_per_id_per_protocol_second_line_treatment.ID

left join #cycles_per_id_per_protocol_third_line_treatment
 on #excel_data.ID =  #cycles_per_id_per_protocol_third_line_treatment.ID

 --select * from #final 

------------------------------------------------------------------------------------------
--Export the data without line breaks
select 
ID
,first_casenum
,last_casenum
,date_of_birth
,sex
,REPLACE(REPLACE(REPLACE(REPLACE(replace(type_of_cancer,'"',''), CHAR(13), ''), CHAR(10), ''),'+',''),'=','') as type_of_cancer
,first_line_regimen
,date_of_first_treatment_first_line_treatment
--,date_of_first_treatment
,first_round
---------------------------------------
,bmi_round_one_first_value
,bmi_round_one_first_value_HourDiff
,height_round_one_first_value
,height_round_one_first_value_HourDiff
,weight_round_one_first_value
,weight_round_one_first_value_HourDiff
,Albumin_routine_round_one_first
,Albumin_routine_round_one_first_HourDiff
,Albumin_StatGel_round_one_first
,Albumin_StatGel_round_one_first_HourDiff
,Hemoglobin_round_one_first
,Hemoglobin_round_one_first_HourDiff
,WBC_round_one_first
,WBC_round_one_first_HourDiff
,WBC_count_diffrential_blood_round_one_first
,WBC_count_diffrential_blood_round_one_first_HourDiff
,Calcium_total_blood_round_one_first
,Calcium_total_blood_round_one_first_HourDiff
,Calcium_ionized_blood_round_one_first
,Calcium_ionized_blood_round_one_first_HourDiff
,Calcium_ionized_whole_blood_round_one_first
,Calcium_ionized_whole_blood_round_one_first_HourDiff
,Calcium_ionized_Ar_round_one_first
,Calcium_ionized_Ar_round_one_first_HourDiff
,Calcium_total_routine_round_one_first
,Calcium_total_routine_round_one_first_HourDiff
,Calcium_total_StatGel_round_one_first
,Calcium_total_StatGel_round_one_first_HourDiff
,Glucose_glucometer_whole_blood_round_one_first
,Glucose_glucometer_whole_blood_round_one_first_HourDiff
,Glucose_direct_blood_round_one_first
,Glucose_direct_blood_round_one_first_HourDiff
,Glucose_blood_round_one_first
,Glucose_blood_round_one_first_HourDiff
,Glucose_quantitative_whole_blood_round_one_first
,Glucose_quantitative_whole_blood_round_one_first_HourDiff
,Glucose_quantitative_Ar_round_one_first
,Glucose_quantitative_Ar_round_one_first_HourDiff
,Glucose_routine_round_one_first
,Glucose_routine_round_one_first_HourDiff
,Creatinine_blood_enzymatic_method_round_one_first
,Creatinine_blood_enzymatic_method_round_one_first_HourDiff
,Creatinine_round_one_first
,Creatinine_round_one_first_HourDiff
,Creatinine_routine_round_one_first
,Creatinine_routine_round_one_first_HourDiff
,Creatinine_StatGel_round_one_first
,Creatinine_StatGel_round_one_first_HourDiff

---------------------------------------eee
,date_of_last_treatment_first_line_treatment
--,date_of_last_treatment
,last_round
---------------------------------------
,bmi_round_one_last_value
,bmi_round_one_last_value_HourDiff
,height_round_one_last_value
,height_round_one_last_value_HourDiff
,weight_round_one_last_value
,weight_round_one_last_value_HourDiff
,Albumin_routine_round_one_last
,Albumin_routine_round_one_last_HourDiff
,Albumin_StatGel_round_one_last
,Albumin_StatGel_round_one_last_HourDiff
,Hemoglobin_round_one_last
,Hemoglobin_round_one_last_HourDiff
,WBC_round_one_last
,WBC_round_one_last_HourDiff
,WBC_count_diffrential_blood_round_one_last
,WBC_count_diffrential_blood_round_one_last_HourDiff
,Calcium_total_blood_round_one_last
,Calcium_total_blood_round_one_last_HourDiff
,Calcium_ionized_blood_round_one_last
,Calcium_ionized_blood_round_one_last_HourDiff
,Calcium_ionized_whole_blood_round_one_last
,Calcium_ionized_whole_blood_round_one_last_HourDiff
,Calcium_ionized_Ar_round_one_last
,Calcium_ionized_Ar_round_one_last_HourDiff
,Calcium_total_routine_round_one_last
,Calcium_total_routine_round_one_last_HourDiff
,Calcium_total_StatGel_round_one_last
,Calcium_total_StatGel_round_one_last_HourDiff
,Glucose_glucometer_whole_blood_round_one_last
,Glucose_glucometer_whole_blood_round_one_last_HourDiff
,Glucose_direct_blood_round_one_last
,Glucose_direct_blood_round_one_last_HourDiff
,Glucose_blood_round_one_last
,Glucose_blood_round_one_last_HourDiff
,Glucose_quantitative_whole_blood_round_one_last
,Glucose_quantitative_whole_blood_round_one_last_HourDiff
,Glucose_quantitative_Ar_round_one_last
,Glucose_quantitative_Ar_round_one_last_HourDiff
,Glucose_routine_round_one_last
,Glucose_routine_round_one_last_HourDiff
,Creatinine_blood_enzymatic_method_round_one_last
,Creatinine_blood_enzymatic_method_round_one_last_HourDiff
,Creatinine_round_one_last
,Creatinine_round_one_last_HourDiff
,Creatinine_routine_round_one_last
,Creatinine_routine_round_one_last_HourDiff
,Creatinine_StatGel_round_one_last
,Creatinine_StatGel_round_one_last_HourDiff

---------------------------------------
--,number_of_treatments_first_line_treatment -- Amir will clalculate this - because it is not in the excel provided by Renana
,number_of_treatments_first_line_treatment
,second_line_regimen
,date_of_first_treatment_second_line_treatment
,date_of_last_treatment_second_line_treatment
--,number_of_treatments_second_line_treatment -- Amir will clalculate this - because it is not in the excel provided by Renana
,number_of_treatments_second_line_treatment
,third_line_regimen
,date_of_first_treatment_third_line_treatment
,date_of_last_treatment_third_line_treatment
--,number_of_treatments_third_line_treatment -- Amir will clalculate this - because it is not in the excel provided by Renana
,number_of_treatments_third_line_treatment
,source_tab
/*
first_line_treatment_Protocol_Name_amir,
first_line_treatment_Medical_Record_amir,
date_of_first_treatment_first_line_treatment_amir,
date_of_last_treatment_first_line_treatment_amir,


second_line_treatment_Protocol_Name_amir,
second_line_treatment_Medical_Record_amir,
date_of_first_treatment_second_line_treatment_amir,
date_of_last_treatment_second_line_treatment_amir,


third_line_treatment_Protocol_Name_amir,
third_line_treatment_Medical_Record_amir,
date_of_first_treatment_third_line_treatment_amir,
date_of_last_treatment_third_line_treatment_amir

*/	

 from #final


--select id, count(1) cnt from #final group by id having count(1)>1
--left join #round_one_all_tests_flat on #main_pop_round_one_last.CaseNum = #round_one_all_tests_flat.round_one_last_casenum

--select * from #final where id =15428428
--select *  from #round_one_all_tests_flat where id =15428428
--select *  from #round_one_first_tests where id =15428428
--select *  from #round_one_last_tests where id =15428428
--select *  from #vit_signs_round_one_all_flat where id =15428428
--select id, count(1) cnt from #vit_signs_round_one_all_flat group by id having count(1)>1

--select *  from #vit_signs_round_one_all_flat where id =15428428
--select *  from #vit_signs_round_one_first where id =15428428
--select *  from #vit_signs_round_one_last where id =15428428

--select *  from #vit_signs_round_one_all_flat where id =321440943
--select *  from #vit_signs_round_one_first where id =321440943
--select *  from #vit_signs_round_one_last where id =321440943
--select *  from #main_pop_round_one_last
  
  --select id, count(1) cnt from  #final group by id
  --select id, count(1) cnt from  #final group by id having count(1)>1
  --select *  from  #final where id= 10210193
 --select *  from  #final where id in  (select id from  #final group by id having count(1)>1)

 ---------------

 --select  weight_round_one_last_value_HourDiff from  #final where id = 7147515 -- 51827756


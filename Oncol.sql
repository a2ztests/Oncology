--Main population
--casenums starting with 003 - are elective - do not appear when searching Chameleon 
--------------------------------------------------------------------------------

--Run the following code in dev then run the next in prd (- this allows not to copy the excel file to prd)
/*
select  'INSERT INTO #excel_data select ''' +replace([ID] ,'-','')+ ''', ' 
+''''+cast(date_of_birth as nvarchar(100))+ ''', '
--+''''+sex+ ''', '
+''''+ISNULL(type_of_cancer,'')+ ''', '
+''''+ISNULL(first_line_regimen,'')+ ''', '
+''''+cast(date_of_first_treatment as nvarchar(100))+ ''', '
+''''+cast(date_of_last_treatment as nvarchar(100))+ ''', '
+''''+ISNULL(second_line_regimen,'')+ ''', '
+''''+cast(ISNULL(date_of_first_treatment_second_line_treatment,'') as nvarchar(100))+ ''', '
+''''+cast(isnull(date_of_last_treatment_second_line_treatment,'') as nvarchar(100))+ ''', '
+''''+ISNULL(number_of_treatments_second_line_treatment,'')+ ''', '
+''''+ISNULL(third_line_regimen,'')+ ''', '
+''''+cast(isnull(date_of_first_treatment_third_line_treatment,'') as nvarchar(100))+ ''', '
+''''+cast(isnull(date_of_last_treatment_third_line_treatment,'') as nvarchar(100))+ ''', '
+''''+ISNULL(number_of_treatments_third_line_treatment,'')+ ''''
FROM  [dbo].[cln_tmp_amir_fact_oncology]

*/

--can move to prd from here:
begin try drop table #excel_data; end try begin catch end catch;
CREATE TABLE dbo.#excel_data  
(
Id varchar(25)  NULL,
date_of_birth	datetime NULL,	
--sex	nvarchar(255)	NULL, --all the valeus in Rennana's file were null for this field
type_of_cancer	nvarchar(255)	NULL,
first_line_regimen	nvarchar(255)	NULL,
date_of_first_treatment	nvarchar(255)	NULL,
date_of_last_treatment	nvarchar(255)	NULL,
second_line_regimen	nvarchar(255)	NULL,
date_of_first_treatment_second_line_treatment	nvarchar(255) NULL,	
date_of_last_treatment_second_line_treatment	nvarchar(255)	NULL,
number_of_treatments_second_line_treatment	nvarchar(255)	NULL,
third_line_regimen	nvarchar(255)	,
date_of_first_treatment_third_line_treatment	nvarchar(255)	NULL,
date_of_last_treatment_third_line_treatment	nvarchar(255)	NULL,
number_of_treatments_third_line_treatment	nvarchar(255)	
)

--The insert into code lines below, was pasted after running the "select  'INSERT INTO #excel_data..." part of code above in dev
--the folowing code from here on - can be ran in prd

INSERT INTO #excel_data select '900324', 'Jan  1 1940 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Sep  3 2017 11:00AM', 'Jun 11 2018  3:20PM', 'TASMC  GI/LUNG/all KEYTRUDA  200mg q21d - Version 1', 'Oct 28 2018 12:00PM', 'Nov 19 2018  7:55AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '980649', 'Dec  6 1945 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jun 23 2016  5:23PM', 'Jun 23 2016  8:15PM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '1130939', 'Jul  1 1932 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'May 18 2016 12:00AM', 'Jul 21 2016 12:00AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '1353788', 'May 30 1949 12:00AM', 'pancreatic cancer', 'TASMC GI Panceras FOLFIRINOX - Version 4', 'Aug 21 2018  1:33PM', 'Sep 20 2018  8:30PM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '1397710', 'Jan 12 1949 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jan 17 2018  4:19PM', 'Nov  6 2018  3:00PM', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'May 28 2018  1:00PM', 'Sep 27 2018  1:15PM', '', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Dec  3 2018  6:13PM', 'Dec  3 2018  8:32PM', ''
INSERT INTO #excel_data select '1885094', 'Dec 30 1930 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Alimta - Version 1', 'May  8 2017 10:03AM', 'Jun  5 2017 10:39AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '3130481', 'Apr  6 1948 12:00AM', 'pancreatic cancer', 'TASMC Clinical Trial  HALO-109-301  ABRAXAN  + GEMZAR +PEGPH20/placebo q28d - Version 1', 'Nov 13 2017 12:00PM', 'Nov  5 2018  2:40PM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '3194602', 'Jun  9 1944 12:00AM', 'pancreatic cancer', 'TASMC GI - Pancreas Folfirinox 80% - Version 1', 'May 10 2016  6:28PM', 'May  3 2017  4:37PM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '3237781', 'Dec  6 1946 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'May 10 2018 12:00AM', 'May 28 2018 12:00AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '3268844', 'Nov  5 1942 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Apr  6 2016  4:30PM', 'May  5 2016 11:48PM', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Jun 29 2016  2:09PM', 'Nov  6 2016 12:37PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '3838125', 'Aug  4 1949 12:00AM', 'adenocarcinoma of lung', 'TASMC  GI/LUNG/all KEYTRUDA  200mg q21d - Version 2', 'Jan 16 2018 10:00AM', 'Apr 17 2018 12:02PM', 'TASMC AREDIA - Version 4', 'Jan  4 2018  3:12PM', 'Apr 17 2018 10:06AM', '', 'TASMC GYN/BC Taxol (80)+Carbo (AUC2) 3/4 - Version 1', 'Apr 23 2018  4:58PM', 'Jun 27 2018  1:30PM', ''
INSERT INTO #excel_data select '4414850', 'Jan  1 1941 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Apr 17 2016 12:00AM', 'Jul 18 2016 12:00AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '4497723', 'Jan  1 1948 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Nov 19 2017 12:00AM', 'Mar  8 2018 12:00AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '4735387', 'Jan  1 1937 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jun 27 2016  2:22PM', 'Sep  5 2016 12:36PM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '4741724', 'Oct  5 1942 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Nov  1 2015  4:20PM', 'Dec 24 2015  4:15PM', 'TASMC NSCLC Alimta+Avastin+Zomera - Version 1', 'Jan 27 2016  2:30PM', 'Jun 15 2016 12:30PM', '', 'TASMC ZOMERA - Version 2', 'Jul  6 2016 11:05AM', 'Oct 24 2018 12:00PM', ''
INSERT INTO #excel_data select '4890406', 'Apr 11 1946 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Alimta - Version 1', 'Jun 23 2016 12:15PM', 'Jun 23 2016 12:15PM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '5079165', 'Mar 25 1947 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Feb 11 2016  5:53PM', 'Jun 15 2016  8:05PM', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Jul 11 2016  5:20PM', 'Jul 18 2016  4:05PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '5367750', 'Feb  7 1950 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jul 23 2017  1:54PM', 'Sep 15 2017  5:32PM', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Dec 21 2017  3:00PM', 'Jan 29 2018 12:30PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '5394911', 'Aug 21 1945 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Apr 21 2017 11:56AM', 'Jun  9 2017  6:00PM', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Jul 10 2017  4:12PM', 'Jul 26 2017  4:25PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '6963219', 'Apr 28 1948 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  Cisplatin + alimta + avastin - Version 2', 'Dec 17 2017 12:00PM', 'Nov 18 2018 11:29AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '7036056', 'Nov 14 1942 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Jul 25 2017 11:38AM', 'Nov 15 2017  2:46PM', 'TASMC ZOMERA - Version 2', 'Dec  5 2017  1:30PM', 'Mar 13 2018 12:07PM', '', 'TASMC NSCLC Alimta+Avastin  maintenence - Version 2', 'Dec  5 2017  1:08PM', 'Dec  5 2017  1:08PM', ''
INSERT INTO #excel_data select '7147515', 'Oct 19 1934 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Alimta - Version 1', 'Nov  7 2018 12:00AM', 'Nov 28 2018 12:00AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '7157837', 'May 17 1948 12:00AM', 'pancreatic cancer', 'TASMC GI Pancras  FOLFIRINOX modified (Inpatient) - Version 2', 'Nov  8 2015  6:17PM', 'Nov 24 2015 10:32PM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '7199516', 'Mar  1 1947 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Cis+Alimta+Avastin - Version 1', 'Feb  4 2016 10:57AM', 'May 23 2016  4:20PM', 'TASMC NSCLC Alimta - Version 1', 'Jun 20 2016 12:25PM', 'Jun 20 2016 12:25PM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Aug 29 2016  9:48AM', 'Sep 12 2016  2:00PM', ''
INSERT INTO #excel_data select '7432594', 'Jul  5 1949 12:00AM', 'adenocarcinoma of lung', 'TASMC  GI/LUNG/all KEYTRUDA  200mg q21d - Version 1', 'Apr  6 2017 11:08AM', 'Jul 17 2017  2:04PM', 'TASMC Denosumab - Version 1', 'Apr  6 2017  2:17PM', 'Nov 22 2018 10:55AM', '', 'TASMC  GI/LUNG/all KEYTRUDA  200mg q21d - Version 1', 'Aug 29 2017  1:00PM', 'Sep 19 2017  9:00AM', ''
INSERT INTO #excel_data select '7570864', 'Oct 10 1939 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Feb  8 2018  2:28PM', 'Apr 17 2018 12:51PM', 'TASMC ZOMERA - Version 2', 'Feb  8 2018  2:03PM', 'Jun 27 2018 12:45PM', '', 'TASMC  GU   ATEZOLIZUMAB - Version 1', 'Jun  6 2018  2:11PM', 'Jul 18 2018  2:03PM', ''
INSERT INTO #excel_data select '7635675', 'May  7 1946 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Alimta - Version 1', 'Nov 14 2016 12:00AM', 'Nov 14 2016 12:00AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '7857410', 'Oct  5 1947 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Apr 23 2018 12:00AM', 'Sep 25 2018 12:00AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '7889595', 'Dec 16 1936 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Nov  8 2015  3:39PM', 'Aug  2 2016  2:20PM', 'TASMC GYN Gemzar 850 +Carboplatin (AUC5) - Version 1', 'Oct 16 2016 10:20AM', 'Jun 18 2017  1:10PM', '', 'TASMC NSCLC Carbo+Gemzar - Version 1', 'Jul 11 2017  1:00PM', 'Sep  3 2017 11:40AM', ''
INSERT INTO #excel_data select '8143901', 'Jun 23 1946 12:00AM', 'pancreatic cancer', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Jul  4 2018  1:50PM', 'Jul  4 2018  4:15PM', 'TASMC GI Panceras FOLFIRINOX - Version 4', 'Jul 20 2018 12:40PM', 'Aug 22 2018 12:31PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '8174641', 'Nov 11 1935 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Cis+Alimta+Avastin - Version 1', 'Nov  2 2015  3:14PM', 'Jan  4 2016 10:28AM', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Feb 11 2016 10:45AM', 'Jan 22 2018  2:00PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '8362568', 'May 17 1936 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Oct 29 2015 12:00AM', 'Oct 29 2015 12:00AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '8452765', 'Dec  5 1949 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  Cisplatin + alimta + avastin - Version 2', 'Nov 15 2017 12:00AM', 'Feb 28 2018 12:00AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '8827115', 'Mar 22 1947 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Apr 17 2016  1:05PM', 'Jun 12 2016  9:11PM', 'TASMC GI Gemzar  3/4 - Version 1', 'Jul 25 2016  1:50PM', 'Jul 25 2016  1:50PM', '', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Aug  8 2016  4:15PM', 'Apr 23 2017  2:00PM', ''
INSERT INTO #excel_data select '9709700', 'Feb 10 1931 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Nov 18 2015  1:31PM', 'Jun  1 2016  2:27PM', 'TASMC NSCLC Alimta - Version 1', 'Jun 28 2016  1:18PM', 'Aug  9 2016  4:55PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '9814641', 'Jan 13 1948 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Feb 12 2017  2:29PM', 'Apr 24 2017  1:20AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '10080281', 'Jan  1 1938 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Nov  1 2015  3:17PM', 'Jan  5 2016  3:35PM', 'TASMC NSCLC Alimta - Version 1', 'Feb 22 2016 11:35AM', 'Mar 17 2016  2:10PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '10210193', 'Oct 24 1948 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Apr 30 2018  8:06PM', 'May 14 2018  8:00PM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '10225514', 'Mar  5 1950 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jun 23 2016  4:51PM', 'Oct 25 2016  6:49PM', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Nov 16 2016  2:26PM', 'Dec 25 2016  4:09PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '10292993', 'Mar  1 1949 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Version 1', 'Nov  3 2015  6:14PM', 'Jan 18 2016 11:18AM', 'TASMC GI Folfox (infuser) new - Version 1', 'Feb 22 2016  2:30PM', 'Jan 23 2017 12:20PM', '', 'TASMC BC Gemzar+Carboplatin AUC 2 - Version 1', 'Apr 24 2017 11:37AM', 'May 15 2017 11:45AM', ''
INSERT INTO #excel_data select '10324457', 'Jan  1 1944 12:00AM', 'pancreatic cancer', 'TASMC GI -Pancreas Folfirinox-D2-UGT1A1 mutant - Version 1', 'Oct 28 2015  5:57PM', 'Nov 27 2015  1:16AM', 'TASMC GI Gemzar  3/4 - Version 1', 'Dec 24 2015  3:44PM', 'May 11 2016 12:54PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '10679413', 'Nov 13 1943 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  Cisplatin + alimta + avastin - Version 2', 'Nov 26 2017 12:31PM', 'Dec 18 2017  2:50PM', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 2', 'Jan 31 2018  1:00PM', 'Jun 17 2018  2:37PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '11265881', 'Nov 11 1967 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Feb 20 2017  4:30PM', 'Apr  3 2017  6:27PM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '11352663', 'Nov  7 1948 12:00AM', 'pancreatic cancer', 'TASMC GI FOLFIRI (Inpatient) - Version 1', 'Nov 22 2015  3:42PM', 'Feb 22 2016  4:55PM', 'TASMC GI FOLFIRI (Inpatient) - Version 1', 'Nov  8 2015  6:21PM', 'Nov  8 2015  9:00PM', '', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Oct  6 2016  4:30PM', 'Mar  5 2017  5:15PM', ''
INSERT INTO #excel_data select '11497831', 'Dec 28 1953 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Nov  4 2015  1:00PM', 'Nov  4 2015  2:24PM', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Dec 16 2015  1:33PM', 'Aug 31 2016  9:45AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '11764073', 'Dec  7 1952 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Aug 19 2018 12:00AM', 'Dec  5 2018 12:00AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '12409124', 'May  8 1966 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Version 3', 'Jun 16 2016  6:52PM', 'Nov 24 2016 12:10AM', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Jan 19 2017 12:27PM', 'Jul 13 2017  4:48PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '12514121', 'Jul 20 1940 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Jun 19 2018  3:20PM', 'Jul 10 2018 11:54AM', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Jul 31 2018 11:00AM', 'Aug 21 2018 12:12PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '12593190', 'Dec 12 1955 12:00AM', 'adenocarcinoma of lung', 'TAASMC  NSCLC  Cisplatin + alimta + avastin - Version 1', 'Nov  2 2015 12:00AM', 'Dec 14 2015 12:00AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '12720496', 'Oct 23 1954 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'May  3 2016 12:00AM', 'Jul  6 2016 12:00AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '13454491', 'Jan  1 1959 12:00AM', 'pancreatic cancer', 'TASMC GI Pancras  FOLFIRINOX modified (Inpatient) - Version 2', 'Oct 23 2016 10:32AM', 'Nov 27 2016  5:54PM', 'TASMC GI Panceras FOLFIRINOX - Version 4', 'Dec 11 2016 12:30PM', 'Jan 15 2017  6:56PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '13619614', 'Apr 30 1952 12:00AM', 'pancreatic cancer', 'TASMC GI Panceras FOLFIRINOX - Version 4', 'Jan 22 2017 11:26AM', 'May 15 2018  3:00PM', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Jun 18 2018 12:30PM', 'Sep 13 2018  7:35PM', '', 'TASMC Clinical Trial  CAN1001  JNJ-64457107 - Version 2', 'Dec  3 2018 11:19AM', 'Dec  3 2018 12:55PM', ''
INSERT INTO #excel_data select '14095574', 'Aug  8 1938 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Mar  8 2018 12:52PM', 'Aug 23 2018 10:25AM', 'TASMC  GI/LUNG/all KEYTRUDA  200mg q21d - Version 1', 'Oct 24 2018 10:45AM', 'Dec  5 2018  8:11AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '14443196', 'Jan  1 1951 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jun  8 2016  5:46PM', 'Jul  8 2016 12:11AM', 'TASMC GI Panceras FOLFIRINOX - Version 4', 'Jul 31 2016  1:21PM', 'Mar 28 2017 10:02AM', '', 'TASMC GI Gemzar  3/4 - Version 1', 'Apr 12 2017  2:00PM', 'Feb 20 2018 12:17PM', ''
INSERT INTO #excel_data select '14586192', 'Apr 19 1938 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jan 27 2016  3:52PM', 'Mar 17 2016  8:14PM', 'TASMC - GI FOLFOX - Inpatient - Version 1', 'Apr 18 2016 12:54PM', 'May 23 2016 12:21AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '14613673', 'Jan 11 1947 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  Cisplatin + alimta + avastin - Version 2', 'Jun 13 2018  3:31PM', 'Jul  4 2018 11:00AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '14714166', 'Apr  1 1966 12:00AM', 'adenocarcinoma of lung', 'TAASMC  NSCLC  Cisplatin + alimta + avastin - Version 1', 'Jan 13 2016 11:45AM', 'Mar 16 2016 11:45AM', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Aug  2 2016  1:00PM', 'Oct 16 2016 10:00AM', '', 'TASMC ZOMERA - Version 2', 'Nov 24 2016 10:25AM', 'Dec 28 2017 12:33PM', ''
INSERT INTO #excel_data select '14782999', 'Sep  5 1947 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Nov  1 2016  2:13PM', 'Dec  7 2016  9:14PM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '15129067', 'Nov  5 1940 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Alimta - Version 1', 'Jan 31 2017  9:35AM', 'Oct 16 2017 12:39PM', 'TASMC  GU   ATEZOLIZUMAB - Version 1', 'Jun 14 2018  1:49PM', 'Jul 26 2018 12:00PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '15428428', 'Feb 14 1949 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Mar  1 2017  3:00PM', 'Apr 25 2017  2:09PM', 'TASMC ZOMERA - Version 2', 'Mar 22 2017  3:20PM', 'Jun 24 2018  2:24PM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 2', 'Jun 14 2017  2:19PM', 'Jul  8 2018  2:37PM', ''
INSERT INTO #excel_data select '15782022', 'Jan  1 1955 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Oct 10 2016 11:37AM', 'Feb  8 2017 11:02AM', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 2', 'May 18 2017 12:01PM', 'Jun 28 2017  1:42PM', '', 'TASMC ZOMERA - Version 2', 'May 11 2017 12:00PM', 'Jun 14 2017 11:58AM', ''
INSERT INTO #excel_data select '16551590', 'Jan  8 1934 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Feb 27 2018 11:27AM', 'Mar 20 2018 11:31AM', 'TASMC  GU   ATEZOLIZUMAB - Version 1', 'May  2 2018  2:00PM', 'May 23 2018  6:40PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '17881020', 'Mar 10 1943 12:00AM', 'adenocarcinoma of lung', 'TASMC  GI/LUNG/all KEYTRUDA  200mg q21d - Version 1', 'Aug 30 2017 10:07AM', 'Jan 15 2018 11:46AM', 'TASMC ZOMERA - Version 2', 'Dec  3 2017  2:58PM', 'Dec  3 2017  2:58PM', '', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Mar 20 2018  1:53PM', 'Jun 18 2018 12:30PM', ''
INSERT INTO #excel_data select '22527329', 'Jul 30 1966 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Alimta - Version 1', 'Jan  3 2016  4:02PM', 'May 25 2016  3:42PM', 'TASMC ZOMERA - Version 2', 'Apr 13 2016  2:30PM', 'May 25 2016  4:06PM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Jan  4 2017  2:08PM', 'Jan 18 2017 12:07PM', ''
INSERT INTO #excel_data select '22757546', 'May 12 1967 12:00AM', 'adenocarcinoma of lung', 'TASMC  GI/LUNG/all KEYTRUDA  200mg q21d - Version 1', 'Sep 28 2017  8:57AM', 'Mar 28 2018  9:39AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '22995443', 'Jul 22 1967 12:00AM', 'adenocarcinoma of lung', 'TASMC Clinical Trial EMR100070-005 - ArmB (NonSCC): Cis+Alimta - Version 1', 'Mar 28 2016 11:35AM', 'Mar 28 2016  1:35PM', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Aug  4 2016  1:30PM', 'Oct  2 2017  3:24PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '23741457', 'Oct 11 1968 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Dec 11 2017  6:55PM', 'Jan  1 2018  1:08AM', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Jan 21 2018  3:40PM', 'Nov 15 2018  2:35PM', '', 'TASMC GI Pancreas  Gemzar(800) + cisplatin modified - Version 2', 'Dec 11 2018 12:53PM', 'Dec 11 2018 12:53PM', ''
INSERT INTO #excel_data select '23896186', 'Oct  3 1968 12:00AM', 'pancreatic cancer', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Feb 19 2018  2:41PM', 'Feb 19 2018  4:55PM', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Mar  5 2018 11:37AM', 'Apr  3 2018 10:58PM', '', 'TASMC GI Pancreas Folfirinox 80% - Version 2', 'May 21 2018 12:06PM', 'Sep 12 2018  7:22PM', ''
INSERT INTO #excel_data select '24320749', 'Jan 18 1969 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Version 2', 'Dec 13 2015  3:19PM', 'May 29 2016  5:24PM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '25273947', 'May 28 1973 12:00AM', 'adenocarcinoma of lung', 'TAASMC  NSCLC  Cisplatin + alimta + avastin - Version 1', 'Oct 28 2015  3:17PM', 'Oct 28 2015  5:00PM', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 2', 'Aug 10 2017 10:51AM', 'Dec  4 2018 12:19PM', '', 'TASMC HG Glioma Avastin - Version 1', 'Oct  4 2017 11:00AM', 'Oct  9 2018 10:15AM', ''
INSERT INTO #excel_data select '26012393', 'Oct 26 1951 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Cis+Alimta+Avastin - Version 1', 'Jul 14 2016  9:40AM', 'Oct 26 2016  3:34PM', 'TASMC NSCLC Alimta+Avastin  maintenence - Version 2', 'Nov 30 2016  9:54AM', 'May 10 2017 12:18PM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 2', 'Nov  6 2017  7:37AM', 'Jan 15 2018  7:40AM', ''
INSERT INTO #excel_data select '26038356', 'Sep  1 1952 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Oct 20 2017  6:15PM', 'Jan 15 2018  5:20PM', 'TASMC GI Panceras FOLFIRINOX - Version 4', 'Jan 29 2018  4:16PM', 'Dec  2 2018  4:45PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '26737411', 'Nov  7 1951 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jan  4 2017  1:17PM', 'May 19 2017  1:42PM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '26962282', 'Jan 31 1937 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Nov  9 2015  1:15PM', 'Dec  7 2015 10:51AM', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Feb  2 2016  1:02PM', 'Mar 15 2016 12:25PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '28018745', 'Aug 31 1970 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Nov 16 2015  2:40PM', 'Nov 16 2015  2:40PM', 'TASMC NSCLC Alimta - Version 1', 'Jan  7 2016 12:07PM', 'Jan 27 2016 12:15PM', '', 'TASMC ZOMERA - Version 2', 'Mar 22 2018  2:30PM', 'May 13 2018 12:39PM', ''
INSERT INTO #excel_data select '28722775', 'Jun  8 1971 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jan  5 2018 12:45PM', 'Jun 20 2018  2:14PM', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Jul 11 2018 11:35AM', 'Dec  9 2018 10:20AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '29740875', 'Dec 10 1972 12:00AM', 'pancreatic cancer', 'TASMC GI Panceras FOLFIRINOX - Version 4', 'Jun  7 2017  5:55PM', 'Sep  5 2017  6:12PM', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Oct 18 2017  3:53PM', 'Jul 22 2018  4:50PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '30037055', 'Jul 18 1949 12:00AM', 'pancreatic cancer', 'TASMC GI Pancreas Folfirinox 80% - Version 2', 'May  3 2018  1:30PM', 'May  3 2018  1:30PM', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'May 24 2018  3:43PM', 'Jul 26 2018 12:22PM', '', 'TASMC GI FLOX - Version 3', 'Aug  5 2018  6:45PM', 'Sep 30 2018 12:02PM', ''
INSERT INTO #excel_data select '30223671', 'Sep  1 1949 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Alimta - Version 1', 'Oct 26 2015 11:26AM', 'Dec 21 2015  1:14PM', 'TASMC BC Pembrolizumab (keytruda) - Version 1', 'Jan 25 2016  3:20PM', 'Dec 26 2017 11:00AM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 2', 'Jan 16 2018 11:42AM', 'Dec  4 2018  7:36AM', ''
INSERT INTO #excel_data select '30412340', 'Jul 15 1949 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'May 23 2016  9:58PM', 'Sep  6 2016  7:23PM', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Sep 25 2016  5:35PM', 'Jun 22 2017 12:34PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '30483176', 'Feb  1 1949 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Nov 27 2017  3:15PM', 'Jan  1 2018  6:51PM', 'TASMC GI Panceras FOLFIRINOX - Version 4', 'Jan 15 2018 12:55PM', 'Mar 18 2018  4:04PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '30545149', 'Oct 13 1947 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Aug  7 2017  3:36PM', 'Aug  2 2018  9:25AM', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Nov 18 2018  3:03PM', 'Dec  4 2018  5:53PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '30554828', 'Feb 24 1929 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Alimta - Version 1', 'Mar 16 2016 11:07AM', 'Jul 20 2016 10:16AM', 'TASMC ZOMERA - Version 2', 'Mar 16 2016 11:57AM', 'Oct 19 2016 10:33AM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Oct 19 2016  9:47AM', 'Nov  2 2016  9:24AM', ''
INSERT INTO #excel_data select '30625735', 'Jan  1 1947 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Mar  6 2018 12:12PM', 'Aug  9 2018 10:00AM', 'TASMC NSCLC OPDIVO 3mg/kg q2week - Version 1', 'Oct 17 2018 11:31AM', 'Dec 12 2018  7:45AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '30656656', 'Jan  1 1946 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Version 3', 'Jan 25 2016  9:50AM', 'Mar 14 2016  1:43PM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '34465948', 'Dec 26 1977 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jul  4 2018  6:20PM', 'Aug  2 2018  6:26PM', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Aug 14 2018  4:25PM', 'Nov 21 2018  1:00PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '41600339', 'Jan  1 1947 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'May 17 2018 11:04AM', 'Jul 19 2018 11:10AM', 'TASMC ZOMERA - Version 2', 'Oct 11 2018  2:00PM', 'Oct 11 2018  2:00PM', '', 'TASMC  GU   ATEZOLIZUMAB - Version 1', 'Sep 20 2018 11:00AM', 'Oct 11 2018  9:34AM', ''
INSERT INTO #excel_data select '42022418', 'Jan  1 1940 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Alimta - Version 1', 'Jun  7 2017 12:00AM', 'Jun  7 2017 12:00AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '42241299', 'Jan  1 1949 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Mar  8 2016 11:39AM', 'Mar 29 2016  2:48PM', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Apr 21 2016  8:58AM', 'Jun  2 2016 10:41AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '42518555', 'Jul 21 1943 12:00AM', 'adenocarcinoma of lung', 'TAASMC  NSCLC  Cisplatin + alimta + avastin - Version 1', 'Dec 29 2015 11:54AM', 'May  3 2016  1:25PM', 'TASMC NSCLC Alimta+Avastin  maintenence - Version 2', 'Sep 20 2016 11:41AM', 'Oct 18 2016 11:07AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '42644245', 'Nov  1 1936 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Jun 16 2016  9:35AM', 'Sep 11 2016 11:33AM', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Feb 22 2017 10:30AM', 'Apr 26 2017  4:47PM', '', 'TASMC ZOMERA - Version 2', 'Feb 22 2017 11:10AM', 'Apr  3 2017  2:18PM', ''
INSERT INTO #excel_data select '46625547', 'Jan  1 1946 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Nov  6 2017  2:31PM', 'Nov 27 2017  3:00PM', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 2', 'Feb  5 2018  4:28PM', 'Feb  5 2018  4:28PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '46722948', 'Jan  1 1947 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Jun 12 2018 12:45PM', 'Aug 15 2018  4:39PM', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Sep 25 2018 10:20AM', 'Oct 16 2018 10:55AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '46924239', 'Apr 24 1948 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Dec 29 2016 12:00AM', 'Mar  2 2017 12:00AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '47100235', 'Jan  1 1945 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Jul 11 2017 12:00AM', 'Feb  6 2018 12:00AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '48740138', 'Jan  1 1949 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Jun  9 2016  1:12PM', 'Aug 15 2016 11:00AM', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Feb  1 2017 11:21AM', 'Mar 16 2017  1:59PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '49181415', 'Jun 29 1926 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Jul 26 2016 12:10PM', 'Dec 11 2016 11:32AM', 'TASMC ZOMERA - Version 2', 'Oct 30 2016 11:15AM', 'May 11 2017 10:43AM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Feb  2 2017 10:59AM', 'Apr 27 2017 10:23AM', ''
INSERT INTO #excel_data select '49440548', 'Jan  1 1948 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Nov 14 2017 12:00AM', 'Jan 16 2018 12:00AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '50306810', 'Oct 22 1950 12:00AM', 'pancreatic cancer', 'TASMC GI Pancras  FOLFIRINOX modified (Inpatient) - Version 2', 'Nov  6 2015  2:43PM', 'Jun 19 2016  8:40PM', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Jul 11 2016  2:37PM', 'Oct  7 2016 12:55PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '50695279', 'Sep 13 1951 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  Cisplatin + alimta + avastin - Version 2', 'Dec  1 2016  2:57PM', 'Jun 15 2017  2:42PM', 'TASMC ZOMERA - Version 2', 'Nov 29 2016  4:00PM', 'Mar 28 2018  3:24PM', '', 'TASMC GI/GYN Gemzar+Cisplatin (d1+8) - Version 1', 'Jul  9 2017 12:50PM', 'Aug 23 2017  2:36PM', ''
INSERT INTO #excel_data select '50783950', 'Aug 30 1951 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Oct 24 2018 12:00AM', 'Nov 14 2018 12:00AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '51113306', 'Mar 31 1952 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'May 15 2016  3:58PM', 'Jun 15 2017  8:08PM', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Jul 16 2017 11:45AM', 'Aug  3 2017 12:23PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '51170157', 'Jan 23 1952 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  Cisplatin + alimta + avastin - Version 2', 'Dec  2 2018 12:00AM', 'Dec  2 2018 12:00AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '51210664', 'Apr  8 1952 12:00AM', 'adenocarcinoma of lung', 'TASMC  GI/LUNG/all KEYTRUDA  200mg q21d - Version 1', 'Sep 28 2017  1:20PM', 'Nov 30 2017 11:08AM', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Mar  5 2018 10:21AM', 'Oct  8 2018 11:44AM', '', 'TASMC NSCLC Navelbine - Version 1', 'Nov 21 2018 11:49AM', 'Dec  5 2018  2:01PM', ''
INSERT INTO #excel_data select '51216257', 'Jun  2 1952 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Oct 18 2017  2:17PM', 'Dec 25 2017  1:01PM', 'TASMC NSCLC OPDIVO 3mg/kg q2week - Version 1', 'Aug 27 2018  4:02PM', 'Oct 10 2018  4:10PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '51403103', 'Jul  3 1953 12:00AM', 'pancreatic cancer', 'TASMC GI Pancras  FOLFIRINOX modified (Inpatient) - Version 2', 'Jun  1 2016  8:23PM', 'Jul  3 2016  6:03PM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '52109097', 'Nov  2 1953 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Nov  3 2015 12:00AM', 'Jan  3 2016 12:00AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '52265774', 'Dec 22 1953 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Jan 29 2017 11:29AM', 'Jan 29 2017 12:32PM', 'TASMC ZOMERA - Version 2', 'Mar 19 2017 11:02AM', 'Nov 18 2018 10:20AM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Mar 19 2017  9:32AM', 'Nov 18 2018  9:23AM', ''
INSERT INTO #excel_data select '52410206', 'Mar 10 1953 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jan 10 2018  5:08PM', 'Jan 10 2018  7:50PM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '52754074', 'Jul 20 1954 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Nov 16 2015  1:53PM', 'Dec 28 2015  1:17PM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '52764321', 'Nov 17 1954 12:00AM', 'adenocarcinoma of lung', 'TAASMC  NSCLC  Cisplatin + alimta + avastin - Version 1', 'Nov  5 2015 11:23AM', 'Jun 23 2016 12:00PM', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Aug  3 2016 11:40AM', 'Oct 27 2016  9:39AM', '', 'TASMC ZOMERA - Version 2', 'Oct 25 2016 10:15AM', 'Oct 25 2016 10:15AM', ''
INSERT INTO #excel_data select '52889128', 'Jun  5 1954 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Aug 21 2016  3:22PM', 'Oct  9 2016  6:05PM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '53278917', 'Apr 19 1955 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Mar 29 2017  6:12PM', 'May 24 2017  7:30PM', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Jun 22 2017 12:15PM', 'Sep 24 2017  2:20PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '53386231', 'Feb  5 1955 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jun  9 2017 12:50PM', 'Oct 22 2017  8:15PM', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Nov 16 2017  2:21PM', 'Jan  7 2018  5:10PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '53458006', 'Jun 26 1955 12:00AM', 'pancreatic cancer', 'TASMC GI Panceras FOLFIRINOX - Version 4', 'Jul 10 2016  3:03PM', 'Apr 22 2018  1:13PM', 'TASMC GI biliary  tract  Gemzar D1+8+15 q28d - Version 1', 'May  6 2018  7:02PM', 'Jun 11 2018 12:09PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '53504379', 'Feb 14 1958 12:00AM', 'pancreatic cancer', 'TASMC GI FOLFIRI (Infusor) - Version 1', 'Nov  8 2015 11:56AM', 'Aug 18 2016  9:30AM', 'TASMC GI Panceras FOLFIRINOX - Version 4', 'Aug 30 2016 10:00AM', 'Jan 31 2017  1:00PM', '', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Feb 21 2017 11:20AM', 'Jul 20 2017  1:18PM', ''
INSERT INTO #excel_data select '53569174', 'Oct  9 1955 12:00AM', 'pancreatic cancer', 'TASMC GI Pancreas Folfirinox 80% - Version 2', 'Dec 18 2016  5:08PM', 'Jan 22 2017  4:14PM', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Feb 19 2017 11:30AM', 'May 21 2017  1:03PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '53604450', 'Oct 15 1955 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Version 3', 'May 20 2016  4:22PM', 'Jun 24 2016 11:32PM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '53651667', 'Oct 29 1955 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Dec 27 2017  1:15PM', 'Apr 20 2018  4:52PM', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'May 14 2018  5:56PM', 'May 27 2018  2:00PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '53888210', 'Dec 19 1955 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Mar  6 2016 12:27PM', 'Apr 18 2016  3:08AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '53892303', 'Jan 10 1956 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Oct 10 2017  9:52AM', 'Jun 14 2018 11:32AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '53897807', 'Feb 19 1956 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Version 3', 'May 15 2016  7:10PM', 'Oct 16 2017  5:02PM', 'TASMC GI Panceras FOLFIRINOX - Version 4', 'Nov 12 2017 11:38AM', 'Dec 12 2017  6:19PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '53936977', 'Jan 27 1956 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Nov 16 2017 12:00AM', 'Jan 28 2018 12:00AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '54070206', 'Mar 28 1956 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Apr  9 2018 10:17AM', 'Aug 16 2018  1:00PM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '54076633', 'Mar 24 1956 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Apr 26 2016 11:24AM', 'Jun 15 2016  3:01PM', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Jun 15 2016  1:47PM', 'Jul 11 2016 11:32AM', '', 'TASMC NSCLC Alimta+Avastin  maintenence - Version 2', 'Aug  8 2016 10:24AM', 'Oct 26 2016 11:44AM', ''
INSERT INTO #excel_data select '54211735', 'Jun 20 1957 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  Cisplatin + alimta + avastin - Version 2', 'Apr  1 2018  1:15PM', 'Jun  4 2018  1:36PM', 'TASMC BC Pembrolizumab (keytruda) - Version 1', 'Jul 25 2018 10:40AM', 'Dec  4 2018 10:55AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '54309026', 'Jun 23 1956 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Feb  5 2017 12:03PM', 'Apr 12 2017 12:15PM', 'Radionecrosis - Avastin 7.5mg/kg X4 q3w - Version 1', 'Oct 22 2018  5:00PM', 'Dec  5 2018  2:41PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '54350582', 'Jan 29 1957 12:00AM', 'pancreatic cancer', 'TASMC GI -pancreas Gemzar Burris - Version 1', 'Oct 27 2015  2:00PM', 'Oct 27 2015  2:00PM', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Dec 21 2015  2:03PM', 'Jan 24 2016  5:11PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '54934427', 'Dec 18 1957 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Nov 13 2016 10:25AM', 'Mar 22 2017 12:54PM', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 2', 'May 14 2017  1:18PM', 'Dec 10 2017  1:08PM', '', 'TASMC BC/GYN Taxol q3weeks - Version 1', 'Jul 10 2018  3:15PM', 'Sep 20 2018  1:34PM', ''
INSERT INTO #excel_data select '55014310', 'Jan 12 1958 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Feb 22 2016  2:46PM', 'Jun  5 2017  5:40PM', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Jul 26 2017  1:41PM', 'Sep 13 2017 11:15AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '55246714', 'Apr 17 1958 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Aug 19 2018 12:00AM', 'Oct 31 2018 12:00AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '55871537', 'Apr 16 1959 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Mar 22 2018 11:54AM', 'May  9 2018  4:50PM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '55943906', 'Sep 14 1959 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Cis+Alimta+Avastin - Version 1', 'Jan 12 2016 10:59AM', 'Nov 17 2016 10:57AM', 'TASMC ZOMERA - Version 2', 'Feb  2 2016  3:05PM', 'Feb  2 2016  3:05PM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Feb 15 2017  1:25PM', 'May 10 2017 10:20AM', ''
INSERT INTO #excel_data select '56111891', 'Nov  2 1959 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Oct 11 2018 11:08AM', 'Nov 28 2018 11:54AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '56226913', 'Apr 26 1960 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Nov 27 2016  4:27PM', 'Jan 30 2017  6:00PM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '56268790', 'Jun  4 1960 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Nov 24 2017  5:02PM', 'Dec  8 2017  9:36PM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '56616360', 'Aug 18 1960 12:00AM', 'pancreatic cancer', 'TASMC GI FOLFIRI (Infusor) - Version 1', 'Nov  5 2015 10:45AM', 'Mar  3 2016  2:13PM', 'TASMC GI- panceras FOLFIRINOX - Version 3', 'Mar 31 2016 12:20PM', 'May 19 2016  2:30PM', '', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Jun 16 2016  4:31PM', 'Sep 21 2016  1:50PM', ''
INSERT INTO #excel_data select '57308421', 'Aug 26 1961 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Dec 29 2016 12:00AM', 'Mar  2 2017 12:00AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '57461923', 'May  1 1962 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jul 27 2016  4:08PM', 'Mar  1 2017  3:49PM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '57801813', 'Nov 11 1962 12:00AM', 'adenocarcinoma of lung', 'TAASMC  NSCLC  Cisplatin + alimta + avastin - Version 1', 'Dec 28 2015 11:43AM', 'Feb 15 2016 11:31AM', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Jun 27 2016 11:41AM', 'Apr  3 2017  2:19PM', '', 'TASMC ZOMERA - Version 2', 'Jun 27 2016 12:15PM', 'Apr 17 2018 11:30AM', ''
INSERT INTO #excel_data select '57991143', 'Dec 27 1962 12:00AM', 'adenocarcinoma of lung', 'Clinical Trial bTMB cohort C - Carbo+Alimta - Version 1', 'Apr 26 2018 12:00AM', 'Dec 12 2018 12:00AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '57996894', 'Jan 15 1963 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  Cisplatin + alimta + avastin - Version 2', 'Nov 16 2016 11:20AM', 'Jun 28 2017 12:45PM', 'TASMC ZOMERA - Version 2', 'Dec  7 2016  4:52PM', 'Jun 28 2017  2:00PM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 2', 'Jul 12 2017 10:03AM', 'Jul 26 2017 12:46PM', ''
INSERT INTO #excel_data select '58123571', 'Apr 27 1963 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Apr 21 2017  7:32PM', 'May 22 2017 12:42AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '58274069', 'Sep 30 1963 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Dec  6 2015  2:31PM', 'Feb  3 2016  1:17AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '58279043', 'Nov  2 1963 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Apr  3 2017  6:18PM', 'May 30 2017  5:51PM', 'TASMC GI Panceras FOLFIRINOX - Version 4', 'Jun 13 2017  1:19PM', 'Jul 27 2017  3:30PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '58425398', 'Oct  3 1963 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Feb  5 2017  5:56PM', 'Feb  5 2017  9:02PM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '58621491', 'Mar 18 1964 12:00AM', 'adenocarcinoma of lung', 'TASMC BC Pembrolizumab (keytruda) - Version 1', 'Mar 16 2017 10:39AM', 'Jan 10 2018  7:45AM', 'TASMC NSCLC  Cisplatin + alimta + avastin - Version 2', 'Jan 31 2018  1:18PM', 'Aug  9 2018  3:30PM', '', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Sep 26 2018  1:50PM', 'Oct 17 2018  2:39PM', ''
INSERT INTO #excel_data select '58626284', 'Apr  9 1964 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Sep 28 2017 12:46PM', 'Oct 26 2017 10:38AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '58718800', 'Jun  3 1964 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Apr  6 2016 12:00AM', 'Jun 15 2016 12:00AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '59097113', 'Sep 20 1964 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Nov 11 2015  1:34PM', 'Dec 23 2015  2:44PM', 'TASMC NSCLC Alimta - Version 1', 'Mar 21 2016 12:18PM', 'May  2 2016 11:30AM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Feb 15 2017 11:57AM', 'Apr  2 2017 10:07AM', ''
INSERT INTO #excel_data select '59276659', 'Apr  1 1965 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Nov  5 2015  3:00PM', 'Nov 30 2015  1:39PM', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Jan 21 2016 11:01AM', 'Dec  5 2018  5:36PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '60178431', 'Jan  1 1946 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jan 20 2016  6:35PM', 'Mar 10 2016  7:54AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '60550134', 'Aug 16 1955 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'May  6 2018  1:44PM', 'Jul 11 2018 12:43PM', 'TASMC NSCLC DURVALUMAB 10mg  /kg  q2week - Version 1', 'Oct 23 2018 10:48AM', 'Nov 20 2018 10:41AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '61816039', 'Jan  1 1944 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Alimta+Avastin+Zomera - Version 1', 'Nov 18 2015 10:13AM', 'Mar 16 2016 10:21AM', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Aug 10 2016  9:11AM', 'Oct  6 2016  2:00PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '61923348', 'Jan  1 1950 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Apr 13 2017 12:21PM', 'Sep 11 2017  4:30PM', 'TASMC  GU   ATEZOLIZUMAB - Version 1', 'Nov  1 2017  2:40PM', 'Jan 10 2018  2:00PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '62095161', 'Nov 27 1952 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Nov  8 2015  2:10PM', 'Mar  2 2016 11:16AM', 'TASMC NSCLC Alimta+Avastin+Zomera - Version 1', 'Mar 23 2016  9:18AM', 'Feb  6 2017 12:02PM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Mar 14 2017  9:40AM', 'Jun 26 2018  7:43AM', ''
INSERT INTO #excel_data select '62507199', 'Jan  1 1952 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Version 1', 'Oct 26 2015  6:56PM', 'Oct 28 2015  1:36AM', 'TASMC GI Pancras  FOLFIRINOX modified (Inpatient) - Version 2', 'Nov  9 2015  6:26PM', 'Feb 19 2016 10:30PM', '', 'TASMC GI FOLFIRI (Infusor) - Version 1', 'Mar  6 2016 12:00PM', 'Mar  6 2016  3:05PM', ''
INSERT INTO #excel_data select '64404163', 'Jan 22 1938 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jul 24 2017  2:01PM', 'Jul 24 2017  4:41PM', 'TASMC GI Gemzar  3/4 - Version 1', 'Aug 16 2017  3:07PM', 'Sep 19 2017  2:44PM', '', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Oct  3 2017  4:03PM', 'Jun 12 2018  3:23PM', ''
INSERT INTO #excel_data select '64440860', 'Mar  3 1949 12:00AM', 'pancreatic cancer', 'TASMC GI Pancras  FOLFIRINOX modified (Inpatient) - Version 2', 'Nov 13 2015  3:16PM', 'Feb 19 2016 10:20PM', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Mar 30 2016  2:41PM', 'May 10 2016  2:29PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '64607971', 'Jan  1 1943 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jun 24 2016  7:13PM', 'Jan 22 2017  5:52PM', 'TASMC GI FOLFIRI (Inpatient) - Version 1', 'Apr 14 2017  1:22PM', 'May 25 2017  7:45PM', '', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Jun 22 2017 12:01PM', 'Jul 30 2017 11:00AM', ''
INSERT INTO #excel_data select '64676109', 'Feb  2 1946 12:00AM', 'pancreatic cancer', 'TASMC GI -Pancreas Folfirinox-D2-UGT1A1 mutant - Version 1', 'Nov  1 2015  3:03PM', 'Nov 15 2016  1:58PM', 'TASMC GI De Gramont (Inpatient) - Version 1', 'Dec 25 2016 10:26AM', 'Feb  5 2017 12:04PM', '', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Oct 22 2017 11:00AM', 'Dec 14 2017  2:28PM', ''
INSERT INTO #excel_data select '64685050', 'Sep 19 1942 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jun 30 2017  1:55PM', 'Aug 20 2017  7:16PM', 'TASMC GI Pancreas Folfirinox 80% - Version 2', 'Sep 27 2017  4:49PM', 'Jan 21 2018 12:20PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '65598815', 'Jul 22 1951 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Cis+Alimta+Avastin - Version 1', 'Nov  5 2015  1:10PM', 'Dec 14 2016  2:22PM', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Feb  8 2017  1:00PM', 'May 24 2017 12:46PM', '', 'TASMC ZOMERA - Version 2', 'Feb 22 2017  3:21PM', 'Feb 22 2017  3:21PM', ''
INSERT INTO #excel_data select '65888372', 'Nov 13 1953 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'May 31 2016 12:00AM', 'Nov  7 2016 12:00AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '67458455', 'Apr 14 1944 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Feb 21 2018 11:26AM', 'Jul 11 2018 10:55AM', 'TASMC ZOMERA - Version 2', 'Mar 14 2018  3:30PM', 'May  7 2018  9:25AM', '', 'TASMC  GI/LUNG/all KEYTRUDA  200mg q21d - Version 1', 'Sep  3 2018  7:49AM', 'Nov 26 2018  7:46AM', ''
INSERT INTO #excel_data select '68538248', 'Jan 24 1944 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Apr  3 2016 11:15AM', 'Jul 17 2016 12:59PM', 'TASMC NSCLC Alimta+Avastin  maintenence - Version 2', 'Aug  9 2016  2:57PM', 'Nov 27 2016 12:24PM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 2', 'May 18 2017  2:02PM', 'Jul 19 2017  1:45PM', ''
INSERT INTO #excel_data select '68692888', 'Jan  1 1954 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Feb  8 2017 12:35PM', 'May  3 2017  1:54PM', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 2', 'Jul 11 2017 11:56AM', 'Aug 22 2017 11:26AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '69209609', 'Aug 19 1953 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Feb 29 2016  3:40PM', 'Jul 27 2016  7:31PM', 'TASMC GI FOLFIRI (Infusor) - Version 2', 'Aug 16 2016  4:37PM', 'Feb 28 2017  2:01PM', '', 'TASMC GI Panceras FOLFIRINOX - Version 4', 'Mar 28 2017 12:55PM', 'May 16 2017  5:19PM', ''
INSERT INTO #excel_data select '69226256', 'Oct 15 1946 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Nov 13 2016  3:40PM', 'Dec  5 2016 12:00AM', 'TASMC GI Panceras FOLFIRINOX - Version 4', 'Dec 25 2016 10:47AM', 'Nov 14 2017  3:32PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '69338713', 'Feb 17 1948 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Aug 21 2018 10:49AM', 'Nov 21 2018 10:22AM', 'TASMC  GI/LUNG/all KEYTRUDA  200mg q21d - Version 1', 'Aug 21 2018  3:08PM', 'Nov 21 2018  9:34AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '69792166', 'Dec 11 1951 12:00AM', 'adenocarcinoma of lung', 'TAASMC  NSCLC  Cisplatin + alimta + avastin - Version 1', 'Jan 14 2016 12:55PM', 'Feb  4 2016  3:04PM', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Mar 30 2016  2:45PM', 'Apr 27 2016  1:12PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '70875786', 'Jan  1 1944 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'May 24 2016  1:01PM', 'Jun  9 2016  3:06AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '71687438', 'Jan  1 1950 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Version 2', 'Nov  9 2015  7:16PM', 'Nov  9 2015 10:14PM', 'TASMC SCLC CIS(100) d1 +VP16(100)d1-3 q21d - Version 1', 'Nov 24 2015  4:39PM', 'Nov 24 2015 11:24PM', '', 'irinotecan + cisplatin - Version 1', 'Nov 26 2015  4:58PM', 'Nov 26 2015  4:58PM', ''
INSERT INTO #excel_data select '78262086', 'Jan  1 1948 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'May 24 2017  2:48PM', 'Jun 20 2017 12:10PM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '79554937', 'Feb  8 1950 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Jun 22 2016  1:37PM', 'Jul 18 2016 12:02PM', 'TASMC NSCLC  Cisplatin + alimta + avastin - Version 2', 'Aug  8 2016  1:34PM', 'Jan  9 2017  2:46PM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Mar  9 2017 12:04PM', 'Jul 20 2017  2:09PM', ''
INSERT INTO #excel_data select '79867461', 'Jan  1 1950 12:00AM', 'pancreatic cancer', 'TASMC GI Pancras  FOLFIRINOX modified (Inpatient) - Version 2', 'Dec 26 2016  5:25PM', 'Feb 16 2017  1:30AM', 'TASMC GI biliary  tract  Gemzar D1+8+15 q28d - Version 1', 'Mar  1 2017  2:29PM', 'Apr 14 2017  2:16PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '303900260', 'Sep  5 1946 12:00AM', 'pancreatic cancer', 'TASMC GI Pancras  FOLFIRINOX modified (Inpatient) - Version 2', 'Mar 22 2017  7:13PM', 'Jun  1 2017  6:53PM', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Jul  4 2017  2:05PM', 'Jul 17 2017  2:51PM', '', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Aug 25 2017  2:05PM', 'Aug 25 2017  4:04PM', ''
INSERT INTO #excel_data select '304269566', 'Apr 14 1949 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Nov  8 2015  1:57PM', 'Jan 11 2016  4:56PM', 'TAASMC  NSCLC  Cisplatin + alimta + avastin - Version 1', 'Feb  7 2016  1:12PM', 'Mar 22 2016  2:18PM', '', 'TASMC  NSCLC  AVASTIN  maintenence - Version 1', 'Apr 12 2016  3:06PM', 'May  3 2016  1:38PM', ''
INSERT INTO #excel_data select '304341654', 'Sep 19 1947 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Apr  9 2016  4:15PM', 'May 22 2016  8:57PM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '305856411', 'Feb 15 1954 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'May  5 2016 11:56AM', 'Jul 13 2016 11:36AM', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Oct 10 2016  2:12PM', 'Nov  7 2017 12:40PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '306038951', 'Oct 29 1947 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'May 19 2016 11:20AM', 'Jun 30 2016  1:43PM', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Jul 21 2016 10:39AM', 'Dec 15 2016 11:07AM', '', 'TASMC GI Gemzar  3/4 - Version 1', 'Jan  5 2017 11:14AM', 'Jan 19 2017  2:45PM', ''
INSERT INTO #excel_data select '306218439', 'Feb 10 1953 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Alimta - Version 1', 'Nov 12 2015  2:46PM', 'Feb 14 2016 10:35AM', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Apr 10 2016  9:48AM', 'Dec  3 2018  7:35AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '306976960', 'Dec 18 1942 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jul 12 2017  6:30PM', 'Jan  3 2018 10:45PM', 'TASMC GI FOLFIRI (Inpatient) - Version 1', 'Jan 23 2018 12:19PM', 'Feb 12 2018  8:19PM', '', 'TASMC GI FOLFIRI (Infusor) - Version 2', 'Mar 27 2018  1:29PM', 'Dec  3 2018 11:12AM', ''
INSERT INTO #excel_data select '307186858', 'Jun  8 1953 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Jul 15 2018 12:00AM', 'Oct  7 2018 12:00AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '307507053', 'Aug  9 1947 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Dec 12 2018  2:13PM', 'Dec 12 2018  2:13PM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '307580282', 'Oct 25 1959 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jun  2 2016  6:42PM', 'Jun 19 2016 11:55PM', 'TASMC GI Panceras FOLFIRINOX - Version 4', 'Jul  3 2016  4:52PM', 'Jul 18 2016  8:48PM', '', 'TASMC GI Gemzar  3/4 - Version 1', 'Aug  4 2016  2:45PM', 'Aug 18 2016 10:16AM', ''
INSERT INTO #excel_data select '308611623', 'Apr 17 1938 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Nov 30 2015 11:44AM', 'Nov 30 2015 11:54AM', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'May  8 2016 10:25AM', 'Jun  1 2016 12:02PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '308728617', 'Apr 14 1966 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Jul  4 2017 12:14PM', 'Oct 24 2017  1:52PM', 'TASMC NSCLC Alimta+Avastin  maintenence - Version 2', 'Nov 16 2017 12:34PM', 'Dec  7 2017 12:45PM', '', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 2', 'Jan  4 2018 10:48AM', 'Mar 11 2018 12:55PM', ''
INSERT INTO #excel_data select '308949411', 'May 20 1954 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Dec 17 2015 12:00AM', 'Jan  7 2016 12:00AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '309115384', 'Nov 19 1948 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Dec 13 2015 10:00AM', 'Feb 17 2016 10:22AM', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 2', 'Mar  7 2017  2:00PM', 'May  3 2017 11:20AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '309158384', 'Nov 24 1954 12:00AM', 'pancreatic cancer', 'TASMC GI Pancras  FOLFIRINOX modified (Inpatient) - Version 1', 'Nov  3 2015 12:14PM', 'Jun  6 2016  9:40AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '309569754', 'Aug  2 1939 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Dec 27 2016 12:57PM', 'Jan 22 2017  4:58PM', 'TASMC GYN/BC Taxol (80)+Carbo (AUC2) 3/4 - Version 1', 'Feb 12 2017  1:45PM', 'Apr  3 2017  2:30PM', '', 'TASMC  GU   ATEZOLIZUMAB - Version 1', 'Feb 27 2018 10:25AM', 'Nov 28 2018 10:22AM', ''
INSERT INTO #excel_data select '310267265', 'Jun 22 1941 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Oct 19 2017  1:16PM', 'Nov  9 2017  2:12PM', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 2', 'Dec 10 2017 11:00AM', 'Mar 13 2018  1:15PM', '', 'TASMC ZOMERA - Version 2', 'Jan  7 2018  3:14PM', 'Jan  7 2018  3:14PM', ''
INSERT INTO #excel_data select '310280474', 'Sep 12 1936 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Sep 13 2017 11:03AM', 'Nov 27 2017  1:34PM', 'TASMC NSCLC DURVALUMAB 10mg  /kg  q2week - Version 1', 'May 10 2018 10:41AM', 'Dec  5 2018  2:45PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '310353065', 'Sep 25 1948 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jul 12 2017  6:39PM', 'Aug 24 2017  2:54PM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '310585666', 'Mar 24 1967 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  Cisplatin + alimta + avastin - Version 2', 'Apr 20 2017  9:19AM', 'Jun 26 2017 12:57PM', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 2', 'Aug 28 2017  7:48AM', 'Oct  9 2017  9:37AM', '', 'TASMC NSCLC Cis+Gemzar - Version 1', 'Oct 25 2017 11:13AM', 'Mar 12 2018 11:49AM', ''
INSERT INTO #excel_data select '310765748', 'Sep 12 1940 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC   OPDIVO (nivolumab) - Version 1', 'Nov  1 2015 12:14PM', 'Feb 11 2016  1:49PM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '311996433', 'Sep  5 1946 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Jul 21 2016 11:46AM', 'Oct 13 2016  4:04PM', 'TASMC NSCLC Alimta - Version 1', 'Dec 15 2016 12:50PM', 'Jan 26 2017 11:32AM', '', 'TASMC NSCLC Alimta - Version 1', 'Sep  7 2017  3:19PM', 'Nov  2 2017 11:41AM', ''
INSERT INTO #excel_data select '312033772', 'Mar 19 1966 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Feb 25 2018  3:31PM', 'Apr 11 2018  1:04AM', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'May 17 2018  5:02PM', 'May 24 2018  2:51PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '313798514', 'Mar  3 1951 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'May  8 2016  3:57PM', 'Apr 18 2017  2:45PM', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'May  9 2017 11:36AM', 'Oct 14 2018 11:30AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '314151986', 'Jun 22 1959 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jun 14 2017  1:07PM', 'Jul 30 2017  4:55PM', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Aug 30 2017  4:34PM', 'Oct 10 2017  5:36PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '314235672', 'May 30 1965 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'May 23 2018  5:09PM', 'Jul  4 2018  9:20PM', 'TASMC GI Panceras FOLFIRINOX - Version 4', 'Jul 29 2018 11:24AM', 'Nov 28 2018  3:30PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '314590571', 'Aug 19 1958 12:00AM', 'pancreatic cancer', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Oct 16 2016  2:42PM', 'Oct 16 2016  5:00PM', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Oct 30 2016  5:19PM', 'Nov 15 2016  7:47PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '316695360', 'Jan 18 1949 12:00AM', 'pancreatic cancer', 'TASMC GI Panceras FOLFIRINOX - Version 4', 'Feb 22 2018  2:26PM', 'Jun 13 2018  3:17AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '316817709', 'Feb 20 1948 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Feb 23 2018 11:46AM', 'Jun  2 2018  3:15AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '317292340', 'Jan 19 1942 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Oct 29 2017 10:27AM', 'Apr 16 2018 12:49PM', 'TASMC AREDIA - Version 4', 'Oct 29 2017 12:53PM', 'Mar 19 2018  4:00PM', '', 'TASMC  GU   ATEZOLIZUMAB - Version 1', 'Aug 22 2018  3:15PM', 'Nov  1 2018  9:48AM', ''
INSERT INTO #excel_data select '320513666', 'Oct 15 1956 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'May  5 2016 10:34AM', 'May  5 2016 11:03AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '320551955', 'May 12 1968 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Sep  3 2017  5:40PM', 'Oct  4 2017  5:06PM', 'TASMC BC/GYN Gemzar d1,8 q21d - Version 1', 'Oct 26 2017  5:41PM', 'Jan  7 2018  3:35PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '321440943', 'Jan 29 1947 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Version 1', 'Nov  1 2015  6:38PM', 'Nov 16 2015  3:19AM', 'TASMC GI FOLFIRI (Inpatient) - Version 1', 'Jan 10 2016  6:14PM', 'Mar  6 2016  9:01PM', '', 'TASMC - GI FOLFOX - Inpatient - Version 1', 'May  8 2016  7:12PM', 'May 25 2016 12:30AM', ''
INSERT INTO #excel_data select '321860538', 'Sep 17 1946 12:00AM', 'pancreatic cancer', 'TASMC GI Pancras  FOLFIRINOX modified (Inpatient) - Version 2', 'Apr  3 2018  2:47PM', 'Oct 12 2018  9:02PM', 'TASMC BC/GYN Gemzar - Version 1', 'Nov  8 2018  2:15PM', 'Dec 12 2018  2:58PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '323323170', 'Jan 30 1950 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Alimta - Version 1', 'Oct 29 2017 12:00AM', 'Nov 19 2017 12:00AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '323387605', 'Feb  2 1943 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Jul 30 2017  2:46PM', 'Oct 29 2017  1:14PM', 'TASMC BC Taxol+Carboplatin weekly - Version 1', 'Jan  1 2018  1:10PM', 'Feb  5 2018  3:47PM', '', 'TASMC NSCLC DURVALUMAB 10mg  /kg  q2week - Version 1', 'Aug 14 2018  2:43PM', 'Dec  5 2018 10:40AM', ''
INSERT INTO #excel_data select '323411702', 'Dec  9 1938 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Jan 17 2016 12:06PM', 'Jun 21 2016  9:30AM', 'TASMC ZOMERA - Version 2', 'Jan 17 2016 12:06PM', 'Jun 21 2016 10:02AM', '', 'TASMC ZOMERA - Version 2', 'Aug  3 2016  9:44AM', 'Apr 25 2017  8:46AM', ''
INSERT INTO #excel_data select '323480830', 'Feb 21 1958 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'May 27 2018 12:00AM', 'Jul 29 2018 12:00AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '324485697', 'Nov 25 1962 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jan 10 2018 10:44AM', 'Mar 29 2018  8:21PM', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Apr 17 2018 11:28AM', 'May 15 2018  3:03PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '328741764', 'Mar  5 1949 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'Dec 27 2015 11:00AM', 'Apr 17 2016  2:59PM', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Apr 29 2018 12:31PM', 'Dec  9 2018 10:20AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '332319094', 'Apr 26 1944 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC Carbo+Alimta+Avastin - Version 1', 'Feb  1 2018 10:24AM', 'Jun  5 2018  2:24PM', 'TASMC AREDIA - Version 4', 'Mar 15 2018  1:40PM', 'Apr 15 2018  3:14PM', '', 'TASMC NSCLC OPDIVO 3mg/kg q2week - Version 1', 'Jul 29 2018  1:59PM', 'Aug 12 2018  2:24PM', ''
INSERT INTO #excel_data select '333784163', 'Jan 31 1945 12:00AM', 'pancreatic cancer', 'TASMC GI Panceras FOLFIRINOX - Version 4', 'Jul 31 2017 11:37AM', 'Sep 13 2017  4:30PM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '336553649', 'Jul 28 1965 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Dec 12 2016 12:40PM', 'Feb 13 2017  3:31PM', 'TASMC ZOMERA - Version 2', 'Feb 22 2017  2:35PM', 'Dec 19 2017  7:41PM', '', 'TASMC AREDIA - Version 4', 'Jan 31 2017 12:43PM', 'Jan 31 2017 12:43PM', ''
INSERT INTO #excel_data select '337863104', 'May 15 1941 12:00AM', 'pancreatic cancer', 'TASMC GI Pancreas Folfirinox 80% - Version 2', 'Aug 29 2016  1:30PM', 'Aug 29 2016  4:02PM', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Oct 26 2016  2:58PM', 'Nov 13 2016  9:24PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '340885995', 'Apr  6 1948 12:00AM', 'pancreatic cancer', 'TASMC GI Pancreas  Abraxane( NabPaclitaxel)+Gemzar - Version 1', 'Oct 28 2015  3:59PM', 'Apr 27 2016  1:00PM', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'May 11 2016  2:23PM', 'Oct 14 2016  3:20PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '341016665', 'Dec  6 1949 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Version 3', 'May 30 2016  2:38PM', 'Jul 15 2016  7:06PM', 'TASMC GI Gemzar  3/4 - Version 1', 'Aug  2 2016 12:28PM', 'Sep 13 2016 12:37PM', '', 'TASMC BC Taxol (3/4) - Version 1', 'Oct  6 2016  1:55PM', 'Dec 26 2016  3:25PM', ''
INSERT INTO #excel_data select '341314557', 'Feb 21 1949 12:00AM', 'adenocarcinoma of lung', 'TASMC  GI/LUNG/all KEYTRUDA  200mg q21d - Version 1', 'Nov 28 2017 10:45AM', 'Apr 12 2018  1:45PM', 'TASMC NSCLC ALIMTA +CARBOPLATIN - Version 1', 'May 28 2018 12:30PM', 'Jul 12 2018  1:13PM', '', 'TASMC NSCLC Alimta - Version 1', 'Aug 22 2018 10:53AM', 'Oct 21 2018 12:52PM', ''
INSERT INTO #excel_data select '342623691', 'Feb 20 1961 12:00AM', 'pancreatic cancer', 'TASMC GI Panceras FOLFIRINOX - Version 4', 'Mar 27 2018 10:40AM', 'Jul 17 2018  5:32PM', 'TASMC GI Folfox 6 (infuser) - Version 3', 'Aug  7 2018  2:47PM', 'Oct  2 2018  2:30PM', '', 'TASMC GI Gemzar  3/4 - Version 1', 'Dec 12 2018  2:56PM', 'Dec 12 2018  2:56PM', ''
INSERT INTO #excel_data select '345077598', 'Jul  1 1941 12:00AM', 'pancreatic cancer', 'TASMC GI FOLFOX - Inpatient - Version 2', 'Mar 18 2018  6:04PM', 'Mar 18 2018  8:16PM', 'TASMC GI Panceras FOLFIRINOX - Version 4', 'Apr  5 2018  1:44PM', 'May 19 2018 12:16AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '345240261', 'May 17 1980 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Jul 17 2018  5:28PM', 'Aug 29 2018 11:40PM', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Nov  7 2018  4:00PM', 'Dec 10 2018  4:15PM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '410052781', 'Feb 15 1958 12:00AM', 'pancreatic cancer', 'TASMC GI- panceras FOLFIRINOX - Inpatient - Version 1', 'Apr 14 2017  2:07PM', 'Aug 20 2017 10:15PM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''
INSERT INTO #excel_data select '410215602', 'Jul 12 1948 12:00AM', 'adenocarcinoma of lung', 'TASMC NSCLC  cisplatin + alimta - Version 1', 'Dec  7 2018 12:00AM', 'Dec  7 2018 12:00AM', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', '', '', 'Jan  1 1900 12:00AM', 'Jan  1 1900 12:00AM', ''

--Test the data
--select * from #excel_data e  where e.Id is null
--select id, count(1) from #excel_data e  group by id having count(1)>1

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
--------------------------------------------------------------------------------
--Main population 
--------------------------------------------------------------------------------
--Find first treatement's casenum
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
      ,CONVERT(datetime, fact.[date_of_first_treatment]) as date_of_first_treatment
	  ,CONVERT(datetime, fact.[date_of_last_treatment]) as date_of_last_treatment
	  
    
	--,CASE --if the first & last treatment dates are the same, we want to get the same casenum
 --   WHEN CONVERT(date, fact.[date_of_last_treatment])= CONVERT(date, fact.[date_of_fist_treatment]) THEN CONVERT(datetime, fact.[date_of_first_treatment])
 --   ELSE CONVERT(date, fact.[date_of_last_treatment])
	--END AS date_of_last_treatment

      ,fact.[second_line_regimen]
      ,CONVERT(datetime,fact.[date_of_first_treatment_second_line_treatment]) as date_of_first_treatment_second_line_treatment
      ,CONVERT(datetime,fact.[date_of_last_treatment_second_line_treatment]) as date_of_last_treatment_second_line_treatment
      ,fact.[number_of_treatments_second_line_treatment]
      ,fact.[third_line_regimen]
      ,CONVERT(datetime,fact.[date_of_first_treatment_third_line_treatment]) as date_of_first_treatment_third_line_treatment
      ,CONVERT(datetime,fact.[date_of_last_treatment_third_line_treatment]) as date_of_last_treatment_third_line_treatment
	  ,fact.[number_of_treatments_third_line_treatment]
	  ,dim_sex.Sextype as sex
	  ,ii.EnterDate
	   ,ii.CaseNum 
	  -- ,DIM_CASES.BeginDate
	  -- ,DIM_CASES.BeginTime
	  --,DIM_CASES.CaseNum 
	  ,DATEDIFF(hour, ii.EnterDate, fact.date_of_first_treatment) HourDifference_first
	  ,ROW_NUMBER() OVER(PARTITION BY fact.id ORDER BY abs(DATEDIFF(hour, ii.EnterDate, fact.date_of_first_treatment)) ASC) AS row_num
	  --,ROW_NUMBER() OVER(PARTITION BY fact.id ORDER BY abs(DATEDIFF(hour, DIM_CASES.BeginDate+DIM_CASES.BeginTime, fact.date_of_first_treatment)) ASC) AS row_num
	  
	  --,DATEDIFF(hour, DIM_CASES.BeginDate+DIM_CASES.BeginTime, fact.date_of_last_treatment) HourDifference_last
	  --,ROW_NUMBER() OVER(PARTITION BY fact.id,DIM_CASES.casenum ORDER BY abs(DATEDIFF(hour, DIM_CASES.BeginDate+DIM_CASES.BeginTime, fact.date_of_first_treatment)) ASC) AS row_num
	  
	  --select CONVERT(datetime, [date_of_first_treatment_second_line_treatment]) from #excel_data
	  --select date_of_first_treatment_second_line_treatment from #excel_data

FROM   #excel_data fact-- טבלה מהלקוח
	left JOIN bi_dev..[CLN_Ishpuzim_Indicators] ii
	ON  fact.id = ii.PatId --or fact.id = DIM_CASES.PatIdNum
	
	join DWH_PRD..PRD_DIM_SEX dim_sex
		on dim_sex.SexCode = ii.SexCode

where ii.CaseNum is not null
--and fact.id = 23896186
/*		
		left JOIN DWH_PRD..PRD_DIM_CASES DIM_CASES
		ON  fact.id = DIM_CASES.PatId --or fact.id = DIM_CASES.PatIdNum
		--ON  cast(fact.id as nvarchar(50)) = DIM_CASES.PatId or cast(fact.id as nvarchar(50)) = DIM_CASES.PatIdNum
		--ON  fact.id = cast(DIM_CASES.PatId as float) or fact.id = cast(DIM_CASES.PatIdNum as float)
		

	join DWH_PRD..PRD_DIM_SEX dim_sex
		on dim_sex.SexCode = DIM_CASES.SexCode

where DIM_CASES.CaseNum is not null
*/
--and fact.ID = 980649 
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
--Find last treatement's casenum
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
      ,CONVERT(datetime, fact.[date_of_first_treatment]) as date_of_first_treatment
      ,CONVERT(datetime, fact.[date_of_last_treatment]) as date_of_last_treatment
      ,fact.[second_line_regimen]
      ,CONVERT(datetime,fact.[date_of_first_treatment_second_line_treatment]) as date_of_first_treatment_second_line_treatment
      ,CONVERT(datetime,fact.[date_of_last_treatment_second_line_treatment]) as date_of_last_treatment_second_line_treatment
      ,fact.[number_of_treatments_second_line_treatment]
      ,fact.[third_line_regimen]
      ,CONVERT(datetime,fact.[date_of_first_treatment_third_line_treatment]) as date_of_first_treatment_third_line_treatment
      ,CONVERT(datetime,fact.[date_of_last_treatment_third_line_treatment]) as date_of_last_treatment_third_line_treatment
	  ,fact.[number_of_treatments_third_line_treatment]
	  ,dim_sex.Sextype as sex
	  ,ii.EnterDate
	   ,ii.CaseNum 
	  -- ,DIM_CASES.BeginDate
	  -- ,DIM_CASES.BeginTime
	  --,DIM_CASES.CaseNum 
	  ,DATEDIFF(hour, ii.EnterDate, fact.date_of_last_treatment) HourDifference_last
	  ,ROW_NUMBER() OVER(PARTITION BY fact.id ORDER BY abs(DATEDIFF(hour, ii.EnterDate, fact.date_of_last_treatment)) ASC) AS row_num

FROM   #excel_data fact-- טבלה מהלקוח
	
	left JOIN bi_dev..[CLN_Ishpuzim_Indicators] ii
	ON  fact.id = ii.PatId --or fact.id = DIM_CASES.PatIdNum
	
	join DWH_PRD..PRD_DIM_SEX dim_sex
		on dim_sex.SexCode = ii.SexCode

where ii.CaseNum is not null
--and fact.id = 23896186

--and fact.ID = 1130939 
)A
where A.row_num=1

--select * from #main_pop_round_one_last
--select id, count(1) from #main_pop_round_one_last e  group by id having count(1)>1
--select casenum, count(1) from #main_pop_round_one_last e  group by casenum having count(1)>1

--select * from #main_pop_round_one_last where id = 23896186 
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
,ROW_NUMBER() OVER( PARTITION BY a.casenum,a.Parameter_Name order by abs(DATEDIFF(hour, a.vit_sig_date, a.date_of_first_treatment)) ) as row_num
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
			main.date_of_first_treatment,
	        DATEDIFF(hour, sig_namer.MONITOR_DATE, main.date_of_first_treatment) AS HourDiff
	--,ROW_NUMBER() OVER( PARTITION BY main.casenum,sig_namer.Parameter_Name order by DATEDIFF(hour, sig_namer.MONITOR_DATE, main.date_of_first_treatment) ) as row_num
	FROM #main_pop_round_one_first main --#main_pop_round_one_all main
	left join bi_dev..CLN_Vital_Signals_namer sig_namer
	on main.CaseNum = sig_namer.CaseNum
 
	
	and (sig_namer.Parameter_Name = 'BMI' or sig_namer.Parameter_Name = 'Height' or sig_namer.Parameter_Name = 'Weight')
	--and DATEDIFF(hour, sig_namer.MONITOR_DATE, main.date_of_first_treatment)>=0 -- the required test is to be perfromed prior to the treatment
	--or DATEDIFF(hour, sig_namer.MONITOR_DATE, main.date_of_first_treatment) between -72 and 0 --or the required test was perfromed three days after the treatment
	and DATEDIFF(hour, sig_namer.MONITOR_DATE, main.date_of_first_treatment) between -72 and 72 --or the required test was perfromed three days after the treatment

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
		main.date_of_first_treatment,
		DATEDIFF(hour, c.MONITOR_DATE, main.date_of_first_treatment) AS HourDiff



	FROM #main_pop_round_one_first main --#main_pop_round_one_all main

	left join bi_dev..CLN_Vital_Signals_chameleon c on main.CaseNum = c.CaseNum
	and (c.Parameter_Name = 'BMI' or c.Parameter_Name = 'Height' or c.Parameter_Name = 'Weight')
	and DATEDIFF(hour, c.MONITOR_DATE, main.date_of_first_treatment) between -72 and 72 --or the required test was perfromed three days after the treatment

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

--select * from #vit_signs_round_one_first order by id, parameter_name 
--select * from #vit_signs_round_one_first where datasourcevit = 'Namer' and  parameter_name is not null

--select id, count(1) from #vit_signs_round_one_first group by id order by count(1)asc

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
,ROW_NUMBER() OVER( PARTITION BY a.casenum,a.Parameter_Name order by abs(DATEDIFF(hour, a.vit_sig_date, a.date_of_last_treatment)) ) as row_num
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
			main.date_of_last_treatment,
	        DATEDIFF(hour, sig_namer.MONITOR_DATE, main.date_of_last_treatment) AS HourDiff
	--,ROW_NUMBER() OVER( PARTITION BY main.casenum,sig_namer.Parameter_Name order by DATEDIFF(hour, sig_namer.MONITOR_DATE, main.date_of_first_treatment) ) as row_num
	FROM #main_pop_round_one_last main -- #main_pop_round_one_all main
	left join bi_dev..CLN_Vital_Signals_namer sig_namer
	on main.CaseNum = sig_namer.CaseNum
 	and (sig_namer.Parameter_Name = 'BMI' or sig_namer.Parameter_Name = 'Height' or sig_namer.Parameter_Name = 'Weight')
	--and DATEDIFF(hour, sig_namer.MONITOR_DATE, main.date_of_first_treatment)>=0 -- the required test is to be perfromed prior to the treatment
	--or DATEDIFF(hour, sig_namer.MONITOR_DATE, main.date_of_first_treatment) between -72 and 0 --or the required test was perfromed three days after the treatment
	and DATEDIFF(hour, sig_namer.MONITOR_DATE, main.date_of_last_treatment) between -72 and 72 --or the required test was perfromed three days after the treatment

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
		main.date_of_last_treatment,
		DATEDIFF(hour, c.MONITOR_DATE, main.date_of_last_treatment) AS HourDiff



	FROM #main_pop_round_one_last main 
	
	left join bi_dev..CLN_Vital_Signals_chameleon c on main.CaseNum = c.CaseNum
	and (c.Parameter_Name = 'BMI' or c.Parameter_Name = 'Height' or c.Parameter_Name = 'Weight')
	and DATEDIFF(hour, c.MONITOR_DATE, main.date_of_last_treatment) between -72 and 72 --or the required test was perfromed three days after the treatment

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
--select * from #vit_signs_round_one_last order by id, parameter_name 
--select * from #vit_signs_round_one_last where datasourcevit = 'Namer' and  parameter_name is not null
--select id, count(1) cnt from #vit_signs_round_one_last group by id having count(1)>1

--select* from #vit_signs_round_one_last  where  id = 15428428
--select* from #vit_signs_round_one_last  where id = 15428428 --and row_num>1
----------------------------------------------------------------------------
--#vit_signs_round_one_all_flat
----------------------------------------------------------------------------
begin try drop table #vit_signs_round_one_all_flat; end try begin catch end catch;
--#vit_signs_round_one_all_flat will be constracted by breaking #vit_signs_round_one_first + #vit_signs_round_one_last by fields & re-constracting it
select A.*
into #vit_signs_round_one_all_flat
from 
	(SELECT 
		main_pop_round_one_first.id,
		main_pop_round_one_first.casenum as round_one_first_casenum,
		main_pop_round_one_last.round_one_last_casenum,

		main_pop_round_one_first.date_of_first_treatment,
		main_pop_round_one_last.date_of_last_treatment,

		
		bmi_round_one_first.bmi_round_one_first_value,
        height_round_one_first.height_round_one_first_value,
		weight_round_one_first.weight_round_one_first_value,

		bmi_round_one_last.bmi_round_one_last_value,
        height_round_one_last.height_round_one_last_value,
		weight_round_one_last.weight_round_one_last_value


		from #main_pop_round_one_first as main_pop_round_one_first --this is th leading table in the left join select becuase it contains all the required population (last round treatment must have had first rount treatment as weel)
		 
		 left join ( --get round_one_last_casenum 
				select 
				id,
				casenum as round_one_last_casenum,
				date_of_last_treatment
				from #main_pop_round_one_last
				) main_pop_round_one_last
				on main_pop_round_one_first.id = main_pop_round_one_last.id
	

		 left join (
				select 
				casenum,
				date_of_first_treatment,
				Parameter_EnteredValue as bmi_round_one_first_value
				from #vit_signs_round_one_first
				where Parameter_Name = 'BMI' and row_num=1) BMI_round_one_first
				on main_pop_round_one_first.casenum = BMI_round_one_first.casenum
				and main_pop_round_one_first.date_of_first_treatment = BMI_round_one_first.date_of_first_treatment


		 left join (
				select 
				casenum,
				date_of_first_treatment,
				Parameter_EnteredValue as height_round_one_first_value
				from #vit_signs_round_one_first
				where Parameter_Name = 'Height' and row_num=1) Height_round_one_first
				on main_pop_round_one_first.casenum = Height_round_one_first.casenum
				and main_pop_round_one_first.date_of_first_treatment = Height_round_one_first.date_of_first_treatment

		 left join (
				select 
				casenum,
				date_of_first_treatment,
				Parameter_EnteredValue as weight_round_one_first_value
				from #vit_signs_round_one_first
				where Parameter_Name = 'Weight' and row_num=1) Weight_round_one_first
				on main_pop_round_one_first.casenum = Weight_round_one_first.casenum
				and main_pop_round_one_first.date_of_first_treatment = Weight_round_one_first.date_of_first_treatment


		left join (
				select 
				casenum,
				date_of_last_treatment,
				Parameter_EnteredValue as bmi_round_one_last_value
				from #vit_signs_round_one_last
				where Parameter_Name = 'BMI' and row_num=1) BMI_round_one_last
				on main_pop_round_one_last.round_one_last_casenum = BMI_round_one_last.casenum
				and main_pop_round_one_last.date_of_last_treatment = BMI_round_one_last.date_of_last_treatment


		 left join (
				select 
				casenum,
				date_of_last_treatment,
				Parameter_EnteredValue as height_round_one_last_value
				from #vit_signs_round_one_last
				where Parameter_Name = 'Height' and row_num=1) Height_round_one_last
				on main_pop_round_one_last.round_one_last_casenum = Height_round_one_last.casenum
				and main_pop_round_one_last.date_of_last_treatment = Height_round_one_last.date_of_last_treatment

		 left join (
				select 
				casenum,
				date_of_last_treatment,
				Parameter_EnteredValue as weight_round_one_last_value
				from #vit_signs_round_one_last
				where Parameter_Name = 'Weight' and row_num=1) Weight_round_one_last
				on main_pop_round_one_last.round_one_last_casenum = Weight_round_one_last.casenum
				and main_pop_round_one_last.date_of_last_treatment = Weight_round_one_last.date_of_last_treatment
)A
--select id, count(1) cnt from #vit_signs_round_one_all_flat group by id having count(1)>1
--select * from #vit_signs_round_one_all_flat where round_one_last_casenum = 0035779391
--select * from #vit_signs_round_one_last where casenum = 0035779391

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
	main.date_of_first_treatment  as treatment_date,
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
 ,DATEDIFF(hour, fact_tests.Entry_Date+fact_tests.Entry_Time, main.date_of_first_treatment) AS HourDiff
--,ROW_NUMBER() OVER(PARTITION BY main.casenum,fact_tests.Test_Code  ORDER BY DATEDIFF(DAY, fact_tests.Entry_Date, main.date_of_first_treatment) ASC) AS Row#
,ROW_NUMBER() OVER(PARTITION BY main.casenum,fact_tests.Test_Code  ORDER BY abs(DATEDIFF(hour, fact_tests.Entry_Date+fact_tests.Entry_Time, main.date_of_first_treatment)) ASC) AS row_num
	
	FROM #main_pop_round_one_first main --#main_pop_round_one_all main
	left join [DWH_PRD].[dbo].[AUTODB_Labs_Fact_Tests] fact_tests on main.CaseNum = fact_tests.CaseNum
	and DATEDIFF(hour, fact_tests.Entry_Date+fact_tests.Entry_Time, main.date_of_first_treatment) between -72 and 72  -- the required test was perfromed three days before / after the treatment

	JOIN #all_desired_tests --get only the relevnt tests
	ON fact_tests.test_code = #all_desired_tests.Test_code


	--LEFT JOIN [DWH_PRD].[dbo].[AUTODB_Dim_Tests] dim_tests
	--ON dim_tests.test_code = fact_tests.Test_code

	--left JOIN #all_desired_tests --get only the relevnt tests
	--ON dim_tests.test_code = #all_desired_tests.Test_code

	where  main.CaseNum is not null and fact_tests.Is_cancelled=0 and  ISNUMERIC(fact_tests.Result)=1

)A
where A.row_num=1




--select id, count(1) cnt from #round_one_first_tests group by id
--select * from #round_one_first_tests where casenum = 0011100572

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
	main.date_of_last_treatment as treatment_date,
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

 ,DATEDIFF(hour, fact_tests.Entry_Date+fact_tests.Entry_Time, main.date_of_last_treatment) AS HourDiff
,ROW_NUMBER() OVER(PARTITION BY main.casenum,fact_tests.Test_Code  ORDER BY abs(DATEDIFF(hour, fact_tests.Entry_Date+fact_tests.Entry_Time, main.date_of_last_treatment)) ASC) AS row_num
	
	FROM #main_pop_round_one_last main -- #main_pop main
	left join [DWH_PRD].[dbo].[AUTODB_Labs_Fact_Tests] fact_tests on main.CaseNum = fact_tests.CaseNum
	and DATEDIFF(hour, fact_tests.Entry_Date+fact_tests.Entry_Time, main.date_of_last_treatment) between -72 and 72  -- the required test was perfromed three days before / after the treatment

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

--select id, count(1) cnt from #round_one_last_tests group by id
--select * from #round_one_last_tests where ID = 1130939 

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
		main_pop_round_one_first.date_of_first_treatment,
		main_pop_round_one_last.date_of_last_treatment,

	
		Albumin_routine_round_one_first.Albumin_routine_round_one_first,
		Albumin_StatGel_round_one_first.Albumin_StatGel_round_one_first,
		Hemoglobin_round_one_first.Hemoglobin_round_one_first,
		WBC_round_one_first.WBC_round_one_first,
		WBC_count_diffrential_blood_round_one_first.WBC_count_diffrential_blood_round_one_first,
		Calcium_total_blood_round_one_first.Calcium_total_blood_round_one_first,
		Calcium_ionized_blood_round_one_first.Calcium_ionized_blood_round_one_first,
		Calcium_ionized_whole_blood_round_one_first.Calcium_ionized_whole_blood_round_one_first,
		Calcium_ionized_Ar_round_one_first.Calcium_ionized_Ar_round_one_first,
		Calcium_total_routine_round_one_first.Calcium_total_routine_round_one_first,
		Calcium_total_StatGel_round_one_first.Calcium_total_StatGel_round_one_first,
		Glucose_glucometer_whole_blood_round_one_first.Glucose_glucometer_whole_blood_round_one_first,
		Glucose_direct_blood_round_one_first.Glucose_direct_blood_round_one_first,
		Glucose_blood_round_one_first.Glucose_blood_round_one_first,
		Glucose_quantitative_whole_blood_round_one_first.Glucose_quantitative_whole_blood_round_one_first,
		Glucose_quantitative_Ar_round_one_first.Glucose_quantitative_Ar_round_one_first,
		Glucose_routine_round_one_first.Glucose_routine_round_one_first,
		Creatinine_blood_enzymatic_method_round_one_first.Creatinine_blood_enzymatic_method_round_one_first,
		Creatinine_round_one_first.Creatinine_round_one_first,
		Creatinine_routine_round_one_first.Creatinine_routine_round_one_first,
		Creatinine_StatGel_round_one_first.Creatinine_StatGel_round_one_first,

		Albumin_routine_round_one_last.Albumin_routine_round_one_last,
		Albumin_StatGel_round_one_last.Albumin_StatGel_round_one_last,
		Hemoglobin_round_one_last.Hemoglobin_round_one_last,
		WBC_round_one_last.WBC_round_one_last,
		WBC_count_diffrential_blood_round_one_last.WBC_count_diffrential_blood_round_one_last,
		Calcium_total_blood_round_one_last.Calcium_total_blood_round_one_last,
		Calcium_ionized_blood_round_one_last.Calcium_ionized_blood_round_one_last,
		Calcium_ionized_whole_blood_round_one_last.Calcium_ionized_whole_blood_round_one_last,
		Calcium_ionized_Ar_round_one_last.Calcium_ionized_Ar_round_one_last,
		Calcium_total_routine_round_one_last.Calcium_total_routine_round_one_last,
		Calcium_total_StatGel_round_one_last.Calcium_total_StatGel_round_one_last,
		Glucose_glucometer_whole_blood_round_one_last.Glucose_glucometer_whole_blood_round_one_last,
		Glucose_direct_blood_round_one_last.Glucose_direct_blood_round_one_last,
		Glucose_blood_round_one_last.Glucose_blood_round_one_last,
		Glucose_quantitative_whole_blood_round_one_last.Glucose_quantitative_whole_blood_round_one_last,
		Glucose_quantitative_Ar_round_one_last.Glucose_quantitative_Ar_round_one_last,
		Glucose_routine_round_one_last.Glucose_routine_round_one_last,
		Creatinine_blood_enzymatic_method_round_one_last.Creatinine_blood_enzymatic_method_round_one_last,
		Creatinine_round_one_last.Creatinine_round_one_last,
		Creatinine_routine_round_one_last.Creatinine_routine_round_one_last,
		Creatinine_StatGel_round_one_last.Creatinine_StatGel_round_one_last
		

		from #main_pop_round_one_first as main_pop_round_one_first --this is th leading table in the left join select becuase it contains all the required population (last round treatment must have had first rount treatment as weel)
		 
		 left join ( --get round_one_last_casenum 
				select 
				id,
				casenum as round_one_last_casenum,
				date_of_last_treatment
				from #main_pop_round_one_last
				) main_pop_round_one_last
				on main_pop_round_one_first.id = main_pop_round_one_last.id
				
		
		 left join (
				select 
				casenum,
				treatment_date,
				test_result as Albumin_routine_round_one_first
				from #round_one_first_tests
				where test_code = 1882040010) Albumin_routine_round_one_first
				on main_pop_round_one_first.casenum = Albumin_routine_round_one_first.casenum
				and main_pop_round_one_first.date_of_first_treatment = Albumin_routine_round_one_first.treatment_date
		
		 left join (
				select 
				casenum,
				treatment_date,
				test_result as Albumin_StatGel_round_one_first
				from #round_one_first_tests
				where test_code = 1882040012) Albumin_StatGel_round_one_first
				on main_pop_round_one_first.casenum = Albumin_StatGel_round_one_first.casenum
				and main_pop_round_one_first.date_of_first_treatment = Albumin_StatGel_round_one_first.treatment_date
		
		left join (
				select 
				casenum,
				treatment_date,
				test_result as Hemoglobin_round_one_first
				from #round_one_first_tests
				where test_code = 885018010) Hemoglobin_round_one_first
				on main_pop_round_one_first.casenum = Hemoglobin_round_one_first.casenum
				and main_pop_round_one_first.date_of_first_treatment = Hemoglobin_round_one_first.treatment_date

		left join (
				select 
				casenum,
				treatment_date,
				test_result as WBC_round_one_first
				from #round_one_first_tests
				where test_code = 805001010) WBC_round_one_first
				on main_pop_round_one_first.casenum = WBC_round_one_first.casenum
				and main_pop_round_one_first.date_of_first_treatment = WBC_round_one_first.treatment_date

		left join (
				select 
				casenum,
				treatment_date,
				test_result as WBC_count_diffrential_blood_round_one_first
				from #round_one_first_tests
				where test_code = 805255920) WBC_count_diffrential_blood_round_one_first
				on main_pop_round_one_first.casenum = WBC_count_diffrential_blood_round_one_first.casenum
				and main_pop_round_one_first.date_of_first_treatment = WBC_count_diffrential_blood_round_one_first.treatment_date

		left join (
				select 
				casenum,
				treatment_date,
				test_result as Calcium_total_blood_round_one_first
				from #round_one_first_tests
				where test_code = 882310010) Calcium_total_blood_round_one_first
				on main_pop_round_one_first.casenum = Calcium_total_blood_round_one_first.casenum
				and main_pop_round_one_first.date_of_first_treatment = Calcium_total_blood_round_one_first.treatment_date

		left join (
				select 
				casenum,
				treatment_date,
				test_result as Calcium_ionized_blood_round_one_first
				from #round_one_first_tests
				where test_code = 882330010) Calcium_ionized_blood_round_one_first
				on main_pop_round_one_first.casenum = Calcium_ionized_blood_round_one_first.casenum
				and main_pop_round_one_first.date_of_first_treatment = Calcium_ionized_blood_round_one_first.treatment_date

		left join (
				select 
				casenum,
				treatment_date,
				test_result as Calcium_ionized_whole_blood_round_one_first
				from #round_one_first_tests
				where test_code = 882330140) Calcium_ionized_whole_blood_round_one_first
				on main_pop_round_one_first.casenum = Calcium_ionized_whole_blood_round_one_first.casenum
				and main_pop_round_one_first.date_of_first_treatment = Calcium_ionized_whole_blood_round_one_first.treatment_date

		left join (
				select 
				casenum,
				treatment_date,
				test_result as Calcium_ionized_Ar_round_one_first
				from #round_one_first_tests
				where test_code = 882330150) Calcium_ionized_Ar_round_one_first
				on main_pop_round_one_first.casenum = Calcium_ionized_Ar_round_one_first.casenum
				and main_pop_round_one_first.date_of_first_treatment = Calcium_ionized_Ar_round_one_first.treatment_date

		left join (
				select 
				casenum,
				treatment_date,
				test_result as Calcium_total_routine_round_one_first
				from #round_one_first_tests
				where test_code = 1882310010) Calcium_total_routine_round_one_first
				on main_pop_round_one_first.casenum = Calcium_total_routine_round_one_first.casenum
				and main_pop_round_one_first.date_of_first_treatment = Calcium_total_routine_round_one_first.treatment_date

		left join (
				select 
				casenum,
				treatment_date,
				test_result as Calcium_total_StatGel_round_one_first
				from #round_one_first_tests
				where test_code = 1882310012) Calcium_total_StatGel_round_one_first
				on main_pop_round_one_first.casenum = Calcium_total_StatGel_round_one_first.casenum
				and main_pop_round_one_first.date_of_first_treatment = Calcium_total_StatGel_round_one_first.treatment_date

		left join (
				select 
				casenum,
				treatment_date,
				test_result as Glucose_glucometer_whole_blood_round_one_first
				from #round_one_first_tests
				where test_code = 802194140) Glucose_glucometer_whole_blood_round_one_first
				on main_pop_round_one_first.casenum = Glucose_glucometer_whole_blood_round_one_first.casenum
				and main_pop_round_one_first.date_of_first_treatment = Glucose_glucometer_whole_blood_round_one_first.treatment_date
	
		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Glucose_direct_blood_round_one_first
				   from #round_one_first_tests 
				where test_code =803583010) Glucose_direct_blood_round_one_first 
				on main_pop_round_one_first.casenum =Glucose_direct_blood_round_one_first.casenum 
				and main_pop_round_one_first.date_of_first_treatment = Glucose_direct_blood_round_one_first.treatment_date


		left join(
					select  
					casenum,
					  treatment_date,
					  test_result as Glucose_blood_round_one_first
					   from #round_one_first_tests 
					where test_code =882947010) Glucose_blood_round_one_first 
					on main_pop_round_one_first.casenum =Glucose_blood_round_one_first.casenum 
					and main_pop_round_one_first.date_of_first_treatment = Glucose_blood_round_one_first.treatment_date

		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Glucose_quantitative_whole_blood_round_one_first
				   from #round_one_first_tests 
				where test_code =882947140) Glucose_quantitative_whole_blood_round_one_first 
				on main_pop_round_one_first.casenum =Glucose_quantitative_whole_blood_round_one_first.casenum 
				and main_pop_round_one_first.date_of_first_treatment = Glucose_quantitative_whole_blood_round_one_first.treatment_date

		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Glucose_quantitative_Ar_round_one_first
				   from #round_one_first_tests 
				where test_code =882947150) Glucose_quantitative_Ar_round_one_first 
				on main_pop_round_one_first.casenum =Glucose_quantitative_Ar_round_one_first.casenum 
				and main_pop_round_one_first.date_of_first_treatment = Glucose_quantitative_Ar_round_one_first.treatment_date

		left join(
				select  
				casenum,
				  treatment_date,
				  test_result as Glucose_routine_round_one_first
				   from #round_one_first_tests 
				where test_code =1882947010) Glucose_routine_round_one_first 
				on main_pop_round_one_first.casenum =Glucose_routine_round_one_first.casenum 
				and main_pop_round_one_first.date_of_first_treatment = Glucose_routine_round_one_first.treatment_date

		left join(
			 select  
			casenum,
			  treatment_date,
			  test_result as Creatinine_blood_enzymatic_method_round_one_first
			   from #round_one_first_tests 
			where test_code =802219010) Creatinine_blood_enzymatic_method_round_one_first 
			on main_pop_round_one_first.casenum =Creatinine_blood_enzymatic_method_round_one_first.casenum 
			and main_pop_round_one_first.date_of_first_treatment = Creatinine_blood_enzymatic_method_round_one_first.treatment_date

		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Creatinine_round_one_first
				   from #round_one_first_tests 
				where test_code =882565010) Creatinine_round_one_first 
				on main_pop_round_one_first.casenum =Creatinine_round_one_first.casenum 
				and main_pop_round_one_first.date_of_first_treatment = Creatinine_round_one_first.treatment_date
		
		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Creatinine_routine_round_one_first
				   from #round_one_first_tests 
				where test_code =1882565010) Creatinine_routine_round_one_first 
				on main_pop_round_one_first.casenum =Creatinine_routine_round_one_first.casenum 
				and main_pop_round_one_first.date_of_first_treatment = Creatinine_routine_round_one_first.treatment_date

		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Creatinine_StatGel_round_one_first
				   from #round_one_first_tests 
				where test_code =1882565012) Creatinine_StatGel_round_one_first 
				on main_pop_round_one_first.casenum =Creatinine_StatGel_round_one_first.casenum 
				and main_pop_round_one_first.date_of_first_treatment = Creatinine_StatGel_round_one_first.treatment_date


		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Albumin_routine_round_one_last
				   from #round_one_last_tests 
				where test_code =1882040010) Albumin_routine_round_one_last 
				on main_pop_round_one_last.round_one_last_casenum =Albumin_routine_round_one_last.casenum 
				and main_pop_round_one_last.date_of_last_treatment = Albumin_routine_round_one_last.treatment_date
		
		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Albumin_StatGel_round_one_last
				   from #round_one_last_tests 
				where test_code =1882040012) Albumin_StatGel_round_one_last 
				on main_pop_round_one_last.round_one_last_casenum =Albumin_StatGel_round_one_last.casenum 
				and main_pop_round_one_last.date_of_last_treatment = Albumin_StatGel_round_one_last.treatment_date
		
		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Hemoglobin_round_one_last
				   from #round_one_last_tests 
				where test_code =885018010) Hemoglobin_round_one_last 
				on main_pop_round_one_last.round_one_last_casenum =Hemoglobin_round_one_last.casenum 
				and main_pop_round_one_last.date_of_last_treatment = Hemoglobin_round_one_last.treatment_date
		
		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as WBC_round_one_last
				   from #round_one_last_tests 
				where test_code =805001010) WBC_round_one_last 
				on main_pop_round_one_last.round_one_last_casenum =WBC_round_one_last.casenum 
				and main_pop_round_one_last.date_of_last_treatment = WBC_round_one_last.treatment_date
		
		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as WBC_count_diffrential_blood_round_one_last
				   from #round_one_last_tests 
				where test_code =805255920) WBC_count_diffrential_blood_round_one_last 
				on main_pop_round_one_last.round_one_last_casenum =WBC_count_diffrential_blood_round_one_last.casenum 
				and main_pop_round_one_last.date_of_last_treatment = WBC_count_diffrential_blood_round_one_last.treatment_date

		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Calcium_total_blood_round_one_last
				   from #round_one_last_tests 
				where test_code =882310010) Calcium_total_blood_round_one_last 
				on main_pop_round_one_last.round_one_last_casenum =Calcium_total_blood_round_one_last.casenum 
				and main_pop_round_one_last.date_of_last_treatment = Calcium_total_blood_round_one_last.treatment_date
		
		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Calcium_ionized_blood_round_one_last
				   from #round_one_last_tests 
				where test_code =882330010) Calcium_ionized_blood_round_one_last 
				on main_pop_round_one_last.round_one_last_casenum =Calcium_ionized_blood_round_one_last.casenum 
				and main_pop_round_one_last.date_of_last_treatment = Calcium_ionized_blood_round_one_last.treatment_date

		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Calcium_ionized_whole_blood_round_one_last
				   from #round_one_last_tests 
				where test_code =882330140) Calcium_ionized_whole_blood_round_one_last 
				on main_pop_round_one_last.round_one_last_casenum =Calcium_ionized_whole_blood_round_one_last.casenum 
				and main_pop_round_one_last.date_of_last_treatment = Calcium_ionized_whole_blood_round_one_last.treatment_date

		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Calcium_ionized_Ar_round_one_last
				   from #round_one_last_tests 
				where test_code =882330150) Calcium_ionized_Ar_round_one_last 
				on main_pop_round_one_last.round_one_last_casenum =Calcium_ionized_Ar_round_one_last.casenum 
				and main_pop_round_one_last.date_of_last_treatment = Calcium_ionized_Ar_round_one_last.treatment_date

		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Calcium_total_routine_round_one_last
				   from #round_one_last_tests 
				where test_code =1882310010) Calcium_total_routine_round_one_last 
				on main_pop_round_one_last.round_one_last_casenum =Calcium_total_routine_round_one_last.casenum 
				and main_pop_round_one_last.date_of_last_treatment = Calcium_total_routine_round_one_last.treatment_date
		
		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Calcium_total_StatGel_round_one_last
				   from #round_one_last_tests 
				where test_code =1882310012) Calcium_total_StatGel_round_one_last 
				on main_pop_round_one_last.round_one_last_casenum =Calcium_total_StatGel_round_one_last.casenum 
				and main_pop_round_one_last.date_of_last_treatment = Calcium_total_StatGel_round_one_last.treatment_date
		
		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Glucose_glucometer_whole_blood_round_one_last
				   from #round_one_last_tests 
				where test_code =802194140) Glucose_glucometer_whole_blood_round_one_last 
				on main_pop_round_one_last.round_one_last_casenum =Glucose_glucometer_whole_blood_round_one_last.casenum 
				and main_pop_round_one_last.date_of_last_treatment = Glucose_glucometer_whole_blood_round_one_last.treatment_date

		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Glucose_direct_blood_round_one_last
				   from #round_one_last_tests 
				where test_code =803583010) Glucose_direct_blood_round_one_last 
				on main_pop_round_one_last.round_one_last_casenum =Glucose_direct_blood_round_one_last.casenum 
				and main_pop_round_one_last.date_of_last_treatment = Glucose_direct_blood_round_one_last.treatment_date
		
		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Glucose_blood_round_one_last
				   from #round_one_last_tests 
				where test_code =882947010) Glucose_blood_round_one_last 
				on main_pop_round_one_last.round_one_last_casenum =Glucose_blood_round_one_last.casenum 
				and main_pop_round_one_last.date_of_last_treatment = Glucose_blood_round_one_last.treatment_date

		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Glucose_quantitative_whole_blood_round_one_last
				   from #round_one_last_tests 
				where test_code =882947140) Glucose_quantitative_whole_blood_round_one_last 
				on main_pop_round_one_last.round_one_last_casenum =Glucose_quantitative_whole_blood_round_one_last.casenum 
				and main_pop_round_one_last.date_of_last_treatment = Glucose_quantitative_whole_blood_round_one_last.treatment_date

		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Glucose_quantitative_Ar_round_one_last
				   from #round_one_last_tests 
				where test_code =882947150) Glucose_quantitative_Ar_round_one_last 
				on main_pop_round_one_last.round_one_last_casenum =Glucose_quantitative_Ar_round_one_last.casenum 
				and main_pop_round_one_last.date_of_last_treatment = Glucose_quantitative_Ar_round_one_last.treatment_date

		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Glucose_routine_round_one_last
				   from #round_one_last_tests 
				where test_code =1882947010) Glucose_routine_round_one_last 
				on main_pop_round_one_last.round_one_last_casenum =Glucose_routine_round_one_last.casenum 
				and main_pop_round_one_last.date_of_last_treatment = Glucose_routine_round_one_last.treatment_date
		
		left join(
			 select  
			casenum,
			  treatment_date,
			  test_result as Creatinine_blood_enzymatic_method_round_one_last
			   from #round_one_last_tests 
			where test_code =802219010) Creatinine_blood_enzymatic_method_round_one_last 
			on main_pop_round_one_last.round_one_last_casenum =Creatinine_blood_enzymatic_method_round_one_last.casenum 
			and main_pop_round_one_last.date_of_last_treatment = Creatinine_blood_enzymatic_method_round_one_last.treatment_date

		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Creatinine_round_one_last
				   from #round_one_last_tests 
				where test_code =882565010) Creatinine_round_one_last 
				on main_pop_round_one_last.round_one_last_casenum =Creatinine_round_one_last.casenum 
				and main_pop_round_one_last.date_of_last_treatment = Creatinine_round_one_last.treatment_date
		
		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Creatinine_routine_round_one_last
				   from #round_one_last_tests 
				where test_code =1882565010) Creatinine_routine_round_one_last 
				on main_pop_round_one_last.round_one_last_casenum =Creatinine_routine_round_one_last.casenum 
				and main_pop_round_one_last.date_of_last_treatment = Creatinine_routine_round_one_last.treatment_date

		left join(
				 select  
				casenum,
				  treatment_date,
				  test_result as Creatinine_StatGel_round_one_last
				   from #round_one_last_tests 
				where test_code =1882565012) Creatinine_StatGel_round_one_last 
				on main_pop_round_one_last.round_one_last_casenum =Creatinine_StatGel_round_one_last.casenum 
				and main_pop_round_one_last.date_of_last_treatment = Creatinine_StatGel_round_one_last.treatment_date

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
CONVERT(datetime, #excel_data.date_of_first_treatment) as date_of_first_treatment,

--#main_pop_round_one_first.HourDifference_first,
#main_pop_round_one_first.round as first_round,
--#main_pop_round_one_first.CaseNum as first_casenum,

--vit_signs.vit_sig_date_round_one_first,
vit_signs.bmi_round_one_first_value,
vit_signs.height_round_one_first_value,
vit_signs.weight_round_one_first_value,

#round_one_all_tests_flat.Albumin_routine_round_one_first,
#round_one_all_tests_flat.Albumin_StatGel_round_one_first,
#round_one_all_tests_flat.Hemoglobin_round_one_first,
#round_one_all_tests_flat.WBC_round_one_first,
#round_one_all_tests_flat.WBC_count_diffrential_blood_round_one_first,
#round_one_all_tests_flat.Calcium_total_blood_round_one_first,
#round_one_all_tests_flat.Calcium_ionized_blood_round_one_first,
#round_one_all_tests_flat.Calcium_ionized_whole_blood_round_one_first,
#round_one_all_tests_flat.Calcium_ionized_Ar_round_one_first,
#round_one_all_tests_flat.Calcium_total_routine_round_one_first,
#round_one_all_tests_flat.Calcium_total_StatGel_round_one_first,
#round_one_all_tests_flat.Glucose_glucometer_whole_blood_round_one_first,
#round_one_all_tests_flat.Glucose_direct_blood_round_one_first,
#round_one_all_tests_flat.Glucose_blood_round_one_first,
#round_one_all_tests_flat.Glucose_quantitative_whole_blood_round_one_first,
#round_one_all_tests_flat.Glucose_quantitative_Ar_round_one_first,
#round_one_all_tests_flat.Glucose_routine_round_one_first,
#round_one_all_tests_flat.Creatinine_blood_enzymatic_method_round_one_first,
#round_one_all_tests_flat.Creatinine_round_one_first,
#round_one_all_tests_flat.Creatinine_routine_round_one_first,
#round_one_all_tests_flat.Creatinine_StatGel_round_one_first,

--#excel_data.date_of_last_treatment,
CONVERT(datetime, #excel_data.date_of_last_treatment) as date_of_last_treatment,
--#main_pop_round_one_last.HourDifference_last,
#main_pop_round_one_last.round as last_round,


--vit_signs.vit_sig_date_round_one_last,
vit_signs.bmi_round_one_last_value,
vit_signs.height_round_one_last_value,
vit_signs.weight_round_one_last_value,

#round_one_all_tests_flat.Albumin_routine_round_one_last,
#round_one_all_tests_flat.Albumin_StatGel_round_one_last,
#round_one_all_tests_flat.Hemoglobin_round_one_last,
#round_one_all_tests_flat.WBC_round_one_last,
#round_one_all_tests_flat.WBC_count_diffrential_blood_round_one_last,
#round_one_all_tests_flat.Calcium_total_blood_round_one_last,
#round_one_all_tests_flat.Calcium_ionized_blood_round_one_last,
#round_one_all_tests_flat.Calcium_ionized_whole_blood_round_one_last,
#round_one_all_tests_flat.Calcium_ionized_Ar_round_one_last,
#round_one_all_tests_flat.Calcium_total_routine_round_one_last,
#round_one_all_tests_flat.Calcium_total_StatGel_round_one_last,
#round_one_all_tests_flat.Glucose_glucometer_whole_blood_round_one_last,
#round_one_all_tests_flat.Glucose_direct_blood_round_one_last,
#round_one_all_tests_flat.Glucose_blood_round_one_last,
#round_one_all_tests_flat.Glucose_quantitative_whole_blood_round_one_last,
#round_one_all_tests_flat.Glucose_quantitative_Ar_round_one_last,
#round_one_all_tests_flat.Glucose_routine_round_one_last,
#round_one_all_tests_flat.Creatinine_blood_enzymatic_method_round_one_last,
#round_one_all_tests_flat.Creatinine_round_one_last,
#round_one_all_tests_flat.Creatinine_routine_round_one_last,
#round_one_all_tests_flat.Creatinine_StatGel_round_one_last,

#excel_data.second_line_regimen,
--#excel_data.date_of_first_treatment_second_line_treatment,
CONVERT(datetime, #excel_data.date_of_first_treatment_second_line_treatment) as date_of_first_treatment_second_line_treatment,

--#excel_data.date_of_last_treatment_second_line_treatment,
CONVERT(datetime, #excel_data.date_of_last_treatment_second_line_treatment) as date_of_last_treatment_second_line_treatment,
#excel_data.number_of_treatments_second_line_treatment,



#excel_data.third_line_regimen,
--#excel_data.date_of_first_treatment_third_line_treatment,
CONVERT(datetime, #excel_data.date_of_first_treatment_third_line_treatment) as date_of_first_treatment_third_line_treatment,

--#excel_data.date_of_last_treatment_third_line_treatment,
CONVERT(datetime, #excel_data.date_of_last_treatment_third_line_treatment) as date_of_last_treatment_third_line_treatment,
#excel_data.number_of_treatments_third_line_treatment

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


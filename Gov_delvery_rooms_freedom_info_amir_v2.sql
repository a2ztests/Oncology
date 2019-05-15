--For hofesh hameida request on government delivery rooms
--Design doc at:O:\Amir_Shaked\חפש המידע - חדרי_לידה_ממשלתיים_1\אפיון_פרויקט_חדרי_לידה_ממשלתיים_1.xlsx
--Changed the Tolac calculation in this version: אחרי נתוח קיסרי אחד בעבר+ לידה נוכחית= רגילה או קיסרית
------------------------------------------------------------------
--כלל הלידות
--אם נולד יותר מילד אחד, נספור יותר מפעם אחת
select 
	year([תאריך לידה ילוד]) year_of_birth
	,count(מקרה) cnt 
--select year([Birth_Time]),   COUNT(DISTINCT(casenum)) as כלל_הלידות 
FROM [BI_Dev].[dbo].[CLN_LIS_DATA] lis
where 
	year([תאריך לידה ילוד]) between 2016 and 2018
	and [מספר עוברים] = 2
group by year([תאריך לידה ילוד])
order by year([תאריך לידה ילוד])

/*בדיקה שבלידת תאומים יש 2 רשומות של מקרה אם

select 
	מקרה 
	,[PatIdNum_baby]
	from [BI_Dev].[dbo].[CLN_LIS_DATA] lis
where [מספר עוברים] = 2
order by מקרה
*/

------------------------------------------------------------------
--שיעור_השראת_מתוך_כלל_הלידות
select 
	year([תאריך לידה ילוד]) year_of_birth
	,count(מקרה) cnt
--select year([Birth_Time]),   COUNT(DISTINCT(casenum)) as כלל_הלידות 
FROM [BI_Dev].[dbo].[CLN_LIS_DATA] lis
where 
	year([תאריך לידה ילוד]) between 2016 and 2018
	and [אופן התחלת לידה] in ('Cervical Ripening-EAB+PGE2'
			,'Cervical Ripening-Vaginal Pg'
			,'Induction - Amniotomy + Oxytocin'
			,'הבשלת צוואר + השראת לידה'
			,'השראת לידה'
			,'CxRipening+Induction-MechanicEAB+Oxytocin'
			,'Cx Ripening + Induction- EAB/Saline + Oxytocin'
			,'אוגמנטציה'
			,'Induction - Amniotomy'
			,'הבשלת צואר - בלון'
			,'Cervical Ripening-EAB Saline/Mechanical'
			,'Cx Ripening + Induction- Vaginal Pg + Oxytocin'
			,'Induction - Oxytocin'
			,'אוגמנטציה בחדר לידה'
			,'Cx Ripening + Induction- EAB/PGE2 + Oxytocin'
			,'הבשלת צוואר'
			)

group by year([תאריך לידה ילוד])
order by year([תאריך לידה ילוד])


------------------------------------------------------------------
--שיעור_זרוזים_באמצעות_פיטוצין_במהלך_לידות_ספונטניות_מתוך_כלל_הלידות
select year([תאריך לידה ילוד]) year_of_birth
		,count(מקרה) cnt
from BI_Dev.dbo.CLN_LIS_DATA
where 
		[אופן התחלת לידה] like '%Oxytocin%'
		--רגילה = ספונטנית
		--and [סוג לידה] = 'רגילה'  
		and [קיסרי משוקלל] = 0
		and year([תאריך לידה ילוד]) between 2016 and 2018
group by year([תאריך לידה ילוד])
order by year([תאריך לידה ילוד])


--select distinct ([אופן התחלת לידה]) from BI_Dev.dbo.CLN_LIS_DATA where [אופן התחלת לידה] like '%בסיכון%'

------------------------------------------------------------------
--שיעור_אלחוש_אפידורלי_מתוך_כלל_הלידות


select year([תאריך לידה ילוד]) year_of_birth
		,count(מקרה) cnt
from BI_Dev.dbo.CLN_LIS_DATA
where ([סוג הרדמה ללא תלות בניתוח] like '%Epidural%'
		or [סוג הרדמה ללא תלות בניתוח] like '%אפידורל%')
		and year([תאריך לידה ילוד]) between 2016 and 2018
group by year([תאריך לידה ילוד])
order by year([תאריך לידה ילוד])

--select distinct ([סוג הרדמה ללא תלות בניתוח]) from BI_Dev.dbo.CLN_LIS_DATA
------------------------------------------------------------------
--התפלגות גיל_אם_בזמן_הלידה

select 
	year([תאריך לידה ילוד])  year_of_birth
	,case when [גיל האם]=9999 then null else [גיל האם] end 'שנת_לידת_התינוק'
	,count(מקרה) cnt 
FROM [BI_Dev].[dbo].[CLN_LIS_DATA] lis
where 
	year([תאריך לידה ילוד]) between 2016 and 2018

group by year([תאריך לידה ילוד]),[גיל האם]
order by year([תאריך לידה ילוד]), [גיל האם]

------------------------------------------------------------------
--שיעור_לידות_היי_ריסק_מתוך_כלל_הלידות
select year([תאריך לידה ילוד]) year_of_birth
		,count(מקרה) cnt
from BI_Dev.dbo.CLN_LIS_DATA
where 
		[אופן התחלת לידה] = 'התקבלה להשגחה מהריון בסיכון'
		
		and year([תאריך לידה ילוד]) between 2016 and 2018
group by year([תאריך לידה ילוד])
order by year([תאריך לידה ילוד])
------------------------------------------------------------------

--שיעור_לידות_מבכירות_לעומת_לידות_ולדניות_מתוך_כלל_הלידות
--שיעור_לידות_מבכירות
select year([תאריך לידה ילוד]) year_of_birth
		,count(מקרה) cnt
from BI_Dev.dbo.CLN_LIS_DATA
where [NumOfBirths_P]=0
		and year([תאריך לידה ילוד]) between 2016 and 2018
group by year([תאריך לידה ילוד])
order by year([תאריך לידה ילוד])

/*
select
[תז],
 [מקרה], 
[מקרה ילוד],
[NumOfBirths_P] 
from BI_Dev.dbo.CLN_LIS_DATA
where [תז] = 
'20323594-0'
order by [תז], [NumOfBirths_P] 
*/
--שיעור_לידות_ולדניות
select year([תאריך לידה ילוד]) year_of_birth
		,count(מקרה) cnt
from BI_Dev.dbo.CLN_LIS_DATA
where [NumOfBirths_P]>0
		and year([תאריך לידה ילוד]) between 2016 and 2018
group by year([תאריך לידה ילוד])
order by year([תאריך לידה ילוד])

------------------------------------------------------------------
-- שיעור_לידות_לאחר_שבוע_41_מתוך_כלל_הלידות
select year([תאריך לידה ילוד]) year_of_birth
		,count(מקרה) cnt
from BI_Dev.dbo.CLN_LIS_DATA
where [שבוע לידה]>41
		and year([תאריך לידה ילוד]) between 2016 and 2018
group by year([תאריך לידה ילוד])
order by year([תאריך לידה ילוד])



------------------------------------------------------------------
--שיעור_מכשירניות_מתוך_כלל_הלידות

select year([תאריך לידה ילוד]) year_of_birth
		,count(מקרה) cnt
from BI_Dev.dbo.CLN_LIS_DATA
where 
		[סוג לידה] = 'וואקום'
		
		and year([תאריך לידה ילוד]) between 2016 and 2018
group by year([תאריך לידה ילוד])
order by year([תאריך לידה ילוד])

--select distinct ([סוג לידה]) from BI_Dev.dbo.CLN_LIS_DATA 

------------------------------------------------------------------
--שיעור_מכשירניות_מתוך_לידות_נרתיקיות
--מכשירניות
select year([תאריך לידה ילוד]) year_of_birth
		,count(מקרה) cnt
from BI_Dev.dbo.CLN_LIS_DATA
where 
		[סוג לידה] = 'וואקום'
	
		and year([תאריך לידה ילוד]) between 2016 and 2018
group by year([תאריך לידה ילוד])
order by year([תאריך לידה ילוד])

--רגילות = נרתיקיות
select year([תאריך לידה ילוד]) year_of_birth
		,count(מקרה) cnt
from BI_Dev.dbo.CLN_LIS_DATA
where 
	 [קיסרי משוקלל] = 0 --רגילה = נרתיקית
	 /*
	 [סוג לידה] = 'רגילה'  
	 רגילה = ספונטנית
	 */
		and year([תאריך לידה ילוד]) between 2016 and 2018
group by year([תאריך לידה ילוד])
order by year([תאריך לידה ילוד])



------------------------------------------------------------------
--שיעור_חתך_חיץ_הנקבים_מתוך_כלל_הלידות
--=מבוקש אפיזיוטומיה ולא כל ארוע של תפירה
select year([תאריך לידה ילוד]) year_of_birth
		,count(מקרה) cnt
from BI_Dev.dbo.CLN_LIS_DATA
where 
[Episiotomy]=1

		and year([תאריך לידה ילוד]) between 2016 and 2018
group by year([תאריך לידה ילוד])
order by year([תאריך לידה ילוד])

/*חתך חיץ
(Stitch_Time is not null
		or Stitch_Doctor_1 is not null
		or Stitch_Doctor_2 is not null)
		
		and Birth_Year between 2016 and 2018

group by Birth_Year
order by Birth_Year
*/

------------------------------------------------------------------
--שיעור_ניתוחים_קיסריים_ראשונים_מתוך_כלל_הלידות

select year([תאריך לידה ילוד]) year_of_birth
		,count(מקרה) cnt
from BI_Dev.dbo.CLN_LIS_DATA
where 
		[קיסרי משוקלל] = 1
	
	
		and year([תאריך לידה ילוד]) between 2016 and 2018
group by year([תאריך לידה ילוד])
order by year([תאריך לידה ילוד])

/*
select 
מקרה,
[קיסרי משוקלל],
[סוג לידה]
from BI_Dev.dbo.CLN_LIS_DATA 

liad
--דוגמא - לידה נוכחית לא קיסרית + בעבר 2 קיסריות
select
[תז],
 [מקרה], 
 [NumOfBirths_P],
[מקרה ילוד],
[קיסרי משוקלל],
[NumOfCaesars_CS]
from BI_Dev.dbo.CLN_LIS_DATA

where [NumOfCaesars_CS]>0
and [תז] = 
'30737373-8'
and [קיסרי משוקלל]
=0
and [NumOfCaesars_CS]
>0

order by [תז], [NumOfBirths_P] 
*/

------------------------------------------------------------------
--שיעור_ניתוחים_קיסריים_חוזרים_מתוך_כלל_הלידות


select year([תאריך לידה ילוד]) year_of_birth
		,count(מקרה) cnt
from BI_Dev.dbo.CLN_LIS_DATA
where 
		--לידה קיסרית בעבר
		[NumOfCaesars_CS]>0
	
		and year([תאריך לידה ילוד]) between 2016 and 2018
group by year([תאריך לידה ילוד])
order by year([תאריך לידה ילוד])

/*
select 
מקרה,
[קיסרי משוקלל],
[NumOfCaesars_CS]
from BI_Dev.dbo.CLN_LIS_DATA 
*/
------------------------------------------------------------------

--שיעור_לידות_vbac_מתוך_Tolac

--שיעור VBAC
--הגדרת VBAC:  אחרי נתוח קיסרי בעבר,+ לידה נוכחית= רגילה
select year([תאריך לידה ילוד]) year_of_birth
		,count(מקרה) cnt
from BI_Dev.dbo.CLN_LIS_DATA
where 
		[קיסרי משוקלל] = 0 --עכשיו רגילה = נרתיקית
		and [NumOfCaesars_CS]=1 --  קיסרית אחת בעבר

		and year([תאריך לידה ילוד]) between 2016 and 2018
group by year([תאריך לידה ילוד])
order by year([תאריך לידה ילוד])

--כלל TOLAC
--הגדרת TOLAC:  נסיון ללידה נרתיקית (אופן התחלת לידה = spont \ השראת לידה \ ספונטני \ לבדוק את השאר...), אחרי לידה קיסרית בעבר
select year([תאריך לידה ילוד]) year_of_birth
		,count(מקרה) cnt
from BI_Dev.dbo.CLN_LIS_DATA
where
		/*--עכשיו ספונטנית: כולל השראת לידה, ספונטני
			 [אופן התחלת לידה] in ('Cervical Ripening-EAB+PGE2'
			,'Cervical Ripening-Vaginal Pg'
			,'Induction - Amniotomy + Oxytocin'
			,'הבשלת צוואר + השראת לידה'
			,'השראת לידה'
			,'CxRipening+Induction-MechanicEAB+Oxytocin'
			,'Cx Ripening + Induction- EAB/Saline + Oxytocin'
			,'אוגמנטציה'
			,'Induction - Amniotomy'
			,'הבשלת צואר - בלון'
			,'Cervical Ripening-EAB Saline/Mechanical'
			,'Cx Ripening + Induction- Vaginal Pg + Oxytocin'
			,'Induction - Oxytocin'
			,'אוגמנטציה בחדר לידה'
			,'Cx Ripening + Induction- EAB/PGE2 + Oxytocin'
			,'הבשלת צוואר'

			--ספונטני
			,'Spontaneous onset of labor'
			,'ספונטני' 
			) 
*/
		
	/*	קיסרי משוקלל = 0 - משמע עכשיו רגילה = נרתיקית
	--קיסרי משוקלל = 1 - משמע עכשיו קיסרי 
--select distinct [קיסרי משוקלל] from BI_Dev.dbo.CLN_LIS_DATA
--since 1/0 are the only values for this field, we do not include it in the where part
*/	
		[NumOfCaesars_CS]=1 --  קיסרית אחת בעבר

		and year([תאריך לידה ילוד]) between 2016 and 2018
group by year([תאריך לידה ילוד])
order by year([תאריך לידה ילוד])

--select distinct [אופן התחלת לידה] from BI_Dev.dbo.CLN_LIS_DATA


------------------------------------------------------------------
--שיעור_לידות_עכוז_נרתיקיות_מתוך_כלל_לידות_עכוז
--כלל לידות עכוז 
select year([תאריך לידה ילוד]) year_of_birth
		,count(מקרה) cnt
from BI_Dev.dbo.CLN_LIS_DATA
where 
		[סוג לידה] ='עכוז'
	
	
		and year([תאריך לידה ילוד]) between 2016 and 2018
group by year([תאריך לידה ילוד])
order by year([תאריך לידה ילוד])


--לידות_עכוז נרתיקיות 
-- נרתיקיות = רגילות, משמע קיסרי משוקלל=0

select year([תאריך לידה ילוד]) year_of_birth
		,count(מקרה) cnt
from BI_Dev.dbo.CLN_LIS_DATA
where 
		[קיסרי משוקלל] = 0 --רגילה = נרתיקית
	and [סוג לידה] ='עכוז'
	
		and year([תאריך לידה ילוד]) between 2016 and 2018
group by year([תאריך לידה ילוד])
order by year([תאריך לידה ילוד])

------------------------------------------------------------------


--שיעור_לידות_תאומים_וגינליות_מתוך_כלל_לידות_תאומים
--כלל לידות תאומים 
select year([תאריך לידה ילוד]) year_of_birth
		,count(מקרה) cnt
from BI_Dev.dbo.CLN_LIS_DATA
where 
		
	[מספר עוברים] = 2
	
		and year([תאריך לידה ילוד]) between 2016 and 2018
group by year([תאריך לידה ילוד])
order by year([תאריך לידה ילוד])


--לידות_תאומים נרתיקיות 
-- נרתיקיות = וגינליות = רגילות, משמע קיסרי משוקלל=0

select year([תאריך לידה ילוד]) year_of_birth
		,count(מקרה) cnt
from BI_Dev.dbo.CLN_LIS_DATA
where 
		[קיסרי משוקלל] = 0 --רגילה = וגינלית = נרתיקית
	and [מספר עוברים] = 2
	
		and year([תאריך לידה ילוד]) between 2016 and 2018
group by year([תאריך לידה ילוד])
order by year([תאריך לידה ילוד])

------------------------------------------------------------------
--פילוח_התוויות_לניתוח_קיסרי

--select distinct [סוג ניתוח קיסרי] from BI_Dev.dbo.CLN_LIS_DATA

select year([תאריך לידה ילוד]) שנת_לידת_התינוק
,[סוג ניתוח קיסרי] as סוג_ניתוח_קיסרי
		,count(מקרה) cnt
from BI_Dev.dbo.CLN_LIS_DATA

where 
	
		--[אופן התחלת לידה] = 'ניתוח קיסרי דחוף' and
		
	
		 year([תאריך לידה ילוד]) between 2016 and 2018
group by year([תאריך לידה ילוד]), [סוג ניתוח קיסרי]
order by year([תאריך לידה ילוד]), [סוג ניתוח קיסרי]



------------------------------------------------------------------
--שיעור_ניתוחים_קיסריים_לא_מתוכננים_חרום_מתוך_כלל_הלידות
/*select distinct [אופן התחלת לידה] from BI_Dev.dbo.CLN_LIS_DATA
select distinct [סוג ניתוח קיסרי] from BI_Dev.dbo.CLN_LIS_DATA
select distinct [דחיפות ניתוח] from BI_Dev.dbo.CLN_LIS_DATA
select distinct [קיסרי משוקלל]  from BI_Dev.dbo.CLN_LIS_DATA
*/

/*הקוד הבא לא נראה נכון
select year([תאריך לידה ילוד]) year_of_birth
		,count(מקרה) cnt
from BI_Dev.dbo.CLN_LIS_DATA
where 
	
		[אופן התחלת לידה] = 'ניתוח קיסרי דחוף'
	
		and year([תאריך לידה ילוד]) between 2016 and 2018
group by year([תאריך לידה ילוד])
order by year([תאריך לידה ילוד])
*/

select year([תאריך לידה ילוד]) year_of_birth
		,count(מקרה) cnt
from BI_Dev.dbo.CLN_LIS_DATA
where 
	
		[דחיפות ניתוח] in ('דחוף', 'בהול (emergency)' , 'דחוף (urgent)')
		and [קיסרי משוקלל] =1 --הנתוח הנוכחי הוא קיסרי
		and year([תאריך לידה ילוד]) between 2016 and 2018
group by year([תאריך לידה ילוד])
order by year([תאריך לידה ילוד])
------------------------------------------------------------------
--מצגים_בלידות_תאומים_נרתיקיות-חלוקה_לפי_אחוזים
/*לא הצלחנו למצוא
SELECT *   FROM sys.tables
where [object_id] in (
  SELECT object_id
  FROM sys.columns
  --where name = 'Clinic_Necessary')
  where name like lower('%PRESENTATION%'))
  --where name like lower('%מצג%'))

  --select distinct [CORD PRESENTATION] from BI_Dev.dbo.CLN_LIS_DATA
*/






------------------------------------------------------------------
--מספר_הנרשמות_לעומת_מספר_הלידות_המתבצעות_בפועל_בחדר_טבעי
--לא מצאנו



------------------------------------------------------------------
--סיבות_בטול_קיום_לידות_שנרשמו_אליהם_מראש_במרכז_לידה_טבעי_-_התפלגות_באחוזים
--לא מצאנו



------------------------------------------------------------------
--שיעור_לידות_vbac_לאחר_2_ניתוחים_קיסריים_או_יותר_מתוך_כלל_היולדות_לאחר_2_נתוחים_קיסריים_או_יותר

--כלל VBAC
--הגדרת VBAC:  אחרי 2 או יותר נתוחים קיסריים בעבר,+ לידה נוכחית= רגילה
select year([תאריך לידה ילוד]) year_of_birth
		,count(מקרה) cnt
from BI_Dev.dbo.CLN_LIS_DATA
where 
		[קיסרי משוקלל] = 0 --עכשיו רגילה = נרתיקית
		and [NumOfCaesars_CS]>1 --   שתי קיסריות בעבר או יותר

		and year([תאריך לידה ילוד]) between 2016 and 2018
group by year([תאריך לידה ילוד])
order by year([תאריך לידה ילוד])


--כלל היולדות לאחר 2 נתוחים קיסריים או יותר
select year([תאריך לידה ילוד]) year_of_birth
		,count(מקרה) cnt
from BI_Dev.dbo.CLN_LIS_DATA
where 
		--[קיסרי משוקלל] = 0 --עכשיו רגילה = נרתיקית
		 [NumOfCaesars_CS]>1 --  שתי קיסריות בעבר או יותר

		and year([תאריך לידה ילוד]) between 2016 and 2018
group by year([תאריך לידה ילוד])
order by year([תאריך לידה ילוד])




------------------------------------------------------------------
--שיעור_לידות_vbac_לאחר_2_ניתוחים_קיסריים_מתוך_TOLAC_לאחר_2_נתוחים_קיסריים


--כלל VBAC
--הגדרת VBAC:  אחרי 2 נתוחים קיסריים + לידה נוכחית= רגילה
select year([תאריך לידה ילוד]) year_of_birth
		,count(מקרה) cnt
from BI_Dev.dbo.CLN_LIS_DATA
where 
		[קיסרי משוקלל] = 0 --עכשיו רגילה = נרתיקית
		and [NumOfCaesars_CS]=2 --  שתי קיסריות בעבר

		and year([תאריך לידה ילוד]) between 2016 and 2018
group by year([תאריך לידה ילוד])
order by year([תאריך לידה ילוד])

--כלל TOLAC
--הגדרת TOLAC:  אחרי 2 נתוחים קיסריים בעבר+ לידה נוכחית= רגילה או קיסרית
select year([תאריך לידה ילוד]) year_of_birth
		,count(מקרה) cnt
from BI_Dev.dbo.CLN_LIS_DATA
where
		/*
		--עכשיו ספונטנית: כולל השראת לידה, ספונטני
			 [אופן התחלת לידה] in ('Cervical Ripening-EAB+PGE2'
			,'Cervical Ripening-Vaginal Pg'
			,'Induction - Amniotomy + Oxytocin'
			,'הבשלת צוואר + השראת לידה'
			,'השראת לידה'
			,'CxRipening+Induction-MechanicEAB+Oxytocin'
			,'Cx Ripening + Induction- EAB/Saline + Oxytocin'
			,'אוגמנטציה'
			,'Induction - Amniotomy'
			,'הבשלת צואר - בלון'
			,'Cervical Ripening-EAB Saline/Mechanical'
			,'Cx Ripening + Induction- Vaginal Pg + Oxytocin'
			,'Induction - Oxytocin'
			,'אוגמנטציה בחדר לידה'
			,'Cx Ripening + Induction- EAB/PGE2 + Oxytocin'
			,'הבשלת צוואר'

			--ספונטני
			,'Spontaneous onset of labor'
			,'ספונטני' 
			)
*/

	/*	קיסרי משוקלל = 0 - משמע עכשיו רגילה = נרתיקית
	--קיסרי משוקלל = 1 - משמע עכשיו קיסרי 
--select distinct [קיסרי משוקלל] from BI_Dev.dbo.CLN_LIS_DATA
--since 1/0 are the only values for this field, we do not include it in the where part
*/	
			 [NumOfCaesars_CS]=2 --  שתי קיסריות בעבר
			and year([תאריך לידה ילוד]) between 2016 and 2018

group by year([תאריך לידה ילוד])
order by year([תאריך לידה ילוד])		
------------------------------------------------------------------
--שיעור_מסך_הלידות_של_קרעים_ברחם_לאחר_VBAC_עם_2_ניתוחים_קיסריים_או_יותר_בעברה

/*
קרע 665.10 כלול בשאר הקרעים
select [מקרה]
,[UTERINE RUPTURE]
,[UTERINE RUPTURE 665.10]
,max([תאריך לידה ילוד])
from BI_Dev.dbo.CLN_LIS_DATA
where [UTERINE RUPTURE 665.10]=1
 group by [מקרה]
 		,[UTERINE RUPTURE]
		,[UTERINE RUPTURE 665.10]
--order by [תאריך לידה ילוד]

--------------------------

--קרע ברחם
select [מקרה]
		,[מטופל]
		,[תז]
		,[שם משפחה]
		,[שם פרטי]
		,[UTERINE RUPTURE]
		,max([תאריך לידה ילוד]) 'תאריך לידה ילוד'
from BI_Dev.dbo.CLN_LIS_DATA
where [UTERINE RUPTURE]=1
--Thi condition includes [UTERINE RUPTURE 665.10]=1
		and [תאריך לידה ילוד] is not null
group by [מקרה]
		,[מטופל]
		,[תז]
		,[שם משפחה]
		,[שם פרטי]
		,[UTERINE RUPTURE]
order by 'תאריך לידה ילוד'



--קרע ברחם
--רק קוד 665.10
select [מקרה]
		,[מטופל]
		,[תז]
		,[שם משפחה]
		,[שם פרטי]
		,[UTERINE RUPTURE]
		,max([תאריך לידה ילוד]) 'תאריך לידה ילוד'
from BI_Dev.dbo.CLN_LIS_DATA
where [UTERINE RUPTURE 665.10]=1
		and [תאריך לידה ילוד] is not null
group by [מקרה]
		,[מטופל]
		,[תז]
		,[שם משפחה]
		,[שם פרטי]
		,[UTERINE RUPTURE]
order by 'תאריך לידה ילוד'
*/



--הגדרת VBAC עם קרע ברחם
 -- שני ניתוחים קיסריים בעבר+ לידה נוכחית= רגילה ובנוכחית קרע
select year([תאריך לידה ילוד]) year_of_birth
		,count(מקרה) cnt
from BI_Dev.dbo.CLN_LIS_DATA
where 
		[קיסרי משוקלל] = 0 --עכשיו רגילה = נרתיקית
		and [NumOfCaesars_CS]=2 --  שתי קיסריות בעבר
		and [UTERINE RUPTURE]=1 --קרע ברחם
		and year([תאריך לידה ילוד]) between 2016 and 2018
group by year([תאריך לידה ילוד])
order by year([תאריך לידה ילוד])

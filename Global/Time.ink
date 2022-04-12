/*
** TIME
Note: the simulation for time runs in the game engine and does not increment running outside of that (e.g. Inky).
*/

// defined periods
CONST CTimeSpanMidnight = 0
CONST CTimeSpanNight = 1
CONST CTimeSpanDawn = 2
CONST CTimeSpanMorningEarly = 3
CONST CTimeSpanMorning = 4
CONST CTimeSpanMorningLate = 5
CONST CTimeSpanNoon = 6
CONST CTimeSpanAfternoonEarly = 7
CONST CTimeSpanAfternoon = 8
CONST CTimeSpanAfternoonLate = 9
CONST CTimeSpanDusk = 10

/*
	0 => "Bakdag", // fire day
	1 => "Esdag", // water day
	2 => "Ordag", // air day
	3 => "Tirdag", // earth day
	4 => "Hexdag", // leader day
*/

// current time on worlds
// note: these are maintained by the game engine and do NOT increment outside of that
VAR TimeDayPri = 0
VAR TimeMonthPri = 0 // Is, Lou, Es
VAR TimeYearPri = 0
VAR TimeEraPri = 0 // this is not computed, it has to be set
VAR TimeTicksPri = 0
VAR TimeDayTagom = 0
VAR TimeMonthTagom = 0 
VAR TimeYearTagom = 0
VAR TimeEraTagom = 0 // this is not computed, it has to be set
VAR TimeTicksTagom = 0

=== function ClockGetCurrentTimeSpan(ref ticks)
	~ temp span = CTimeSpanMidnight
	{
		- ticks == 35:
			~ span = CTimeSpanNoon
		- ticks >= 1 && ticks < 17 || ticks >= 54:
			~ span = CTimeSpanNight
		- ticks >= 17 && ticks < 20:
			~ span = CTimeSpanDawn
		- ticks >= 20 && ticks < 25:
			~ span = CTimeSpanMorningEarly
		- ticks >= 25 && ticks < 30:
		 	~ span = CTimeSpanMorning
		- ticks >= 30 && ticks < 35:
			~ span = CTimeSpanMorningLate
		- ticks >= 36 && ticks < 41:
			~ span = CTimeSpanAfternoonEarly
		- ticks >= 41 && ticks < 46:
			~ span = CTimeSpanAfternoon
		- ticks >= 46 && ticks < 51:
			~ span = CTimeSpanAfternoonLate
		- ticks >= 51:
			~ span = CTimeSpanDusk
	}
	~ return span

// is the specified tick count between span1 and span2?
=== function ClockGetCurrentTimeBetween(ref ticks, span1, span2)
	~ temp span = ClockGetCurrentTimeSpan(ticks)
	{
		- span1 == CTimeSpanNight || span2 == CTimeSpanNight:
			// there's no granularity for night, so we can't really check between these spans
			~ return false
		- span1 == span2:
			~ return span == span1
		- span1 < span2:
			~ return span >= span1 && span <= span2
		- span2 < span1:
			~ return span >= span2 && span <= span1
	}

=== function ClockGetCurrentTimeSpanPri()
	~ return ClockGetCurrentTimeSpan(TimeTicksPri)

=== function ClockIsCurrentTimeBetweenPri(span1, span2)
	~ return ClockGetCurrentTimeBetween(TimeTicksPri, span1, span2)

=== function ClockGetCurrentTimeSpanTagom()
	~ return ClockGetCurrentTimeSpan(TimeTicksTagom)

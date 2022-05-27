//
// WEATHER
//

// weather conditions
CONST CClimateConditionClear = 0
CONST CClimateConditionCloudHigh = 1
CONST CClimateConditionCloudLow = 2
CONST CClimateConditionMist = 3
CONST CClimateConditionFog = 4
CONST CClimateConditionRainLight = 5
CONST CClimateConditionRainHeavy = 6
CONST CClimateConditionShowers = 7
CONST CClimateConditionSleet = 8
CONST CClimateConditionThunderstorm = 9
CONST CClimateConditionSnow = 10

// biome 
CONST CClimateTypeTemperate = 0
CONST CClimateTypeTropical = 1
CONST CClimateTypeArctic = 2
CONST CClimateTypeDesert = 3

// scale of temperature
CONST CTemperatureDifferenceCold = 0
CONST CTemperatureDifferenceCool = 1
CONST CTemperatureDifferenceNormal = 2
CONST CTemperatureDifferenceWarm = 3
CONST CTemperatureDifferenceHot = 4

CONST CTemperatureChangeChance = 40 // % of chance to change the temperature
CONST CConditionChangeChance = 30 // % chance to change weather condition

// base temperatures for each climate type
CONST CTempBaseTemperateNoon = 20
CONST CTempBaseTemperateMidnight = 10
CONST CTempBaseTropicalNoon = 30
CONST CTempBaseTropicalMidnight = 15
CONST CTempBaseArcticNoon = 0
CONST CTempBaseArcticMidnight = -10
CONST CTempBaseDesertNoon = 40
CONST CTempBaseDesertMidnight = 15
// maximum change from base when changing temperature (e.g. not lower than CTempBaseTemperateNoon-CTempBaseMaxDeviation)
CONST CTempBaseMaxDeviation = 15 
CONST CTempDifferenceStep = 3 // (15 / 5) there are five grades of difference
// maximum amount of temperature difference if determined to change
CONST CTempMaxChangeAmount = 2
// temperatures required to transition to specific conditions
CONST CTempSleetStart = 3
CONST CTempSnowStart = 0
CONST CTempRainEnd = 30 // don't rain if hotter than this
CONST CTempMistEnd = 15 // don't fog up 
CONST CTempThunderstormStart = 30 // TODO 
// 1:x chance of rain/snow being rolled when applicable
CONST CWeatherConditionRainChance = 5

// Pri conditions
VAR ClimatePriTemperateCondition = CClimateConditionClear
VAR ClimatePriTemperateTemp = CTempBaseTemperateNoon
VAR ClimatePriTropicalCondition = CClimateConditionClear
VAR ClimatePriTropicalTemp = CTempBaseTropicalNoon
VAR ClimatePriArcticCondition = CClimateConditionClear
VAR ClimatePriArcticTemp = CTempBaseArcticNoon
VAR ClimatePriDesertCondition = CClimateConditionClear
VAR ClimatePriDesertTemp = CTempBaseDesertNoon

// Tagom conditions
VAR ClimateTagomVolcanicCondition = CClimateConditionClear
VAR ClimateTagomVolcanicTemp = CTempBaseTemperateNoon
VAR ClimateTagomDesertCondition = CClimateConditionClear
VAR ClimateTagomDesertTemp = CTempBaseDesertNoon

// Synthetic Domain conditions
VAR ClimateEthereumEtherealCondition = CClimateConditionClear
VAR ClimateEthereumEtherealTemp = CTempBaseTemperateNoon

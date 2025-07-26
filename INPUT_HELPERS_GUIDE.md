# ================================
# 🐔 INPUT HELPERS CREATION GUIDE
# ================================
# Follow these steps to create all required input helpers

## Instructions:
1. Go to Settings → Devices & Services → Helpers → CREATE HELPER

## Required Input Helpers:

### 1. Daily Chicken Visits Counter
- Type: Number
- Name: Daily Chicken Visits
- Entity ID: input_number.daily_chicken_visits
- Minimum: 0
- Maximum: 999
- Step: 1
- Initial: 0
- Unit: visits
- Icon: mdi:counter

### 2. Weekly Chicken Visits Counter  
- Type: Number
- Name: Weekly Chicken Visits
- Entity ID: input_number.weekly_chicken_visits
- Minimum: 0
- Maximum: 9999
- Step: 1
- Initial: 0
- Unit: visits
- Icon: mdi:calendar-week

### 3. Current Nest Occupant
- Type: Text
- Name: Current Nest Occupant
- Entity ID: input_text.current_nest_occupant
- Maximum length: 50
- Initial: "Empty"
- Icon: mdi:chicken

### 4. Daily Chicken Champion
- Type: Text
- Name: Daily Chicken Champion
- Entity ID: input_text.daily_chicken_champion
- Maximum length: 50
- Initial: "No champion yet"
- Icon: mdi:trophy

### 5. Last Activity Time
- Type: Text
- Name: Last Activity Time
- Entity ID: input_text.last_activity_time
- Maximum length: 30
- Initial: "No activity"
- Icon: mdi:clock

### 6. Current Session Duration
- Type: Number
- Name: Current Session Duration
- Entity ID: input_number.current_session_duration
- Minimum: 0
- Maximum: 7200
- Step: 1
- Initial: 0
- Unit: seconds
- Icon: mdi:timer

## After creating helpers:
1. Go to Settings → System → Restart Home Assistant
2. Wait for restart to complete
3. Check if MQTT sensors appear in Developer Tools → States

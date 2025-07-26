# ================================
# 🐔 HÖNSGÅRDEN SETUP GUIDE
# ================================

## What I've Created For You

### 1. **Long-term Data Storage**
- Added `recorder` configuration to keep chicken data for 1 full year
- All chicken-related entities will be preserved for historical analysis

### 2. **Main Hönsgården Dashboard**
- **Path**: `/hoensgaarden/overview`
- **Features**:
  - Live status showing current nest occupant
  - System status indicators  
  - Daily/weekly visit counters
  - Real-time productivity charts
  - Champion leaderboards

### 3. **Individual Chicken Profiles**
- **Path**: `/hoensgaarden/chicken-profiles`
- **14 Individual chickens**: Lady Kluck, Ronny, Ada, Ms.Foster, Kiwi, Skrik, Panik, Gästrid, Chick_1-6_2025
- Each chicken gets their own profile page with personal stats
- Clickable chicken cards that navigate to individual profiles

### 4. **Statistics Dashboard**
- **Path**: `/hoensgaarden/statistics`
- Long-term trend analysis
- Monthly and weekly comparisons
- Champion history tracking

### 5. **System Monitoring**
- **Path**: `/hoensgaarden/system-monitoring`
- RFID system status
- MQTT data flow monitoring
- Debug information

### 6. **Small Status Card for Main Dashboard**
- File: `/config/dashboards/chicken-status-card.yaml`
- Shows current nest occupant
- Tap to go to main chicken dashboard
- Hold to go to chicken profiles

## How to Add to Your Main Dashboard

### Method 1: Manual Card Addition
1. Go to your main dashboard
2. Click "Edit Dashboard"
3. Click "Add Card"
4. Choose "Manual" card type
5. Copy and paste the content from `chicken-status-card.yaml`

### Method 2: YAML Mode (if using YAML dashboards)
```yaml
- type: custom:mushroom-entity-card
  entity: sensor.nest_1_occupant
  name: 🥚 I boet nu
  icon: mdi:bird
  icon_color: orange
  layout: horizontal
  tap_action:
    action: navigate
    navigation_path: "/hoensgaarden/overview"
```

## Photo Setup

### 1. Add Photos to `/config/www/chickens/`
Required filenames:
- `lady_kluck.jpg`
- `ronny.jpg`
- `ada.jpg`  
- `ms_foster.jpg`
- `kiwi.jpg`
- `skrik.jpg`
- `panik.jpg`
- `gastrid.jpg`
- `chick1_2025.jpg`
- `chick2_2025.jpg`
- `chick3_2025.jpg`
- `chick4_2025.jpg`
- `chick5_2025.jpg`
- `chick6_2025.jpg`

### 2. Photo Specifications
- **Format**: JPG or PNG
- **Size**: 800x600 pixels (4:3 aspect ratio)
- **File size**: Under 1MB each

## Required HACS Cards

For the best experience, install these HACS frontend cards:

### Essential Cards
1. **Mushroom Cards** - `bartmichu/lovelace-mushroom`
   - Main UI components for the dashboard
   
2. **ApexCharts Card** - `RomRider/apexcharts-card`
   - Charts and graphs for statistics

### Optional Enhancements
3. **Card Mod** - `thomasloven/lovelace-card-mod`
   - Custom styling (already included in card code)

4. **Layout Card** - `thomasloven/lovelace-layout-card`
   - Advanced layout options

## Installation Steps

### 1. Restart Home Assistant
After all configuration changes:
```
Developer Tools > YAML > Restart Home Assistant
```

### 2. Access the Dashboard
Navigate to: `http://your-ha-ip:8123/hoensgaarden/overview`

### 3. Install HACS Cards
1. Go to HACS > Frontend
2. Search for "Mushroom" and install
3. Search for "ApexCharts" and install  
4. Restart Home Assistant

### 4. Add Photos
1. Copy chicken photos to `/config/www/chickens/`
2. Use exact filenames from the list above
3. Refresh the dashboard

## Expected Behavior

### When ESP32 Starts Publishing MQTT Data:
- All sensors will become available
- Dashboard cards will show real data
- Lint errors will disappear
- Individual chicken stats will start calculating

### Data Flow:
```
ESP32 RFID Reader → MQTT → Home Assistant → Dashboard
                              ↓
                        Recorder Database
                              ↓
                        1 Year Data Retention
```

## Individual Chicken Features

Each chicken profile includes:
- **Personal photo**
- **RFID tag information**
- **Daily visit count**
- **Total lifetime visits**
- **Last visit timestamp**
- **Personal achievements**

## Competitive Features

### Daily Champions
- Announced at 6 PM each day
- Most productive chicken gets title

### Weekly Champions  
- Calculated Monday through Sunday
- Long-term productivity tracking

### Productivity Alerts
- Alert if activity is low (< 5 visits by noon)
- System health monitoring

## Technical Details

### Data Retention
- **Daily data**: 365 days
- **Weekly data**: 52+ weeks
- **Individual visits**: Full year history
- **Champion records**: Persistent

### MQTT Topics Used
- `chickens/nest1/status`
- `chickens/nest1/occupant`
- `chickens/visits`
- `chickens/leaderboard`
- `chickens/system/status`

## Troubleshooting

### If Dashboard Doesn't Appear
1. Check YAML syntax: `Developer Tools > YAML > Check Configuration`
2. Restart Home Assistant
3. Clear browser cache

### If Cards Don't Load
1. Install required HACS cards
2. Hard refresh browser (Ctrl+F5)
3. Check browser console for errors

### If Data Doesn't Update
1. Verify ESP32 is publishing MQTT data
2. Check MQTT integration in Home Assistant
3. Verify entity names match configuration

## Future Enhancements

Potential additions you might want:
- **Egg tracking** (if you add sensors)
- **Health monitoring** (activity pattern analysis)
- **Seasonal statistics** (productivity by month/season)
- **Feed correlation** (if you track feeding)
- **Weather correlation** (productivity vs weather)

## Support

The dashboard is designed to grow with your chicken monitoring system. As you add more sensors or features, you can easily extend the dashboard by adding new cards and views.

All configuration files are documented and modular, making it easy to customize colors, add chickens, or modify the layout to your preferences.

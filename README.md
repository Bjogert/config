# Home Assistant Configuration

## Overview
This is the Home Assistant configuration for Robert & Julia's smart home system. The setup includes automated control for:

- **Duck Door**: Automated opening/closing based on sunrise/sunset
- **Beer Elevator**: MQTT-controlled stepper motor system
- **Lighting**: Automated lighting control with scene management
- **Chicken Coop**: Automated door control
- **Temperature Monitoring**: Multiple ESP32 sensors throughout the house

## Key Features
- 🦆 Duck door automation with limit switches
- 🍺 Beer elevator control system
- 💡 Smart lighting with Philips Hue integration
- 🐔 Chicken coop door automation
- 🌡️ Temperature and humidity monitoring
- 🔊 Audio control with VLC integration
- 📱 Mobile notifications

## File Structure
- `configuration.yaml` - Main configuration file
- `automations.yaml` - All automation rules
- `scripts.yaml` - Custom scripts
- `scenes.yaml` - Lighting scenes
- `secrets.yaml` - Sensitive configuration (not in git)
- `themes/` - Custom UI themes

## Setup Instructions
1. Copy `secrets.yaml.example` to `secrets.yaml`
2. Fill in your actual credentials in `secrets.yaml`
3. Ensure MQTT broker is running on localhost
4. Restart Home Assistant

## MQTT Topics
### Duck Door
- `duck/door/command` - Control commands (clockwise/counterclockwise/stop)
- `duck/door/status` - Current status
- `duck/door/limit_switch` - Limit switch state
- `duck/door/availability` - Connection status

### Beer Elevator
- `beer_elevator/command` - Control commands (Up/Down)
- `beer_elevator/config/speed` - Motor speed setting
- `beer_elevator/config/acceleration` - Motor acceleration
- `beer_elevator/config/extra_steps_up` - Extra steps going up
- `beer_elevator/config/extra_steps_down` - Extra steps going down

### Chicken Door
- `chickendoor/status` - Door status
- `chickendoor/control` - Door control

## Device Information
- **ESP32 Sensors**: Temperature and humidity monitoring
- **Philips Hue**: Smart lighting control
- **VLC Media Player**: Audio streaming control
- **MQTT Broker**: Mosquitto running on localhost

## Automation Overview
- **Sunrise/Sunset**: Automatic lighting and door control
- **Temperature Monitoring**: Notifications for hot tub temperature
- **Button Control**: Physical button integration for lighting
- **Safety**: Limit switches for mechanical systems

## Contributing
This is a personal home automation system. Configuration is specific to our hardware setup.

## License
Personal use only.

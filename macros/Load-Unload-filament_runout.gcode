[gcode_macro LOAD_FILAMENT]
gcode:
    M104 S220
    M105    
    M109 S220
    G91 
    G1 E100 F300
    G90

[gcode_macro UNLOAD_FILAMENT]
gcode:
    M104 S220
    M105    
    M109 S220
    G91
    G1 E30 F300
    G1 E-27 F9000
    M106 S255
    M104 S120
    M105    
    M109 S120
    G1 E-50 F300
    M106 S0
    M84

[filament_switch_sensor fila]
pause_on_runout: True
runout_gcode:
    G91
    G1 Z10 
    G90
    G1 X10 Y10 F3000
    M104 S220
    M105    
    M109 S220
    G91
    G1 E30 F300
    G1 E-27 F9000
    M106 S255
    M104 S120
    M105    
    M109 S120
    G1 E-50 F300
    M106 S0
    SET_HEATER_TEMPERATURE HEATER=extruder TARGET=0
event_delay: 3.0
pause_delay: 0.5
switch_pin:PA1

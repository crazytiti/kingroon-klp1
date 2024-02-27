[homing_override]
set_position_z:0
gcode: 
    G91
    G1 Z5 F100 
    {% set HOME_CUR = 0.500 %}
    {% set driver_config = printer.configfile.settings['tmc2209 stepper_x'] %}
    {% set RUN_CUR = driver_config.run_current %}
    SET_VELOCITY_LIMIT ACCEL=500
      # Set current for sensorless homing
    {% if params.X is defined %}
    SET_TMC_CURRENT STEPPER=stepper_x CURRENT={HOME_CUR}
    G28 X F100
    G1 X2 F1000
    {% endif %}
    {% if params.Y is defined %}
    SET_TMC_CURRENT STEPPER=stepper_y CURRENT={HOME_CUR}
    G28 Y F100
    G1 Y2 F1000
    {% endif %}
    {% if params.Z is defined %}
    G28 Z F100
    {% endif %}
    {% if params.X is undefined %}
    {% if params.Y is undefined %}
    {% if params.Z is undefined %}
    SET_TMC_CURRENT STEPPER=stepper_x CURRENT={HOME_CUR}
    G28 X F100
    SET_TMC_CURRENT STEPPER=stepper_y CURRENT={HOME_CUR}
    G28 Y F100
    G1 X2 F1000
    G1 Y2 F1000
    G28 Z F100
    {% endif %}
    {% endif %}
    {% endif %}    
    SET_TMC_CURRENT STEPPER=stepper_x CURRENT={RUN_CUR}
    SET_TMC_CURRENT STEPPER=stepper_y CURRENT={RUN_CUR}
    SET_VELOCITY_LIMIT ACCEL=5000
    G90
    BED_MESH_PROFILE LOAD=default

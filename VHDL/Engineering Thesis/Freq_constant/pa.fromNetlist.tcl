
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name Freq_constant -dir "C:/Users/Elsik/Desktop/DYPLOM/Freq_constant/planAhead_run_2" -part xc3s500efg320-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/Elsik/Desktop/DYPLOM/Freq_constant/instrument.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/Elsik/Desktop/DYPLOM/Freq_constant} }
set_param project.pinAheadLayout  yes
set_param project.paUcfFile  "instrument.ucf"
add_files "instrument.ucf" -fileset [get_property constrset [current_run]]
open_netlist_design

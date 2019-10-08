
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name faceAR -dir "C:/Users/Ying Yu/Desktop/Mojo_v3/faceAR/planAhead_run_1" -part xc6slx9tqg144-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/Ying Yu/Desktop/Mojo_v3/faceAR/dvi_demo.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/Ying Yu/Desktop/Mojo_v3/faceAR} {ipcore_dir} }
add_files [list {ipcore_dir/ddsc.ncf}] -fileset [get_property constrset [current_run]]
set_property target_constrs_file "dvi_demo.ucf" [current_fileset -constrset]
add_files [list {dvi_demo.ucf}] -fileset [get_property constrset [current_run]]
link_design

# Begin_DVE_Session_Save_Info
# DVE full session
# Saved on Sat Dec 9 16:05:15 2017
# Designs open: 1
#   V1: /home/warehouse/c.ricciardi/GitHub/ESE488_FinalProject/top/top.vcd
# Toplevel windows open: 1
# 	TopLevel.1
#   Source.1: 
#   Group count = 6
#   Group MUX signal count = 13
#   Group SIGMOID1_9 signal count = 14
#   Group MAC0 signal count = 15
# End_DVE_Session_Save_Info

# DVE version: J-2014.12-SP1-1
# DVE build date: Apr 23 2015 20:58:03


#<Session mode="Full" path="/home/warehouse/c.ricciardi/GitHub/ESE488_FinalProject/top/DVEfiles/session.tcl" type="Debug">

gui_set_loading_session_type Post
gui_continuetime_set

# Close design
if { [gui_sim_state -check active] } {
    gui_sim_terminate
}
gui_close_db -all
gui_expr_clear_all

# Close all windows
gui_close_window -type Console
gui_close_window -type Wave
gui_close_window -type Source
gui_close_window -type Schematic
gui_close_window -type Data
gui_close_window -type DriverLoad
gui_close_window -type List
gui_close_window -type Memory
gui_close_window -type HSPane
gui_close_window -type DLPane
gui_close_window -type Assertion
gui_close_window -type CovHier
gui_close_window -type CoverageTable
gui_close_window -type CoverageMap
gui_close_window -type CovDetail
gui_close_window -type Local
gui_close_window -type Stack
gui_close_window -type Watch
gui_close_window -type Group
gui_close_window -type Transaction



# Application preferences
gui_set_pref_value -key app_default_font -value {Helvetica,10,-1,5,50,0,0,0,0,0}
gui_src_preferences -tabstop 8 -maxbits 24 -windownumber 1
#<WindowLayout>

# DVE top-level session


# Create and position top-level window: TopLevel.1

if {![gui_exist_window -window TopLevel.1]} {
    set TopLevel.1 [ gui_create_window -type TopLevel \
       -icon $::env(DVE)/auxx/gui/images/toolbars/dvewin.xpm] 
} else { 
    set TopLevel.1 TopLevel.1
}
gui_show_window -window ${TopLevel.1} -show_state normal -rect {{86 239} {1017 812}}

# ToolBar settings
gui_set_toolbar_attributes -toolbar {TimeOperations} -dock_state top
gui_set_toolbar_attributes -toolbar {TimeOperations} -offset 0
gui_show_toolbar -toolbar {TimeOperations}
gui_hide_toolbar -toolbar {&File}
gui_set_toolbar_attributes -toolbar {&Edit} -dock_state top
gui_set_toolbar_attributes -toolbar {&Edit} -offset 0
gui_show_toolbar -toolbar {&Edit}
gui_hide_toolbar -toolbar {CopyPaste}
gui_set_toolbar_attributes -toolbar {&Trace} -dock_state top
gui_set_toolbar_attributes -toolbar {&Trace} -offset 0
gui_show_toolbar -toolbar {&Trace}
gui_hide_toolbar -toolbar {TraceInstance}
gui_hide_toolbar -toolbar {BackTrace}
gui_set_toolbar_attributes -toolbar {&Scope} -dock_state top
gui_set_toolbar_attributes -toolbar {&Scope} -offset 0
gui_show_toolbar -toolbar {&Scope}
gui_set_toolbar_attributes -toolbar {&Window} -dock_state top
gui_set_toolbar_attributes -toolbar {&Window} -offset 0
gui_show_toolbar -toolbar {&Window}
gui_set_toolbar_attributes -toolbar {Signal} -dock_state top
gui_set_toolbar_attributes -toolbar {Signal} -offset 0
gui_show_toolbar -toolbar {Signal}
gui_set_toolbar_attributes -toolbar {Zoom} -dock_state top
gui_set_toolbar_attributes -toolbar {Zoom} -offset 0
gui_show_toolbar -toolbar {Zoom}
gui_set_toolbar_attributes -toolbar {Zoom And Pan History} -dock_state top
gui_set_toolbar_attributes -toolbar {Zoom And Pan History} -offset 0
gui_show_toolbar -toolbar {Zoom And Pan History}
gui_set_toolbar_attributes -toolbar {Grid} -dock_state top
gui_set_toolbar_attributes -toolbar {Grid} -offset 0
gui_show_toolbar -toolbar {Grid}
gui_hide_toolbar -toolbar {Simulator}
gui_hide_toolbar -toolbar {Interactive Rewind}
gui_hide_toolbar -toolbar {Testbench}

# End ToolBar settings

# Docked window settings
set HSPane.1 [gui_create_window -type HSPane -parent ${TopLevel.1} -dock_state left -dock_on_new_line true -dock_extent 207]
catch { set Hier.1 [gui_share_window -id ${HSPane.1} -type Hier] }
gui_set_window_pref_key -window ${HSPane.1} -key dock_width -value_type integer -value 207
gui_set_window_pref_key -window ${HSPane.1} -key dock_height -value_type integer -value -1
gui_set_window_pref_key -window ${HSPane.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${HSPane.1} {{left 0} {top 0} {width 206} {height 369} {dock_state left} {dock_on_new_line true} {child_hier_colhier 166} {child_hier_coltype 100} {child_hier_colpd 0} {child_hier_col1 0} {child_hier_col2 1} {child_hier_col3 -1}}
set DLPane.1 [gui_create_window -type DLPane -parent ${TopLevel.1} -dock_state left -dock_on_new_line true -dock_extent 110]
catch { set Data.1 [gui_share_window -id ${DLPane.1} -type Data] }
gui_set_window_pref_key -window ${DLPane.1} -key dock_width -value_type integer -value 110
gui_set_window_pref_key -window ${DLPane.1} -key dock_height -value_type integer -value 370
gui_set_window_pref_key -window ${DLPane.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${DLPane.1} {{left 0} {top 0} {width 109} {height 369} {dock_state left} {dock_on_new_line true} {child_data_colvariable 140} {child_data_colvalue 100} {child_data_coltype 40} {child_data_col1 0} {child_data_col2 1} {child_data_col3 2}}
set Console.1 [gui_create_window -type Console -parent ${TopLevel.1} -dock_state bottom -dock_on_new_line true -dock_extent 105]
gui_set_window_pref_key -window ${Console.1} -key dock_width -value_type integer -value 932
gui_set_window_pref_key -window ${Console.1} -key dock_height -value_type integer -value 105
gui_set_window_pref_key -window ${Console.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${Console.1} {{left 0} {top 0} {width 931} {height 105} {dock_state bottom} {dock_on_new_line true}}
#### Start - Readjusting docked view's offset / size
set dockAreaList { top left right bottom }
foreach dockArea $dockAreaList {
  set viewList [gui_ekki_get_window_ids -active_parent -dock_area $dockArea]
  foreach view $viewList {
      if {[lsearch -exact [gui_get_window_pref_keys -window $view] dock_width] != -1} {
        set dockWidth [gui_get_window_pref_value -window $view -key dock_width]
        set dockHeight [gui_get_window_pref_value -window $view -key dock_height]
        set offset [gui_get_window_pref_value -window $view -key dock_offset]
        if { [string equal "top" $dockArea] || [string equal "bottom" $dockArea]} {
          gui_set_window_attributes -window $view -dock_offset $offset -width $dockWidth
        } else {
          gui_set_window_attributes -window $view -dock_offset $offset -height $dockHeight
        }
      }
  }
}
#### End - Readjusting docked view's offset / size
gui_sync_global -id ${TopLevel.1} -option true

# MDI window settings
set Source.1 [gui_create_window -type {Source}  -parent ${TopLevel.1}]
gui_show_window -window ${Source.1} -show_state normal -rect {{0 0} {606 319}}
gui_update_layout -id ${Source.1} {{left 0} {top 0} {width 611} {height 344} {show_state normal} {dock_state undocked} {dock_on_new_line false}}

# End MDI window settings

gui_set_env TOPLEVELS::TARGET_FRAME(Source) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(Schematic) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(PathSchematic) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(Wave) none
gui_set_env TOPLEVELS::TARGET_FRAME(List) none
gui_set_env TOPLEVELS::TARGET_FRAME(Memory) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(DriverLoad) none
gui_update_statusbar_target_frame ${TopLevel.1}

#</WindowLayout>

#<Database>

# DVE Open design session: 

if { ![gui_is_db_opened -db {/home/warehouse/c.ricciardi/GitHub/ESE488_FinalProject/top/top.vcd.vpd}] } {
	gui_open_db -design V1 -file /home/warehouse/c.ricciardi/GitHub/ESE488_FinalProject/top/top.vcd.vpd -nosource
}
gui_set_precision 1ps
gui_set_time_units 1ps
#</Database>

# DVE Global setting session: 


# Global: Bus

# Global: Expressions

# Global: Signal Time Shift

# Global: Signal Compare

# Global: Signal Groups
gui_load_child_values {top_tb.DUT.MUX}
gui_load_child_values {top_tb.DUT.SIGMOID1_0}
gui_load_child_values {top_tb.DUT.SIGMOID1_9}
gui_load_child_values {top_tb.DUT.MAC0}


set _session_group_1 MUX
gui_sg_create "$_session_group_1"
set MUX "$_session_group_1"

gui_sg_addsignal -group "$_session_group_1" { top_tb.DUT.MUX.sel top_tb.DUT.MUX.mux_in_0 top_tb.DUT.MUX.mux_in_1 top_tb.DUT.MUX.mux_in_2 top_tb.DUT.MUX.mux_in_3 top_tb.DUT.MUX.mux_in_4 top_tb.DUT.MUX.mux_in_5 top_tb.DUT.MUX.mux_in_6 top_tb.DUT.MUX.mux_in_7 top_tb.DUT.MUX.mux_in_8 top_tb.DUT.MUX.mux_in_9 top_tb.DUT.MUX.mux_out }

set _session_group_2 $_session_group_1|
append _session_group_2 SIGMOID1_0
gui_sg_create "$_session_group_2"
set MUX|SIGMOID1_0 "$_session_group_2"

gui_sg_addsignal -group "$_session_group_2" { top_tb.DUT.SIGMOID1_0.clk top_tb.DUT.SIGMOID1_0.reset top_tb.DUT.SIGMOID1_0.done top_tb.DUT.SIGMOID1_0.address top_tb.DUT.SIGMOID1_0.we top_tb.DUT.SIGMOID1_0.d top_tb.DUT.SIGMOID1_0.sig_in top_tb.DUT.SIGMOID1_0.sig_out top_tb.DUT.SIGMOID1_0.y top_tb.DUT.SIGMOID1_0.sig_rdy top_tb.DUT.SIGMOID1_0.i }
gui_set_radix -radix {decimal} -signals {V1:top_tb.DUT.SIGMOID1_0.i}
gui_set_radix -radix {twosComplement} -signals {V1:top_tb.DUT.SIGMOID1_0.i}

set _session_group_3 SIGMOID1_9
gui_sg_create "$_session_group_3"
set SIGMOID1_9 "$_session_group_3"

gui_sg_addsignal -group "$_session_group_3" { top_tb.DUT.SIGMOID1_9.clk top_tb.DUT.SIGMOID1_9.reset top_tb.DUT.SIGMOID1_9.done top_tb.DUT.SIGMOID1_9.address top_tb.DUT.SIGMOID1_9.we top_tb.DUT.SIGMOID1_9.d top_tb.DUT.SIGMOID1_9.sig_in top_tb.DUT.SIGMOID1_9.sig_out top_tb.DUT.SIGMOID1_9.sig_ready top_tb.DUT.SIGMOID1_9.y top_tb.DUT.SIGMOID1_9.sig_rdy top_tb.DUT.SIGMOID1_9.i }
gui_set_radix -radix {decimal} -signals {V1:top_tb.DUT.SIGMOID1_9.i}
gui_set_radix -radix {twosComplement} -signals {V1:top_tb.DUT.SIGMOID1_9.i}

set _session_group_4 $_session_group_3|
append _session_group_4 MAC0_1
gui_sg_create "$_session_group_4"
set SIGMOID1_9|MAC0_1 "$_session_group_4"

gui_sg_addsignal -group "$_session_group_4" { top_tb.DUT.MAC0.mac_out top_tb.DUT.MAC0.weight top_tb.DUT.MAC0.reset top_tb.DUT.MAC0.stage1 top_tb.DUT.MAC0.stage2 top_tb.DUT.MAC0.stage3 top_tb.DUT.MAC0.stage4 top_tb.DUT.MAC0.stage5 top_tb.DUT.MAC0.stage6 top_tb.DUT.MAC0.mult_out top_tb.DUT.MAC0.psum top_tb.DUT.MAC0.clk top_tb.DUT.MAC0.done top_tb.DUT.MAC0.start top_tb.DUT.MAC0.mac_in }

set _session_group_5 $_session_group_3|
append _session_group_5 MAC0
gui_sg_create "$_session_group_5"
set SIGMOID1_9|MAC0 "$_session_group_5"

gui_sg_addsignal -group "$_session_group_5" { top_tb.DUT.MAC0.clk top_tb.DUT.MAC0.reset top_tb.DUT.MAC0.start top_tb.DUT.MAC0.done top_tb.DUT.MAC0.mac_in top_tb.DUT.MAC0.weight top_tb.DUT.MAC0.mac_out top_tb.DUT.MAC0.psum top_tb.DUT.MAC0.mult_out top_tb.DUT.MAC0.stage1 top_tb.DUT.MAC0.stage2 top_tb.DUT.MAC0.stage3 top_tb.DUT.MAC0.stage4 top_tb.DUT.MAC0.stage5 top_tb.DUT.MAC0.stage6 }

gui_sg_move "$_session_group_5" -after "$_session_group_3" -pos 1 

set _session_group_6 MAC0
gui_sg_create "$_session_group_6"
set MAC0 "$_session_group_6"

gui_sg_addsignal -group "$_session_group_6" { top_tb.DUT.MAC0.mac_out top_tb.DUT.MAC0.weight top_tb.DUT.MAC0.reset top_tb.DUT.MAC0.stage1 top_tb.DUT.MAC0.stage2 top_tb.DUT.MAC0.stage3 top_tb.DUT.MAC0.stage4 top_tb.DUT.MAC0.stage5 top_tb.DUT.MAC0.stage6 top_tb.DUT.MAC0.mult_out top_tb.DUT.MAC0.psum top_tb.DUT.MAC0.clk top_tb.DUT.MAC0.done top_tb.DUT.MAC0.start top_tb.DUT.MAC0.mac_in }

# Global: Highlighting

# Global: Stack
gui_change_stack_mode -mode list

# Post database loading setting...

# Restore C1 time
gui_set_time -C1_only 16024317



# Save global setting...

# Wave/List view global setting
gui_cov_show_value -switch false

# Close all empty TopLevel windows
foreach __top [gui_ekki_get_window_ids -type TopLevel] {
    if { [llength [gui_ekki_get_window_ids -parent $__top]] == 0} {
        gui_close_window -window $__top
    }
}
gui_set_loading_session_type noSession
# DVE View/pane content session: 


# Hier 'Hier.1'
gui_show_window -window ${Hier.1}
gui_list_set_filter -id ${Hier.1} -list { {Package 1} {All 0} {Process 1} {VirtPowSwitch 0} {UnnamedProcess 1} {UDP 0} {Function 1} {Block 1} {SrsnAndSpaCell 0} {OVA Unit 1} {LeafScCell 1} {LeafVlgCell 1} {Interface 1} {LeafVhdCell 1} {$unit 1} {NamedBlock 1} {Task 1} {VlgPackage 1} {ClassDef 1} {VirtIsoCell 0} }
gui_list_set_filter -id ${Hier.1} -text {*}
gui_hier_list_init -id ${Hier.1}
gui_change_design -id ${Hier.1} -design V1
catch {gui_list_expand -id ${Hier.1} top_tb}
catch {gui_list_expand -id ${Hier.1} top_tb.DUT}
catch {gui_list_select -id ${Hier.1} {top_tb.DUT.MAC0}}
gui_view_scroll -id ${Hier.1} -vertical -set 441
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Data 'Data.1'
gui_list_set_filter -id ${Data.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {LowPower 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Data.1} -text {*}
gui_list_show_data -id ${Data.1} {top_tb.DUT.MAC0}
gui_view_scroll -id ${Data.1} -vertical -set 0
gui_view_scroll -id ${Data.1} -horizontal -set 0
gui_view_scroll -id ${Hier.1} -vertical -set 441
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Source 'Source.1'
gui_src_value_annotate -id ${Source.1} -switch false
gui_set_env TOGGLE::VALUEANNOTATE 0
gui_view_scroll -id ${Source.1} -vertical -set 0
gui_src_set_reusable -id ${Source.1}
# Restore toplevel window zorder
# The toplevel window could be closed if it has no view/pane
if {[gui_exist_window -window ${TopLevel.1}]} {
	gui_set_active_window -window ${TopLevel.1}
	gui_set_active_window -window ${Source.1}
	gui_set_active_window -window ${HSPane.1}
}
#</Session>


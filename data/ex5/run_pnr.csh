#! /bin/csh -f 

## project=   dragonx              strategy=  perseus_default     
## design=    j2k_t1_wbuf_wrap_core strategy=  user_dt_r1s1d1p1_0613
## library=   dragonx              strategy=  perseus_default_12T 
## flow=      undefined            strategy=  undefined           
## tool=      undefined            strategy=  undefined           
## tech=      undefined            strategy=  undefined           
setenv PERSEUS_HOME /tools/perseus
source /asic/proj/uniquify/perseus/rel/modules/tcl/init/tcsh
source /tools/uge/gridengine/unq/common/settings.csh
setenv RECIPIENT "`whoami`@uniquify.com"

cd /asic/proj/red/dragonx/build/silver001/j2k_t1_wbuf_wrap_core/user_dt_r1s1d1p1_0613/icc_pnr
\rm -rf log/run.log
echo submitting t131078_J1_ICC_FLOORPLAN_j2k_t1_wbuf_wrap_core_user_dt_r1s1d1p1_0613
setenv t131078_J1_ICC_FLOORPLAN_j2k_t1_wbuf_wrap_core_user_dt_r1s1d1p1_0613 `${PERSEUS_HOME}/src/perl/script/psub.pl -V -terse -cwd -q dragonx \
                        -l m_mem_free=20G \
                        -o ./gridout \
                        -e ./griderr \
                        -m bes -M $RECIPIENT \
                        -N t131078_J1_ICC_FLOORPLAN_j2k_t1_wbuf_wrap_core_user_dt_r1s1d1p1_0613 \
                        -b y \
       source /asic/proj/uniquify/perseus/rel/modules/tcl/init/tcsh \&\& \
       module load synopsys/synopsys \&\& \
       \"/tools/synopsys/icc_vI-2013.12-SP2_/bin/icc_shell -64bit -f ./script/floorplan.tcl \| tee -i log/floorplan.log\"`

echo submitting t131079_J2_ICC_PLACE_j2k_t1_wbuf_wrap_core_user_dt_r1s1d1p1_0613
setenv t131079_J2_ICC_PLACE_j2k_t1_wbuf_wrap_core_user_dt_r1s1d1p1_0613 `${PERSEUS_HOME}/src/perl/script/psub.pl -V -terse -cwd -q dragonx \
                        -l m_mem_free=20G \
                        -hold_jid $t131078_J1_ICC_FLOORPLAN_j2k_t1_wbuf_wrap_core_user_dt_r1s1d1p1_0613 \
                        -o ./gridout \
                        -e ./griderr \
                        -m bes -M $RECIPIENT \
                        -N t131079_J2_ICC_PLACE_j2k_t1_wbuf_wrap_core_user_dt_r1s1d1p1_0613 \
                        -b y \
       source /asic/proj/uniquify/perseus/rel/modules/tcl/init/tcsh \&\& \
       module load synopsys/synopsys \&\& \
       \"/tools/synopsys/icc_vI-2013.12-SP2_/bin/icc_shell -64bit -f ./script/place.tcl \| tee -i log/place.log\"`

echo submitting t131080_J3_ICC_CTS_CCD_j2k_t1_wbuf_wrap_core_user_dt_r1s1d1p1_0613
setenv t131080_J3_ICC_CTS_CCD_j2k_t1_wbuf_wrap_core_user_dt_r1s1d1p1_0613 `${PERSEUS_HOME}/src/perl/script/psub.pl -V -terse -cwd -q dragonx \
                        -l m_mem_free=20G \
                        -hold_jid $t131079_J2_ICC_PLACE_j2k_t1_wbuf_wrap_core_user_dt_r1s1d1p1_0613 \
                        -o ./gridout \
                        -e ./griderr \
                        -m bes -M $RECIPIENT \
                        -N t131080_J3_ICC_CTS_CCD_j2k_t1_wbuf_wrap_core_user_dt_r1s1d1p1_0613 \
                        -b y \
       source /asic/proj/uniquify/perseus/rel/modules/tcl/init/tcsh \&\& \
       module load synopsys/synopsys \&\& \
       \"/tools/synopsys/icc_vI-2013.12-SP2_/bin/icc_shell -64bit -f ./script/cts_ccd.tcl \| tee -i log/cts_ccd.log\"`

echo submitting t131081_J4_ICC_CTS_RT_j2k_t1_wbuf_wrap_core_user_dt_r1s1d1p1_0613
setenv t131081_J4_ICC_CTS_RT_j2k_t1_wbuf_wrap_core_user_dt_r1s1d1p1_0613 `${PERSEUS_HOME}/src/perl/script/psub.pl -V -terse -cwd -q dragonx \
                        -l m_mem_free=20G \
                        -hold_jid $t131080_J3_ICC_CTS_CCD_j2k_t1_wbuf_wrap_core_user_dt_r1s1d1p1_0613 \
                        -o ./gridout \
                        -e ./griderr \
                        -m bes -M $RECIPIENT \
                        -N t131081_J4_ICC_CTS_RT_j2k_t1_wbuf_wrap_core_user_dt_r1s1d1p1_0613 \
                        -b y \
       source /asic/proj/uniquify/perseus/rel/modules/tcl/init/tcsh \&\& \
       module load synopsys/synopsys \&\& \
       \"/tools/synopsys/icc_vI-2013.12-SP2_/bin/icc_shell -64bit -f ./script/cts_rt.tcl \| tee -i log/cts_rt.log\"`

echo submitting t131082_J5_ICC_ROUTE_j2k_t1_wbuf_wrap_core_user_dt_r1s1d1p1_0613
setenv t131082_J5_ICC_ROUTE_j2k_t1_wbuf_wrap_core_user_dt_r1s1d1p1_0613 `${PERSEUS_HOME}/src/perl/script/psub.pl -V -terse -cwd -q dragonx \
                        -l m_mem_free=20G \
                        -hold_jid $t131081_J4_ICC_CTS_RT_j2k_t1_wbuf_wrap_core_user_dt_r1s1d1p1_0613 \
                        -o ./gridout \
                        -e ./griderr \
                        -m bes -M $RECIPIENT \
                        -N t131082_J5_ICC_ROUTE_j2k_t1_wbuf_wrap_core_user_dt_r1s1d1p1_0613 \
                        -b y \
       source /asic/proj/uniquify/perseus/rel/modules/tcl/init/tcsh \&\& \
       module load synopsys/synopsys \&\& \
       \"/tools/synopsys/icc_vI-2013.12-SP2_/bin/icc_shell -64bit -f ./script/route.tcl \| tee -i log/route.log\"`

echo submitting t131083_J6_ICC_ROUTE_OPT_j2k_t1_wbuf_wrap_core_user_dt_r1s1d1p1_0613
setenv t131083_J6_ICC_ROUTE_OPT_j2k_t1_wbuf_wrap_core_user_dt_r1s1d1p1_0613 `${PERSEUS_HOME}/src/perl/script/psub.pl -V -terse -cwd -q dragonx \
                        -l m_mem_free=20G \
                        -hold_jid $t131082_J5_ICC_ROUTE_j2k_t1_wbuf_wrap_core_user_dt_r1s1d1p1_0613 \
                        -o ./gridout \
                        -e ./griderr \
                        -m bes -M $RECIPIENT \
                        -N t131083_J6_ICC_ROUTE_OPT_j2k_t1_wbuf_wrap_core_user_dt_r1s1d1p1_0613 \
                        -b y \
       source /asic/proj/uniquify/perseus/rel/modules/tcl/init/tcsh \&\& \
       module load synopsys/synopsys \&\& \
       \"/tools/synopsys/icc_vI-2013.12-SP2_/bin/icc_shell -64bit -f ./script/route_opt.tcl \| tee -i log/route_opt.log\"`

echo submitting t131084_J7_ICC_CHIP_FINISH_j2k_t1_wbuf_wrap_core_user_dt_r1s1d1p1_0613
setenv t131084_J7_ICC_CHIP_FINISH_j2k_t1_wbuf_wrap_core_user_dt_r1s1d1p1_0613 `${PERSEUS_HOME}/src/perl/script/psub.pl -V -terse -cwd -q dragonx \
                        -l m_mem_free=20G \
                        -hold_jid $t131083_J6_ICC_ROUTE_OPT_j2k_t1_wbuf_wrap_core_user_dt_r1s1d1p1_0613 \
                        -o ./gridout \
                        -e ./griderr \
                        -m bes -M $RECIPIENT \
                        -N t131084_J7_ICC_CHIP_FINISH_j2k_t1_wbuf_wrap_core_user_dt_r1s1d1p1_0613 \
                        -b y \
       source /asic/proj/uniquify/perseus/rel/modules/tcl/init/tcsh \&\& \
       module load synopsys/synopsys \&\& \
       \"/tools/synopsys/icc_vI-2013.12-SP2_/bin/icc_shell -64bit -f ./script/chip_finish.tcl \| tee -i log/chip_finish.log\"`

echo submitting t131085_J8_ICC_METAL_FILL_j2k_t1_wbuf_wrap_core_user_dt_r1s1d1p1_0613
setenv t131085_J8_ICC_METAL_FILL_j2k_t1_wbuf_wrap_core_user_dt_r1s1d1p1_0613 `${PERSEUS_HOME}/src/perl/script/psub.pl -V -terse -cwd -q dragonx \
                        -l m_mem_free=20G \
                        -hold_jid $t131084_J7_ICC_CHIP_FINISH_j2k_t1_wbuf_wrap_core_user_dt_r1s1d1p1_0613 \
                        -o ./gridout \
                        -e ./griderr \
                        -m bes -M $RECIPIENT \
                        -N t131085_J8_ICC_METAL_FILL_j2k_t1_wbuf_wrap_core_user_dt_r1s1d1p1_0613 \
                        -b y \
       source /asic/proj/uniquify/perseus/rel/modules/tcl/init/tcsh \&\& \
       module load synopsys/synopsys \&\& \
       \"/tools/synopsys/icc_vI-2013.12-SP2_/bin/icc_shell -64bit -f ./script/metal_fill.tcl \| tee -i log/metal_fill.log\"`

echo submitting t131086_J9_ICC_EXPORT_j2k_t1_wbuf_wrap_core_user_dt_r1s1d1p1_0613
setenv t131086_J9_ICC_EXPORT_j2k_t1_wbuf_wrap_core_user_dt_r1s1d1p1_0613 `${PERSEUS_HOME}/src/perl/script/psub.pl -V -terse -cwd -q dragonx \
                        -l m_mem_free=20G \
                        -hold_jid $t131085_J8_ICC_METAL_FILL_j2k_t1_wbuf_wrap_core_user_dt_r1s1d1p1_0613 \
                        -o ./gridout \
                        -e ./griderr \
                        -m bes -M $RECIPIENT \
                        -N t131086_J9_ICC_EXPORT_j2k_t1_wbuf_wrap_core_user_dt_r1s1d1p1_0613 \
                        -b y \
       source /asic/proj/uniquify/perseus/rel/modules/tcl/init/tcsh \&\& \
       module load synopsys/synopsys \&\& \
       \"/tools/synopsys/icc_vI-2013.12-SP2_/bin/icc_shell -64bit -f ./script/export.tcl \| tee -i log/export.log\"`


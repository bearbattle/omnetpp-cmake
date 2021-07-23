require_envvar(EXPECTED_OMNETPP_ROOT)
expect_file(${TEST_SUITE_BINARY_DIR}/run.sh)

file(STRINGS ${TEST_SUITE_BINARY_DIR}/run.sh run_script LIMIT_COUNT 10)
list(GET run_script 0 run_script_shebang)
expect_strequal("#!/bin/bash" run_script_shebang)
list(GET run_script 1 run_script_opp_runall)
expect_strequal("OPP_RUNALL=$ENV{EXPECTED_OMNETPP_ROOT}/bin/opp_runall" run_script_opp_runall)
list(GET run_script 2 run_script_opp_run)
expect_strequal("OPP_RUN=$ENV{EXPECTED_OMNETPP_ROOT}/bin/opp_run" run_script_opp_run)
list(GET run_script 3 run_script_ned_folders)
expect_strequal("NED_FOLDERS=\"/foo/ned1:/foo/ned2:/bar/ned\"" run_script_ned_folders)
list(GET run_script 4 run_script_libraries)
expect_strequal("LIBRARIES=\"-l${TEST_SUITE_BINARY_DIR}/libbar.so\"" run_script_libraries)

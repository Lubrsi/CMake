include(RunCMake)

function(run_transform_depfile name)
  set(RunCMake-check-file gccdepfile.cmake)
  run_cmake_command(${name}-gcc
    ${CMAKE_COMMAND} -E cmake_transform_depfile gccdepfile ../ ${CMAKE_CURRENT_LIST_DIR}/${name}.d out.d
    )
  set(RunCMake-check-file vstlog.cmake)
  run_cmake_command(${name}-tlog
    ${CMAKE_COMMAND} -E cmake_transform_depfile vstlog ../ ${CMAKE_CURRENT_LIST_DIR}/${name}.d out.tlog
    )
endfunction()

if(WIN32)
  run_transform_depfile(deps-windows)
else()
  run_transform_depfile(deps-unix)
endif()
run_transform_depfile(noexist)
run_transform_depfile(empty)
run_transform_depfile(invalid)

set(CMAKE_SYSTEM_NAME Windows)
set(CMAKE_SYSTEM_PROCESSOR AMD64)

# The xwin SDK root (https://github.com/Jake-Shadle/xwin): $XWIN_ROOT, else ~/.xwin.
if(DEFINED ENV{XWIN_ROOT})
    set(XWIN_ROOT "$ENV{XWIN_ROOT}")
else()
    set(XWIN_ROOT "$ENV{HOME}/.xwin")
endif()

set(CMAKE_C_COMPILER clang-cl)
set(CMAKE_CXX_COMPILER clang-cl)
set(CMAKE_RC_COMPILER llvm-rc)
set(CMAKE_LINKER lld-link)
set(CMAKE_AR llvm-lib)

set(XWIN_FLAGS
    "-m64"
    "--target=x86_64-pc-windows-msvc"
    "-fuse-ld=lld-link"
    "-Wno-unused-command-line-argument"
    "-Wno-unknown-pragmas"
    "-Wno-missing-field-initializers"
    "-Wno-unused-function"
    "-Wno-unused-variable"
    "-Wno-unused-but-set-variable"
    "-Wno-deprecated-declarations"
    "-Wno-microsoft-include"
    "-Wno-microsoft-cast"
    "-Wno-invalid-token-paste"
    "/imsvc${XWIN_ROOT}/crt/include"
    "/imsvc${XWIN_ROOT}/sdk/include/ucrt"
    "/imsvc${XWIN_ROOT}/sdk/include/um"
    "/imsvc${XWIN_ROOT}/sdk/include/shared"
    "/imsvc${XWIN_ROOT}/sdk/include/winrt"
    "/imsvc${XWIN_ROOT}/sdk/include/cppwinrt"
)
string(REPLACE ";" " " XWIN_FLAGS_STR "${XWIN_FLAGS}")

set(CMAKE_C_FLAGS_INIT "${XWIN_FLAGS_STR}")
set(CMAKE_CXX_FLAGS_INIT "${XWIN_FLAGS_STR}")

set(XWIN_RC_FLAGS
    "-I${XWIN_ROOT}/sdk/include/um"
    "-I${XWIN_ROOT}/sdk/include/shared"
    "-I${XWIN_ROOT}/sdk/include/ucrt"
    "-I${XWIN_ROOT}/crt/include"
)
string(REPLACE ";" " " XWIN_RC_FLAGS_STR "${XWIN_RC_FLAGS}")
set(CMAKE_RC_FLAGS_INIT "${XWIN_RC_FLAGS_STR}")

set(XWIN_LINK_FLAGS
    "/libpath:${XWIN_ROOT}/crt/lib/x86_64"
    "/libpath:${XWIN_ROOT}/sdk/lib/um/x86_64"
    "/libpath:${XWIN_ROOT}/sdk/lib/ucrt/x86_64"
)
string(REPLACE ";" " " XWIN_LINK_FLAGS_STR "${XWIN_LINK_FLAGS}")

set(CMAKE_EXE_LINKER_FLAGS_INIT "${XWIN_LINK_FLAGS_STR}")
set(CMAKE_SHARED_LINKER_FLAGS_INIT "${XWIN_LINK_FLAGS_STR}")
set(CMAKE_MODULE_LINKER_FLAGS_INIT "${XWIN_LINK_FLAGS_STR}")

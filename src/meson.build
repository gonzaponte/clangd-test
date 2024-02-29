project( 'helloworld'
       , 'cpp'
       , version : 'v0.0.0'
       , default_options : [ 'buildtype=debugoptimized'
                           , 'debug=true'
                           , 'optimization=2'
                           , 'cpp_std=c++20'
                           , 'prefix=@0@/../install/helloworld/'.format(meson.source_root())
                           , 'libdir=lib' # removes architecture from path
                           ]
       )

crystal_exe = executable( 'helloworld'
                        , ['main.cc']
                        , install : true
                        )

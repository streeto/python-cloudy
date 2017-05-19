# python-cloudy
Python bindings for the [cloudy](http://www.nublado.org/) nebular modelling code.

It is recommended to read the cloudy documentation, especially Hazy Volume 2, chapter 8.

This is a simple proof of concept for calling cloudy routines from python.
There's a SWIG interface, but it seems broken. I also prefer Cython, so let's do this.

First download cloudy 17 and uncompress it. Don't compile it the usual way! instead, go
to an alternative build directory: ``sys_gcc_shared``. From there, build the shared
library.

```
cd <path-to-cloudy>/source/sys_gcc_shared
make libcloudy.so
```

The shared library will be in the ``sys_gcc_shared`` directory. Keep that in mind.

Now, one can compile the cython code. This is the tricky part, because cloudy is not
installed in the system directories (the default includes and libraries locations).
I managed to specify these paths by hand to the setup script, but not in a portable
way. I only tested in my Mac using Python 3.6 from Homebrew.

Also, I had to edit ``source/cddrive.h`` to include another header. There's probably
a way to avoid this, but it has to be this way for now. Just add this line at the beginning,
after the first ``#define``:

```
#define CDDRIVE_H_
#include "cddefines.h"
```

OK, building the cython extension:

```
cd python-couldy
CC=/usr/bin/g++ CFLAGS="-I<path-to-cloudy>/source/ -I<path-to-cloudy>/source/sys_gcc_shared/ \
    -L<path-to-cloudy>/source/sys_gcc_shared" python3 setup.py build_ext --inplace
```

It should compile correctly. Now we hit another problem, the library ``libcloudy.so`` is not
in the system library path. One must add its location to the list of library paths. In bash,
for a Mac computer,

```
export DYLD_LIBRARY_PATH=${DYLD_LIBRARY_PATH}:<path-to-cloudy>/source/sys_gcc_shared/
```

The test can be done in an IPython console.

```
In [1]: from cloudy.cloudy import test

In [2]: test()

                               This is a beta release of Cloudy, and is intended for testing only.
Please help make Cloudy better by posing problems or suggestions on http://tech.groups.yahoo.com/group/cloudy_simulations/.

                                                Cloudy 17.00 beta 1 (prerelease)
                                                         www.nublado.org

                       **************************************17Jan01**************************************
                       *                                                                                 *
                       * test                                                                            *
                       *                                                                                 *
                       ***********************************************************************************

```

Now, the input and output must be implemented, see the ``cloudy/cloudy_lib.pxd`` and ``cloudy/cloudy.pyx``
files to have an idea.




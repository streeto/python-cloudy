from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize

ext_modules=[
    Extension('cloudy.cloudy',
              sources=['cloudy/cloudy.pyx'],
              libraries=['cloudy'],
              language='c++',
    )
]

setup(
    name = 'cloudy',
    ext_modules = cythonize(ext_modules)
)

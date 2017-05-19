#
# Import the cloudy library functions, defined in cloudy_lib.pxd
# Note the "cimport" instead of "import".
#

from .cloudy_lib cimport cdInit, cdTalk, cdRead, cdDrive


def test():
	cdInit()
	cdTalk(True)
	cdRead('test')
	return cdDrive()


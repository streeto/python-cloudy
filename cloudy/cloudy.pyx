from .cloudy_lib cimport cdInit, cdTalk, cdRead, cdDrive


def test():
	cdInit()
	cdTalk(True)
	cdRead('test')
	return cdDrive()


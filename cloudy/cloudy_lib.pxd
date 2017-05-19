#
# Here are some functions to be called from cddrive.h, which is the
# main interface to cloudy. The data types are mapped automatically,
# but sometimes a conversion is needed.
#

cdef extern from 'cddrive.h':
    void cdInit()
    void cdTalk(bool)
    int cdRead(const char *)
    int cdDrive()

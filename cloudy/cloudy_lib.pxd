cdef extern from 'cddrive.h':
    void cdInit()
    void cdTalk(bool)
    int cdRead(const char *)
    int cdDrive()

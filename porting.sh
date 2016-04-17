#!/bib/sh

#head file
sed -i "s/<Windows.h>/\"sysdeps.h\"/g" inc/*
sed -i "s/<Windows.h>/\"sysdeps.h\"/g" src/*
sed -i "s/<windows.h>/\"sysdeps.h\"/g" inc/*
sed -i "s/<windows.h>/\"sysdeps.h\"/g" src/*
sed -i "s/\"windows.h\"/\"sysdeps.h\"/g" inc/*
sed -i "s/\"windows.h\"/\"sysdeps.h\"/g" src/*

#data type
sed -i "/typedef unsigned __int64/d" inc/xmlparser.h
sed -i "/typedef unsigned __int64/d" inc/partition.h

sed -i "s/BYTE/unsigned char/g" inc/*
sed -i "s/BYTE/unsigned char/g" src/*
sed -i "s/SECTOR_SIZE_IN_unsigned charS/SECTOR_SIZE_IN_BYTES/g" inc/*
sed -i "s/SECTOR_SIZE_IN_unsigned charS/SECTOR_SIZE_IN_BYTES/g" src/*

sed -i '/int Log(TCHAR \*str,...);/d'  inc/*
sed -i '/void Log(TCHAR \*str,/d'  inc/*
sed -i "s/TCHAR/char/g" inc/*
sed -i "s/TCHAR/char/g" src/*

sed -i "s/DWORDLONG/uint64_t/g" src/*
sed -i "s/DWORD/uint32_t/g" inc/*
sed -i "s/DWORD/uint32_t/g" src/*

sed -i "s/UINT8/uint8_t/g" inc/*
sed -i "s/UINT8/uint8_t/g" src/*
sed -i "s/UINT16/uint16_t/g" inc/*
sed -i "s/UINT16/uint16_t/g" src/*
sed -i "s/UINT32/uint32_t/g" inc/*
sed -i "s/UINT32/uint32_t/g" src/*
sed -i "s/UINT64/uint64_t/g" inc/*
sed -i "s/UINT64/uint64_t/g" src/*

sed -i '/typedef unsigned int64_t uint64;/d'  inc/*
sed -i '/typedef unsigned int64_t uint64;/d'  src/*
sed -i "s/uint64 /uint64_t /g" inc/*
sed -i "s/uint64 /uint64_t /g" src/*
sed -i "s/(uint64)/(uint64_t)/g" src/*
sed -i "s/(uint64)/(uint64_t)/g" inc/*

sed -i "s/__int32/int32_t/g" inc/*
sed -i "s/__int32/int32_t/g" src/*
sed -i "s/__int64/int64_t/g" inc/*
sed -i "s/__int64/int64_t/g" src/*


sed -i "s/__int32/int32_t/g" inc/*
sed -i "s/__int32/int32_t/g" src/*

#error code
sed -i "s/ERROR_SUCCESS/0/g" src/*
sed -i "s/ERROR_SUCCESS/0/g" inc/*
sed -i "s/SAHARA_0/SAHARA_ERROR_SUCCESS/g" inc/sahara.h

sed -i "s/INVALID_HANDLE_VALUE/(-1)/g" src/*
sed -i "s/INVALID_HANDLE_VALUE/(-1)/g" inc/*

sed -i "s/ERROR_INVALID_HANDLE/EINVAL/g" src/*
sed -i "s/ERROR_INVALID_HANDLE/EINVAL/g" inc/*

sed -i "s/ERROR_INVALID_PARAMETER/EINVAL/g" src/*
sed -i "s/ERROR_INVALID_PARAMETER/EINVAL/g" inc/*

sed -i "s/ERROR_HV_INSUFFICIENT_MEMORY/ENOMEM/g" src/*
sed -i "s/ERROR_HV_INSUFFICIENT_MEMORY/ENOMEM/g" inc/*

sed -i "s/ERROR_NOT_READY/EBUSY/g" src/*
sed -i "s/ERROR_NOT_READY/EBUSY/g" inc/*

sed -i "s/ERROR_NOT_FOUND/ENOENT/g" src/*
sed -i "s/ERROR_NOT_FOUND/ENOENT/g" inc/*

sed -i '/ERROR_HANDLE_EOF/d'  inc/*
sed -i '/ERROR_HANDLE_EOF/d'  src/*

sed -i "s/HANDLE /int /g" inc/*
sed -i "s/HANDLE /int /g" src/*

#wide char
sed -i "s/_wfopen_s(&fMprgFile,szFlashPrg,L\"r\");/fMprgFile = fopen(szFlashPrg,\"rb\");/g" src/dload.cpp

sed -i '/tchar.h/d'  src/*
sed -i "s/_char*/char/g" src/emmcdl.cpp
sed -i "s/__cdecl _tmain/main/g" src/emmcdl.cpp
sed -i "s/L\"/\"/g" src/*
sed -i "s/wprintf/printf/g" src/*
sed -i "s/wcscmp/strcmp/g" src/*
sed -i "s/wcscpy_s/strcpy/g" src/*
sed -i "s/wcsncmp/strncmp/g" src/*
sed -i "s/_T(/(/g" src/* 

sed -i "s/_wcsicmp/strcasecmp/g" src/*
sed -i "s/_wcsnicmp/strncasecmp/g" src/*
sed -i "s/_wtoi/atoi/g" src/*
sed -i "s/wcsstr/strstr/g" src/*
sed -i "s/wcsncpy_s/strncpy/g" src/*
sed -i "s/wcsrchr/strrchr/g" src/*
sed -i "s/wcslen/strlen/g" src/*

sed -i "s/max_len,//g" src/*
#sed -i "s/strncpy_s/strncpy/g" src/*

sed -i "s/goto WriteSectorsExit;/return status;/g" src/*
sed -i "s/goto ReadSectorsExit;/return status;/g" src/*
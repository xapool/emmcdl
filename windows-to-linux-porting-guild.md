#### 基本数据类型转换

	HANDLE   --  int
	BYTE     --  unsigned char
	TCHAR    --  char
	DWORD    --  uint32_t
	UINT8    --  uint8_t
	UINT16   --  uint16_t
	UINT32   --  uint32_t
	uint64   --  uint64_t
	__int32  --  int32_t
	__int64  --  int64_t
	OVERLAPPED -- void*

####宏定义和函数替换(多数在sysdeps.h中加钩子)

####错误码替换：

	ERROR_SUCCESS            -- 0
	INVALID_HANDLE_VALUE     -- (-1)
	ERROR_INVALID_HANDLE     -- EINVAL
	ERROR_INVALID_PARAMETER  -- EINVAL
	ERROR_HV_INSUFFICIENT_MEMORY
							 -- ENOMEM
	ERROR_NOT_READY          -- EBUSY
	ERROR_END_OF_MEDIA       -- EINVAL
	ERROR_NOT_FOUND          -- ENOENT
	LPVOID lpMsgBuf(FormatMessage)
							 -- strerror(status)
	GetLastError()           -- errno

####平台相关文件操作和系统调用
          
	HANDEL(NULL)             -- int(0)
	Sleep()                  -- usleep()
	CreateFile()             -- xxx_open()
	ReadFile()				 -- xxx_read()
	SetFilePointer()         -- xxx_lseek()
	CloseHandle()            -- xxx_close()

####宽字符以及安全有关的函数操作
	_tmain                   -- main
	wprintf                  -- printf [参数 %I64d -- %lu]
	_stricmp                 -- strcasecmp
	sprintf_s                -- sprintf
	swprintf_s               -- sprintf
	strcat_s                 -- strcat
	wcscmp                   -- strcmp
	wcsncmp                  -- strncmp
	_wcsicmp                 -- strcasecmp
	wcscpy_s                 -- strcpy
	wcsncpy_s                -- strncpy
	wcsstr                   -- strstr
	wcstombs_s               -- strncpy
	wcslen                   -- strlen
	_wtoi                    -- atoi
	_atoi64                  -- atoll
	_i64tow_s                -- sprintf
	iswdigit                 -- isdigit
	memcpy_s(a,b,c,d)        -- memcpy(a,c,d)
	_wfopen_s(a,b,c)         -- a=fopen(b,c)
	L"string"                -- "string"

####平台相关替换

	1.使用宏定义__WIN32__等将平台相关代码包裹
	2.使用sysdeps.h替换windows.h等平台相关头文件
	3.#define MIN(X,Y) ((X) < (Y) ? (X) : (Y))
	4.windows错误码在<error.h>中，换成对应linux <errno.h>版本
	5."tchar.h"相关的包含放到"sysdeps.h"的平台控制代码中
	6.GetTickCount64() 更换为Linux实现clock_gettime()

####项目相关的特殊移植

	diskwriter.h: 注释掉OVERLAPPED ovl;
	class XMLParser的改变
	部分与平台绑定的非常强的API

####Windows, Unix, ANSIC API对比：
[https://blogs.msdn.microsoft.com/csliu/2009/03/20/windows-unix-and-ansi-c-api-comparison/](https://blogs.msdn.microsoft.com/csliu/2009/03/20/windows-unix-and-ansi-c-api-comparison/)
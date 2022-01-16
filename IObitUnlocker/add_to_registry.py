

path = 'E:\\projects\\portable-soft\\IObitUnlocker\\IObitUnlockerPortable.exe'


code = rf'''
Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\*\shell\Уничтожить2]
"Icon"="\"{path}\""
"extended"=""

[HKEY_CLASSES_ROOT\*\shell\Уничтожить2\command]
@="\"{path}\" /delete \"%1\""

[HKEY_CLASSES_ROOT\Directory\shell\Уничтожить2]
"Icon"="\"{path}\""
"extended"=""

[HKEY_CLASSES_ROOT\Directory\shell\Уничтожить2\command]
@="\"{path}\" /delete \"%1\""

[HKEY_CLASSES_ROOT\Directory\background\shell\Уничтожить2]
"Icon"="\"{path}\""
"extended"=""

[HKEY_CLASSES_ROOT\Directory\background\shell\Уничтожить2\command]
@="\"{path}\""
'''

file = open('test.txt', 'w')
file.write(code)

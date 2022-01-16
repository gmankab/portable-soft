import pathlib
import os

RUN_AFTER_SAVE = False

unlocker_executable = 'IObitUnlockerPortable.exe'
unlocker_full_path = os.path.abspath(unlocker_executable)

context_menu_item = 'force delete'
filename = 'force delete.reg'


def main():
    code = rf'''Windows Registry Editor Version 5.00

    [HKEY_CLASSES_ROOT\*\shell\{context_menu_item}]
    "Icon"="\"{unlocker_full_path}\""
    "extended"=""

    [HKEY_CLASSES_ROOT\*\shell\{context_menu_item}\command]
    @="\"{unlocker_full_path}\" /delete \"%1\""

    [HKEY_CLASSES_ROOT\Directory\shell\{context_menu_item}]
    "Icon"="\"{unlocker_full_path}\""
    "extended"=""

    [HKEY_CLASSES_ROOT\Directory\shell\{context_menu_item}\command]
    @="\"{unlocker_full_path}\" /delete \"%1\""

    [HKEY_CLASSES_ROOT\Directory\background\shell\{context_menu_item}]
    "Icon"="\"{unlocker_full_path}\""
    "extended"=""

    [HKEY_CLASSES_ROOT\Directory\background\shell\{context_menu_item}\command]
    @="\"{unlocker_full_path}\""
    '''

    filedir = str(pathlib.Path(__file__).parent.resolve()).replace('\\', '/')
    os.chdir(filedir)

    file = open(filename, 'w')
    file.write(code)

    os.system(f'regedit.exe /S {filename}')


if __name__ == '__main__':
    main()

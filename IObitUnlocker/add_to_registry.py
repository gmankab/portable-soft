import pathlib
import os

os.chdir(str(pathlib.Path(__file__).parent.resolve()).replace('\\', '/'))


RUN_AFTER_SAVE = False

context_menu_item_name = 'force delete'

unlocker_exe_name = 'IObitUnlockerPortable.exe'
reg_filename = 'force delete.reg'


unlocker_full_path = str(
    pathlib.Path(unlocker_exe_name).resolve()
).replace('\\', '\\\\')


code = rf'''Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\*\shell\{context_menu_item_name}]
"Icon"="\"{unlocker_full_path}\""
"extended"=""

[HKEY_CLASSES_ROOT\*\shell\{context_menu_item_name}\command]
@="\"{unlocker_full_path}\" /delete \"%1\""

[HKEY_CLASSES_ROOT\Directory\shell\{context_menu_item_name}]
"Icon"="\"{unlocker_full_path}\""
"extended"=""

[HKEY_CLASSES_ROOT\Directory\shell\{context_menu_item_name}\command]
@="\"{unlocker_full_path}\" /delete \"%1\""

[HKEY_CLASSES_ROOT\Directory\background\shell\{context_menu_item_name}]
"Icon"="\"{unlocker_full_path}\""
"extended"=""

[HKEY_CLASSES_ROOT\Directory\background\shell\{context_menu_item_name}\command]
@="\"{unlocker_full_path}\""
'''


def main():
    file = open(reg_filename, 'w')
    file.write(code)

    reg_full_path = os.path.abspath(reg_filename)

    if RUN_AFTER_SAVE:
        os.system(f'regedit.exe /S "{reg_full_path}"')
        print(f'regedit.exe /S "{reg_full_path}"')


if __name__ == '__main__':
    main()

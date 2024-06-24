from cx_Freeze import setup, Executable

base = None

executables = [Executable("main.py", base=base)]

setup(
    name="Snake",
    version="1.0",
    description="A Snake game developed my a sipmle python code.",
    options={
        "build_exe": {
            "packages": [],
            "include_files": [],  # Add any additional files or directories as needed
        },
    },
    executables=executables
)

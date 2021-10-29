@echo off
set WD=%~dp0

if not exist dist mkdir dist

cd ort\torch_cpp_extensions\cpu\aten_op_executor
python setup.py bdist_wheel
copy dist\* %WD%\dist

cd ..\torch_interop_utils
python setup.py bdist_wheel
copy dist\* %WD%\dist

cd %WD%



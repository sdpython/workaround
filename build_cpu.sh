echo --aten_op_executor--
cd ort/torch_cpp_extensions/cpu/aten_op_executor

python setup.py bdist_wheel
if [ $? -ne 0 ]; then exit $?; fi

echo --torch_interop_utils--
cd ../torch_interop_utils

python setup.py bdist_wheel
if [ $? -ne 0 ]; then exit $?; fi

echo --COPY--
cd ../../../..

cp ort/torch_cpp_extensions/cpu/aten_op_executor/dist/*.whl .
if [ $? -ne 0 ]; then exit $?; fi

cp ort/torch_cpp_extensions/cpu/torch_interop_utils/dist/*.whl .
if [ $? -ne 0 ]; then exit $?; fi

echo --END--
cd ..
echo --aten_op_executor--
cd ort/torch_cpp_extensions/cpu/aten_op_executor

python setup.py bdist_wheel || exit 1

echo --torch_interop_utils--
cd ../torch_interop_utils

python setup.py bdist_wheel || exit 1

echo --COPY--
cd ../../../..

cp ort/torch_cpp_extensions/cpu/aten_op_executor/dist/*.whl . || exit 1

cp ort/torch_cpp_extensions/cpu/torch_interop_utils/dist/*.whl . || exit 1

echo --END--
cd ..
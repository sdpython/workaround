# -------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.
# --------------------------------------------------------------------------

import os
from setuptools import setup, Extension
from torch.utils import cpp_extension
from torch import __version__ as version

version_torch = version.split('+')[0]

filename = os.path.join(os.path.dirname(__file__),
                        'torch_interop_utils.cc')

setup(
    name='torch_interop_utils',
    ext_modules=[
        cpp_extension.CppExtension(
            name='torch_interop_utils', sources=[filename])],
    cmdclass={'build_ext': cpp_extension.BuildExtension},
    version=version,
    author='Microsoft Corporation',
    author_email='onnxruntime@microsoft.com',
    license="MIT License",
    url="https://onnxruntime.ai",
    download_url='https://github.com/microsoft/onnxruntime/tags',
    setup_requires=['torch==%s' % version_torch],
    install_requires=["torch==%s" % version_torch]
)

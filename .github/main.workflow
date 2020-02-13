name: Publish python package

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: Set up Python 3.7
      uses: actions/setup-python@v1
      with:
        python-version: '3.7'
    - name: Install dependencies
      run: pip install wheel
    - name: Build package
      run: python setup.py sdist bdist_wheel
    - name: Publish package
      uses: pypa/gh-action-pypi-publish@master
      with:
        user: __token__
        password: ${{ secrets.pypi_password }}

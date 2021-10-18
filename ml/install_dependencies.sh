#!/bin/sh
pip install --upgrade pip setuptools wheel pip-tools
pip-compile --output-file=requirements.txt requirements.in
pip install -r requirements.in
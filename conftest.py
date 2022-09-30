import os
import platform

import pytest


from config import RunConfig

# 项目目录配置
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
UPPER_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
REPORT_DIR = BASE_DIR + os.sep + "allure-results" + os.sep






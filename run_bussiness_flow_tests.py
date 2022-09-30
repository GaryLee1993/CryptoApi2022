# coding=utf-8
import getopt
import logging
import os
import sys
import time
import click
import pytest


logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)
from pathlib import Path
from conftest import REPORT_DIR

'''
说明：
1、用例创建原则，测试文件名必须以“test”开头，测试函数必须以“test”开头。
2、运行方式：
  > python run_bussiness_flow_tests.py  (回归模式，生成HTML报告)
  > python run_bussiness_flow_tests.py -m debug  (调试模式)
'''


def init_env(new_report):
    """
    初始化测试报告目录
    """
    os.makedirs(new_report, exist_ok=True)


@click.command()
@click.option('-m', default=None, help='输入运行模式：run 或 debug.')
@click.option('-c', default=None, help='输入是否清理环境：clean 或 keep.')
@click.option('-e', default=None, help='测试的环境：TEST 或 PREONLINE.')
def run(m, c, e):
    if m is None or m == "run":
        logger.info("回归模式，开始执行✈✈！")
        now_time = ""
        if e == "preonline" or e == "PreOnline" or e == "PREONLINE":
            now_time = "预发布环境业务流测试报告_" + time.strftime("%Y_%m_%d_%H_%M_%S")
            Environment.SETENVIRONMENT = "PREONLINE"
            from config import RunConfig
        if e == "test" or e == "Test" or e == "TEST":
            now_time = "测试环境业务流测试报告_" + time.strftime("%Y_%m_%d_%H_%M_%S")
            Environment.SETENVIRONMENT = "TEST"
            from config import RunConfig
        if c == "clean" or c == "Clean" or c == "CLEAN":
            logger.info("开始清理环境")

        elif c is None or c == "keep" or c == "Keep" or c == "KEEP":
            logger.info("不清理环境，测试继续")
        from config import RunConfig
        RunConfig.EXCEL_LOG_STATUS=False
        RunConfig.NEW_REPORT = os.path.join(REPORT_DIR, now_time)
        init_env(RunConfig.NEW_REPORT)
        if not Path(os.path.join(RunConfig.PRO_PATH, "automation_report")).exists():
            os.makedirs(os.path.join(RunConfig.PRO_PATH, "automation_report"), exist_ok=True)
            RunConfig.NEW_REPORT = os.path.join(RunConfig.PRO_PATH, "automation_report")
        if Path(os.path.join(RunConfig.PRO_PATH, "automation_report")).exists():
            RunConfig.NEW_REPORT = os.path.join(RunConfig.PRO_PATH, "automation_report")
        allurecss_path = os.path.join(RunConfig.PRO_PATH, "allure-results")
        os.system("rm -rf %s" %allurecss_path)
        pytest.main(["-s", "-v", RunConfig.BUSSINESS_CASES_PATH, "--alluredir", allurecss_path,
                     "--maxfail", RunConfig.MAX_FAIL,
                     "--reruns", RunConfig.RERUN_BUSSINESS_FLOW_TIMES])
        logger.info("运行结束，生成业务流测试报告♥❤！")
        cmd = "allure generate " + allurecss_path + " --clean " + " -o " + RunConfig.NEW_REPORT
        os.system(cmd)

        os.system('git commit -a -m "修改目录"')
        os.system("git push -u origin master")

    elif m == "debug":
        if e == "preonline" or e == "PreOnline" or e == "PREONLINE":
            Environment.SETENVIRONMENT = "PREONLINE"
            from config import RunConfig
        if e == "test" or e == "Test" or e == "TEST":
            Environment.SETENVIRONMENT = "TEST"
            from config import RunConfig
        if c == "clean" or c == "Clean" or c == "CLEAN":
            logger.info("开始清理环境")

        elif c is None or c == "keep" or c == "Keep" or c == "KEEP":
            logger.info("不清理环境，测试继续")
        from config import RunConfig
        print("debug模式，开始执行！")
        pytest.main(["-v", "-s", RunConfig.BUSSINESS_CASES_PATH])
        print("运行结束！！")


def main(argv):
    try:
        options, args = getopt.getopt(argv, "hc:e:", ["help", "c=", "e="])
    except getopt.GetoptError:
        sys.exit()
    titalparam = []
    for option, value in options:
        if option in ("-h", "--help"):
            print("-c 是否清理环境 输入clean清理,输入keep不清理环境")
            print("-e 需要测试的环境test表示测试环境 pre-online表示预发布环境")
        else:
            titalparam.append(option)
            titalparam.append(value)
    eval('run(%s)' % titalparam)


if __name__ == '__main__':
    main(sys.argv[1:])

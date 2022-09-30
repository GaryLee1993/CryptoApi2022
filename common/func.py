# -*- coding: utf-8 -*-
# __author__ = 'zhouqiang'
import datetime
import hashlib
import json
import logging
import string
import time
from datetime import datetime

from config import RunConfig
from .api_utils import Api as WrapperApi
from .log import log_config
import os
import random

LOG_LEVEL = {'CRITICAL': 50, 'ERROR': 40, 'WARNING': 30, 'INFO': 20, 'DEBUG': 10}


class Func:
    log = log_config(c_level=logging.WARNING, f_level=None)[0]
    log_msg_flag = False

    @classmethod
    def api(cls, *args, **kwargs):
        # 调用WrapperApi发送请求
        if "protocol" in kwargs.keys():
            protocol = kwargs["protocol"]
            kwargs.update({"protocol": protocol})
        else:
            protocol = RunConfig.HTTPMODE
            kwargs.update({"protocol": protocol})
        if kwargs.get('gateway_protocol'):
            protocol = kwargs.get('gateway_protocol')
            del kwargs['gateway_protocol']

        _api = WrapperApi(*args, log=cls.log, log_msg_flag=cls.log_msg_flag,  verify=False, **kwargs)
        return _api


    @staticmethod
    def pop_none(lobalparams, body, queryparamlist=[]):
        for i in lobalparams.items():
            if i[1] == "None" or i[1] == "none" or i[1] == "Null" or i[1] == "null":
                body.pop(i[0])
        for i in queryparamlist:
            exec("%s=''" % i)




if __name__ == "__main__":
    fc = Func()
    fc.get_random_len_num(5)

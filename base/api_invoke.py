# -*-coding:utf-8 -*-
import copy
import time
from base.api_config import *
from common.func import Func
from config import RunConfig


class my_osbervatory_api():

    @staticmethod
    def get_weather_info_api(host):

        time.sleep(1)
        body = {}
        Func.pop_none(locals(), body)
        api = Func.api(host, body=body, headers=RunConfig.APPHEADER,
                       **SSecConst.MY_OBSERVATORY_GET_WEATHER_INFO)
        return api.get_response(), body



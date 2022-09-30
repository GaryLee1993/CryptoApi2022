# -*-coding:utf-8 -*-
import uuid
from datetime import date, timedelta

from base.api_invoke import *
from config import RunConfig


class my_osbervatory_service():
    @staticmethod
    def get_weather_info_service(host):
        res, body = my_osbervatory_api.get_weather_info_api(host)
        return res, body




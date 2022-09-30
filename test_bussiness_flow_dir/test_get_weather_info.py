# -*- coding: utf-8 -*-
# __author__ = 'lijiarui'
import pytest as pytest
from datetime import date, timedelta
from config import RunConfig
from service.api_services import my_osbervatory_service


def test_add_to_product_audit_process():
    # 添加商品并三级审核
    try:
        res, body = my_osbervatory_service.get_weather_info_service(RunConfig.HOST)
        dayafttertormorrow = (date.today() + timedelta(days=int(2))).strftime("%Y%m%d")
        ForecastRelativeHumidityList = [i["ForecastRelativeHumidity"] for i in res["HourlyWeatherForecast"] if
                                        i["ForecastHour"][0:8] == dayafttertormorrow]

        print("最高湿度为:%s" %max(ForecastRelativeHumidityList))
        print("最小湿度为:%s:" % min(ForecastRelativeHumidityList))

    except Exception as ex:
        print(ex)
        assert False
    finally:

        pass


if __name__ == '__main__':
    pytest.main(["-s", "-v", "test_get_weather_info.py"])

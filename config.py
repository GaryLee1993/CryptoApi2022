import os




class RunConfig():
    PRO_PATH = os.path.dirname(os.path.abspath(__file__))

    BUSSINESS_CASES_PATH = os.path.join(PRO_PATH, "test_bussiness_flow_dir")
    RERUN_BUSSINESS_FLOW_TIMES = "1"
    MAX_FAIL = "10000"
    NEW_REPORT = None
    HOST="pda.weather.gov.hk"
    HTTPMODE="https"
    APPHEADER = {
	"Accept": "*/*",
	"User-Agent": "Mozilla/5.0 (iPhone; CPU iPhone OS 16_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148",
	"Connection": "keep-alive",
	"Accept-Language": "zh-CN,zh-Hans;q=0.9",
	"Host": "pda.weather.gov.hk",
	"Accept-Encoding": "gzip, deflate, br"
}

    EXCEL_LOG_STATUS = True


import jdatetime


class Times:
    def __init__(self):
        pass

    def change_date_to_jalali(self, date, input_format='%Y-%m-%dT%H:%M:%S.%fZ'):
        strip_time = jdatetime.datetime.strptime(date, input_format)
        result = jdatetime.datetime.fromgregorian(year=strip_time.year, month=strip_time.month, day=strip_time.day,
                                                  hour=strip_time.hour, minute=strip_time.minute,
                                                  second=strip_time.second, microsecond=strip_time.microsecond)
        return jdatetime.datetime.strftime(result, "%Y-%m-%dT%H:%M:%S.%f")[:-3] + 'Z'
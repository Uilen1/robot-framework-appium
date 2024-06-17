import locale
from datetime import datetime, timedelta


class DateLibrary:
    locale.setlocale(locale.LC_TIME, 'pt_BR.UTF-8')

    def get_current_date_by_format(self,format='timestamp'):
        data_atual = datetime.now()
        return data_atual.strftime(format)
    
    def get_next_business_day(self,format='timestamp'):
        data_atual = datetime.now()
        while   True:
            data_atual += timedelta(days=1)
            if data_atual.weekday() < 5:
                break
        return data_atual.strftime(format).strip()

    def get_current_date(self):
        return datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    def get_next_sunday(self):
        today = datetime.now()
        days_until_sunday = (6 - today.weekday() + 7) % 7
        next_sunday = today + timedelta(days=days_until_sunday)
        return next_sunday.strftime("%Y-%m-%d")

    def get_difference_between_dates(self, initialDate, endDate):
        data1_obj = datetime.strptime(initialDate, "%Y-%m-%d")
        data2_obj = datetime.strptime(endDate, "%Y-%m-%d")
        diferenca = data2_obj - data1_obj
        return diferenca.days

    def get_difference_between_hours(self, initialTime, endTime):
        hora1_obj = datetime.strptime(initialTime, "%H:%M:%S")
        hora2_obj = datetime.strptime(endTime, "%H:%M:%S")
        # Adicionei um datetime inicial (01/01/1970) para lidar com a diferença de horas além de 24h
        diferenca = datetime(1970, 1, 1) + (hora2_obj - hora1_obj)
        # Extrai as horas, minutos e segundos da diferença
        horas = diferenca.hour
        minutos = diferenca.minute
        segundos = diferenca.second
        return {"hours": horas, "minutes": minutos, "seconds": segundos}
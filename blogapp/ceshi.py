from datetime import datetime
dt=datetime.now()
a=datetime.now().strftime("%Y-%m-%d %H:%M:%S")
print(dt.year,dt.month,dt.day,a)
print(type(dt),type(dt.year),type(a))
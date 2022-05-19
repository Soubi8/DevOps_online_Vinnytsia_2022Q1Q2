# pip install psutil
import psutil
from platform import system, release, version, processor


def system_info():
    print("=" * 30, "System Information", "=" * 30)
    print(f"Operating system: {system()}")
    print(f"Operating system release: {release()}")
    print(f"Operating system version: {version()}")


def processor_info():
    print("=" * 30, "CPU Information", "=" * 33)
    print(f"Processor type: {processor()}")
    print(f"Number of physical cores: {psutil.cpu_count(logical=False)}")
    print(f"Number of logical cores: {psutil.cpu_count(logical=True)}")
    print(f"Max CPU frequency: {psutil.cpu_freq().max} GHz")
    print(f"Current utilization: {psutil.cpu_percent(interval=1)}%")


def memory_info():
    print("=" * 30, "RAM Information", "=" * 33)
    print(f"Total Size: {round(psutil.virtual_memory().total / 1000000000, 2)} GB")
    print(f"Used: {round(psutil.virtual_memory().used / 1000000000, 2)} GB")
    print(f"Free: {round(psutil.virtual_memory().available / 1000000000, 2)} GB")
    print(f"Current utilization: {psutil.virtual_memory().percent}%")


def hdd_info():
    print("=" * 30, "Storage Information", "=" * 29)
    hdd = psutil.disk_usage("/")
    print(f"Total Size: {round(hdd.total / 1000000000, 2)} GB")
    print(f"Used: {round(hdd.used / 1000000000, 2)} GB")
    print(f"Free: {round(hdd.free / 1000000000, 2)} GB")
    print(f"Current utilization: {hdd.percent}%")


def show_info():
    return system_info(), processor_info(), memory_info(), hdd_info()


show_info()

# Module 8 - Python Intro 
## Task 8.1
### 1. Write easy program, which will display current date and time

[1.py](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m8/task8.1/1.py)

    import datetime as dt

    date_time = str(dt.datetime.now())[:-7]
    print('Current date and time is: ' + date_time)

![Screenshot1](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m8/task8.1/Screenshots/1.jpg)

### 2. Write python program, which will accept comma-separated numbers, and then it should write tuple and list of them:

[2.py](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m8/task8.1/2.py)

    numbers = input('Please enter the numbers separated by comma: ')
    list = numbers.split(",")
    tuple = tuple(list)
    print('Output:')
    print('List: ', (list))
    print('Tuple: ', (tuple))

![Screenshot2](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m8/task8.1/Screenshots/2.jpg)

### 3. Write python program, which will ask file name. File should be read, and only even lines should be shown.

[3.py](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m8/task8.1/3.py)

    file_name = input('Please enter the name of the file: ')
    try:
        i = 1
        read_file = open(file_name)
        print('The even line(s) from ' + file_name + ' file are displayed below: ')
        for even_numbers in read_file.readlines():
            if i % 2 == 0:
                print(even_numbers)
            i += 1
    except IOError:
        print('File does not exist')

![Screenshot3](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m8/task8.1/Screenshots/3.jpg)

### 4. Write python program, which should read html document, parse it, and show it's title.

[4.py](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m8/task8.1/4.py)

For this program I used the package __BeautifulSoup__. To install it I ran `pip install bs4`.

    from bs4 import BeautifulSoup

    html_file = open(input("Please enter the name of an .html file: "))
    soup = BeautifulSoup(html_file, 'html.parser')
    title = soup.title.text
    print("Title is: ", title)

![Screenshot4](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m8/task8.1/Screenshots/4.jpg)

### 5. Write python program, which will parse user’s text, and replace some emotions with emoji’s (Look: pip install emoji)

[5.py](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m8/task8.1/5.py)

For this program I used the package __Emoji__. To install it I executed `pip install emoji`.

    # pip install emoji
    from emoji import emojize


    def text_to_emoji(users_text):
        words = users_text.split(" ")
        emojis = {
            "angry": emojize(":angry_face:"),
            "happy": emojize(":grinning_face:"),
            "sad": emojize(":pleading_face:"),
            "okay": emojize(":thumbs_up:"),
            "fine": emojize(":neutral_face:"),
            "lovely": emojize(":smiling_face_with_hearts:"),
            "exciting": emojize(":partying_face:"),
            "great": emojize(":grinning_face_with_smiling_eyes:")
        }
        output = " "
        for word in words:
            output += emojis.get(word, word) + " "
        return output


    users_text = input("Please tell me, how are you today? ")
    print(text_to_emoji(users_text))

![Screenshot5](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m8/task8.1/Screenshots/5.jpg)

### 6. Write program, that will show basic PC information (OS, RAM amount, HDD’s, and etc.)

[6.py](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m8/task8.1/6.py)

For this program I used the package __Psutil__. To install it I executed `pip install psutil`.

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

![Screenshot6](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m8/task8.1/Screenshots/6.jpg)

## Summary
During this task I worked with the PyCharm IDE. The IDE was easy to utilize and to isolate multiple errors that I made while I wrote the code for all subtasks. I attached two .html files which I used to verify the program #4. 

[1.html](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m8/task8.1/1.html)

[2.html](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m8/task8.1/2.html)
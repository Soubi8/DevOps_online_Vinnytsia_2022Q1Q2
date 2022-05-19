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

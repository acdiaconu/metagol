def create_ex(lines):
    final = ""
    for line in lines:
        if line[0] == '%' or line == '\n':
            final = final + '\n' + line
            continue

        ex = 'f(['
        i = 0
        while line[i] != '=':
            ex += '\'' + line[i] + '\'' + ','
            i += 1
        ex = ex[:-5] + "],[" 
        i += 3
        while i < len(line):
            ex += '\'' + line[i] + '\'' + ','
            i += 1
        ex = ex[:-5] + "]),"
        final = final + '\n' + ex
    final = final[:-1]
    print(final)
        
file1 = open('C:\\Users\\andre\\OneDrive\\Documente\\metagol\\gen\\ex', 'r') 
Lines = file1.readlines() 
create_ex(Lines)
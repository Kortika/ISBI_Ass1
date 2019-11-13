
def readfile(filename):
    name=filename.split('.csv')[0]
    question, engine=name.split('-')[0], name.split('-')[1]
    with open(filename,'r') as fh:
        fh.readline()#Ingore first line we don't need col names
        raw_data=fh.readlines()
    data=[]
    for i in range(0, len(raw_data)):
        line=raw_data[i]
        if not (i+1==len(raw_data)):
            data.append((line.split(',')[0], int(line.split(',')[1][:-1])))
        else:
            data.append((line.split(',')[0], int(line.split(',')[1])))
    return (question, engine, data)

#Printing Test
(q, engine, data)=readfile('q4-google.csv')
for element in data:
    print(element)

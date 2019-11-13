import os
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

def readData(questions, engines, dirpath='./data'):
    filenames=[]
    for r, d, f in os.walk(dirpath):
        for file in f:
            filenames.append(file)
    unusefullData=[]
    for filename in filenames:
        unusefullData.append(readfile(dirpath+'/'+filename))
    commonpools=([], [], [])
    for i in range(0, engines):
        for result in unusefullData[questions*i:questions*(i+1)]:
            (question, engine, data)=result
            divider=1
            revs=0
            for (link, relevance) in data:
                if relevance==1 and not (link in commonpools[i]):
                    commonpools[i].append(link)
                if relevance==1:
                    revs+=1
                print(revs, '/', divider)
                divider+=1
            print('\n')

readData(2, 2)#dirpath='C:/Users/Μαρία/Desktop/ISBI/ISBI_Ass1/data')
#Printing Test
'''
(q, engine, data)=readfile('q4-google.csv')
for element in data:
    print(element)
'''

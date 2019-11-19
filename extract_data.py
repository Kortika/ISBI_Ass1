import os
import numpy as np


def readDirectory(directory="./data"):
    result = []

    for file_name in os.listdir(directory):
        if(file_name.endswith(".csv")):
            result.append(readFile("%s/%s" % (directory, file_name)))

    return result


def readFile(filename):
    name = filename.split('.csv')[0]
    question, engine = name.split('-')[0].lower(), name.split('-')[1].lower()
    question = question.split('/')[-1].lower()
    with open(filename, 'r') as fh:
        fh.readline()  # Ingore first line we don't need col names
        raw_data = fh.readlines()
    data = []
    for i in range(0, len(raw_data)):
        line = raw_data[i]
        if not (i+1 == len(raw_data)):
            data.append(
                (i, line.split(',')[0].strip(), int(line.split(',')[1][:-1])))
        else:
            data.append(
                (i, line.split(',')[0].strip(), int(line.split(',')[1])))
    return (question, engine, data)


def calculateRecallPrecision(data, pool_dict):
    engine_query_dict = dict()
    for question, engine, links in data:
        try:
            engine_query_dict[engine]
        except KeyError:
            engine_query_dict[engine] = dict()

        engine_query_dict[engine][question] = []
        precision_divider = 0
        numerator = 0
        recall = 0
        precision = 0

        for index, link, relevance in links:
            precision_divider += 1

            if relevance == 1:
                numerator += 1

            precision = round(numerator/precision_divider, 3)
            recall = round(numerator/pool_dict[question], 3)

            if (precision == 0):
                precision = "NA"
                recall = "NA"
            engine_query_dict[engine][question].append([precision, recall])

    for engine in engine_query_dict:
        with open("pyresults/%s.csv.result" % engine, "w+") as output:
            text = []
            for query in engine_query_dict[engine]:
                query_text = ["%s_precision,%s_recall" % (query, query)]
                query_text += map(lambda x: ",".join(str(z)
                                                     for z in x), engine_query_dict[engine][query])

                if len(text) == 0:
                    text = query_text
                else:
                    for i in range(0, len(query_text)):
                        text[i] += "," + query_text[i]

            output.write("\n".join(text))

    return engine_query_dict


def interpolate_query(engine_query_dict):

    result = dict()
    std_recall_list = np.arange(0.1, 1.1, 0.1)

    for engine in engine_query_dict:
        with open("pyresults/%s_interpolated.csv.result" % engine, "w+") as output:
            result[engine] = dict()

            for query in engine_query_dict[engine]:

                print(engine, query)
                result[query] = list()

                for std_recall_val in std_recall_list:

                    query_precision_recalls = engine_query_dict[engine][query]
                    filtered_precision = [
                        x[0] for x in query_precision_recalls if x[1] >= std_recall_val]

                    highest_precision= 0
                    if len(filtered_precision) != 0:
                        highest_precision = max(filtered_precision)

                    result[query].append(highest_precision)





    return result


def calculatePool(data):
    query_dict = dict()
    for question, engine, links in data:
        relevant_links = filter(lambda x: x[2] == 1, links)
        try:
            query_dict[question]
        except KeyError:
            query_dict[question] = dict()

        for linkTuple in relevant_links:
            link = linkTuple[1]
            try:
                query_dict[question][link]
            except KeyError:
                query_dict[question][link] = set()

            query_dict[question][link].add(engine)

    result = dict()
    for question in query_dict.keys():
        with open("pyresults/%s.csv.pool" % question, "w+") as output:
            output.write("Link,Engines\n")
            pool_output = []
            result[question] = len(query_dict[question])
            for link in query_dict[question]:
                engine = query_dict[question][link]
                pool_output.append("%s,%s" % (link, "-".join(engine)))

            output.write("%s" % ("\n".join(pool_output)))

    return result


def readData(questions, engines, dirpath='./data'):
    filenames = []
    for r, d, f in os.walk(dirpath):
        for file in f:
            filenames.append(file)

    unusefullData = []
    for filename in filenames:
        if filename.endswith(".csv"):
            unusefullData.append(readFile(dirpath+'/'+filename))

    commonpools = calculatePool(unusefullData)

    engine_query_dict = calculateRecallPrecision(unusefullData, commonpools)
    interpolate_query(engine_query_dict)


readData(2, 2)

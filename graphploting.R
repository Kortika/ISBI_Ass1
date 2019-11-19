#Initializations
dirpath='C:/Users/Μαρία/Desktop/ISBI/ISBI_Ass1/pyresults/'#Specify project directory
filenames=c('google.csv.result', 'duckduckgo.csv.result', 'webcrawler.csv.result')
#Read Inputs
google.frame=read.table(file=paste(dirpath, filenames[1], sep=""), header = TRUE, sep=",", na.strings="NA", strip.white = TRUE, stringsAsFactors = FALSE)
duckduckgo.frame=read.table(file=paste(dirpath, filenames[2], sep=""), header = TRUE, sep=",", na.strings="NA", strip.white = TRUE, stringsAsFactors = FALSE)
webcrawler.frame=read.table(file=paste(dirpath, filenames[3], sep=""), header = TRUE, sep=",", na.strings="NA", strip.white = TRUE, stringsAsFactors = FALSE)


#Clear NA values
na.omit(google.frame)
na.omit(duckduckgo.frame)
na.omit(webcrawler.frame)
#Plot graph for Google
plot(google.frame$q1_recall, google.frame$q1_precision, type='o', col='blue', ylim=c(0,1), xlim=c(0,1), main='Google', xlab='Recall', ylab='precision')
lines(google.frame$q2_recall, google.frame$q2_precision, type='o', col='red')
lines(google.frame$q3_recall, google.frame$q3_precision, type='o', col='green')
lines(google.frame$q3_recall, google.frame$q4_precision, type='o', col='yellow')
legend('bottomright', legend=c('q1', 'q2','q3','q4'), fill=c('blue', 'red', 'green', 'yellow'))
#Plot graph for duckduckgo
plot(duckduckgo.frame$q1_recall, duckduckgo.frame$q1_precision, type='o', col='blue', ylim=c(0,1), xlim=c(0,1), main='DuckDuckGo', xlab='Recall', ylab='precision')
lines(duckduckgo.frame$q2_recall, duckduckgo.frame$q2_precision, type='o', col='red')
lines(duckduckgo.frame$q3_recall, duckduckgo.frame$q3_precision, type='o', col='green')
lines(duckduckgo.frame$q3_recall, duckduckgo.frame$q4_precision, type='o', col='yellow')
legend('bottomright', legend=c('q1', 'q2','q3','q4'), fill=c('blue', 'red', 'green', 'yellow'))
#Plot graph for webcrawler
plot(webcrawler.frame$q1_recall, webcrawler.frame$q1_precision, type='o', col='blue', ylim=c(0,1), xlim=c(0,1), main='Webcrawler', xlab='Recall', ylab='precision')
lines(webcrawler.frame$q2_recall, webcrawler.frame$q2_precision, type='o', col='red')
lines(webcrawler.frame$q3_recall, webcrawler.frame$q3_precision, type='o', col='green')
lines(webcrawler.frame$q3_recall, webcrawler.frame$q4_precision, type='o', col='yellow')
legend('bottomright', legend=c('q1', 'q2','q3','q4'), fill=c('blue', 'red', 'green', 'yellow'))

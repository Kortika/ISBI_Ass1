#Initializations
dirpath='C:/Users/�����/Desktop/ISBI/ISBI_Ass1/'#Specify project directory
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
lines(google.frame$q3_recall, google.frame$q3_precision, type='o', col='red')
legend('bottomright', legend=c('q1', 'q2','q3','q4'), fill=c('blue', 'red'))
#Plot graph for Lycos
plot(duckduckgo.frame$q1_recall, duckduckgo.frame$q1_precision, type='o', col='blue', ylim=c(0,1), xlim=c(0,1), main='DuckDuckGo', xlab='Recall', ylab='precision')
lines(duckduckgo.frame$q2_recall, duckduckgo.frame$q2_precision, type='o', col='red')
lines(duckduckgo.frame$q3_recall, duckduckgo.frame$q3_precision, type='o', col='red')
legend('bottomright', legend=c('q1', 'q2','q3','q4'), fill=c('blue', 'red'))

plot(duckduckgo.frame$q1_recall, duckduckgo.frame$q1_precision, type='o', col='blue', ylim=c(0,1), xlim=c(0,1), main='DuckDuckGo', xlab='Recall', ylab='precision')
lines(duckduckgo.frame$q2_recall, duckduckgo.frame$q2_precision, type='o', col='red')
lines(duckduckgo.frame$q3_recall, duckduckgo.frame$q3_precision, type='o', col='red')
legend('bottomright', legend=c('q1', 'q2','q3','q4'), fill=c('blue', 'red'))
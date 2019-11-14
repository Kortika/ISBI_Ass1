#Initializations
dirpath='C:/Users/Μαρία/Desktop/ISBI/ISBI_Ass1/'#Specify project directory
filenames=c('google.csv.result', 'lycos.csv.result')
#Read Inputs
google.frame=read.table(file=paste(dirpath, filenames[1], sep=""), header = TRUE, sep=",", na.strings="NA", strip.white = TRUE, stringsAsFactors = FALSE)
lycos.frame=read.table(file=paste(dirpath, filenames[2], sep=""), header = TRUE, sep=",", na.strings="NA", strip.white = TRUE, stringsAsFactors = FALSE)
#Clear NA values
na.omit(google.frame)
na.omit(lycos.frame)
#Plot graph for Google
plot(google.frame$t1_recall, google.frame$t1_precision, type='o', col='blue', ylim=c(0,1), xlim=c(0,1), main='Google', xlab='Recall', ylab='precision')
lines(google.frame$t2_recall, google.frame$t2_precision, type='o', col='red')
legend('bottomright', legend=c('q1', 'q2'), fill=c('blue', 'red'))
#Plot graph for Lycos
plot(lycos.frame$t1_recall, lycos.frame$t1_precision, type='o', col='blue', ylim=c(0,1), xlim=c(0,1), main='Google', xlab='Recall', ylab='precision')
lines(lycos.frame$t2_recall, lycos.frame$t2_precision, type='o', col='red')
legend('bottomright', legend=c('q1', 'q2'), fill=c('blue', 'red'))

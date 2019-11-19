#Initializations
dirpath='C:/Users/Μαρία/Desktop/ISBI/ISBI_Ass1/pyresults/'#Specify project directory
filenames=c('google.csv.result', 'duckduckgo.csv.result', 'webcrawler.csv.result', 'google_interpolated.csv.result', 'duckduckgo_interpolated.csv.result', 'webcrawler_interpolated.csv.result')
#Read Inputs
google.prcsn_rcl.frame=read.table(file=paste(dirpath, filenames[1], sep=""), header = TRUE, sep=",", na.strings="NA", strip.white = TRUE, stringsAsFactors = FALSE)
google.interpolated.frame=read.table(file=paste(dirpath, filenames[4], sep=""), header = TRUE, sep=",", na.strings="0.0", strip.white = TRUE, stringsAsFactors = FALSE)
duckduckgo.prcsn_rcl.frame=read.table(file=paste(dirpath, filenames[2], sep=""), header = TRUE, sep=",", na.strings="NA", strip.white = TRUE, stringsAsFactors = FALSE)
duckduckgo.interpolated.frame=read.table(file=paste(dirpath, filenames[5], sep=""), header = TRUE, sep=",", na.strings="0.0", strip.white = TRUE, stringsAsFactors = FALSE)
webcrawler.prcsn_rcl.frame=read.table(file=paste(dirpath, filenames[3], sep=""), header = TRUE, sep=",", na.strings="NA", strip.white = TRUE, stringsAsFactors = FALSE)
webcrawler.interpolated.frame=read.table(file=paste(dirpath, filenames[6], sep=""), header = TRUE, sep=",", na.strings="0.0", strip.white = TRUE, stringsAsFactors = FALSE)


#Clear NA values
na.omit(google.prcsn_rcl.frame)
na.omit(google.interpolated.frame)
na.omit(duckduckgo.prcsn_rcl.frame)
na.omit(duckduckgo.interpolated.frame)
na.omit(webcrawler.prcsn_rcl.frame)
na.omit(webcrawler.interpolated.frame)

#Plot graph for Google
plot(google.prcsn_rcl.frame$q1_recall, google.prcsn_rcl.frame$q1_precision, type='o', col='blue', ylim=c(0,1), xlim=c(0,1), main='Google', xlab='Recall', ylab='precision')
lines(google.prcsn_rcl.frame$q2_recall, google.prcsn_rcl.frame$q2_precision, type='o', col='red')
lines(google.prcsn_rcl.frame$q3_recall, google.prcsn_rcl.frame$q3_precision, type='o', col='green')
lines(google.prcsn_rcl.frame$q4_recall, google.prcsn_rcl.frame$q4_precision, type='o', col='yellow')
legend('bottomright', legend=c('q1', 'q2','q3','q4'), fill=c('blue', 'red', 'green', 'yellow'))

#Plot graph for duckduckgo
plot(duckduckgo.prcsn_rcl.frame$q1_recall, duckduckgo.prcsn_rcl.frame$q1_precision, type='o', col='blue', ylim=c(0,1), xlim=c(0,1), main='DuckDuckGo', xlab='Recall', ylab='precision')
lines(duckduckgo.prcsn_rcl.frame$q2_recall, duckduckgo.prcsn_rcl.frame$q2_precision, type='o', col='red')
lines(duckduckgo.prcsn_rcl.frame$q3_recall, duckduckgo.prcsn_rcl.frame$q3_precision, type='o', col='green')
lines(duckduckgo.prcsn_rcl.frame$q4_recall, duckduckgo.prcsn_rcl.frame$q4_precision, type='o', col='yellow')
legend('bottomright', legend=c('q1', 'q2','q3','q4'), fill=c('blue', 'red', 'green', 'yellow'))

#Plot graph for webcrawler
plot(webcrawler.prcsn_rcl.frame$q1_recall, webcrawler.prcsn_rcl.frame$q1_precision, type='o', col='blue', ylim=c(0,1), xlim=c(0,1), main='Webcrawler', xlab='Recall', ylab='precision')
lines(webcrawler.prcsn_rcl.frame$q2_recall, webcrawler.prcsn_rcl.frame$q2_precision, type='o', col='red')
lines(webcrawler.prcsn_rcl.frame$q3_recall, webcrawler.prcsn_rcl.frame$q3_precision, type='o', col='green')
lines(webcrawler.prcsn_rcl.frame$q4_recall, webcrawler.prcsn_rcl.frame$q4_precision, type='o', col='yellow')
legend('bottomright', legend=c('q1', 'q2','q3','q4'), fill=c('blue', 'red', 'green', 'yellow'))

#Plot intepolation Graph
plot(google.interpolated.frame$std_recall, google.interpolated.frame$average, type='o', col='blue', ylab='Precission', ylim=c(0, 1), xlim=c(0, 1), main='Average Interpolated', xlab='Recall' )
lines(duckduckgo.interpolated.frame$std_recall, duckduckgo.interpolated.frame$average, type='o', col='red')
lines(webcrawler.interpolated.frame$std_recall, webcrawler.interpolated.frame$average, type='o', col='green')
legend('topright', legend=c('Google', 'DuckDuckGo', 'Webcrawler'), fill=c('blue', 'red', 'green'))
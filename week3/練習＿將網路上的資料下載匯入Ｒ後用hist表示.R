file_path <- "/Users/rgmmmt4r/Documents/大學/Ｒ/week 3/name.csv"
msleep <- read.table(file_path, header = TRUE, stringsAsFactors = FALSE, sep = ",")
hist(x=msleep$sleep_total,main="sleep_total",xlab="hours",ylab="frequency")
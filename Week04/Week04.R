#' ---
#' title: "Week 4: Data Visualization Lab"
#' author: "Shahriyar Chamnakhah(PID:A17173389)"
#' 
#' ---


# Week 4 Data Visualization Lab

# Install the Package ggplot2
#install.packages("ggplot2")

# any time I want to use this
# package I need to load it
 library(ggplot2)

View(cars)

# A Quick base R plot - this is not ggplot
plot(cars)

# Our first ggplot
# we need data + aes + geoms
ggplot(data=cars) + 
aes(x=speed, y=dist) +
  geom_point()

p<- ggplot(data=cars) + 
     aes(x=speed, y=dist) +
     geom_point()
# add a line geom with geom_line()
p + geom_line()


# add a trend line close to the data
p + geom_smooth()

p + geom_smooth(method="lm")


#-------------------------

# read in our drug expression data
url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim(url)
head(genes)

# Q.  how many ‘up’ regulated genes
 table(genes$State)
 
# Q. What fraction of total genes is up-regulated
  round((table(genes$State) / nrow(genes))*100, 2)
 
# let's make a first plot attempt
g<-ggplot(data=genes) +
 aes(x=Condition1, y=Condition2, col=State) +
  geom_point()
g
# add some color
g + scale_color_manual(values=c("blue", "gray","red")) +
  
  labs(title=" Genes expression changes", 
       x="Control(no drug)")
  theme_bw()
  

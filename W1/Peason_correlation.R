# Packages
library("ggpubr")
# Example
my_data <- mtcars
head(my_data, 6)
#                    mpg cyl disp  hp drat    wt  qsec vs am gear carb
# Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
# Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
# Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
# Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
# Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
# Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1

#  Visualize the correlation by pearson method
ggscatter(my_data, x = "mpg", y = "wt", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "Miles/(US) gallon", ylab = "Weight (1000 lbs)")

ggqqplot(my_data$mpg, ylab = "MPG")
# Data
data=read.table("anscombe_quartet.tsv",header=TRUE)
par(mfrow=c(2,2))
# Run one by one
type=c("a","b","c","d")
for (i in type)
{
a=ggscatter(data[data$plot==i,], x = "x", y = "y", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab ="", ylab = "")
b=ggqqplot(data[data$plot==i,]$x, ylab = "x")
c=ggqqplot(data[data$plot==i,]$y, ylab = "y")
ggarrange(a, b, c, ncol = 3) %>%
  ggexport(filename = paste0("pearsonR_",i,".pdf"),width = 30,  height = 10)
}
# Finally all of the data have a good r coefficient however, only a satisfied the conditions
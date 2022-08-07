#simplest w/only two variables

cor.test(USArrests$UrbanPop, USArrests$Assault, method = "pearson", use= "complete.obs")

#2variables = pearson / 2var not normally distribute = spearman 
#2 categorical recoded to numeric = kendall 
#use fn with complete.obs argument means you don't need complete dataset

#if p less than .05 it's significant

#corr matrices quicker 

install.packages("PerformanceAnalytics")
library("PerformanceAnalytics")

#because chart.Correlation() looks at all data you have to limit to quantVar
#so you subset

mtcars_quant <- mtcars[, c(1,2,3,4,5,6,7)]
mtcars_quant

#rows would go first before first comma

#now make correl matrix

chart.Correlation(mtcars_quant, histogram = FALSE, method = "pearson")
#look for 3 stars

#corr.plot will be prettier but doesn't list signifcance or r values
#first you have to turn data into a matrix. corr.plot won't take df as arg

corr_matrix <- cor(mtcars_quant)
corr_matrix

install.packages("corrplot")
library("corrplot")

corrplot(corr_matrix, type = "upper", order = "hclust", p.mat = corr_matrix, sig.level = 0.01, insig = "blank")












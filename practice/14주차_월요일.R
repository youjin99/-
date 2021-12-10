#14주차 월요일 
install.packages('ggplot2')
library(ggplot2)

#증분방식의 이해
#산점도 예제 - 예제 자료 :
x11()
p = ggplot(mtcars, aes(wt, mpg, color=cyl))
p
p = p + geom_point()
p

names(p)
head(p$data)
p$layers
p$scales
p$mapping
p$theme
p$coordinates
p$facet
p$plot_env
p$labels
p$labels$x = 'Weight'
p$labels$y = 'MPG'
p$labels$colour = 'Cyliner'

p
attributes(p)
summary(p)

#ggplot2 막대그래프 - 기어 갯수 별 실린더의 수 막대그래프
p = ggplot(mtcars, aes(factor(cyl), fill = factor(cyl)))
p
p = p + geom_bar(width=.5)
p
p2 = p + facet_grid(.~gear)
p2

p3 = p + facet_grid(rows=vars(gear)); p3

p4 = p + facet_grid(cols = vars(gear)); p4

p5 = p + facet_grid(rows=vars(am), cols=vars(gear)); p5

#Global mapping 
x11()
p = ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)); p
p = p + geom_point(aes(color=Species)); p
p2 = p + geom_point(mapping = aes(x = Petal.Length, y = Petal.Width, color = Species), pch = 17); p2

#Local mapping 
x11()
p = ggplot(data=iris)
p = p + xlab('Length') + ylab('Width'); p

p2 = p + geom_point(mapping = aes(x = Sepal.Length, y = Sepal.Width), colour = 'blue', pch = 19); p2

p3 = p + geom_point(mapping = aes(x=Petal.Length, y = Petal.Width), colour = 'red', pch = 17); p3

p4 = p2 + geom_point(mapping = aes(x=Petal.Length, y = Petal.Width), colour = 'red', pch = 17); p4

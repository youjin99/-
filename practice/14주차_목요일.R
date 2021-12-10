rm(list=ls())

#14주차 목요???
library(ggplot2)
#Geoms 계열 ??????
#geom_point(dataset, mapping)
x11()
p = ggplot(data = mtcars, aes(x=wt, y=mpg)); p
p = p + geom_point(color='orange', size=6); p

p = ggplot(data = mtcars, aes(x=wt, y=mpg))
p = p + geom_point(aes(color = cyl, size = gear));p

#geom_line()
p = ggplot(data=mtcars, aes(x=wt, y=mpg))
p + geom_line()
p + geom_line(aes(x=wt, y=mpg),linetype=2, size=2, color=2)

#geom_abline(intercept, slope)
mw_coef = coef(lm(mpg~wt,mtcars))
p = ggplot(data=mtcars, aes(x=wt, y=mpg)); p
p = p + xlim(1,5)+ylim(10,35) + geom_point(); p 
p + geom_abline(intercept=mw_coef[1], slope = mw_coef[2], color=4)
p + geom_vline(xintercept = 3, color=2) + geom_hline(yintercept = 20, color=2)

#geom_smooth()
p = ggplot(data=mtcars, aes(x=wt, y=mpg))
p = p + geom_point(); p
p + geom_smooth()
p + geom_smooth(aes(linetype=factor(cyl)))

#geom_bar()
p = ggplot(data=mtcars, aes(factor(cyl))); p
p + geom_bar(fill='steelblue',color = 'black')
p + geom_bar(aes(fill=factor(gear)),color='black')
p + geom_bar(aes(fill=factor(gear)),color='black')

#geom_area()
huron = data.frame(year=1875:1972, level = as.vector(LakeHuron)); huron
p = ggplot(data = huron, aes(x=year, y=level)) ; p
p + geom_area()
p + geom_area(fill='steelblue') + coord_cartesian(ylim=c(min(huron$level)-2, max(huron$level)+2))

#geom_ribbon()
p = ggplot(data=huron, aes(x=year, y=level, ymin=huron$level-2, ymax=huron$level+2))
p + geom_ribbon(fill='steelblue')

#Geoms 계열 ?????? ?????? 문제 
setwd('c:/example')
kospi = read.csv(file='kospi_data.txt', sep="\t")
head(kospi)
kospi$Date = as.Date(kospi$Date)
mode(kospi$Date)

x11()
KOSPI = ggplot(kospi, aes(x=Date, y=CurrentIndex))
KOSPI = KOSPI + geom_point(color='red')
KOSPI = KOSPI + geom_line(color='black')
KOSPI = KOSPI + geom_ribbon(aes(ymin=Lowest, ymax=Highest),fill='steelblue')
KOSPI

#geom_boxplot()
p = ggplot(mtcars, aes(factor(cyl), mpg))
p + geom_boxplot()
p + geom_boxplot(aes(fill=factor(carb)))

#geom_histogram()
setwd('c:/example')
movies = read.csv(file='movies.csv', header = T)
head(movies)
dim(movies)
p = ggplot(data=movies, aes(x=rating))
p + geom_histogram()
p + geom_histogram(binwidth = 1)
p + geom_histogram(binwidth = 1, aes(y=..density.., fill=..count..)) + geom_density(color='red') + scale_fill_gradient(low='white', high='#496ff5')

#geom_density)
p = ggplot(movies, aes(x=rating))
p + geom_density()
p + geom_density(aes(fill=factor(mpaa)), alpha=0.25)

#geom_text()
p = ggplot(mtcars, aes(x=wt, y=mpg, label=rownames(mtcars)))
p = p + geom_point()
p + geom_text(aes(x=wt+0.05, color=factor(cyl)), size=5)

#geom_map()
install.packages("reshape2")
library(reshape2)
install.packages("mapproj")
library(mapproj)
install.packages("maps")
library(maps)
x11()
crimes = data.frame(state = tolower(rownames(USArrests)), USArrests)
USArrests
head(crimes)

states_map = map_data('state')
head(states_map)

p = ggplot(crimes, aes(map_id=state));p
p = p + geom_map(aes(fill=Murder), map = states_map); p
p = p + expand_limits(x = states_map$long, y = states_map$lat);p
p + coord_map()

#stat_ecdf()
df = data.frame(x = c(rnorm(100,0,2), rnorm(100,1,4)), g=gl(2, 100)); head(df)
p = ggplot(df, aes(x, color=g)); p
p + stat_ecdf()
p + stat_ecdf(geom='line', size=1)

#stat_function(fun=??????)
dat = data.frame(x=rnorm(100))
p = ggplot(dat, aes(x=x)); p
p = p + geom_density(fill = 'green', alpha=0.15); p
p + stat_function(fun=dnorm, color='red', fill='red', alpha=0.15, geom='area')

#coord_cartesian()
p = ggplot(data=mtcars, aes(x=disp, y=wt)); p
p = p + geom_smooth(); p
p + coord_cartesian(xlim=c(325,500), ylim=c(3,6))

#coord_flip()
p = ggplot(mtcars, aes(factor(cyl), mpg)); p
p + geom_boxplot()
p + geom_boxplot() + coord_flip()

#coord_fixed(ratio = value)
x = c(500, 350, 700, 600, 400)
y = c(10,20,30,30,20)
dat = data.frame(x,y)
p = ggplot(data=dat, aes(x=x,y=y)); p
p = p + geom_point(size=5); p
p + coord_fixed(ratio=1)

#coord_map()
library(maps)
world = map_data('world'); head(world)
korea = world[grep('Korea$', world$region),]
head(korea)
p = ggplot(korea, aes(x=long, y=lat, group=group)); p
p = p + geom_polygon(fill='white', color='black'); p
p + coord_map()

#coord_trans()
p = ggplot(data=diamonds, aes(x = carat, y = price, color = factor(cut))); p
p = p + geom_point(); p
p + coord_trans(x='log10', y='log10')
p + coord_trans(y='log10')
# install.packages("fpp") 
library(fpp)
# install.packages("mFilter")
library(mFilter)
# install.packages("forecast")
library(forecast)

# 2.1 Introdução
data(elecequip)
plot(elecequip, xlab="Tempo", ylab="Índice de novas ordens")

decomp <- decompose(elecequip, type="additive")
plot(decomp)

ajuste_sazonal <- elecequip - decomp$seasonal
plot(ajuste_sazonal)

data(cafe)
filtro_hp <- hpfilter(cafe, type="lambda")
par(mfrow=c(2, 1))
plot(cafe, ylab="Despesas Trimestrais", xlab="Tempo")
lines(hpfilter(cafe, type="lambda")$trend, col="red", lwd=2)
legend(1985, 8000, c("Série Original", "Tendência - Filtro HP"),
       col=c("black", "red"), lwd=c(1, 2), bty="n")
plot(hpfilter(cafe, type="lambda")$cycle, ylab="Componente Cíclica",
     xlab="Tempo")

# 2.2 Suavização exponencial simples (SES)
set.seed(1234)
serie <- ts(runif(100, 10, 15), start=c(1915, 1), frequency=1)
plot(serie)

ajuste <- HoltWinters(serie, beta=FALSE, gamma=FALSE)
ajuste
plot(ajuste, xlab="Tempo", ylab="Valores observados/ajustados", main="")

ajuste_prev <- forecast(ajuste, h=10, level=95)
ajuste_prev
plot(ajuste_prev, main="", xlab="Tempo", ylab="Dados")

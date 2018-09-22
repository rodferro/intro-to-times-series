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
par(mfrow=c(1,1))
set.seed(1234)
serie <- ts(runif(100, 10, 15), start=c(1915, 1), frequency=1)
plot(serie)

ajuste <- HoltWinters(serie, beta=FALSE, gamma=FALSE)
ajuste
plot(ajuste, xlab="Tempo", ylab="Valores observados/ajustados", main="")

ajuste_prev <- forecast(ajuste, h=10, level=95)
ajuste_prev
plot(ajuste_prev, main="", xlab="Tempo", ylab="Dados")

# 2.3 Suavização exponencial de Holt (SEH)
dados <- read.csv2("data/consumo_energia_eletrica_regiao_sudeste.csv")
dados <- dados[-457, ] # retirando janeiro de 2017
consumo <- ts(dados[, 2], start=c(1979, 1), frequency=12)
plot(consumo, xlab="Tempo", ylab="Consumo de Energia Elétrica (Gwh)", main="")

ajuste_holt <- HoltWinters(consumo, gamma=FALSE)
ajuste_holt

plot(consumo, xlab="Tempo", ylab="Valores Observados/Ajustados", main="")
lines(fitted(ajuste_holt)[, 1], lwd=2, col="red")
legend(1980, 20000, c("Consumo Energia Elétrica", "Ajuste SEH"),
       lwd=c(1, 2), col=c("black", "red"), bty="n")

prev_holt <- forecast(ajuste_holt, h=12, level=95)
prev_holt

plot(prev_holt, xlab="Tempo", ylab="Valores Observados/Previstos", main="")

# 2.4 Suavização exponencial sazonal de Holt-Winters

# 2.4.2 O modelo multiplicativo
tx_desemprego <- read.csv2("data/taxa_desemprego_regiao_metropolitana_sp.csv", sep="")
desemprego <- tx_desemprego[, 2]
serie_desemprego <- ts(desemprego, start=c(1985, 1), frequency=12)
plot(serie_desemprego, xlab="Tempo", ylab="Taxa de Desemprego", main="")

ajuste_com_sazonalidade <- HoltWinters(serie_desemprego)
ajuste_com_sazonalidade

plot(serie_desemprego, xlab="Tempo", ylab="Taxa de Desemprego", main="")
lines(fitted(ajuste_com_sazonalidade)[, 1], lwd=2, col="red")
legend(1985, 15, c("Taxa de Desemprego", "Ajuste HW"), lwd=c(1, 2), 
       col=c("black", "red"), bty="n")

prev_hw <- forecast(ajuste_com_sazonalidade, h=12, level=95)
plot(prev_hw, xlab="Tempo", ylab="Taxa de Desemprego", main="")

ajuste_com_sazonalidade_mult <- HoltWinters(serie_desemprego, seasonal="multiplicative")
plot(serie_desemprego, xlab="Tempo", ylab="Taxa de Desemprego", main="", ylim=c(4, 20))
lines(fitted(ajuste_com_sazonalidade)[, 1], lwd=2, col="red")
lines(fitted(ajuste_com_sazonalidade_mult)[, 1], lwd=2, col="blue")
legend(1985, 20, c("Taxa de Desemprego", "Ajuste HW Aditivo", "Ajuste HW Multiplicativo"), 
       lwd=c(1, 2), col=c("black", "red", "blue"), bty="n")

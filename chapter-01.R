# Capítulo 1 - Introdução ao R

# 1.3.1 Operações matemáticas

sqrt(25)
5%%2

# 1.3.2 Operações lógicas

a = 25
b = 45
a > b

# 1.3.3 Objetos

(a = 3)

a = 3
a

# 1.3.4 Classes de objetos

# Numeric
a = 2
b = 5
c = a + b
c

a = 15
b = 25
(c = a + b)

d = c^(1/3)
d

# Character
nome1 = "big"
nome1

nome2 = 'data'
nome2

nomecompleto = paste(nome1, nome2)
nomecompleto

nomecompleto = paste0(nome1, nome2)
nomecompleto

# Date
data = "06/02/2017"
formatodata = as.Date(x = data, format="%d/%m/%Y")
formatodata

# Logical
TRUE
FALSE

# Conhecendo a classe de um objeto
a = 3
str(3)

a = 3
class(a)

# 1.4 Vetores

nomes = c("Anna", "Paula", "Roberta", "Ingrid", "Fernanda", "João")
nomes

# Indexação de vetores
v = c(1, 10, 15, 5, 30, 2)
v[1]

v[1:3]

# Tamanho do vetor
v = c(1, 10, 15, 5, 30, 2)
length(v)

# Concatenando valores
nomes1 <- c("Anna", "Pedro", "Carlos", "Bruno", "Vanessa", "Paula", "Italo")
nomes2 <- c("Jorge", "Davi", "Mariana", "Carolina", "Alice")
nomes_completo <- c(nomes1, nomes2)
nomes_completo

# 1.5 Data frames

produto <- c("Produto A", "Produto B", "Produto C", "Produto D", "Produto E")
preco <- c(5, 15, 4, 6, 8)
tabela_preco_produto <- data.frame(produto, preco)
tabela_preco_produto

# Indexação de data frames
tabela_preco_produto[4, 2]
tabela_preco_produto[4:5, 2]

# Acessando uma coluna de um frame
tabela_preco_produto$produto
tabela_preco_produto[, "produto"]

# Criando uma nova coluna em um data frame
tabela_preco_produto$quantidade <- c(50, 100, 120, 150, 200)
tabela_preco_produto

tabela_preco_produto[, "custos"] <- c(2, 12, 3, 5, 6)
tabela_preco_produto

# Conhecendo seu data frame
base_flores <- iris

str(base_flores)
head(base_flores)
summary(base_flores)
names(base_flores)

# 1.6 Matriz

A <- matrix(c(0, 7, 0, 1, 4, 5, 0, 7, 0), ncol=3, nrow=3, byrow=TRUE)
A

B <- matrix(rep(0, 16), ncol=4, nrow=4)
B

A[1, 2]

# Alterando a primeira linha
B[1,] <- c(5, 7, 6, 8)
# Alterando a terceira coluna
B[, 3] <- c(4, 3, 2, 16)
B

# 1.7 Listas

minha_lista <- list("Curso de Formação Executiva em Big Data e Data Science", 
                    3, "Introdução ao R")
minha_lista

minha_lista2 <- list(nome_curso="Curso de Formação Executiva em Big Data e Data Science",
                    turma=3, aula="Introdução ao R")
minha_lista2

# Acessando os elementos em uma lista
minha_lista2[[3]]
minha_lista2$nome_curso

# Adicionando objetos em uma lista
minha_lista2$alunos <- c("Anna", "Marco", "Fernando", "Juliana", "Diego", "Rafael")
minha_lista2$idades <- c(29, 31, 22, 20, 27, 28)
minha_lista2

# Conhecendo a sua lista
str(minha_lista2)
summary(minha_lista2$idades)

# 1.8 Trabalhando com diretórios e arquivos externos

getwd()
list.files()
setwd("~/Developer/projects/time-series-analysis")

# 1.8.1 Leitura de arquivos externos

pessoas <- read.table(file="populacao.txt", header=TRUE, sep="\t", dec=".")
head(pessoas)

pessoas_csv <- read.csv(file="populacao.csv")
pessoas_csv

combustivel <- read.csv2(file="dados_anp2.csv")
combustivel

# 1.8.2 Exportação de arquivos

nomes <- c("Marco", "Carol", "João", "Caio", "Vinicius")
idades <- c(36, 29, 28, 8, 10)
frame_idades <- data.frame(nomes, idades)

write.table(frame_idades, "idades.txt")
write.csv(frame_idades, "idades.csv")
write.csv2(frame_idades, "idades.csv")

# Leitura de arquivos usando pacotes externos
# install.packages("xlsx")
# (No terminal) sudo R CMD javareconf

# Leitura de arquivos no formato .xlsx
library(xlsx)
populacao <- read.xlsx("populacao.xlsx", sheetIndex=1)
head(populacao)

# Exportação de arquivos no formato .xlsx
nome <- c("Anna", "Bruno", "Fernando", "Viviane", "Bernardo")
salario <- c(3000, 5000, 2500, 1000, 500)
df_salarios <- data.frame(nome, salario)
write.xlsx(df_salarios, "funcionarios.xlsx", sheetName="Salario", row.names=FALSE)

# 1.9 Estruturas de condição e repetição

# 1.9.1 Estruturas de condição

# Estrutura if e else
a = 31
b = 30
if (a < b) {
  cat("a é menor que b")
} else if (a > b) {
  cat("b é menor que a")
} else {
  cat("São iguais")
}

# Estrutura ifelse
a = 31
b = 30
ifelse(a > b, "a é maior", "b é maior")

# 1.9.2 Estruturas de repetição

a = 10
while (a < 20) {
  print(a)
  a <- a + 1
}

produto <- c("Produto A", "Produto B", "Produto C", "Produto D", "Produto E")
preco <- (c(5, 15, 4, 6, 8))
preco_novo <- NA
tabela_preco_produto <- data.frame(produto, preco, preco_novo)
produtos <- 1
while (produtos <= 5) {
  tabela_preco_produto[produtos, "preco_novo"] <- 2 * tabela_preco_produto[produtos, "preco"]
  produtos <- produtos + 1
}
tabela_preco_produto

# Estrutura for
v = c(16, 18, 59, 35, 27, 37, 38)
for (i in 1:length(v)) {
  print(v[i])
}

produto <- c("Produto A", "Produto B", "Produto C", "Produto D", "Produto E")
preco <- (c(5, 15, 4, 6, 8))
preco_novo <- NA
tabela_preco_produto <- data.frame(produto, preco, preco_novo)
for (i in 1:nrow(tabela_preco_produto)) {
  tabela_preco_produto[i, "preco_novo"] <- 2 * tabela_preco_produto[i, "preco"]
}
tabela_preco_produto

alunos <- c("Anna", "Paulo", "Pedro", "Serafin", "Marco", "Karina", "Giuliana", "Diego", "Natalia", "Ingrid", "Daiane")
p1 <- c(2, 3, 10, 5, 7, 8, 5, 2, 4, 10, 8)
p2 <- c(9, 5, 9, 5, 7, 5, 4, 4, 2, 1, 8)
p3 <- c(10, 6, 8, 8, 8, 10, 8, 5, 9, 2, 9)
alunos <- data.frame(alunos, p1, p2, p3)
alunos$media <- (alunos$p1 + alunos$p2 + alunos$p3) / 3
alunos$status <- NA
for (i in 1:nrow(alunos)) {
  if (alunos[i, "media"] >= 7) {
    alunos[i, "status"] <- "Aprovado"
  } else if(alunos[i, "media"] < 7 & alunos[i, "media"] >= 5) {
    alunos[i, "status"] <- "Recuperação"
  } else {
    alunos[i, "status"] <- "Reprovado"
  }
}
alunos

# 1.10 Funções

media <- function(a, b) {
  m <- (a + b) / 2
  return(m)
}
media(3, 5)

calcula_tudo <- function(a, b) {
  media <- (a + b) / 2
  soma <- a + b
  multiplicacao <- a * b
  return(list(soma=soma, media=media, multiplicacao=multiplicacao))
}
calcula_tudo(4, 10)

# 1.11 A função which

v = c(15, 20, 35, 38, 24, 50)
v2 = v[which(v %% 5 == 0)]
v2

nomes <- c("Claudia", "Paulo", "Fernando", "Gisele", "Anna", "Pedro", "João", "Matheus")
idades <- c(30, 28, 45, 36, 27, 18, 21, 25)
frame_pessoas <- data.frame(nomes, idades)
maior_idade <- max(idades)
pessoa_mais_velha <- frame_pessoas[which(frame_pessoas$idades == maior_idade),]
pessoa_mais_velha

# 1.12 Funções apply

# Função apply
D = matrix(c(10, 18, 18, 50, 25, 19, 23, 45, 90, 27, 28, 40, 11, 45, 25, 35),
           nrow=4, ncol=4, byrow=TRUE)
D

medias = apply(D, 2, mean)
medias

apply(D, 1, function(x) x-1)

# Função lapply
v = c(5, 9, 7, 10, 4)
lapply(v, function(v) v^2)

unlist(lapply(v, function(v) v^2))

# Função sapply
sapply(v, function(v) v^2)

# 1.13 Criando gráficos com o R

# Lendo a base
# install.packages("UsingR")
require(UsingR)
head(galton)

# Convertendo de polegadas para centímetros (1 polegada ≈ 2,54 cm)
galton <- 2.54 * galton
head(galton)

# Esboçando o histograma
hist(galton$child, main="", xlab="Altura (cm)", ylab="Frequência", ylim=c(0, 200),
     col="lightgray", border="steelblue")

# Criando o gráfico
dados <- read.csv2("POF_capitais.csv")
hist(dados[, 31], main="", xlab="Renda Total Mensal do Domicílio", ylab="Frequência",
     col="lightsteelblue3")

# Filtrando os dados
menorq10 <- subset(dados[, 31], dados[, 31] < 10000)

# Criando o gráfico
hist(menorq10, main="", xlab="Renda Total Mensal do Domicílio em R$", ylab="Frequência",
     col="lightskyblue")

# Instalando e carregando o pacote moments
# install.packages("moments")
require(moments)

# Calcular assimetria com a fórmula
skewness(menorq10)

# 1.13.2 Boxplot

boxplot(galton$parent, main="", ylab="Altura (cm)", col="seagreen3")

# Criando o boxplot
boxplot(menorq10, horizontal=T, col="gold", xlab = "Renda Total Mensal do Domicílio",
        main="")

# 1.13.3 Gráfico de pontos ou gráfico de dispersão

# Base a ser utilizada
head(kid.weights)

# Criando o gráfico
plot(kid.weights$weight, kid.weights$height, main="", xlab="Peso", ylab="Altura")

# Criando o gráfico
plot(dados[, 16], dados[, 20], main="", pch=19, col="dodgerblue3",
     xlab="Quantidade de Cômodos no Domicílio", 
     ylab="Quantidade de Banheiros no Domicílio")

# 1.13.4 Gráfico de setores ou de pizza

# Tabela de frequência das categorias
prop <- table(kid.weights[, 4])
prop

# Esboçando o gráfico
pie(prop, main="", labels=c("51.6%", "48.4%"),
    col=c("palevioletred2", "dodgerblue3"))

# Adicionando a legenda
legend(x="topright", bty="n", cex=0.8, legend=c("Feminino", "Masculino"),
       fill=c("palevioletred2", "dodgerblue3"))

# Tabela de frequência das categorias
setores <- table(dados[, 12])

# Cálculo da porcentagem de cada categoria
valores <- signif(setores / sum(setores) * 100, 3)

# Construção do gráfico
pie(setores, labels=paste(valores, "%", sep=""),
    col=c("steelblue1", "olivedrab3", "orange"),
    main="")

# Criando a legenda
texto <- c("Casa", "Apartamento", "Cômodo")
legend(x="topright", legend=texto, fill=c("steelblue1", "olivedrab3", "orange"),
       cex=0.65)

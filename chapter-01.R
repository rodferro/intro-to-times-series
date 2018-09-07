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
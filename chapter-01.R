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

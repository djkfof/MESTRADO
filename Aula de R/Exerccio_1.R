#################################################################################
##########                     Exercicio 1                          #############
#################################################################################
#crie o vetor de nome "alfa" contendo as 5 primeiras consoantes do alfabeto
alfa<-c("B","C","D","F","G")
alfa


#crie um integer de nome "primos" com os 5 primeiros numeros primos
primos<-c(1L,2L,3L,5L,7L)
class(primos)


#crie uma sequnecia de nome "x" de 1 a 3, com incremento de 0.5
x<-c(1:3)+0.5



##################################################################################

#crie um vetor numerico de 1 a 100

num<- (1:100)
num
#calcule a media
media<- median(num, na.rm=FALSE)
media


#transforme o vetor em uma matrix de 10x10
mat<-matrix(num,10,10)


#substitua a segunda coluna pela decima linha
mat[,2]<-mat[10,]
mat


#calcule a media
media<-median(mat, na.rm=FALSE)
media


#verifique quantos valores da matrix "m" estao acima da media
mat>media




#################################################################################

#sete a semente de numeros aleatorios em 1
set.seed(2)


#crie um vetor aleatorio "s" de de tamanho 100, com valores no intervalo de 0 a 1000, permitindo reposicao

s<- sample(0:1000, 100)
s

#verifique a posicao dos valores maximos e minimos
which.max(s)
which.min(s)
s[84]   # ------------> Valor encontrado no which.max() no meu comando, foi somente para confirmação
s[67]   # ------------> Valor encontrado no which.min() no meu comando, foi somente para confirmação

#verifique o numero de duplicatas
soma<- sum(duplicated(s), na.rm=FALSE)
soma


#verifique quem sao as duplicatas
DJ<-c("na minha seed, não pareceu nenhuma duplicada", soma)
DJ


#ordene o vetor s de forma crescente usando a funcao order(), criando o vetor "s3"
s3<- s[order(s)]
s3

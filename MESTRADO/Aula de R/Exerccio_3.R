######################################
##          Exercicio 3             ##
######################################

#####################       arquivo network.txt      ##############################

#importe o arquivo network.txt para o R e crie um data.frame com nome "network"
load()
network<-read.table("network.txt", header=T)


#mantenha somente as informacoes das colunas $node1, $node2 e $combined_score
network1<- network[,c(1,2,15)]



#selecione somente as liogacoes com score acima de 0.700
network2<- network1[with(network1, (combined_score>0.700)),]


#identifique quantos e quais sao os nos da rede
A<- unique(network2$node1)
B<- unique(network2$node2)
quais<- unique(c(network2$node1, network2$node2))
quantos<- length(quais)

#####################           funcoes           ##############################


#faca a funcao "K()" que calcule a conectividade de um determinado no da rede
# a funcao deve ter o argumento "symbol" e o argumento "network"
K<- function(symbol, network){
  sum((network2$node1== symbol),(network2$node2==symbol))
  }
K("NGF", network)  #ao rodar essa linha, a resposta devera ser 16


###############################################################################
#faca a funcao "vizinhos()" para encontrar os vizinhos de um no na rede
vizinhos<- function(symbol,network){
    vi<-network[network$node1==symbol,][2]
    zi<-network[network$node2==symbol,][1]
    nhos<- c(vi,zi)
    nhos
  }

vizinhos("NGF", network2) #ao rodar essa linha sua funcao deve retornar o resultado abaixo:
#[1] "PIK3R1" "CASP6"  "IKBKB"  "NTRK1"  "NFKBIA" "PIK3CB" "NFKB1"  "PIK3R2" "BAD"   
#[10] "PIK3CA" "CASP3"  "MYD88"  "CHUK"   "RELA"   "IRAK1"  "IKBKG"



##############################################################################
#faca a funcao "Knetwork()" para encontrar a conectividade media da rede
Knetwork<- function(network){
  nos<- nrow(network2)
  k<- (2*nos)/quantos
  k
  }

Knetwork(network)    ##ao rodar essa linha, a resposta devera ser  11.6319

as<-nrow(network2)/(quantos*(quantos-1))

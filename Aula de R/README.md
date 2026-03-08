**Aula de introdução ao R**
# PRIMEIRA AULA - 02/03/2026

1. Leve introdução ao R, contando uma história da linguagem de programação;
2. O R é uma linguagem herdada da linguagem S;
3. Possui uma extensa documentação mas é limitado devido ao uso da memória RAM;
4. os dois principais repositórios utiizados no R são: Cran e Bioconductor;
5. Todos os valores no R são vetores, então é possível ter vetores de diferentes complexidade;
6. Vetores numéricos podem ser diviidios em tres grupos, os numeric (vetor de números reais), integer (vetores de números inteiros) e complex( vetores de números complexos);
7. Parindo para o Rstudio. é sempre bom ver onde o script que  será utilizado esta localizado, dentro do script é possível utilizar atralhos (Ctrl + enter) para rodar uma linha do script;


# SEGUNDA AULA - 03/03/2026

1. Fução append, serve para adicionar números entres os vetores que eu desejo posicionar. *EX* appende(X,y, after =3);
2. A função paste cola vetores;
3. A função grep retorna valores que eu estou procurando, utilizando fatores de bucas descritos pelo usuário.
   - grep (o que busca nos vetores, Variável que é utilizada), a função pode ser modificada mais ainda colocando "$" no final do que eu busco pra utilizar como se fosse um limitador até onde eu quero buscar. A função grep também pode ser alterada com ignore.case= T, a qual busca pelos caracteres em maiusculo.
4. para criar Lista basta usar o comando list;
   -Para acessar números dentro dentro uma lista, é necessário que seja entre chaves duplas;
   -A forma mais intuitiva de buscar um vetor da minha lista é: lista[[2]] [[2]]. O primeiro par de colchetes inidca a lista que eu irei buscar e o segundo ira indicar o vetor que eu vou buscar dentro da lista;
   - Uma lista pode ser uma dataflame, podendo trabalhar com uma vetor multi dimensional.
5. Para criar um dataflame, se utilizar a função dataflame e entre parênteses os valores que serão posto nesse dataflame;
   - É possível buscar ou extrair informações de dentro  do dataflame utlizando o seguinte comando: nome do dataflame+$ ---> o sifrão irá mostrar o que se podeteirar de dentro do dataflame.
   - Também é possível acessar uma dataflame do mesmo modo que uma matrix;
   - A organização da criação do dataflame é primero coluno e depois linha;
   - Pode ser buscado se uma informação de um dataflame está em outro.
      - *EX* dataflame1$nome_da_coluna_que_se_repetei%in%dataflame2$nome_da_coluna_que_se_repete
    
   - É possível unir dois dataflames eliminando informações que se repetem, deixando somente o que é único em cada um.
     - *EX* marge(dataflame1, dataflame2, by= nome_da_coluna_que_se_repete)
     - Caso alguns os datasflames tenha mais informações que o outro, é necessário indetinficar (all.dataflame=T)

+ ATIVIDADE DO DIA 2

```R
- load("exer2.RData")

1. Construa o data.frame "SH.DE" com os dados de "SH.limma", mantendo somente as sondas que estao presentes no data.frame "DE.exp"


SH.DE<- merge(SH.limma, DEexp, by = "row.names", all.x=T) 

--> SH.DE <- SH.DE[row.names(DEexp),] - forma mais correta do comando, a utilização da função merge() não está totalmente errada, mas como o merge junta ambas os datasflames deixando o resultado com muitas colunas. Já com esse código mais simples e não gera um arquivo com tantas colunas.

2. Confirme se todos as sondas presentes em "DEexp" estao presentes em "SH.DE"

soma<- sum(row.names(DEexp)%in%SH.DE$Row.names)
soma == nrow(DEexp)
--> Pode ser feito utilizando a função all().

Elimine as linhas que contem NA do data.frame "SH.DE"
SH.DE<-na.omit(SH.DE) 

Adicione uma coluna em "SH.DE" contendo os dados de "ensemble_gene_id" 
contidos no data.frame "queryENSG"

 SH.DE<- merge(SH.DE, queryENSG, by.x = "Row.names", by.y= "hgnc_symbol", all = TRUE)

--> SH.DE<- merge(SH.DE, queryENSG, by.x = "Row.names", all = TRUE) um dos principais erros desse código está no final, o all=T está errado pois quando acontece o merge, são criados linhas NA para bater a quantidade de linhas iguais nos dois dataflames. O correto seria all.x = T, dessa forma não iria gerar linhas a mais sem conter nada.
              
#faca uma lista "DEtime" com 5 data.frames, cada um contendo symbol, 
#entrez e ensemble_gene_id dos genes upregulated nos tempos 6h, 1d, 2d, 3d e 5d, respectivamente

df_6h<- SH.DE[which(SH.DE$logFC.t6h...t0h>0), c("symbol", "entrez", "ensembl_gene_id.y")]
df_1d<- SH.DE[which(SH.DE$logFC.t1d...t0h>0), c("symbol", "entrez", "ensembl_gene_id.y")]
df_2d<- SH.DE[which(SH.DE$logFC.t2d...t0h>0), c("symbol", "entrez", "ensembl_gene_id.y")]
df_3d<- SH.DE[which(SH.DE$logFC.t3d...t0h>0), c("symbol", "entrez", "ensembl_gene_id.y")]
df_5d<- SH.DE[which(SH.DE$logFC.t5d...t0h>0), c("symbol", "entrez", "ensembl_gene_id.y")]

--> O erro nessa parte é que devido ao erro da questão anterior, eu tive que usar o which por conta dos vários NA criados

DEtime<- list(df_6h,df_1d,df_2d,df_3d,df_5d)
```


# AULA 3 - 4/03/2026
- Trabalhando com importação de dados

só para dor de cabeça ajsdahdjashdajsh 

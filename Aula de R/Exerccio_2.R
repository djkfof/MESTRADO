
load("exer2.RData")

#Construa o data.frame "SH.DE" com os dados de "SH.limma", mantendo 
#somente as sondas que estao presentes no data.frame "DE.exp"

SH.DE<- merge(SH.limma, DEexp, by = "row.names", all.x=T)

#confirme se todos as sondas presentes em "DEexp" estao presentes em "SH.DE"
soma<- sum(row.names(DEexp)%in%SH.DE$Row.names)
soma == nrow(DEexp)


#Elimine as linhas que contem NA do data.frame "SH.DE"
SH.DE<-na.omit(SH.DE) 

#Adicione uma coluna em "SH.DE" contendo os dados de "ensemble_gene_id" 
#contidos no data.frame "queryENSG"
SH.DE<- merge(SH.DE, queryENSG, by.x = "Row.names", by.y= "hgnc_symbol", all = TRUE)
              
#faca uma lista "DEtime" com 5 data.frames, cada um contendo symbol, 
#entrez e ensemble_gene_id dos genes upregulated nos tempos 6h, 1d, 2d, 3d e 5d, respectivamente

df_6h<- SH.DE[which(SH.DE$logFC.t6h...t0h>0), c("symbol", "entrez", "ensembl_gene_id.y")]
df_1d<- SH.DE[which(SH.DE$logFC.t1d...t0h>0), c("symbol", "entrez", "ensembl_gene_id.y")]
df_2d<- SH.DE[which(SH.DE$logFC.t2d...t0h>0), c("symbol", "entrez", "ensembl_gene_id.y")]
df_3d<- SH.DE[which(SH.DE$logFC.t3d...t0h>0), c("symbol", "entrez", "ensembl_gene_id.y")]
df_5d<- SH.DE[which(SH.DE$logFC.t5d...t0h>0), c("symbol", "entrez", "ensembl_gene_id.y")]

DEtime<- list(df_6h,df_1d,df_2d,df_3d,df_5d)

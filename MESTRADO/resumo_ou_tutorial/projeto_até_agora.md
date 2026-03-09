# Procurando a sequência nos genomas
## 1. Montagem do Genomas e procura do Conting correto
1. Foi procurado um genoma completo de phytomonas utilizando o SRA accession no NCBI. Em nosso pesquisa achamos uma SRA accession de run: SRR4244759;
2. Após acharmos o SRA accession, o genoma foi montado por uma ferramenta chamada Marauders geno maps, disponibilazada pelo laboratório de evolução molécular e biologia de sistemas; 
3. Durante esse meio tempo, foi criado um batabase de sequências de quitinases diponíveis em site online como o ncbi,pdb e TriTrypDB; 
4. Com isso foi possível achar uma contig que possuia alta similaridade entre as testadas; 

## 2. Utilizando o MEME e o TOMTOM para achar fatores de transcrição 
- MEME (Multiple EM for Motif Elicitation): Esta é uma ferramenta de descoberta de motivos de novo. Você fornece a ela um conjunto de sequências (DNA, RNA ou proteína) e o MEME procura por padrões conservados que se repetem. Por exemplo, se você inserir sequências de regiões promotoras de vários genes do seu genoma de interesse, o MEME encontrará as assinaturas de nucleotídeos mais recorrentes ali.

- TOMTOM: O TOMTOM atua na etapa seguinte. Ele pega o motivo desconhecido que o MEME acabou de descobrir e o compara com bancos de dados de motivos genômicos já validados cientificamente (como o JASPAR, HOCOMOCO, etc.).

5. Para prosseguir para  a próxima etapa, é necessário saber onde está o a região da proteína e como funciona a transcrição naquele organismo estudado. Estou estudando quitinases da família trypanomatidae, que são protozoários, esses orginismos possuem uma transcrição policistrônica, então teremos que buscar motivs nas regiões 3'UTR. 
- ref: CLAYTON, Christine. Regulation of gene expression in trypanosomatids: living with polycistronic transcription. Open biology, v. 9, n. 6, 2019.

6. Após descobrir a região, pelo simples código abaixo:

``` python

contig_seq = """""".replace('\n', '')

 1. Coordenadas biológicas da proteína
fim_proteina = 5025
tamanho_total = len(contig_seq)

 2. Ajustando o índice para o Python 
inicio_utr_python = fim_proteina 

 3. Recortando até o final da contig
sequencia_utr = contig_seq[inicio_utr_python:tamanho_total]

 4. Criando e salvando o arquivo FASTA para a UTR
nome_do_arquivo = "3_UTR_extraida.fasta"
cabecalho_fasta = f">3_UTR_k99_6878_quitinase_pos_5026_a_{tamanho_total}"

with open(nome_do_arquivo, "w") as arquivo:
    arquivo.write(cabecalho_fasta + "\n")
   
    sequencia_rna = sequencia_utr.replace('T', 'U')
    arquivo.write(sequencia_rna + "\n")

print(f"Sucesso! O arquivo '{nome_do_arquivo}' foi criado.")
print(f"Foram extraídas {len(sequencia_utr)} bases referentes à região 3' UTR.")
```

7. Agora podemos colocar o arquivo extraido que possui a região 3'UTR no MEME;
- Como estou colocando somente uma região UTR, a ferramenta pedira para marcar a opção "Any number of repeticion".
- Essa opção irá causar ruido ao consequir o motivo, então é necessário colocamias sequências nesses arquivos.


8. O MEME gerará os motivos encontrados, após isso basta pegar os resultados gerados e colocar para comparar contra o banco de dados do TOTOM.




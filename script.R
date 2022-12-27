library(stringr)
library("readxl")

# Configura camimho dos arquivos
setwd('/home/mikhael/downloads/2022/')

publi <- read.delim("Dados_de_Publicacoes.txt", header = TRUE)

# Remove últimos 3 characteres do id_institution
publi$id_institution <- str_sub(publi$id_institution, end=-4)

subdisciplinas <- read_excel("Subdisciplinas.xlsx")

publi_subd = merge(publi, subdisciplinas, by.x = "sub.discipline", by.y = "subd_id")

#Importa instituições
instituicoes_nova <- read.delim("Instituicoes_nova.txt", header=TRUE)

pub_subd_inst = merge(publi_subd, instituicoes_nova, by.x="id_institution", by.y = "InstitutionID")

#importa municipios
PIB_Muni <- read_excel("PIB dos Municípios - base de dados 2010-2015.xlsx")

pub_subd_inst_PIB <- merge(pub_subd_inst, PIB_Muni, by.x = "Municipality_ID", by.y="Código do Município")


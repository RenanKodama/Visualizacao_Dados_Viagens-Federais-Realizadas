
#CARREGANDO BIBLIOTECAS
library(MASS)
library(plotly)
library(httpuv)

#�REAS DE TRABALHO
setwd("C:/Users/renan/Desktop/Visualizacao_Dados_Viagens-Federais-Realizadas/COORDENADAS PARALELAS")

#CARREGANDO TABELA
table = read.csv("pagamento.csv")

#OBS: colunasY_Selecionadas deve ser numeros
#COORDENADAS PARALELAS PARAMETROS(tabela[,colunasY_Selecionadas], cores paras as linhas, label)
#parcoord(table[,c(1,2,4,9)], col=rainbow(length(table[,1])), var.label=TRUE)


#USANDO O PLOTLY
p <- plot_ly(type = 'parcoords', 
             line = list(color = 'blue'),
                         
             
             dimensions = list(
               list(range = c(~min(table$Identificador.do.processo.de.viagem),~max(table$Identificador.do.processo.de.viagem)),
                    label = 'IDViagem', values = table[,c(1)]),
               
               list(range = c(~min(table$C�digo.do.�rg�o.superior),~max(table$C�digo.do.�rg�o.superior)),
                    label = 'CodigoOrg�o', values = table[,c(2)]),
               
               list(range = c(~min(table$Codigo.do.�rg�o.pagador),~max(table$Codigo.do.�rg�o.pagador)),
                    label = 'CodigoOrg�oPagador', values = table[,c(4)]),
                  
               list(range = c(~min(table$Valor),~max(table$Valor)),
                    label = 'Valor', values = table[,c(9)])
             )
)

#chart_link = api_create(p, filename="parcoords-dimensions")
htmlwidgets::saveWidget(as_widget(p), "Finalgraph.html")

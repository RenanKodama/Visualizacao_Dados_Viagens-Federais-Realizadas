SELECT count(idProcesso) FROM visualizacao.Viagem where valorPassagem >=(SELECT  avg(valorPassagem) from visualizacao.Viagem);

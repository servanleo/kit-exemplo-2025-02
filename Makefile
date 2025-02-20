# Formato geral de um makefile
# 
# alvo: pre-requisito1 pre-requisito2 ...
#	 comandos que usam os pré-requisitos para gerar o alvo

all: resultados/variacao_temperatura.csv resultados/numero_de_dados.txt figuras/variacao_temperatura.png paper/paper.pdf
	# Nenhum comando, alvo ficticio que gera todos os alvos no makefile

clean:
	rm -rv resultados dados figuras paper/paper.pdf 
	# Limpa as pastas geradas pelo make

paper/paper.pdf: paper/paper.tex figuras/variacao_temperatura.png
	tectonic -X compile paper/paper.tex

figuras/variacao_temperatura.png: code/plota_dados.py resultados/variacao_temperatura.csv 
		mkdir -p figuras
		python code/plota_dados.py resultados/variacao_temperatura.csv figuras/variacao_temperatura.png
	
resultados/variacao_temperatura.csv: dados/temperature-data.zip code/variacao_temperatura_todos.sh
	mkdir -p resultados/
	bash code/variacao_temperatura_todos.sh > resultados/variacao_temperatura.csv
	
	
resultados/numero_de_dados.txt: dados/temperature-data.zip 
	mkdir -p resultados/
	ls dados/temperatura/*.csv | wc -l > resultados/numero_de_dados.txt
	
dados/temperature-data.zip: code/baixa_dados.py
	python code/baixa_dados.py dados
	

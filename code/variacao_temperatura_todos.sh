# Calcula a variação de temperatura para todos os países
echo variacao_C_por_ano,pais
for arquivo in dados/temperatura/a*.csv
do
	python code/variacao_temperatura.py $arquivo
done
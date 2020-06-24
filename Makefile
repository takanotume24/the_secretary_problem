build:
	mkdir -p bin
	crystal build src/main.cr -o bin/main ${OPTION}

run:
	mkdir -p result
	bin/main ${N} ${SIM_TIME} >> result/N_${N}_SIM_TIME_${SIM_TIME}.csv
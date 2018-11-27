#!/bin/bash

# This file tokenizes an input file to be translated
# Inputs:
#		-d : Data directory where the BPE models and translation models are stored
#		-s : Language of the source file. Valid options are: en, es, or pt
#		-t : Language of the target file. Valid options are: en, es, or pt
#		-f : Path to the file that will be translated
#		-n : Number of parallel threads for tokenization
#		-o : Path to the OpenNMT installation directory

while getopts d:s:t:f:n: option
do
case "${option}"
in
d) DATA=${OPTARG};;
s) src=${OPTARG};;
t) tgt=${OPTARG};;
f) file_trans=${OPTARG};;
n) npar=${OPTARG};;
o) ONMT=${OPTARG};;
esac
done

#DATA='/data/enpt_es'
#src='en'
#tgt='es'
#file_trans='engTerms_totranslate.txt'

cd ${ONMT}

# For Spanish as target
if [[ $tgt = "es" ]]
then
	th tools/tokenize.lua -nparallel ${npar} -joiner_annotate -bpe_model ${DATA}/enpt_es.bpe32000 < ${file_trans} > ${file_trans}.tok ;
fi

# For English as target
if [[ $tgt = "en" ]]
then
	th tools/tokenize.lua -nparallel ${npar} -joiner_annotate -bpe_model ${DATA}/espt_en.bpe32000 < ${file_trans} > ${file_trans}.tok ;
fi

# For Portuguese as target 
if [[ $tgt = "pt" ]]
then
	th tools/tokenize.lua -nparallel ${npar} -joiner_annotate -bpe_model ${DATA}/enes_pt.bpe32000 < ${file_trans} > ${file_trans}.tok ;
fi

# Add source and target markers for each line in the tokenized file
perl -i.bak -pe "s//__opt_src_${src} __opt_tgt_${tgt} /" ${file_trans}.tok
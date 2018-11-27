# Neural Machine Translation for the Biomedical Domain   


## Introduction

This package contains the files needed to use the Neural Machine Translation (NMT) system
for the Biomedical Domain.

The available language directions for translation are:
	- English to Spanish
	- Spanish to English
	- English to Portuguese
	- Portuguese to English
	- Spanish to Portuguese
	- Portuguese to Spanish

Translation models must be downloaded from the Zenodo repository

## Prerequisites
-------------

This package uses the Torch implementation of the OpenNMT system (http://opennmt.net/)  
Instructions to install the system are found in: http://opennmt.net/OpenNMT/installation/  
Download translation models available at: INCLUDE ZENODO REPO  

## Directory structure
-------------------

<pre>
enes_pt.bpe32000 - BPE file for English/Spanish to Portuguese tokenization
enpt_es.bpe32000 - BPE file for English/Portuguese to Spanish tokenization
espt_en.bpe32000 - BPE file for Spanish/Portuguese to English tokenization
Tokenize.sh 	 - Utility script to tokenize the input file using BPE (needed for translation)
</pre> 


## Usage
-----

Tokenize.sh [options] 

Options:
<pre>
-d : Data directory where the BPE models and translation models are stored
-s : Language of the source file. Valid options are: en, es, or pt
-t : Language of the target file. Valid options are: en, es, or pt
-f : Path to the file that will be translated
-n : Number of parallel threads for tokenization
-o : Path to the OpenNMT installation directory
</pre>


## Examples
--------

<pre>
$ .Tokenize.sh -d /home/user/data -s en -t es -f /home/user/text.txt -n 4 -o /home/user/OpenNMT
$ cd /home/user/OpenNMT
$ th translate.lua -model /home/user/data/onmt_enpt_es-4-1000-600_epoch11_60.38_release.t7 -gpuid 1 -src /home/user/text.txt.tok -replace_unk true -detokenize_output true -output /home/user/text.translated
</pre>


## Contact
------

Felipe Soares (felipe.soares@bsc.es)


## License
-------

Copyright (c) 2017-2018 Secretaría de Estado para el Avance Digital (SEAD)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

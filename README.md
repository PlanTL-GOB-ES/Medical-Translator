# Neural Machine Translation for the Biomedical Domain   


## Introduction

This package contains the files needed to use the Neural Machine Translation (NMT) system
for the Biomedical Domain.

The available language directions for translation are:
* English to Spanish
* Spanish to English
* English to Portuguese
* Portuguese to English
* Spanish to Portuguese
* Portuguese to Spanish

Translation models must be downloaded from the Zenodo repository: https://doi.org/10.5281/zenodo.2204995


## Prerequisites

This package uses the Torch implementation of the OpenNMT system (http://opennmt.net/). Instructions to install the 
system are found in: http://opennmt.net/OpenNMT/installation/  


## Directory structure

<pre>
Tokenize.sh 	 - Utility script to tokenize the input file using BPE (needed for translation)
</pre> 
In Zenodo you will find the following files:
<pre>
enes_pt.bpe32000 	 - BPE encoding where source language are either EN/ES and target is PT
enpt_es.bpe32000 	 - BPE encoding where source language are either EN/PT and target is ES
espt_en.bpe32000 	 - BPE encoding where source language are either ES/PT and target is EN
onmt_enes_pt-4-1000-600_epoch11_62.74_release.t7 - OpenNMT model in release format (EN/ES) -> PT
onmt_enpt_es-4-1000-600_epoch11_60.38_release.t7 - OpenNMT model in release format (EN/PT) -> ES
onmt_espt_en-4-1000-600_epoch6_51.52_release.t7  - OpenNMT model in release format (ES/PT) -> EN
onmt_enes_pt-4-1000-600_epoch11_62.74.t7  - OpenNMT model in original format (EN/ES) -> PT
onmt_enpt_es-4-1000-600_epoch11_60.38_.t7 - OpenNMT model in original format (EN/PT) -> ES
onmt_espt_en-4-1000-600_epoch6_51.52.t7   - OpenNMT model in original format (ES/PT) -> EN
</pre> 


## Usage

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

OpenNMT models:
* Release format: Can be translated using GPU or CPU, cannot be modified or retrained
* Original format: Can be translated only with GPU, can be modified or retrained using Torch OpenNMT


## Examples

<pre>
$ .Tokenize.sh -d /home/user/data -s en -t es -f /home/user/text.txt -n 4 -o /home/user/OpenNMT
$ cd /home/user/OpenNMT
$ th translate.lua -model /home/user/data/onmt_enpt_es-4-1000-600_epoch11_60.38_release.t7 -gpuid 1 -src /home/user/text.txt.tok -replace_unk true -detokenize_output true -output /home/user/text.translated
</pre>


## Contact

Felipe Soares (felipe.soares@bsc.es)


## License

<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.

Copyright (c) 2018 Secretaría de Estado para el Avance Digital (SEAD)

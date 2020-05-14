#!/bin/bash
#NOTE: DO NOT EDIT THIS FILE-- MAY RESULT IN INCOMPLETE SUBMISSIONS
set -euo pipefail

CODE=(
	"cs231n/rnn_layers.py"
	"cs231n/classifiers/rnn.py"
	"cs231n/net_visualization_pytorch.py"
	"cs231n/net_visualization_tensorflow.py"
	"cs231n/style_transfer_pytorch.py"
	"cs231n/style_transfer_tensorflow.py"
	"cs231n/gan_pytorch.py"
	"cs231n/gan_tf.py"
)

# these notebooks should ideally
# be in order of questions so
# that the generated pdf is
# in order of questions
NOTEBOOKS=(
	"RNN_Captioning.ipynb"
	"LSTM_Captioning.ipynb"
	"NetworkVisualization-PyTorch.ipynb"
	"NetworkVisualization-TensorFlow.ipynb"
	"StyleTransfer-PyTorch.ipynb"
	"StyleTransfer-TensorFlow.ipynb"
	"Generative_Adversarial_Networks_PyTorch.ipynb"
	"Generative_Adversarial_Networks_TF.ipynb"
)

FILES=( "${CODE[@]}" "${NOTEBOOKS[@]}" )

LOCAL_DIR=`pwd`
ASSIGNMENT_NO=2
ZIP_FILENAME="a3.zip"

C_R="\e[31m"
C_G="\e[32m"
C_BLD="\e[1m"
C_E="\e[0m"

for FILE in "${FILES[@]}"
do
	if [ ! -f ${FILE} ]; then
		echo -e "${C_R}Required file ${FILE} not found, Exiting.${C_E}"
		exit 0
	fi
done

echo -e "### Zipping file ###"
rm -f ${ZIP_FILENAME}
zip -q "${ZIP_FILENAME}" -r ${NOTEBOOKS[@]} $(find . -name "*.py") $(find . -name "*.pyx") -x "makepdf.py"

echo -e "### Creating PDFs ###"
python makepdf.py --notebooks "${NOTEBOOKS[@]}"

echo -e "### Done! Please submit a3.zip and the pdfs to Gradescope. ###"

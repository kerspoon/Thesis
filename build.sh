
echo "------------------------------------------------------------------------------"
echo "building thesis"
echo "------------------------------------------------------------------------------"

pdflatex all.tex > pdflatex.log

echo "--------------------------------------------------------------------------------" >> pdflatex.log
echo "all done" >> pdflatex.log
echo "--------------------------------------------------------------------------------" >> pdflatex.log
pause

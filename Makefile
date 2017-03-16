
all: prepare

prepare:
	xelatex --shell-escape diffprivacy.tex

view: prepare
	open -a Skim diffprivacy.pdf

develop: prepare
	fswatch -i 'diffprivacy.tex' -e '.*' . | xargs -t -n1 -I % bash -c "xelatex --shell-escape % || osascript -e 'display notification \"Latex compilation failed\" with title \"ERROR\"'"

clean:
	rm -rf *.aux *.listing *.pdf *.out *.log _minted-diffprivacy

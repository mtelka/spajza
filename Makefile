all: data html

data:
	ln -s example data

html:
	mkdir html

test:
	./status < example/stock > example/stock-stdout 2> example/stock-stderr

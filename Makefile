all: data

data:
	ln -s example data

test:
	./status < example/stock > example/stock-stdout 2> example/stock-stderr
	cd html ; ../generator ../example/category < ../example/stock-stdout > index.html ; \
	cat ../example/category | while read line ; do \
		ID=$$(echo "$$line" | awk -F$$'\t' '{print $$1}') ; \
		../generator ../example/category "$$ID" < ../example/stock-stdout > "$$ID.html" 2> /dev/null ; \
	done

init:
	pip install -r reqs.txt

test:
	nosetests test.py

ci: init
	nosetests test.py --with-xunit --xunit-file=junit-report.xml

stats:
	pyflakes requests | awk -F\: '{printf "%s:%s: [E]%s\n", $1, $2, $3}' > violations.pyflakes.txt

site:
	cd docs; make dirhtml

docs: site

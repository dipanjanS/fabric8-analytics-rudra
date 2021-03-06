install:
	pip3 install -e .; 

venv:
	virtualenv -p python3 --no-site-packages venv-test;\
		. venv-test/bin/activate;\
		pip3 install -e .; pip3 install moto==1.3.6

clean:
	rm -rf venv-test && rm -rf rudra.egg-info && find . -type f -name '*.py[co]' -delete -o -type d -name __pycache__ -delete

run_pytest:
	. venv-test/bin/activate;\
		pytest -W ignore tests -v

test: venv run_pytest clean

.PHONY: install test venv clean run_pytest

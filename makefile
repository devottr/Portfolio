install:
	python -m pip install -Ue .[dev,pretty]

.venv:
	python -m venv .venv
	source .venv/bin/activate && make install
	echo 'run `source .venv/bin/activate` to activate virtualenv'

venv: .venv

test:
	python -m unittest -v l33t
	python -m mypy -m l33t

lint:
	python -m flake8 l33t
	python -m ufmt check l33t

format:
	python -m ufmt format l33t

release: lint test clean
	flit publish

clean:
	rm -rf .mypy_cache build dist html *.egg-info

distclean: clean
	rm -rf .venv

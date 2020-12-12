clean:
	rm -rf site

serve:
	docker run --rm -it -p 8000:8000 -v ${PWD}:/docs squidfunk/mkdocs-material

build: clean
	docker run --rm -v ${PWD}:/docs squidfunk/mkdocs-material build

publish: build
	cd site && \
		git init && \
		git add -A && \
		git commit -m "build" && \
		git push -f https://github.com/syaning/cncf-notes.git master:gh-pages

.SILENT: clean serve build publish

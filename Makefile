build:
	# HTML index
	pandoc \
		-f gfm+hard_line_breaks-ascii_identifiers \
		--metadata=pagetitle:"Eigenlicht" \
		-t html \
		-s \
		--css style.css \
		src/index.md src/_footer.md > docs/index.html
	# The game
	pandoc \
		-f gfm+hard_line_breaks-ascii_identifiers \
		--metadata=pagetitle:"Eigenlicht" \
		-t html \
		-s \
		--css ../style.css \
		src/game/index.md src/_footer.md > docs/game/index.html
	# Design notes + changelog
	pandoc \
		-f gfm+hard_line_breaks-ascii_identifiers \
		--metadata=pagetitle:"Eigenlicht" \
		-t html \
		-s \
		--css ../style.css \
		src/notes/index.md changelog.md src/_footer.md > docs/notes/index.html
	# Copy images
	cp src/img/* docs/img/

serve:
	@echo "Serving http://127.0.0.1:8000/"
	cd docs; python3 -m http.server

# For the original author only: tiny tool to download the Google Webfont and host it on server, rather than using Google Webfont service.
download-fonts:
	wget 'https://google-webfonts-helper.herokuapp.com/api/fonts/im-fell-english?download=zip&subsets=latin&variants=regular,italic' --output-document=docs/fonts/im-fell-english.zip
	cd docs/fonts; unzip im-fell-english.zip

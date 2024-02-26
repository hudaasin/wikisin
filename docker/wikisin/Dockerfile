FROM mediawiki:1.41

# Adding additional extensions

# Cloning UniversalLanguageSelector extension from Gerrit repository
RUN git clone --depth=1 --branch 2024.01 https://gerrit.wikimedia.org/r/mediawiki/extensions/UniversalLanguageSelector /var/www/html/extensions/UniversalLanguageSelector

# Copying custom extensions from local directory to container
COPY ./extensions /extensions

# Making the extract_zip.sh script executable and extracting zip files
RUN chmod +x /extensions/extract_tar.gz.sh \
    && /extensions/extract_tar.gz.sh \
    && rm -rf /extensions

COPY ./scripts /usr/local/bin/maintenance
RUN chmod +x /usr/local/bin/maintenance/*
RUN mv /usr/local/bin/maintenance/* /usr/local/bin \
    && rmdir /usr/local/bin/maintenance

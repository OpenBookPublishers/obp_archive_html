# OBP HTML reader wayback archiver
[![Build Status](https://travis-ci.org/OpenBookPublishers/obp_archive_html.svg?branch=master)](https://travis-ci.org/OpenBookPublishers/obp_archive_html)


Take a CSV file containing URLs to obtain children URLs linked and submit them to the wayback machine for archival.

## Run via crontab
```
0 12 * * 6 docker run --rm --name "htmlreader_archiver" --env-file /path/to/config.env openbookpublishers/obp_archive_html
```
or without a config file:
```
0 12 * * 6 docker run --rm --name "htmlreader_archiver" -e CSV_LOC_URL='https://url/to/csv' -e CSV_URL_COL='0' openbookpublishers/obp_archive_html
```

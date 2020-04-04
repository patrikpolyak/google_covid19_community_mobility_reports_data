# Google COVID-19 Community Mobility Reports data
Country data scraped from [Google COVID-19 Community Mobility Reports website](https://www.google.com/covid19/mobility/)

## Usage
### I want just the data
You can download output CSV file from [here](https://github.com/patrikpolyak/google_covid19_community_mobility_reports_data/blob/master/country_data.csv)

### I want to fetch and extract the data myself
Clone the repo and run [fetch_pdfs.sh](https://github.com/patrikpolyak/google_covid19_community_mobility_reports_data/blob/master/fetch_pdfs.sh) script:
```
./fetch_pdfs.sh
```

Then run the [extract_to_csv](https://github.com/patrikpolyak/google_covid19_community_mobility_reports_data/blob/master/extract_to_csv.sh) script to extract the country data:
```
./extract_to_csv.sh
```

## Requirements
* Bash 4.2+

## Libraries used
* [Apache PDFBox Command-line Tools](https://pdfbox.apache.org/2.0/commandline.html)

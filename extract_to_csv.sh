#!/bin/bash
# Requires bash 4.2+ for splitting string

output=country_data.csv
pdfbox_path="pdfbox-app-2.0.19.jar"
pdf_path="pdf/"
header="Date;Country Name;Country Code;Category;Change to baseline"
echo "$header" > "$output"

for country_pdf in $(ls $pdf_path); do
    echo Extracting data from $country_pdf
    IFS=_; read -a fields <<< "$country_pdf"
    date="${fields[0]}"
    daily_file="${date}_${output}"
    [ ! -f "$daily_file" ] && echo "$header" > "$daily_file"
    country_code="${fields[1]}"
    pdf_data=$(java -jar "$pdfbox_path" ExtractText -console -endPage 2 "$pdf_path/$country_pdf" 2> /dev/null)
    country_name=$((head -n 2 | tail -n 1 | rev | cut -d' ' -f4- | rev) <<< "$pdf_data")
    data=$(egrep -A1 'Retail|Grocery|Parks|Transit|Workplaces|Residential' <<< "$pdf_data"| grep -v '^\-\-$' | sed 'N;s/\n/;/')
    output_data=$(awk -v date=$date -v country_code=$country_code -v country_name=$country_name '{ print date ";" country_name ";" country_code ";" $0 }' <<< "$data")
    echo $output_data >> "$output"
    echo $output_data >> "$daily_file"
done

echo Done

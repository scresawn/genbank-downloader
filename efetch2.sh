#!/bin/bash

# Input file containing accession numbers
accession_file="accession_list.txt"

# Output directory
output_dir="genbank_files"

# Create output directory if it doesn't exist
if [ ! -d "$output_dir" ]; then
  mkdir -p "$output_dir"
fi

# Read accession numbers from file and download
while IFS= read -r accession; do
  echo "Downloading $accession..."

  # Construct the URL
  download_url="https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nuccore&id=$accession&rettype=gb&retmode=text"

  # Download using wget
  wget "$download_url" -O "$output_dir/$accession.gb" -q

  # Check if the download was successful
  if [ $? -eq 0 ]; then
    echo "$accession downloaded successfully to $output_dir"
  else
    echo "Error downloading $accession"
  fi
echo "Resting..."
sleep 5
done < "$accession_file"

echo "Finished downloading files."

file= "accession_file"








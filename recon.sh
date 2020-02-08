#!/bin/bash

input="$1"
while IFS= read -r line
do
echo -e "\n---- HOSTS ----\n" >> "$line.txt"
host "$line" >> "$line.txt"
echo -e "\n---- NMAP ----\n" >> "$line.txt"
nmap -A -Pn "$line" >> "$line.txt"
mkdir "$line"
assetfinder "$line" > "$line/subdomains.txt"
echo -e "\n---- WHOIS ----\n" >> "$line.txt"
whois "$line" >> "$line.txt"
echo -e "\n---- DNSRECON ----\n" >> "$line.txt"
dnsrecon -d "$line" >> "$line.txt"
done < "$input"
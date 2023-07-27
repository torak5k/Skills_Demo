#!/bin/bash

# Author: Andrew Phillips
# Date: 7/27/23

# Prompting the user for the URL. 
read -p "Please enter the URL without the 'http' or 'https': " URL

# URL is added to the command line.
python3 photon.py -u $URL 

# Creating the file for the report.
touch /Photon/$URL/report.html


# The standard list of of files that Photon generates:
    # endpoints.txt 
    # external.txt 
    # files.txt 
    # fuzzable.txt 
    # intel.txt 
    # internal.txt 
    # robots.txt 
    # scripts.txt 
    # subdomains.txt 
# 

if [[ -e /Photon/$URL/endpoints.txt ]]; then

    # Adding information from endpoints.txt to the report. 

    echo "<html>" >> /Photon/$URL/report.html
    echo "    <head> </head>" >> /Photon/$URL/report.html
    echo "        <body><h1>Endpoints</h1></body>" >> /Photon/$URL/report.html

    echo "            <ul>" >> /Photon/$URL/report.html

    sed -i 's/^/<li>/' /Photon/$URL/endpoints.txt # adds the <li> at the beginning of the line.
    sed -i 's/$/<\/li>/' /Photon/$URL/endpoints.txt # adds the </li> at the end of the line.

    cat /Photon/$URL/endpoints.txt >> /Photon/$URL/report.html

    echo "            </ul>" >> /Photon/$URL/report.html

    echo "</html>" >> /Photon/$URL/report.html

    rm /Photon/$URL/endpoints.txt

fi


if [[ -e /Photon/$URL/external.txt ]]; then

    # Adding information from external.txt to the report. 

    echo "<html>" >> /Photon/$URL/report.html
    echo "    <head> </head>" >> /Photon/$URL/report.html
    echo "        <body><h1>External</h1></body>" >> /Photon/$URL/report.html

    echo "            <ul>" >> /Photon/$URL/report.html

    sed -i 's/^/<li>/' /Photon/$URL/external.txt # adds the <li> at the beginning of the line.
    sed -i 's/$/<\/li>/' /Photon/$URL/external.txt # adds the </li> at the end of the line.

    cat /Photon/$URL/external.txt >> /Photon/$URL/report.html

    echo "            </ul>" >> /Photon/$URL/report.html

    echo "</html>" >> /Photon/$URL/report.html

    rm /Photon/$URL/external.txt

fi

if [[ -e /Photon/$URL/files.txt ]]; then

    # Adding information from files.txt to the report. 

    echo "<html>" >> /Photon/$URL/report.html
    echo "    <head> </head>" >> /Photon/$URL/report.html
    echo "        <body><h1>Files</h1></body>" >> /Photon/$URL/report.html

    echo "            <ul>" >> /Photon/$URL/report.html

    sed -i 's/^/<li>/' /Photon/$URL/files.txt # adds the <li> at the beginning of the line.
    sed -i 's/$/<\/li>/' /Photon/$URL/files.txt # adds the </li> at the end of the line.

    cat /Photon/$URL/files.txt >> /Photon/$URL/report.html

    echo "            </ul>" >> /Photon/$URL/report.html

    echo "</html>" >> /Photon/$URL/report.html

    rm /Photon/$URL/files.txt

fi


if [[ -e /Photon/$URL/fuzzable.txt ]]; then

    # Adding information from fuzzable.txt to the report. 

    echo "<html>" >> /Photon/$URL/report.html
    echo "    <head> </head>" >> /Photon/$URL/report.html
    echo "        <body><h1>Fuzzable</h1></body>" >> /Photon/$URL/report.html

    echo "            <ul>" >> /Photon/$URL/report.html

    sed -i 's/^/<li>/' /Photon/$URL/fuzzable.txt # adds the <li> at the beginning of the line.
    sed -i 's/$/<\/li>/' /Photon/$URL/fuzzable.txt # adds the </li> at the end of the line.

    cat /Photon/$URL/fuzzable.txt >> /Photon/$URL/report.html

    echo "            </ul>" >> /Photon/$URL/report.html

    echo "</html>" >> /Photon/$URL/report.html

    rm /Photon/$URL/fuzzable.txt

fi


if [[ -e /Photon/$URL/intel.txt ]]; then

    # Adding information from intel.txt to the report. 

    echo "<html>" >> /Photon/$URL/report.html
    echo "    <head> </head>" >> /Photon/$URL/report.html
    echo "        <body><h1>Intel</h1></body>" >> /Photon/$URL/report.html

    echo "            <ul>" >> /Photon/$URL/report.html

    sed -i 's/^/<li>/' /Photon/$URL/intel.txt # adds the <li> at the beginning of the line.
    sed -i 's/$/<\/li>/' /Photon/$URL/intel.txt # adds the </li> at the end of the line.

    cat /Photon/$URL/intel.txt >> /Photon/$URL/report.html

    echo "            </ul>" >> /Photon/$URL/report.html

    echo "</html>" >> /Photon/$URL/report.html

    rm /Photon/$URL/intel.txt

fi

if [[ -e /Photon/$URL/internal.txt ]]; then

    # Adding information from internal.txt to the report. 

    echo "<html>" >> /Photon/$URL/report.html
    echo "    <head> </head>" >> /Photon/$URL/report.html
    echo "        <body><h1>Internal</h1></body>" >> /Photon/$URL/report.html

    echo "            <ul>" >> /Photon/$URL/report.html

    sed -i 's/^/<li>/' /Photon/$URL/internal.txt # adds the <li> at the beginning of the line.
    sed -i 's/$/<\/li>/' /Photon/$URL/internal.txt # adds the </li> at the end of the line.

    cat /Photon/$URL/internal.txt >> /Photon/$URL/report.html

    echo "            </ul>" >> /Photon/$URL/report.html

    echo "</html>" >> /Photon/$URL/report.html

    rm /Photon/$URL/internal.txt

fi


if [[ -e /Photon/$URL/robots.txt ]]; then

    # Adding information from robots.txt to the report. 

    echo "<html>" >> /Photon/$URL/report.html
    echo "    <head> </head>" >> /Photon/$URL/report.html
    echo "        <body><h1>Robots</h1></body>" >> /Photon/$URL/report.html

    echo "            <ul>" >> /Photon/$URL/report.html

    sed -i 's/^/<li>/' /Photon/$URL/robots.txt # adds the <li> at the beginning of the line.
    sed -i 's/$/<\/li>/' /Photon/$URL/robots.txt # adds the </li> at the end of the line.

    cat /Photon/$URL/robots.txt >> /Photon/$URL/report.html

    echo "            </ul>" >> /Photon/$URL/report.html

    echo "</html>" >> /Photon/$URL/report.html

    rm /Photon/$URL/robots.txt

fi


if [[ -e /Photon/$URL/scripts.txt ]]; then

    # Adding information from scripts.txt to the report. 

    echo "<html>" >> /Photon/$URL/report.html
    echo "    <head> </head>" >> /Photon/$URL/report.html
    echo "        <body><h1>Scripts</h1></body>" >> /Photon/$URL/report.html

    echo "            <ul>" >> /Photon/$URL/report.html

    sed -i 's/^/<li>/' /Photon/$URL/scripts.txt # adds the <li> at the beginning of the line.
    sed -i 's/$/<\/li>/' /Photon/$URL/scripts.txt # adds the </li> at the end of the line.

    cat /Photon/$URL/scripts.txt >> /Photon/$URL/report.html

    echo "            </ul>" >> /Photon/$URL/report.html

    echo "</html>" >> /Photon/$URL/report.html

    rm /Photon/$URL/scripts.txt

fi


if [[ -e /Photon/$URL/subdomains.txt ]]; then

    # Adding information from subdomains.txt to the report. 

    echo "<html>" >> /Photon/$URL/report.html
    echo "    <head> </head>" >> /Photon/$URL/report.html
    echo "        <body><h1>Subdomains</h1></body>" >> /Photon/$URL/report.html

    echo "            <ul>" >> /Photon/$URL/report.html

    sed -i 's/^/<li>/' /Photon/$URL/subdomains.txt # adds the <li> at the beginning of the line.
    sed -i 's/$/<\/li>/' /Photon/$URL/subdomains.txt # adds the </li> at the end of the line.

    cat /Photon/$URL/subdomains.txt >> /Photon/$URL/report.html

    echo "            </ul>" >> /Photon/$URL/report.html

    echo "</html>" >> /Photon/$URL/report.html

    rm /Photon/$URL/subdomains.txt

fi





# Opens the report that has been created.
elinks /Photon/$URL/report.html
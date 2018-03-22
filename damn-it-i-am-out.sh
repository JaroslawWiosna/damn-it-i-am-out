#!/usr/bin/env bash

if [ "$1" == "-h" ]; then
    echo "damn-it-i-am-out v2.0"
    echo "create-conf - aby stworzyć plik konfiguracyjny"
    echo "remove-conf - aby skasować plik konfiguracyjny"
    exit 0;
fi

command -v convert > /dev/null 2>&1 || { echo >&2 "Imagemagick nie jest zainstalowany. Kończę działanie programu."; exit 1; }  
#command -v gpg     > /dev/null 2>&1 || echo >&2 "gpg required.  Aborting."; exit 1;  

configFile="$HOME/.damn-it-i-am-out.conf"
configFileEncrypted="$HOME/.damn-it-i-am-out.conf.gpg"

if [ "$1" == "remove-conf" ]; then
    rm -f $configFileEncrypted
    exit 0;
fi

if [ "$1" == "create-conf" ]; then
    command -v gpg  > /dev/null 2>&1 || { echo >&2 "GNU Privacy Guard nie jest zainstalowany. Kończę działanie programu. "; exit 1; } 
    echo "create-conf"
    
    echo "#stworzono za pomocą skryptu" > $configFile
    read -p 'Miasto: ' var
    echo : $var >> $configFile
    read -p 'Imię: ' var
    echo Imię: $var >> $configFile
    read -p 'Imię narzędnik: ' var
    echo Imię narzędnik: $var >> $configFile
    read -p 'Nazwisko: ' var
    echo Nazwisko: $var >> $configFile
    read -p 'Nazwisko narzędnik: ' var
    echo Nazwisko narzędnik: $var >> $configFile
    read -p 'Adres: ' var
    echo Adres: $var >> $configFile
    read -p 'Adres c.d.: ' var
    echo Adres c.d.: $var >> $configFile
    read -p 'Nazwa pracodawcy: ' var
    echo Nazwa pracodawcy: $var >> $configFile
    read -p 'Adres pracodawcy: ' var
    echo Adres pracodawcy: $var >> $configFile
    read -p 'Adres pracodawcy c.d.: ' var
    echo Adres pracodawcy c.d.: $var >> $configFile
    read -p 'Data podpisania umowy dd.mm.rrrr ' var
    echo Data podpisania umowy: $var >> $configFile
    read -p 'Miejsce podpisania umowy: ' var
    echo Miejsce podpisania umowy: $var >> $configFile
    
    gpg -c --cipher-algo AES256 $configFile
    rm -f $configFile
    exit 0;
fi

blankPage="blankPage.pdf"
outputPage="wypowiedzenie.pdf"
currentDate=`date +%d.%m.%Y`

if [ -f $configFileEncrypted ]; then
    echo "Znaleziono zaszyfrowany plik configuracyjny"
    echo "odszyfrowanie....:"
    gpg -d --cipher-algo AES256 $configFileEncrypted > $configFile
    echo "Odszyfrowano plik."

    # configFilePath="./.damn-it-i-am-out.conf"
    configFilePath=$configFile
    city=`cat $configFilePath | sed -n 's/^Miasto: \(.*\)$/\1/p'`
    name=`cat $configFilePath | sed -n 's/^Imię: \(.*\)$/\1/p'`
    nameInstrumentalis=`cat $configFilePath | sed -n 's/^Imię narzędnik: \(.*\)$/\1/p'`
    surname=`cat $configFilePath | sed -n 's/^Nazwisko: \(.*\)$/\1/p'`
    surnameInstrumentalis=`cat $configFilePath | sed -n 's/^Nazwisko narzędnik: \(.*\)$/\1/p'`
    address=`cat $configFilePath | sed -n 's/^Adres: \(.*\)$/\1/p'`
    address2nd=`cat $configFilePath | sed -n 's/^Adres c.d.: \(.*\)$/\1/p'`
    employerName=`cat $configFilePath | sed -n 's/^Nazwa pracodawcy: \(.*\)$/\1/p'`
    employerAddress=`cat $configFilePath | sed -n 's/^Adres pracodawcy: \(.*\)$/\1/p'`
    employerAddress2nd=`cat $configFilePath | sed -n 's/^Adres pracodawcy c.d.: \(.*\)$/\1/p'`
    contractDate=`cat $configFilePath | sed -n 's/^Data podpisania umowy: \(.*\)$/\1/p'`
    contractSigningCity=`cat $configFilePath | sed -n 's/^Miejsce podpisania umowy: \(.*\)$/\1/p'`
    firstDay=`echo $contractDate |sed -n 's/^\([[:digit:]]*\).\([[:digit:]]*\).\([[:digit:]]*\)/\2\/\1\/\3/p'`
else
    echo "Nie znaleziono pliku konfiguracyjnego"
    echo "Proszę podać dane:"
    
    read -p '[Miasto:] ' city
    read -p '[Imię:] ' name
    read -p '[Imię narzędik:] ' nameInstrumentalis
    read -p '[Nazwisko:] ' surname
    read -p '[Nazwisko narzędnik:] ' surnameInstrumentalis
    read -p '[Adres:] ' address
    read -p '[Adres c.d.:] ' address2nd
    read -p '[Nazwa pracodawcy:] ' employerName
    read -p '[Adres pracodawcy:] ' employerAddress
    read -p '[Adres pracodawcy c.d.:] ' employerAddress2nd
    read -p '[Data podpisania umowy dd.mm.rrrr:] ' contractDate
    read -p '[Miejsce podpisania umowy:] ' contractSigningCity

fi

firstDay=`echo $contractDate |sed -n 's/^\([[:digit:]]*\).\([[:digit:]]*\).\([[:digit:]]*\)/\2\/\1\/\3/p'`
contractDateF=`date -d $firstDay +%Y%m%d`
sixMonthsAgoF=`date -d 'now- 6 months' +%Y%m%d`
threeYearsAgoF=`date -d 'now- 3 years' +%Y%m%d`

if (( sixMonthsAgoF < contractDateF )); then
#  echo "Pracownik jest zatrudniony krócej niż 6 miesięcy";
  noticePeriod="dwa tygodnie"
elif (( threeYearsAgoF < contractDateF )); then
#  echo "Pracownik jest zatrudniony dłużej niż 6 miesięcy, ale krócej niż 3 lata";
  noticePeriod="jeden miesiąc"
else
#  echo "Pracownik jest zatrudniony dłużej niż 3 lata";
  noticePeriod="trzy miesiące"
fi


convert xc:none -page A4 $blankPage
convert $blankPage -font Helvetica \
 -pointsize 10 -draw "text 350,60 ' $city, $currentDate'" \
 -pointsize 10 -draw "text 100,80 '$name $surname'" \
 -pointsize 10 -draw "text 100,100'$address'"\
 -pointsize 10 -draw "text 100,120'$address2nd'" \
 -pointsize 10 -draw "text 350,140'$employerName'" \
 -pointsize 10 -draw "text 350,160'$employerAddress'" \
 -pointsize 10 -draw "text 350,180'$employerAddress2nd'" \
 -pointsize 12 -draw "text 200,300 'Wypowiedzenie umowy o pracę'" \
 -pointsize 10 -draw "text 80,400 'Niniejszym wypowiadam umowę o pracę zawartą dnia $contractDate w miejscowości $contractSigningCity pomiędzy '" \
 -pointsize 10 -draw "text 50,420 '$employerName a $nameInstrumentalis $surnameInstrumentalis'" \
 -pointsize 10 -draw "text 50,440 'z zachowaniem okresu wypowiedzenia wynoszącego $noticePeriod.'" \
 -pointsize 10 -draw "text 350,500 'z poważaniem'" \
 -pointsize 10 -draw "text 350,520 '____________________________'" \
 -pointsize 8 -draw "text 350,530 '(Imię i nazwisko pracownika)'" \
 -pointsize 10 -draw "text 50,600 'Potwierdzam otrzymanie wypowiedzenia'" \
 -pointsize 10 -draw "text 50,620 '____________________________'" \
 -pointsize 8 -draw "text 50,630 '(Podpis pracodawcy)'" \
  $outputPage

rm -f $blankPage

echo "Pomyślnie wygenerowano plik $outputPage"


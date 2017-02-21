#!/bin/sh

### Stolen from: http://askubuntu.com/questions/73474/how-to-install-firefox-addon-from-command-line-in-scripts

EXTENSIONS_SYSTEM='/usr/share/mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}/'
EXTENSIONS_USER=`echo ~/.mozilla/firefox/*.default/extensions/`

# -------------------------- xpi tools ---------------------------------

get_addon_id_from_xpi () { #path to .xpi file
    addon_id_line=`unzip -p $1 install.rdf | egrep '<em:id>' -m 1`
    addon_id=`echo $addon_id_line | sed "s/.*>\(.*\)<.*/\1/"`
    echo "$addon_id"
}

get_addon_name_from_xpi () { #path to .xpi file
    addon_name_line=`unzip -p $1 install.rdf | egrep '<em:name>' -m 1`
    addon_name=`echo $addon_name_line | sed "s/.*>\(.*\)<.*/\1/"`
    echo "$addon_name"
}

# Installs .xpi given by relative path
# to the extensions path given
install_addon () {
    xpi="${PWD}/${1}"
    extensions_path=$2
    new_filename=`get_addon_id_from_xpi $xpi`.xpi
    new_filepath="${extensions_path}${new_filename}"
    addon_name=`get_addon_name_from_xpi $xpi`
    if [ -f "$new_filepath" ]; then
        echo "File already exists: $new_filepath"
        echo "Skipping installation for addon $addon_name."
    else
        cp "$xpi" "$new_filepath"
    fi
}

### Actuall installations...

dl_inst_id () {
	wget https://addons.mozilla.org/firefox/downloads/latest/$1/addon-$1-latest.xpi
	install_addon addon-$1-latest.xpi "$EXTENSIONS_USER"
}

dl_inst_id 607454 # uBlock Origin

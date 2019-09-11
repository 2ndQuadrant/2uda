#/bin/bash -X

# A custom function for Search & replace in a file
Replace() {
string=''
if [ "$2" != "undef" ];
then
	string=$2
fi
	
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*) 
   
	sed -e "s:$1:$string:g" $3 > "/tmp/$$.tmp" || _die "Failed for search and replace '$1' with '$string' in $3"
    	mv /tmp/$$.tmp $3 || _die "Failed to move /tmp/$$.tmp to $3"
	;;
    Darwin*) 
	sed "s:$1:$string:g" $3 > "/tmp/$$.tmp" || _die "Failed for search and replace '$1' with '$string' in $3"
    	mv /tmp/$$.tmp $3 || _die "Failed to move /tmp/$$.tmp to $3"
;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw
	sed "s:$1:$string:g" $3 > "/tmp/$$.tmp" || _die "Failed for search and replace '$1' with '$string' in $3"
        mv /tmp/$$.tmp $3 || _die "Failed to move /tmp/$$.tmp to $3"
;;
    *)          machine="UNKNOWN:${unameOut}"
esac

}

source ./installer-properties.sh

<<COMENT
Create a copy of the 2UDA.xml.in as 2UDA.xml
Get all the versions from properties.sh 
And replace versions with orignal values in the xml file
COMENT

if [ -f 2UDA.xml ];
then
	rm -vf 2UDA.xml || echo "Error in removing old xml file"
fi

# Copy .xml.in as .xml
cp 2UDA.xml.in 2UDA.xml || echo "Error in creating 2UDA.xml"

# Copy 2uda-postgresql.service as 2uda-postgresql-$__PG_MAJOR_VERSION__.service - where $__PG_MAJOR_VERSION__ wil be from properties.sh file
cp installer_scripts/2uda-postgresql.service installer_scripts/2uda-postgresql-$__PG_MAJOR_VERSION__.service

<<COMENT
Calling Replace function to replace versions placeholders with orignal values in .xml & .service files
Syntax - Replace $find $replace $file
COMENT

Replace __PG_MAJOR_VERSION__     $__PG_MAJOR_VERSION__      installer_scripts/2uda-postgresql-$__PG_MAJOR_VERSION__.service || (echo "Error in setting PostgreSQL major version in .service file exit now ..." && exit 1)
Replace __PG_MAJOR_VERSION__     $__PG_MAJOR_VERSION__      2UDA.xml || (echo "Error: Setting PostgreSQL major version in .xml file exit now ..." && exit 1)
Replace __FULL_VERSION__         $__FULL_VERSION__          2UDA.xml || (echo "Error: Setting PostgreSQL full version in .xml file exit now ..."  && exit 1)
Replace __EXTRA_VERSION_STRING__ $__EXTRA_VERSION_STRING__  2UDA.xml || (echo "Error: Setting extra version string in .xml file exit now ..."     && exit 1)
Replace __BUILD_NUMBER__         $__BUILD_NUMBER__          2UDA.xml || (echo "Error: Setting build number in .xml file exit now ..."             && exit 1)
Replace __DEBUG__                $__DEBUG__                 2UDA.xml || (echo "Error: Setting debug value in .xml file exit now ..."              && exit 1)

# If $__RELEASE__ = 1 then we just need to replace __DEV_TEST__ with an epmty string and if $__RELEASE__ = 0 then we need to use $__DEV_TEST__ value in installer name
if [ "$__RELEASE__" = "1" ];
then
Replace __DEV_TEST__ ""            2UDA.xml || (echo "Error: Setting dev prefix in .xml file exit now ..." && exit 1)
else
Replace __DEV_TEST__ $__DEV_TEST__ 2UDA.xml || (echo "Error: Setting dev prefix in .xml file exit now ..." && exit 1)
fi

# Final message
echo "2UDA.xml generated successfully ..."

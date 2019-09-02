<<COMENT
- installer-properties.sh

Main configuration file for 2UDA installer. User can use this file to generate installer according to requiremennts.
Here is the detail about all the variables and expected values

__FULL_VERSION__
	Description: This variable will be used to specify the ful version for PostgreSQL
	Value: 9.5.15, 9.6.19, 10.10 or 11.5(default)

__PG_MAJOR_VERSION__
	Description: This variable will be used to specify the Major version for PostgreSQL
	Value: 9.5, 9.6, 10 or 11(default)

__BUILD_NUMBER__
	Description: This variable will be used to assign the build number to the installer
	Value: 1(default), 2, 3, 4 or 5
	NOTE: It is always a good practice to increase the build number each time you generate the installer against same version

__RELEASE__
	Description: This variable will be used to identify if this is a test installer or a release installer
	Vaule: 0 or 1(default)
	NOTE: 0 is for generating a test installer and 1 is for generating a release installer

__DEV_TEST__
	Description: If you plan to generate the installer for some testing purpose then you can type some helpuff string here i.e,
        Value: undef(default), internal-testing, test-installer
        NOTE: iF RELEASE variable is set to 1 in that case this variable will be ignored
COMENT


__FULL_VERSION__=11.5
__PG_MAJOR_VERSION__=11
__BUILD_NUMBER__=1
__RELEASE__=1
__DEV_TEST__=undef
__DEBUG__=0
__EXTRA_VERSION_STRING__=undef

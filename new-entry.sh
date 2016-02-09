#!bin/sh

# USAGE:
#   new-entry sides


print_help_and_exit()
{
	echo "Usage:"
	echo "	new-entry <drinks|main|sides> <entry_name>"
	exit 1
}

if (($# != 2)); then
	echo "Wrong number of arguments"
	print_help_and_exit
fi

TARGET_MD=$1"/README.md"
ENTRY=$2

if [ ! -e $TARGET_MD ]; then
	echo "Bad First argument: $1"
	echo "Bad First argument: $TARGET_MD"
	print_help_and_exit
fi

echo "adding $ENTRY to $TARGET_MD"
ENTRY_TEMPLATE='
## $ENTRY
### Ingredients
```
Serves: _people
```
### Directions
1. Under Construction
### Resources
'

# echo $ENTRY_TEMPLATE >> $TARGET_MD
ENTRY_LINK=`echo $ENTRY | awk '{print tolower($0)}' | sed 's/ /-/g'`
echo $ENTRY_LINK

AWK_STATEMENT='/^-/ && !modif { printf('"- [$ENTRY](#$ENTRY_LINK)"'); modif=1 } {print}'
# awk '/^$/ $$ !modif { printf("INSERT\n"); modif=1} {print}' $TARGET_MD
awk '/^-/ && !modif { printf("- [ENVIRON[\"ENTRY\"]](#$TRY_LINK)\n"); modif=1 } {print}' $TARGET_MD
echo $TARGET_MD
# echo $AWK_STATEMENT
# awk $AWK_STATEMENT $TARGET_MD
echo "Done!"
exit 0

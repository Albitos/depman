# Author : Teddy Skarin

# 1. Create ProgressBar function
# 1.1 Input is currentState($1) and totalState($2)
function depman_progress()
{
  _count=$1
  _total=$2
  _label=$3

  if [ $_count -gt $_total ]; then
      _count=$_total
  fi

  # Process data
  _progress=$(( $_count * 100 / $_total * 100 / 100 ))
  _done=$(( $_progress * 4 / 10))
  _left=$(( 40 - $_done ))

  # Build progressbar string lengths
  _done=$(printf "%${_done}s")
  _left=$(printf "%${_left}s")

  # 1.2 Build progressbar strings and print the ProgressBar line
  # 1.2.1 Output example:
  # 1.2.1.1 Progress : [########################################] 100%
  printf "\r$_label : [${_done// /#}${_left// /-}] ($_count/$_total) ${_progress}%%"
}

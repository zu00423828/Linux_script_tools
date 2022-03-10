for path in $1/*.tar.gz
do
	#  echo $path	
	tar -zxvf $path -C $2
done 

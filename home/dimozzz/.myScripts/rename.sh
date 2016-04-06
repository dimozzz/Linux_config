cd "${1}"
for i in *.mp3;
do
	mv "${i}" "${i:0:2} - ${i:3:100}";
done


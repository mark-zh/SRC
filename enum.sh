for i in $(cat baidu.txt); do
	~/recon/tools/subfinder -d $i -o $i.txt
	python3 ~/recon/tools/Sublist3r/sublist3r.py -d $i | tee -a $i.txt
	~/recon/tools/assetfinder --subs-only $i | tee -a $i.txt
	sort -u $i.txt -o $i.txt
	python3 ~/recon/tools/ESD-1.0/ESD.py $i
	cd ~/recon/tools/subDomainsBrute && python3 subDomainsBrute.py $i --full
done

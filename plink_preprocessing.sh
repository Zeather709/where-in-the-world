./plink --23file genome_Heather_Zurel_v4_Full_20211025042907.txt --make-bfile --out zeather_genome

./plink --bfile "1000g/1kg_phase1_all" --extract common_snps.txt --out tg_filtered --make-bed

./plink --bfile zeather_genome --extract common_snps.txt --make-bed --out zeather_filtered

./plink --bfile tg_filtered --bmerge zeather_filtered --make-bed --out zeather_tg

./plink --bfile zeather_filtered --exclude zeather_tg-merge.missnp --out zeather_filtered --make-bed

./plink --bfile tg_filtered --exclude zeather_tg-merge.missnp --out tg_filtered --make-bed

./plink --bfile tg_filtered --bmerge zeather_filtered --make-bed --out zeather_tg

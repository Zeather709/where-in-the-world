./plink --bfile zeather_tg --rel-cutoff 0.125 --make-bed --out zeather_tg_norels

./plink --bfile zeather_tg_norels --pca 100 tabs header --out zeather_tg

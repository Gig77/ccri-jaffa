fusions <- read.csv("/mnt/projects/jaffa/results/jaffa_results.csv", stringsAsFactors = F, check.names = F)
ann <- read.delim("/mnt/projects/jaffa/data/sample-annotation.tsv", stringsAsFactors = F, check.names = F)

ann$Filename <- gsub("(.bam|.txt.gz|.fastq.gz)", "", basename(ann$Filename))
fusions <- merge(fusions, ann, by.x="sample", by.y="Filename", all.x = T)

write.table(fusions, "/mnt/projects/jaffa/results/jaffa_results.annotated.tsv", col.names = T, row.names = F, quote = F, sep = "\t")

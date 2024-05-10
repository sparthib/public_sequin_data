library(readr)
library(here)
library(dplyr)
data <- read_tsv(here("raw_data", "samples.tsv"))


colnames(data)
# [1] "sample_alias"                           
# [2] "Spike in concentration"                 
# [3] "cellLine"                               
# [4] "protocol"                               
# [5] "flowcell"                               
# [6] "kit"                                    
# [7] "Platform"                               
# [8] "Mux_id"                                 
# [9] "basecaller_version*"                    
# [10] "generation_date"                        
# [11] "matched_RNA_modification_data"          
# [12] "fast5_path"                             
# [13] "fastq_path"                             
# [14] "genome_bam_path"                        
# [15] "transcriptome_bam_path"                 
# [16] "bigbed_path"                            
# [17] "bigwig_path"                            
# [18] "fast5_ENA[not recommended for download]"
# [19] "fastq_ENA[not recommended for download]"
# [20] "blow5_path"                             
# [21] "blow5_index_path"


spike_in <- data |> filter(!is.na(`Spike in concentration`)) |> select( `Spike in concentration`, 
                                                                        kit,protocol, Platform)

View(spike_in)


table(spike_in$protocol, spike_in$Platform)


fastqs <- data |> filter(!is.na(`Spike in concentration`)) |> select(fastq_path) 

genome_bams <- data |> filter(!is.na(`Spike in concentration`)) |> select(genome_bam_path)

transcriptome_bams <- data |> filter(!is.na(`Spike in concentration`)) |> select(transcriptome_bam_path)

bigwigs <- data |> filter(!is.na(`Spike in concentration`)) |> select(bigwig_path)


#save fastqs as a text file
write.table(fastqs, file = here("raw_data", "fastqs.txt"), sep = "\t", row.names = FALSE)

#save genome_bams as a text file
write.table(genome_bams, file = here("raw_data", "genome_bams.txt"), sep = "\t", row.names = FALSE)

#save transcriptome_bams as a text file
write.table(transcriptome_bams, file = here("raw_data", "transcriptome_bams.txt"), sep = "\t", row.names = FALSE)

#save bigwigs as a text file
write.table(bigwigs, file = here("raw_data", "bigwigs.txt"), sep = "\t", row.names = FALSE)




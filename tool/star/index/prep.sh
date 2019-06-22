mkdir STAR_reference
mkdir ref
cd ref

wget ftp://ftp.ensembl.org/pub/release-95/fasta/homo_sapiens/dna/Homo_sapiens.GRCh38.dna.primary_assembly.fa.gz
wget ftp://ftp.ensembl.org/pub/release-95/gtf/homo_sapiens/Homo_sapiens.GRCh38.95.gtf.gz

gunzip Homo_sapiens.GRCh38.dna.primary_assembly.fa.gz
gunzip Homo_sapiens.GRCh38.95.gtf.gz

wget ftp://ftp.ensembl.org/pub/release-95/fasta/homo_sapiens//cdna/Homo_sapiens.GRCh38.cdna.all.fa.gz
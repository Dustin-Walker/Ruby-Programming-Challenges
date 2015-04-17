# http://www.reddit.com/r/dailyprogrammer/comments/2zyipu/20150323_challenge_207_easy_bioinformatics_1_dna/
dnaPairs = { 'A' => 'T', 'T' => 'A', 'C' => 'G', 'G' => 'C' }
codonHash = { 'TTT' => 'Phe', 'TTC' => 'Phe', 'TTA' => 'Leu', 'TTG' => 'Leu',  'CTT' => 'Leu', 'CTC' => 'Leu', 'CTA' => 'Leu', 'CTG' => 'Leu',  'ATT' => 'Ile', 'ATC' => 'Ile', 'ATA' => 'Ile', 'ATG' => 'Met', 'GTT' => 'Val', 'GTC' => 'Val', 'GTA' => 'Val', 'GTG' => 'Val', 'TCT' => 'Ser', 'TCC' => 'Ser', 'TCA' => 'Ser', 'TCG' => 'Ser', 'CCT' => 'Pro', 'CCC' => 'Pro', 'CCA' => 'Pro', 'CCG' => 'Pro', 'ACT' => 'Thr', 'ACC' => 'Thr', 'ACA' => 'Thr', 'ACG' => 'Thr', 'GCT' => 'Ala' , 'GCC' => 'Ala' , 'GCA' => 'Ala' , 'GCG' => 'Ala' , 'TAT' => 'Tyr' , 'TAC' => 'Tyr' , 'TAA' => 'STOP' , 'TAG' => 'STOP' , 'CAT' => 'His' , 'CAC' => 'His' , 'CAA' => 'Gln' , 'CAG' => 'Gln' , 'AAT' => 'Asn' , 'AAC' => 'Asn' , 'AAA' => 'Lys' , 'AAG' => 'Lys' , 'GAT' => 'Asp' , 'GAC' => 'Asp' , 'GAA' => 'Glu' , 'GAG' => 'Glu' , 'TGT' => 'Cys' , 'TGC' => 'Cys' , 'TGA' => 'STOP' , 'TGG' => 'Trp' , 'CGT' => 'Arg' , 'CGC' => 'Arg' , 'CGA' => 'Arg' , 'CGG' => 'Arg' , 'AGT' => 'Ser' , 'AGC' => 'Ser' , 'AGG' => 'Arg' , 'AGA' => 'Arg' , 'GGT' => 'Gly' , 'GGC' => 'Gly' , 'GGA' => 'Gly' , 'GGG' => 'Gly'}
inputLine = gets.chomp.delete(" ")
inputLine.each_char { |c| print dnaPairs[c].to_s + " " }
print "\n"
inputLine.chars.each_slice(3) { |c| print codonHash[c.join.to_s]+"   " }
print "\n"

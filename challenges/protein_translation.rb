require 'pry'

class InvalidCodonError < StandardError
end

class Translation
  TRANSLATIONS = {
    "Methionine"    => ["AUG"],
    "Phenylalanine" => ["UUU", "UUC"],
    "Leucine"       => ["UUA", "UUG"],
    "Serine"        => ["UCU", "UCC", "UCA", "UCG"],
    "Tyrosine"      => ["UAU", "UAC"],
    "Cysteine"      => ["UGU", "UGC"],
    "Tryptophan"    => ["UGG"],
    "STOP"          => ["UAA", "UAG", "UGA"]
  }

  def self.of_codon(codon)
    TRANSLATIONS.select {|key, value| value.include? codon}.keys.first
  end

  def self.of_rna(strand)
    codons = strand.scan(/.../)
    protein_strand = []

    codons.each do |codon|
      amino_acid = self.of_codon(codon)
      raise InvalidCodonError unless amino_acid
      break if amino_acid == "STOP"
      protein_strand << amino_acid 
    end

    protein_strand
  end
end

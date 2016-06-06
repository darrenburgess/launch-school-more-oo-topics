require 'pry'
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
    TRANSLATIONS.select {|key, value| value.include? codon}.keys[0]
  end

  def self.of_rna(strand)
  end
end

p Translation.of_codon('UUU')

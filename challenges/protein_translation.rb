require 'pry'

class InvalidCodonError < StandardError
end

class Translation
  TRANSLATIONS = {
    'Methionine'    => %w(AUG),
    'Phenylalanine' => %w(UUU UUC),
    'Leucine'       => %w(UUA UUG),
    'Serine'        => %w(UCU UCC UCA UCG),
    'Tyrosine'      => %w(UAU UAC),
    'Cysteine'      => %w(UGU UGC),
    'Tryptophan'    => %w(UGG),
    'STOP'          => %w(UAA UAG UGA)
  }.freeze

  def self.of_codon(codon)
    TRANSLATIONS.select { |_, value| value.include? codon }.keys.first
  end

  def self.of_rna(strand)
    codons = strand.scan(/.../)
    protein_strand = []

    codons.each do |codon|
      amino_acid = of_codon(codon)
      fail InvalidCodonError unless amino_acid
      break if amino_acid == 'STOP'
      protein_strand << amino_acid
    end

    protein_strand
  end
end

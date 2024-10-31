#!/usr/bin/perl
use strict;
use warnings;

# Vérifie que le nom du fichier a été passé en argument
if (@ARGV != 1) {
    die "Utilisation: $0 fichier_entree.txt\n";
}

# Récupère le nom du fichier d'entrée depuis les arguments
my $input_file = $ARGV[0];

# Vérifie que le fichier d'entrée a bien l'extension .txt
unless ($input_file =~ /\.txt$/) {
    die "Le fichier d'entrée doit avoir l'extension .txt\n";
}

# Génère le nom du fichier de sortie en remplaçant .txt par _reduced.txt
(my $output_file = $input_file) =~ s/\.txt$/_reduced.txt/;

# Ouvre le fichier d'entrée
open(my $in, '<', $input_file) or die "Impossible d'ouvrir le fichier '$input_file': $!";

# Initialise une structure de données pour stocker la valeur la plus proche pour chaque année
my %closest_data;

# Boucle sur chaque ligne du fichier
while (my $line = <$in>) {
    chomp $line;
    
    # Sépare la ligne en colonnes
    my @columns = split(/\s+/, $line);
    
    # Extraire et arrondir l'année
    my $year_decimal = $columns[0];
    my $year_rounded = int($year_decimal + 0.5);

    # Calcule la différence absolue entre l'année décimale et l'année arrondie
    my $diff = abs($year_decimal - $year_rounded);

    # Si aucune donnée n'est encore enregistrée pour cette année, ou si la nouvelle entrée est plus proche
    if (!exists $closest_data{$year_rounded} || $diff < $closest_data{$year_rounded}{diff}) {
        $closest_data{$year_rounded} = {
            year => $year_decimal,
            east => $columns[1] * 100,
            north => $columns[2] * 100,
            diff => $diff,
        };
    }
}
close($in);

# Ouvre le fichier de sortie
open(my $out, '>', $output_file) or die "Impossible d'ouvrir le fichier '$output_file': $!";

# Écrit les données filtrées dans le fichier de sortie
for my $year (sort { $a <=> $b } keys %closest_data) {
    my $data = $closest_data{$year};
    print $out "$year\t$data->{east}\t$data->{north}\n";
}

close($out);

print "Les données filtrées ont été enregistrées dans '$output_file'.\n";

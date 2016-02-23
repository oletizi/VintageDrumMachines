#!/usr/bin/perl -w
use strict;

foreach (<STDIN>) {
  my $filename = $_;
  chomp($filename);
  if ($filename =~ /.+WAV/) {
    my ($type, $tuneLabel, $tune, $attackLabel, $attack, $decayLabel, $decay) = split //, $filename;
    my $transformed = $type . "_T" . valueTransform($tune) . "_A" . valueTransform($attack) . "_D" . valueTransform($decay) . ".WAV";
    print "$filename -> $transformed\n";
    `mv $filename $transformed`;
  }
}

sub valueTransform {
  my ($value) = @_;
  if ($value eq 'A') {
    return 10;
  } else {
    return "0$value";
  }
}

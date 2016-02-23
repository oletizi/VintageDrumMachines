#!/usr/bin/perl -w
use strict;

my ($dir, $group, $key) = @ARGV;
opendir(DIR, $dir);

my $groupName = "\$" . $dir . "group";
my $keyName= "\$" . $dir . "key";

print "#define " . $groupName . " " . $group . "\n";
print "#define " . $keyName . " " . $key . "\n";

print "<group>\n";
print "group=$groupName\n";
print "key=$keyName\n";
print "off_by=$groupName\n";
print "\n";

foreach (readdir(DIR)) {
  my $filename = $_;
  chomp $filename;

  if ($filename =~ /.*WAV/) {
    my ($type, $tune, $attack, $decay) = split /_/, $filename;
    print "<region>                    // tune: $tune, attack: $attack, decay: $decay\n";
    print "sample=$dir/$filename\n";
    print "\n";
    #print "$filename: type: $type, tune: $tune, attack: $attack, decay: $decay\n";
  }
}

closedir(DIR);

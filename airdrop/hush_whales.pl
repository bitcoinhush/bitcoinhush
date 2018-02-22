

use strict;
use warnings;

while (<>) {
    my ($addr,$amount) = split /,/;
    chomp $amount;
    if ($amount >= 1000 && $addr) {
        print "$amount,$addr\n";
    }
}

use strict;
use warnings;
use utf8;
use Test::More;
use String::Slack;

our $pattern = {
    bold         => "*",
    italics      => "_",
    code         => "`",
    preformatted => "```",
    quote        => ">",
    emoji        => ":",
};
my  $text = "text";

for my $mothod (keys %$pattern) {
    my $hold = $pattern->{$mothod};
    subtest $mothod => sub {
        *func = "String::Slack::$mothod";
        my $str  = *func->($text);
        my $str2 = String::Slack->new($text)->$mothod;
        isa_ok $str2,            'String::Slack';
        is     $str,             $hold . $text . $hold;
        is     $str2->stringify, $hold . $text . $hold;
    };
}

done_testing();

package String::Slack;

use strict;
use warnings;

=head1 NAME

String::Slack - add markdown character for slack.

=head1 SYNOPSIS

  use String::Slack;
  my $bold_message = String::Slack::bold("message");

=head1 DESCRIPTION

String::Slack is add markdown character your text at slack.com for perl.

=cut

our $VERSION  = '0.01';
our $IS_BLESS = sub { return ref $_[0] eq __PACKAGE__ ? 1 : 0 };

=head1 CONSTRUCTOR AND STARTUP

=head2 new

Creates and returns a new String::Slack object.

if using oop-style.

    my $obj = String::Slack->new("message");
    my $formatted_message = $obj->bold->italics->stringify;

=cut

sub new {
    my $class = shift;
    my $self  = bless {}, $class;
    $self->{string} = shift || "";
    return $self;
}

=head1 MESSAGE FORMATTING METHODS

adding text bold, italics, code, preformatted, quote and emoji.

=over

=item B<bold>
=item B<italics>
=item B<code>
=item B<preformatted>
=item B<quote>
=item B<emoji>

=back

=cut

sub bold         { $IS_BLESS->($_[0]) ? $_[0]->_brace('*')   : _brace($_[0], '*')   }
sub italics      { $IS_BLESS->($_[0]) ? $_[0]->_brace('_')   : _brace($_[0], '_')   }
sub code         { $IS_BLESS->($_[0]) ? $_[0]->_brace('`')   : _brace($_[0], '`')   }
sub preformatted { $IS_BLESS->($_[0]) ? $_[0]->_brace('```') : _brace($_[0], '```') }
sub quote        { $IS_BLESS->($_[0]) ? $_[0]->_brace('>') : _brace($_[0], '>')     }
sub emoji        { $IS_BLESS->($_[0]) ? $_[0]->_brace(':') : _brace($_[0], ':')     }

=head2 stringify

if using oop-style then, make a string from self.

=cut

sub stringify { $IS_BLESS->($_[0]) ? $_[0]->{string} : $_[0] }

=head1 PRIVATE METHODS

=over

=item B<_brace>

a text between the markdown character.

=cut

sub _brace {
    my $string   = $IS_BLESS->($_[0]) ? $_[0]->{string} : $_[0];
    my $hold     = $_[1];
    $string      = sprintf("%s%s%s", $hold, $string, $hold);
    if($IS_BLESS->($_[0])){
        $_[0]->{string} = $string;
        return $_[0];
    }
    return $string;
}

=back

=head1 AUTHOR

likkradyus E<lt>perl {at} li.que.jpE<gt>

=head1 SEE ALSO

L<slack.com>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;

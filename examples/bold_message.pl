use strict;
use warnings;
use Furl;
use JSON::XS              qw/encode_json/;
use HTTP::Request::Common qw/POST/;
use String::Slack;

my $message = 'hoge';
my $url     = 'https://slack.com/api/chat.postMessage';
my $token   = 'xxxxx-XXXX-XXXX';
my $channel = 'XXXXXXX';

my $data = {
    channel => $channel,
    text    => String::Slack->new($message)->bold->italics->stringify,
    as_user => 1,
};

my $request = POST($url,
    Content_Type => 'form-data',
    Content      => [
        token => $token,
        %$data,
    ]
);

my $res = Furl->new->request($request);

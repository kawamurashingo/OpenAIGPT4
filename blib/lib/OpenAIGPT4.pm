package OpenAIGPT4;

use strict;
use warnings;

our $VERSION = '0.01';

# ABSTRACT: Interact with the OpenAI GPT-4 API

use LWP::UserAgent;
use HTTP::Request::Common qw(POST);
use JSON;

sub new {
    my ($class, $api_key) = @_;

    my $self = {
        api_key => $api_key,
        ua      => LWP::UserAgent->new,
    };

    return bless $self, $class;
}

sub generate_text {
    my ($self, $prompt) = @_;

    my $req = POST 'https://api.openai.com/v1/engines/davinci-codex/completions',
        Content_Type    => 'application/json',
        Content         => to_json({ prompt => $prompt, max_tokens => 100 }),
        'Authorization' => 'Bearer ' . $self->{api_key};

    my $res = $self->{ua}->request($req);

    if ($res->is_success) {
        my $data = from_json($res->decoded_content);
        return $data->{choices}[0]{text};
    }
    else {
        die $res->status_line;
    }
}

1;

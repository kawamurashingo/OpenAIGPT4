package OpenAIGPT4;

use strict;
use warnings;

our $VERSION = '0.02';

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

    my $req = POST 'https://api.openai.com/v1/chat/completions',
        Content_Type => 'application/json',
        Content => to_json({
            messages => [{
                role => 'user',
                content => $prompt
            }],
            model => 'gpt-3.5-turbo',
            temperature => 0.7
        }),
        Authorization => 'Bearer ' . $self->{api_key};

    my $res = $self->{ua}->request($req);

    if ($res->is_success) {
        my $data = from_json($res->decoded_content);
        return $data->{choices}[0]{message}{content};
    }
    else {
        die $res->status_line;
    }
}

package OpenAIGPT4;

use strict;
use warnings;

our $VERSION = '0.05';

# ABSTRACT: Interact with the OpenAI GPT-4 API

use LWP::UserAgent;
use LWP::Protocol::https
use HTTP::Request::Common qw(POST);
use JSON;

=head1 NAME

OpenAIGPT4 - Interact with the OpenAI GPT-4 API

=head1 VERSION

Version 0.05

=head1 SYNOPSIS

    use OpenAIGPT4;

    my $gpt = OpenAIGPT4->new('<your_api_key>');
    my $response = $gpt->generate_text('Hello, how are you?');
    print $response;

=head1 DESCRIPTION

This module provides a Perl interface to the OpenAI GPT-4 API. It currently supports generating text given a prompt.

=head1 METHODS

=head2 new

    my $gpt = OpenAIGPT4->new('<your_api_key>');

This constructor returns a new OpenAIGPT4 object. You must pass your OpenAI API key as the argument.

=head2 generate_text

    my $response = $gpt->generate_text('Hello, how are you?');

This method generates text given a prompt. The argument should be a string containing the prompt. It returns the generated text.

=head1 AUTHOR

Kawamura Shingo, <pannakoota@gmail.com>

=head1 LICENSE AND COPYRIGHT

Copyright 2023 Kawamura Shingo.

This program is free software; you can redistribute it and/or modify it under the same terms as Perl itself.

=head1 SYNOPSIS

    use OpenAIGPT4;

    my $gpt = OpenAIGPT4->new('<your_api_key>');
    my $response = $gpt->generate_text('Hello, how are you?');
    print $response;

    # Or for a more interactive example:

    my $gpt4 = OpenAIGPT4->new('<your_api_key>');
    print "ChatGPT: Hello! Let's start a conversation.\n";

    while (1) {
        print "User: ";
        my $user_input = <STDIN>;
        chomp $user_input;

        # Send the user's input to the API and receive a response
        my $response = $gpt4->generate_text($user_input);

        # Display the response
        print "ChatGPT: $response\n";

        # Check for exit condition (e.g., input of the keyword "exit")
        if ($user_input eq 'exit') {
            last; # Exit the loop to end the conversation
        }
    }

=cut

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

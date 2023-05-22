# OpenAIGPT4 Perl Module

OpenAIGPT4 is a Perl module that enables developers to interface with the OpenAI GPT-4 API. With this module, you can easily generate natural language text.
https://metacpan.org/pod/OpenAIGPT4
## Features

- Generate text that sounds like natural language with the OpenAI GPT-4 API.

## Installation

You can install this module from CPAN using one of the following commands:

With CPAN:

```perl
cpan OpenAIGPT4
```

With CPANM:

```perl
cpanm OpenAIGPT4
```

## Usage

Here is a basic example of using this module:

First, import the module and create a new OpenAIGPT4 object:

```perl
use OpenAIGPT4;
my $gpt = OpenAIGPT4->new('<your_api_key>');
my $gpt = OpenAIGPT4->new('<your_api_key>', 'http://open_ai_host_url');
```

This constructor returns a new OpenAIGPT4 object. You must pass your OpenAI API key as the argument. The open ai host url is optional, and can be used for running against a LocalAI API server.

Then, generate text by providing a prompt:

```perl
my $prompt = "Once upon a time";
my $generated_text = $gpt4->generate_text($prompt);
print $generated_text;
```

## Dependencies

This module depends on the following Perl modules:

- LWP::UserAgent
- LWP::Protocol::https
- HTTP::Request::Common
- JSON

## License

This module is distributed under the terms of the Artistic License 2.0.

Please see [LICENSE](https://opensource.org/licenses/Artistic-2.0) for more details.

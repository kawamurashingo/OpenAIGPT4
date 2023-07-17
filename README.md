# OpenAIGPT4 Perl Module

OpenAIGPT4 is a Perl module that enables developers to interface with the OpenAI GPT-3,4 API. With this module, you can easily generate natural language text.

[OpenAIGPT4 on MetaCPAN](https://metacpan.org/pod/OpenAIGPT4)

## Dependencies

This module depends on the following Perl modules:

- LWP::UserAgent
- LWP::Protocol::https
- HTTP::Request::Common
- JSON

## Features

- Generate text that sounds like natural language with the OpenAI GPT-3,4 API.
- Debug mode for detailed logging of HTTP requests and responses to and from the OpenAI API.

## Installation

The module is self-contained and can be included directly into your project. Save it as OpenAIGPT4.pm and ensure that Perl's @INC array can reference its location.

```bash
perl Makefile.PL
make
make test
make install
```

With CPAN:

```perl
sudo cpan OpenAIGPT4
```

With CPANM:

```perl
sudo cpanm OpenAIGPT4
```

## Getting an API Key
You will need an API key to use the OpenAI GPT-3,4 API. You can get an API key from [OpenAI's API key page](https://platform.openai.com/account/api-keys).

## Usage

### Create an OpenAIGPT4 object

```perl
use OpenAIGPT4;
my $gpt = OpenAIGPT4->new('YOUR_OPENAI_API_KEY');
```

Replace 'YOUR_OPENAI_API_KEY' with your API key obtained from the OpenAI dashboard.

### Generate text

Use the generate_text method to generate text. This method takes a prompt and returns the model's response.

```perl
my $response = $gpt->generate_text('Tell me a joke');
print $response;
```

The generate_text method can also accept a model name and temperature parameter as options. By default, if not specified, the model name is set to 'gpt-3.5-turbo-0613' and temperature to 0.7.

```
my $response = $gpt->generate_text('Tell me a joke', 'gpt-3.5-turbo-0613', 0.8);
print $response;
```

### Debugging

If you need debugging, set the debug flag in the new method.

```perl
my $gpt = OpenAIGPT4->new('YOUR_OPENAI_API_KEY', undef, 1);
```

With this flag set, details of the requests and responses will be outputted.

### Interactive Conversation

You can also create an interactive conversation with gpt-3.5-turbo-0613 using a loop. Here's an example:

```perl
use OpenAIGPT4;

my $gpt = OpenAIGPT4->new('YOUR_OPENAI_API_KEY');
print "ChatGPT: Hello! Let's start a conversation.\n";

while (1) {
    print "User: ";
    my $user_input = <STDIN>;
    chomp $user_input;

    # Send the user's input to the API and receive a response
    my $response = $gpt->generate_text($user_input);

    # Display the response
    print "ChatGPT: $response\n";

    # Check for exit condition (e.g., input of the keyword "exit")
    if ($user_input eq 'exit') {
        last; # Exit the loop to end the conversation
    }
}
```

### Caution

Using the OpenAI GPT-3,4 API involves rate limits and costs, dictated by your subscription plan. Exceeding your quota will result in an error message and possible delays or temporary suspension of API requests. For detailed information, visit [OpenAI's Pricing page](https://platform.openai.com/account/rate-limits).

### Usage Demo

The following YouTube link includes a usage demo for this module:

[![OpenAIGPT4 Perl Module Usage Demo](http://img.youtube.com/vi/0zHDT2CTjV0/0.jpg)](http://www.youtube.com/watch?v=0zHDT2CTjV0 "OpenAIGPT4 Perl Module Usage Demo")

## Author

Kawamura Shingo (pannakoota@gmail.com)

## License

This module is distributed under the terms of the Artistic License 2.0.

Please see [LICENSE](https://opensource.org/licenses/Artistic-2.0) for more details.

## SEE ALSO
[LocalAI is an OpenAI API compatible system for locally hosting models](https://github.com/go-skynet/LocalAI)

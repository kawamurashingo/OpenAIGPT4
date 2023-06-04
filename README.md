# OpenAIGPT4 Perl Module

OpenAIGPT4 is a Perl module that enables developers to interface with the OpenAI GPT-3,4 API. With this module, you can easily generate natural language text.

[OpenAIGPT4 on MetaCPAN](https://metacpan.org/pod/OpenAIGPT4)

## Features

- Generate text that sounds like natural language with the OpenAI GPT-3,4 API.

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

## Getting an API Key
You will need an API key to use the OpenAI GPT-3,4 API. You can get an API key from [OpenAI's API key page](https://platform.openai.com/account/api-keys).

## Usage

### Rate Limits and Billing

Please be aware that usage of the OpenAI GPT-3,4 API is subject to rate limits and is a paid service. The rate limits, which limit the number of API requests you can make in a given time period, and the cost of usage are determined by the plan you have subscribed to.

If you are seeing a 429 Too Many Requests error with an insufficient_quota message, this means you have exceeded your current quota for API usage. Please check your plan and billing details on the OpenAI platform.

For more information about the specific rate limits and billing details of different plans, please refer to the official OpenAI Pricing page.

Note: If you exceed your rate limit, you may encounter a delay in API responses or temporarily lose the ability to make API requests.

First, import the module and create a new OpenAIGPT4 object:

```perl
use OpenAIGPT4;
my $gpt = OpenAIGPT4->new('<your_api_key>');
```

This constructor returns a new OpenAIGPT4 object. You must pass your OpenAI API key as the first argument. The second argument, the OpenAI host URL, is optional. If no host URL is provided, it defaults to 'https://api.openai.com'. If you are running against a [LocalAI API server](https://github.com/go-skynet/LocalAI), you will need to specify the host URL.

Then, generate text by providing a prompt:

```perl
my $response = $gpt->generate_text('Hello, how are you?');
or
my $response = $gpt->generate_text('Hello, how are you?', 'gpt-4', 0.5);
print $response;
```

This method generates text given a prompt. The first argument should be a string containing the prompt. The second argument is optional and can be used to specify the model to be used for the generation. If no model is specified, it defaults to 'gpt-3.5-turbo'. The third argument is also optional and represents the temperature of the generated text. It defaults to 0.7 if not provided. The temperature parameter controls the randomness of the generated text. Lower values (e.g., 0.2) produce more focused and consistent outputs, while higher values (e.g., 0.8) produce more diverse and random outputs. It returns the generated text.

Here is an example of how you can use this module in an interactive manner:

```perl
use OpenAIGPT4;

my $gpt = OpenAIGPT4->new('<your_api_key>');
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

### Usage Demo

The following YouTube link includes a usage demo for this module:

[![OpenAIGPT4 Perl Module Usage Demo](http://img.youtube.com/vi/0zHDT2CTjV0/0.jpg)](http://www.youtube.com/watch?v=0zHDT2CTjV0 "OpenAIGPT4 Perl Module Usage Demo")

## Dependencies

This module depends on the following Perl modules:

- LWP::UserAgent
- LWP::Protocol::https
- HTTP::Request::Common
- JSON

## License

This module is distributed under the terms of the Artistic License 2.0.

Please see [LICENSE](https://opensource.org/licenses/Artistic-2.0) for more details.

## SEE ALSO
[LocalAI is an OpenAI API compatible system for locally hosting models](https://github.com/go-skynet/LocalAI)

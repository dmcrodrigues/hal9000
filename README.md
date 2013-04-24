# hal9000

hal maps your commands to an human readable form, you  just need to think what you want to do and hal will do it for you with pleasure! It's like a domain for  a not-easy-to-remember ip but for your commands.

## Motivation

Aliases are extremely helpful and simple but they are not always self descriptive and easy to remember. Hal is an helper for this, it helps manage your aliases, create, delete, keep them on a single location. Finally it maps your actions into your thoughts. Thoughts? What?

I give you an example. I'm currently using a remote server and the access is made directly by the ip address. I found that very boring and hard to remember.

Well, this was before hal. Now i can simply do:

    hal connect to my remote server
    
Hal will recognize this and will map to my `ssh user@x.x.x.x` command. I found it helpful.

### Inspiration

I developed hal with some inspiring references in mind.

 1. [HUBOT](http://hubot.github.com/) from Github.
 2. [boom](http://zachholman.com/boom) from Zach Holman.
 3. [HAL 9000](http://en.wikipedia.org/wiki/HAL_9000), the super computer from the `2001: A Space Odyssey` movie.

## Installation

Install it via RubyGems:

    $ gem install hal9000

## Usage

    example usage:
      hal --list                          lists all actions
      hal --create <thought> <action>     create a new action
      hal --delete <thought>              delete an action

      hal <thought>                       execute an action

      hal --version                       show hal version
      hal --help                          show this shiny help

## Examples

    $ hal --create "say hello" "echo 'Hello'"
    $ hal say hello
    you - say hello
    hal - right way sir! running: 'echo 'Hello''
    Hello
    
    $ hal --create "start jenkins" "java -jar /usr/local/opt/jenkins/libexec/jenkins.war"
    $ hal start jenkins
    (jenkins starts)
    ...
    
    $ hal --create "copy my ssh key" "pbcopy < ~/.ssh/id_rsa.pub"
    $ hal copy my ssh key
    (key copied to clipboard)

## Portability

Hal uses a single JSON file to store all your thoughts and actions. This file is a pure JSON file and is available on your `$HOME` directory with the name `.hal`. Alternatively, it's possible to configure the location of this file using an enviroment variable with the name `HAL_FILE`.

## Contributing

Hal is currently in a very alpha version so any help is very welcome. Just fork it! :)

## Licence

[MIT License](http://en.wikipedia.org/wiki/MIT_License) (c) [David Rodrigues](mailto:david.ndh@gmail.com)

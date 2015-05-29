use inc::Module::Install;
name 'String-Slack';
all_from 'lib/String/Slack.pm';

# requires '';

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;

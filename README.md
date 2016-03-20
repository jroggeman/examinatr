# Examinatr [![Build Status](https://travis-ci.org/jroggeman/examinatr.svg?branch=master)](https://travis-ci.org/jroggeman/examinatr) [![Code Climate](https://codeclimate.com/github/jroggeman/examinatr/badges/gpa.svg)](https://codeclimate.com/github/jroggeman/examinatr)
Don't worry, the name is temporary.

**Examinatr** is a web app for creating and managing school exams.

## Dependencies
Examinatr runs on Ruby 2.2.2, though it'll probably work on other versions.  NPM
and Bower should be installed to manage the packages for the Ember frontend.

## Setup
After cloning, first ensure that you have a database set up.  The current
database.yml file expects an `examinatr` user with `examinatr_dev` and
`examinatr_test` databases, using MySQL.  If this doesn't work, feel free to
change it; I expect I'll be the only one working on this, but am happy to remove
database.yml from the repo if others want to work on it and have different
setups.

Anyways, with the database setup, run `bin/setup`, followed by a
`rake db:migrate` and you should be good!

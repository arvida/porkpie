# Porkpie

## NAME

porkpie - submit stats to StatHat via UDP

## SYNOPSIS

`porkpie` [`options`] 

## DESCRIPTION

A UDP daemon for submitting stats to [StatHat](http://stathat.com). UDP makes it faster and less error prone.

The daemon accepts messages in following format:

	EZ_KEY%%TYPE%%NAME%%VALUE
	
`TYPE` is either `count` or `value`.
	
## OPTIONS

	--host 			Host to bind to (default: 127.0.0.1)
	--port 			Port to bind to (default: 4321)
	--pid-file		Pid file (default: /var/run/porkpie.pid)
	--log-file		Path to log file (logging disabled by default)
	--daemonize		Daemonize
	--help			Display help	
	
## EXAMPLE

	$ gem install porkpie
	$ porkpie --daemonize --host 10.0.1.6 --port 5000 --log-file log/pies.log

## CONTRIBUTE

Create an issue or do a pull request on GitHub <https://github.com/arvida/porkpie>.
	
## AUTHORS

<https://github.com/arvida/porkpie/contributors>

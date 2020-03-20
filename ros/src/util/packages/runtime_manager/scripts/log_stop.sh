#!/bin/sh

kill -9 `ps auxww | grep "can_log.sh" |cut -d' ' -f2`

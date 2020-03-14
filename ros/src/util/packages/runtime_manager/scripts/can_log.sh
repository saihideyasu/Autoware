#!/bin/bash

konsole -e rostopic echo /microbus/log_write | grep data > $1

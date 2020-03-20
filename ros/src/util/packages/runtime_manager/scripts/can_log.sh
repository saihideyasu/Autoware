#!/bin/bash

rostopic echo /microbus/log_write | grep "data" > $1

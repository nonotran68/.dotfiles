#!/bin/bash
while bspc node any.hidden.window -g hidden=off; do false; done && \
while bspc node 'any.!hidden.window' -g hidden=on; do :; done

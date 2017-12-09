#!/bin/bash
ddsh -a alerts show current | awk '{print $1}' | xargs ddsh -c -- alerts clear alert-id

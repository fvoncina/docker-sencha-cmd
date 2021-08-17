#!/bin/sh
set -e

cd /project

if [ "$1" = 'sencha' ]; then
    exec "$@"
else
	exec sencha "$@"
fi
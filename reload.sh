#!/bin/bash
# workaround for reload caddy file and replace current dir with current dir directory:
./frankenphp adapt --config Caddyfile | sed "s|current/|$(readlink current)/|g" | curl localhost:2019/load -H "Content-Type: application/json" -d @-

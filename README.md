# FrankenPHP

Install FrankenPHP with:

```bash
curl https://frankenphp.dev/install.sh | sh
```

Start FrankenPHP with:

```bash
./frankenphp run --config Caddyfile
```

Open browser [http://127.0.0.1:8082/](http://127.0.0.1:8082/).

Switch release:

```bash
ln -sfn releases/2 current
```

Open browser [http://127.0.0.1:8082/](http://127.0.0.1:8082/).

Still old `index.php` is returned.

Open browser [http://127.0.0.1:8082/test.txt](http://127.0.0.1:8082/test.txt).

Caddy target the `Release 2` static file already.

Switch between releases:

```bash
# Release 1
ln -sfn releases/1 current
# Todo: reload FrankenPHP without any downtime?
curl -XGET http://127.0.0.1:8082/
curl http://127.0.0.1:8082/test.txt

# Release 2
ln -sfn releases/2 current
# Todo: reload FrankenPHP without any downtime?
curl -XGET http://127.0.0.1:8082/
curl http://127.0.0.1:8082/test.txt
```

### What I tried:

```bash
./frankenphp reload
```

```bash
        # change resolve_root_symlink seems not effect frankenphp or caddy:
		resolve_root_symlink true
		resolve_root_symlink false
```

```bash
./frankenphp adapt --config Caddyfile | curl localhost:2019/load \
   -H "Content-Type: application/json" \
   -d @-
```

```bash
curl -X POST http://localhost:2019/frankenphp/workers/restart
```

# PostgreSQL Google Drive Backup

### Environment

- `POSTGRES_USER`
- `POSTGRES_PASS`
- `POSTGRES_HOST`
- `POSTGRES_DB`
- `RCLONE_TOKEN` - JSON token for rclone. This is found in your `rclone.conf`
- `DEST_DIR` - Directory on google drive for backup

### Running

`copy.sh` is the main script, but docker or k8s is how it's meant to be run.

### Docker

There's a `docker-compose.yml` that can be used for a `docker-compose run`. For cron jobs, using this image as a base and adding a cron job is likely the way to go

### Kubernetes

There's a `k8s-config.yaml` example of a cronjob. The rclone token and PostgreSQL pass are treated as secrets



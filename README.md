# Wrangler DEV in Docker optimized for Unraid
This container runs Cloudflares Wrangler workers in Docker.

By default this container is configured to not start the Wrangler worker to be able to deploy your project first in the container and then run it locally instead of on Cloudflares Server infrastructure through `wrangler dev`.

You can get more information about Wrangler [here](https://developers.cloudflare.com/workers/wrangler/).

## Env params
| Name | Value | Example |
| --- | --- | --- |
| DATA_DIR | Folder for configfiles and the application | /wrangler |
| START_WRANGLER | Start Wrangler on container startup | false |
| WRANGLER_START_CMD | The start command the the container is using when START_WRANGLER is set to 'true'. | wrangler dev |
| UID | User Identifier | 99 |
| GID | Group Identifier | 100 |
| UMASK | Umask value for new created files | 0000 |
| DATA_PERMS | Data permissions for config folder | 770 |

## Run example
```
docker run --name Wrangler -d \
	-p 8080:8080 \
	--env 'START_WRANGLER=false' \
	--env 'WRANGLER_START_CMD=wrangler dev' \
	--env 'UID=99' \
	--env 'GID=100' \
	--env 'UMASK=0000' \
	--env 'DATA_PERMS=770' \
	--volume /path/to/wrangler:/wrangler \
	ich777/wrangler-dev
```

This Docker was mainly edited for better use with Unraid, if you don't use Unraid you should definitely try it!

#### Support Thread: https://forums.unraid.net/topic/83786-support-ich777-application-dockers/
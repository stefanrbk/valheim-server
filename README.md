# Valheim Server
Valheim Server is an OCI container image for hosting a dedicated server for the game [Valheim](https://store.steampowered.com/app/892970/Valheim/).

## Requirements
- An OCI compliant container engine like Docker or Podman
- Forward ports 2456-2458/UDP to the server
- Open ports 2456-2458/UDP on your firewall
- `$SERVER_PASSWORD` cannot be empty
- `$SERVER_PASSWORD` must be 5 characters or longer
- `$SERVER_PASSWORD` cannot be in `$SERVER_NAME`

## Usage
```bash
docker run -d -e "SERVER_NAME=My Server" -e "SERVER_WORLD=worldsavename" -e "SERVER_PASSWORD=password" -p 2456-2458:2456-2458/udp -v /path/to/server-data:/root/.config/unity3d/IronGate/Valheim tedtramonte/valheim-server:latest

# Windows
docker run -d -e "SERVER_NAME=My Server" -e "SERVER_WORLD=worldsavename" -e "SERVER_PASSWORD=password" -p 2456-2458:2456-2458/udp -v C:\Path\To\Server Data:/root/.config/unity3d/IronGate/Valheim tedtramonte/valheim-server:latest

# Run a specific build
docker run -d -e "SERVER_NAME=My Server" -e "SERVER_WORLD=worldsavename" -e "SERVER_PASSWORD=password" -p 2456-2458:2456-2458/udp -v /path/to/server-data:/root/.config/unity3d/IronGate/Valheim tedtramonte/valheim-server:6176121
```

## Configuration
### Environment Variables
- `SERVER_NAME` - The name of the server as it should appear in the server browser
- `SERVER_WORLD` - The name of the `.fwl` and `.db` files used to store the world
- `SERVER_PASSWORD` - The password to enter the server
  - This **CANNOT BE BLANK, SHORTER THAN 5 CHARACTERS, OR CONTAINED IN THE SERVER NAME**

### Ports
If ports 2456-2458/UDP are in use on your server, you can use a different port range by changing the left side of the port assignment like so:

```bash
docker run -d -e "SERVER_NAME=My Server" -e "SERVER_WORLD=worldsavename" -e "SERVER_PASSWORD=password" -p 3556-3558:2456-2458/udp -v /path/to/server-data:/root/.config/unity3d/IronGate/Valheim tedtramonte/valheim-server:latest
```

### Volumes
In order to persist your server's data between restarts, the `/root/.config/unity3d/IronGate/Valheim` directory must be kept in a volume. A bind mount is recommended to easily adjust the files yourself, but if you don't need to transfer files into the container an ephemeral volume will work as well.

```bash
# Bind mount: prefs, access lists, and worlds dir will be accessible on this path
docker run -d -e "SERVER_NAME=My Server" -e "SERVER_WORLD=worldsavename" -e "SERVER_PASSWORD=password" -p 3556-3558:2456-2458/udp -v /path/to/server-data:/root/.config/unity3d/IronGate/Valheim tedtramonte/valheim-server:latest

# Ephemeral volume: data will persist but be inaccessible from outside the container
docker run -d -e "SERVER_NAME=My Server" -e "SERVER_WORLD=worldsavename" -e "SERVER_PASSWORD=password" -p 3556-3558:2456-2458/udp -v my-valheim-server-data:/root/.config/unity3d/IronGate/Valheim tedtramonte/valheim-server:latest
```

## Contributing
Merge requests are welcome after opening an issue first.

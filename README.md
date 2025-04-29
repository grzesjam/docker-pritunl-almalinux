# Pritunl docker (AlmaLinux based)

Dockerized version of Pritunl server with OpenVPN and Wireguard support 

Running on AlmaLinux 

### Prerequisites
Requirements:
```
Docker version 27.5
Docker Compose version v2.35
```

## Usage

### Building container yourself
Just run:
```bash
docker compose up -d 
```

UI should be accessible on `https://[ip]:4443`

> You might want to change ports in compose.yml file 

### Using prebuilt image

1. Copy `compose.prod.yml` to you vm
2. Change image version to one you want to use
3. Run:
```
docker compose up -d
```

4. UI should be accessible on `https://[ip]`

## Authors

* [**Grzegorz M**](https://github.com/grzesjam) - *Creator* -

## License

This project is licensed under the **MIT License**
- see the [LICENSE](LICENSE) file for details

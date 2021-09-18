# Bookinfo Review Service

Review service has been developed on Java

## License

MIT License

## How to run with Docker
```bash
# Build Docker Image for review service
docker build -t reviews .

# Run review service on port 8082
docker run -d --name reviews -p 8082:8082 reviews
```
* Test with path `/reviews/1` and `/health`

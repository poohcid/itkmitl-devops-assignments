# Bookinfo Detail Service

Detail service has been developed on Ruby

## License

MIT License

## How to run details service

### Prerequisite

* Ruby 2.7

```bash
ruby details.rb 9080
```

## How to run with Docker
```bash
# Build Docker Image for detail service
docker build -t details .

# Run detail service on port 8081
docker run -d --name details -p 8081:8081 -e "ENABLE_EXTERNAL_BOOK_SERVICE=true" details
```
* Test with path `/details/1` and `/health`

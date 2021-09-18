# Bookinfo Product page Service

Product page service has been developed on Python

## License

MIT License

## How to run product page

### Prerequisite

* Python 3.8

```bash
pip install -r requirements.txt
python productpage.py 9080
```

## How to run with Docker

```bash
# Build Docker Image for product page service
docker build -t productpage .

# Run product page service on port 8083
docker run -d --name productpage -p 8083:8083 productpage
```

* Test with path `/` and `/health`
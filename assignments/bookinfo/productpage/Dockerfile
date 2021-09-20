FROM python:3.7-slim

WORKDIR /usr/src/app/

COPY src/ /usr/src/app/

RUN pip3 install -r requirements.txt

EXPOSE 8083

CMD ["python3", "productpage.py", "8083"]
FROM ubuntu:22.04
WORKDIR /app

COPY requirements.txt ./

# no need to have " / "

RUN useradd jesus && \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y \
  python3 \
  python3-pip \
  && pip3 install --no-cache-dir -r requirements.txt


COPY --chown=jesus  app/ /app


ENV FLASK_APP=app/rn_jesus.py

EXPOSE 3000
CMD ["python3" , "-m" ,"flask" , "run" , "--host=0.0.0.0", "--port=3000"  ]

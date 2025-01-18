FROM ubuntu:22.04
WORKDIR /app
COPY requirements.txt ./

# no need to have " / "

RUN useradd Jesus && \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y \
  python3 \
  python3-pip


RUN pip3 install --no-cache-dir  -r requirements.txt

COPY --chown=Jesus  app/ /app

# EXPOSE 5000
CMD ["python3" , "-m" ,"flask" , "run" , "--host=0.0.0.0"  ]

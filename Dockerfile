FROM ubuntu:22.04
WORKDIR /app
COPY requirements.txt ./

# no need to have " / "

RUN useradd Jesus && \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y \
  python3 \
  python3-pip \
  && pip3 install --no-cache-dir -r requirements.txt

USER jesus 
COPY --chown=Jesus  app/ /app

EXPOSE 3000 
ENV FLASK_APP=app/rn_jesus.py

# EXPOSE 5000
CMD ["python3" , "-m" ,"flask" , "run" , "--host=0.0.0.0"  ]

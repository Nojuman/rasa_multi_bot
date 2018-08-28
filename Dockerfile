FROM rasa/rasa/rasa_core

ENV RASA_DOCKER="YES" \
    RASA_HOME=/app \
    RASA_PYTHON_PACKAGES=/usr/local/lib/python2.7/dist-packages

# Run updates, install basics and cleanup
# - build-essential: Compile specific dependencies
# - git-core: Checkout git repos
RUN apt-get update -qq \
    && apt-get install -y --no-install-recommends build-essential git-core openssl libssl-dev libffi6 libffi-dev curl  \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR ${RASA_HOME}

COPY . ${RASA_HOME}

EXPOSE 5000 5005 5006

CMD python bot.py --port 5005

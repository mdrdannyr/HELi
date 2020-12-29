# Using Official Python 2.7 image
From python:2.7

# Create user to run the app - ensures we don't use root
RUN useradd -ms /bin/bash app
USER app

# Copy the requirements separately and install. 
# Allows us to rebuild faster during dev as requirements shouldn't change as frequently as the code
COPY app/requirements.txt /opt/app/requirements.txt
RUN python -m pip install -r /opt/app/requirements.txt

# Copy the full app 
COPY app /opt/app

# Default entry is to run HELi.py 
ENTRYPOINT ["python", "./opt/app/src/HELi.py"]

# build django app - python app package
FROM python:3.10-slim as final

# Set work directory
WORKDIR /code

# Copy project from previous stage
COPY . .

# Set environment variables
ENV PIP_DISABLE_PIP_VERSION_CHECK 1
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /code/nitoronlinetestportal

# install psycopg2 dependencies
RUN apt-get update && apt-get -y install libpq-dev gcc

# Install dependencies
RUN pip install -r ./requirements.txt

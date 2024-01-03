#!/usr/bin/env bash

echo "Initiating frontend server in watch mode..."

cd /code/nitoronlinetestportal/static

echo "Installing dependencies & starting node server..."

npm i && npm run dev

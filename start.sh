#!/usr/bin/env bash
# Exit on error
set -o errexit

# Initialize the database
flask --app app init-db

# Start the Flask app
gunicorn app:app
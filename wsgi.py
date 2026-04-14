import os
import sys

# Ensure the app directory is on the path so Flask can find templates and static files
sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'app'))

from app import app

if __name__ == "__main__":
    app.run()

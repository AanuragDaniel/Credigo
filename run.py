#!/usr/bin/env python
"""
CrediGo - Agentic AI Personal Loan Assistance Platform
Entrypoint script for development, presentation, and Viva demonstration.
"""
import os
import sys
from backend.config import Config
from backend.database.db import init_db
from backend.database.seed import seed_database
from backend.app import create_app

def main():
    print("=" * 70)
    print(" CrediGo: Agentic AI Personal Loan Assistance Platform")
    print(" Academic FinTech Demonstration Edition - BCA Viva Presentation")
    print("=" * 70)

    # Check if database exists, if not seed it automatically
    db_path = Config.DATABASE_PATH
    if not os.path.exists(db_path):
        print(f"[*] Initializing and seeding fresh database at {db_path}...")
        seed_database()
    else:
        print(f"[*] Found existing database at {db_path}.")

    app = create_app()
    
    print("\n[+] CrediGo Platform is LIVE and ready for presentation:")
    print(f"   --> Main Web Application: http://localhost:{Config.PORT}")
    print(f"   --> Admin Credentials:    admin@credigo.demo / Admin@123")
    print(f"   --> Customer Demo:        alex.demo@credigo.demo (or 1-Click 'Try Demo')")
    print(f"   --> API Health:           http://localhost:{Config.PORT}/api/health")
    print("=" * 70)
    print("Press CTRL+C to stop the server.\n")

    app.run(host=Config.HOST, port=Config.PORT, debug=Config.DEBUG)

if __name__ == '__main__':
    main()

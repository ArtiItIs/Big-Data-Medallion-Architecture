import os
import time

print("Shutting down Docker if running")
os.system("docker-compose down")

print("Starting Docker\nConnecting with PostgreSQL")
os.system("docker-compose up -d")

print("Waiting for database")
time.sleep(5)

print("Running the medallion pipeline")
os.system("docker exec -i bgd_postgres psql -U admin -d customer_db -f /sql/raw_layer.sql")
os.system("docker exec -i bgd_postgres psql -U admin -d customer_db -f /sql/cleaned_layer.sql")
os.system("docker exec -i bgd_postgres psql -U admin -d customer_db -f /sql/analytics_layer.sql")

print("Pipeline was created!")
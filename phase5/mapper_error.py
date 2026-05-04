#!/usr/bin/env python3
import sys

for line in sys.stdin:
    parts = line.split()

    if len(parts) > 8:
        status = parts[8]
        endpoint = parts[6]

        try:
            status = int(status)

            # Filter only error codes >= 400
            if status >= 400:
                print(f"STATUS_{status}\t1")
                print(f"ENDPOINT_{endpoint}\t1")

        except:
            continue


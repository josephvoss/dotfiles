#!/usr/bin/python
import sys
import datetime

template = """# {date}

"""
print(template.format(date=datetime.date.today()))

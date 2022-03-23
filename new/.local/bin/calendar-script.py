#!/usr/bin/python
from apiclient.discovery import build

import datetime
import pytz
from dateutil import parser

import requests
import urllib
import json

slack_token = open("/home/jvoss14/bin/slack-multi-secret.txt").read().strip()
slack_profile = {'first_name':'Joseph', 'last_name':'Voss', \
        'email':'jvoss@multimechanics.com'}

def get_event_times():
    service = build('calendar','v3',\
            developerKey=open("/home/jvoss14/bin/google-secret.txt").read().strip('key=').strip())

    events = service.events().list(calendarId='brosephvossenator@gmail.com', \
            maxResults=1, orderBy='startTime', singleEvents=True, \
            timeMin=datetime.datetime.utcnow().isoformat()+'z').execute()

    event = events['items'][0]
    
    dic = {}

    dic['title'] = event['summary']
    dic['start'] = parser.parse(event['start']['dateTime']).replace( \
            tzinfo=pytz.timezone(event['start']['timeZone']))
    dic['end'] = parser.parse(event['end']['dateTime']).replace( \
            tzinfo=pytz.timezone(event['end']['timeZone']))

    return dic

def get_curr_status():
    # Get current user status
    r = requests.post("https://slack.com/api/users.getPresence", \
            data={'token':slack_token})
    away = r.json()['presence'] == 'away'
    return away

def set_curr_status(away,message=''):
    r=[]
    status_emoji = ':school_satchel:' if away else ''
    status_message = message if away else '' 
    status_presence = 'away' if away else 'auto'

    profile = json.dumps({'first_name':'Joseph', 'last_name':'Voss',
                'email':'jvoss@multimechanics.com', 'status_text':message,
                'status_emoji':status_emoji})

    r.append(requests.post("https://slack.com/api/users.profile.set", \
            data={'token':slack_token, 'profile':profile}))
    r.append(requests.post("https://slack.com/api/users.setPresence", \
            data={'token':slack_token, 'presence':status_presence}))
    return r

curr_time = pytz.utc.localize(datetime.datetime.utcnow())
curr_away = get_curr_status()
class_info = get_event_times()
class_msg = class_info['title']
start_time = class_info['start']
end_time = class_info['end']

if abs((start_time - curr_time).total_seconds()/60) < 15 or abs((curr_time \
        - start_time).total_seconds()/60) < 15:
    set_curr_status(away=True, message="Class: " + class_msg)
    print curr_time.isoformat() + ". Starting class: " \
        + class_msg + ". from " + start_time.isoformat() \
        + " to " + end_time.isoformat()
elif abs((curr_time - end_time).total_seconds()/60) < 15 or abs((end_time \
        - curr_time).total_seconds()/60) < 15:
    set_curr_status(away=False, message="")
    print curr_time.isoformat() + ". Ending class: " \
        + class_msg + ". from " + start_time.isoformat() \
        + " to " + end_time.isoformat()

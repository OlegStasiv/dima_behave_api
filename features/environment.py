from yaml import load
import json_responses as json_responses


def before_all(context):
    context.settings = load(open('features/conf.yaml').read())
    context.base_url = ""
    context.staging_url = context.settings['staging_base_url']
    context.my_id = context.settings['id']
    context.headers = {}
    context.json_responses = json_responses
    context.verify_ssl = True


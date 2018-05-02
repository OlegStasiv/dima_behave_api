from yaml import load


def before_all(context):
    context.settings = load(open('features/conf.yaml').read())
    context.base_url = ""
    context.staging_url = context.settings['staging_base_url']
    context.my_id = context.settings['id']
    context.headers = {}
    context.verify_ssl = True


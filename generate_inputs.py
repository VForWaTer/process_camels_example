from metacatalog import api

def get_dataset_ids(session):
    # request all hyras ids
    entries = api.find_entry(session, title='HYRAS-DE*')
    return [entry.id for entry in entries]


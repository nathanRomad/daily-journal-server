class Entry():

    # Class initializer. It has 5 custom parameters, with the
    # special `self` parameter that every method on a class
    # needs as the first parameter.
    def __init__(self, id, date, topic, journalEntry, moodId):
        self.id = id
        self.date = date
        self.topic = topic
        self.journalEntry = journalEntry
        self.moodId = moodId
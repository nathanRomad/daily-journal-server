import sqlite3
import json
from models import Entry

ENTRIES = []

def get_all_entries():
    # Open a connection to the database
    with sqlite3.connect("./dailyjournal.db") as conn:

        # Just use these. It's a Black Box.
        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        # Write the SQL query to get the information you want
        db_cursor.execute("""
        SELECT
            a.id,
            a.concept,
            a.entry,
            a.date,
            a.moodId
        FROM Entry a
        """)

        # Initialize an empty list to hold all entry representations
        entries = []

        # Convert rows of data into a Python list
        dataset = db_cursor.fetchall()

        # Iterate list of data returned from database
        for row in dataset:

            # Create an entry instance from the current row.
            # Note that the database fields are specified in
            # exact order of the parameters defined in the
            # Entry class above.
            entry = Entry(row['id'], row['concept'],
                            row['entry'], row['date'], row['moodId'])

            entries.append(entry.__dict__)

    # Use `json` package to properly serialize list as JSON
    return json.dumps(entries)

def get_single_entry(id):
    with sqlite3.connect("./dailyjournal.db") as conn:
        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        # Use a ? parameter to inject a variable's value
        # into the SQL statement.
        db_cursor.execute("""
        SELECT
            a.id,
            a.concept,
            a.entry,
            a.date,
            a.moodId
        FROM Entry a
        WHERE a.id = ?
        """, ( id, ))

        # Load the single result into memory
        data = db_cursor.fetchone()

        # Create an entry instance from the current row
        entry = Entry(data['id'], data['date'], data['concept'],
                            data['entry'], data['moodId'])

        return json.dumps(entry.__dict__)

def create_entry(new_entry):
    with sqlite3.connect("./dailyjournal.db") as conn:
        db_cursor = conn.cursor()

        db_cursor.execute("""
        INSERT INTO Entry
            ( concept, entry, date, moodId)
        VALUES
            ( ?, ?, ?, ?);
        """, (new_entry['concept'], new_entry['entry'],
              new_entry['date'], new_entry['moodId']))

        # The `lastrowid` property on the cursor will return
        # the primary key of the last thing that got added to
        # the database.
        id = db_cursor.lastrowid

        # Add the `id` property to the entry dictionary that
        # was sent by the client so that the client sees the
        # primary key in the response.
        new_entry['id'] = id


    return json.dumps(new_entry)

def delete_entry(id):
    with sqlite3.connect("./dailyjournal.db") as conn:
        db_cursor = conn.cursor()

        # entry = get_single_entry(id)

        db_cursor.execute("""
        DELETE FROM Journal_Entries
        WHERE id = ?
        """, (id, ))



def update_entry(id, new_entry):
    # Iterate the ENTRIES list, but use enumerate() so that
    # you can access the index value of each item.
    for index, entry in enumerate(ENTRIES):
        if entry["id"] == id:
            # Found the entry. Update the value.
            ENTRIES[index] = new_entry
            break

def get_entries_by_search(search_term):
    with sqlite3.connect("./dailyjournal.db") as conn:
        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        db_cursor.execute("""
        SELECT
            e.id,
            e.concept,
            e.entry,
            e.date,
            e.moodId
        FROM Entry e
        WHERE e.entry LIKE ?
        """, ( f'%{search_term}%', ))

        entries = []

        dataset = db_cursor.fetchall()

        for row in dataset:
            entry = Entry(row['id'], 
                        row['concept'],
                        row['entry'],
                        row['date'], 
                        row['label']
                        )

            entries.append(entry.__dict__)

    return json.dumps(entries)
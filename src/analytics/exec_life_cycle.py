# %%

import pandas as pd
import sqlalchemy
# %%

def import_query(path):
    with open(path) as open_file:
        query = open_file.read()
    return query

query = import_query('life_cycle.sql')

engine_app = sqlalchemy.create_engine('sqlite:///../../data/loyalty_system/database.db')

df = pd.read_sql(query, engine_app)

# %%

engine_analytical = sqlalchemy.create_engine('sqlite:///../../data/analytics/databse.db')

df.to_sql('life_cycle', engine_analytical, index=False, if_exists="replace")

# %%


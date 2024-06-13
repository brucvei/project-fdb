import pandas as pd

# # ATHLETE
# df = pd.read_csv('csv/athlete.csv')
#
# def generate_sql(row):
#     id, name, gender = row['ID'], row['Name'], row['Sex']
#     name = name.replace("'", "''")
#     return f"INSERT INTO athlete (id, name, sex) VALUES ({id}, '{name}', '{gender}');"
#
# sql_queries = df.apply(generate_sql, axis=1)
#
# with open('query/athlete.sql', 'w') as f:
#     for query in sql_queries:
#         f.write(query + '\n')

# # MODALITY
# df = pd.read_csv('csv/modality.csv')
#
# def generate_sql(row):
#     id, sport, name = row['id'], row['Sport'], row['Event']
#     sport = sport.replace("'", "''")
#     name = name.replace("'", "''")
#     return f"INSERT INTO modality (id, name, sport) VALUES ({id}, '{name}', '{sport}');"
#
# sql_queries = df.apply(generate_sql, axis=1)

# with open('query/modality.sql', 'w') as f:
#     for query in sql_queries:
#         f.write(query + '\n')

# # OLYMPIC
# df = pd.read_csv('csv/olympic.csv')
#
# def generate_sql(row):
#     id, year, season, city, games = row['id'], row['Year'], row['Season'], row['City'], row['Games']
#     city = city.replace("'", "''")
#     return f"INSERT INTO olympic (id, year, season, city, name) VALUES ({id}, {year}, '{season}', '{city}', '{games}');"
#
# sql_queries = df.apply(generate_sql, axis=1)
#
# with open('query/olympic.sql', 'w') as f:
#     for query in sql_queries:
#         f.write(query + '\n')

# ATHLETE_MODALITY
df = pd.read_csv('csv/athlete_modality.csv')


def generate_sql(row):
    athlete_id, modality_id, id, olympic_id, age, height, weight = row['athlete_id'], row['id_modality'], row['id'], \
        row['id_olympic'], row['Age'], row['Height'], row['Weight']
    athlete_id = int(athlete_id)
    modality_id = int(modality_id)
    id = int(id)
    olympic_id = int(olympic_id)
    height = height if not pd.isnull(height) else 'NULL'
    weight = weight if not pd.isnull(weight) else 'NULL'
    return f"INSERT INTO athlete_modality (id, athlete_id, modality_id, olympic_id, age, height, weight) VALUES ({id}, {athlete_id}, {modality_id}, {olympic_id}, {age}, {height}, {weight});"


sql_queries = df.apply(generate_sql, axis=1)

with open('query/athlete_modality.sql', 'w') as f:
    for query in sql_queries:
        f.write(query + '\n')

# # MEDAL
# df = pd.read_csv('csv/medals.csv')
#
# def generate_sql(row):
#     id, athlete_modality_id, medal = row['id'], row['id_atlhete_modality'], row['Medal']
#     return f"INSERT INTO medals (id, atlhete_id, type) VALUES ({id}, {athlete_modality_id}, '{medal}');"
#
# sql_queries = df.apply(generate_sql, axis=1)
#
# with open('query/medal.sql', 'w') as f:
#     for query in sql_queries:
#         f.write(query + '\n')
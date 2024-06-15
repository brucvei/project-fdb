import pandas as pd

df = pd.read_csv("athlete_events.csv")
print(df.head())

filtered_df = df[df['NOC'] == 'AUS']
print(filtered_df)
print(filtered_df.head())

# guardar o resultado em um arquivo csv
filtered_df.to_csv("filtered_athlete_events.csv", index=False)

df = pd.read_csv("csv/filtered.csv")
print(df.head())

# selecionar todos as olimpiadas (colunas: Games, Year, Season, City) e salvar em uma tabela sem repeticao
olympic_df = df[['Games', 'Year', 'Season', 'City']].drop_duplicates()
# add id column que auto incrementa
df = pd.read_csv("csv/olympic.csv")
df['id'] = range(1, len(df) + 1)
print(df.head())
df.to_csv("olympic.csv", index=False)
print(olympic_df.head())
olympic_df.to_csv("olympic.csv", index=False)

# selecionar todas as modalidades (colunas: Sport, Event) e salvar em uma tabela sem repeticao
modality_df = df[['Sport', 'Event']].drop_duplicates()
# add id column que auto incrementa
df = pd.read_csv("csv/modality.csv")
df['id'] = range(1, len(df) + 1)
print(df.head())
df.to_csv("modality.csv", index=False)
print(modality_df.head())
modality_df.to_csv("modality.csv", index=False)

# selecionar todos os atletas (colunas: id, name, sex, age, height, weight) e salvar em uma tabela sem repeticao
athlete_df = df[['ID', 'Name', 'Sex']].drop_duplicates();
print(athlete_df.head())
athlete_df.to_csv("athlete.csv", index=False)

# selecionar todos os atletas e suas modalidades (colunas: athlete_id, modality_id) e salvar em uma tabela sem repeticao
athlete_modality_df = df[['ID', 'Sport', 'Event', 'Year', 'Season', 'City', 'Age', 'Height', 'Weight']]
print(athlete_modality_df.head())
athlete_modality_df['id'] = range(1, len(athlete_modality_df) + 1)
athlete_modality_df.to_csv("athlete_modality.csv", index=False)
athlete_modality_df = pd.read_csv("csv/athlete_modality.csv")
# Modificar o nome da colina ID para athlete_id
athlete_modality_df = athlete_modality_df.rename(columns={"ID": "athlete_id"})
athlete_modality_df.to_csv("athlete_modality.csv", index=False)
# Encontrar o nome da modalidade e adicionar a coluna modality_id
athlete_modality_df = pd.read_csv("csv/athlete_modality.csv")
modality_df = pd.read_csv("csv/modality.csv")
# encontrar modality_id por Sport e Event
athlete_modality_df = pd.merge(athlete_modality_df, modality_df, on=['Sport', 'Event'], how='left',
                               suffixes=('', '_modality'))
print(athlete_modality_df.head())
# add id of modality on athlete_modality_df

# remove columns Sport and Event
athlete_modality_df = athlete_modality_df.drop(columns=['Sport', 'Event'])
athlete_modality_df.to_csv("athlete_modality.csv", index=False)
# encontrar olímpiada_id por Year, Season e City
olympic_df = pd.read_csv("csv/olympic.csv")
athlete_modality_df = pd.merge(athlete_modality_df, olympic_df, on=['Year', 'Season', 'City'], how='left',
                               suffixes=('', '_olympic'))
athlete_modality_df.to_csv("athlete_modality.csv", index=False)
print(athlete_modality_df.head())
# remove columns Year, Season e City and Games
athlete_modality_df = athlete_modality_df.drop(columns=['Year', 'Season', 'City', 'Games'])
athlete_modality_df.to_csv("athlete_modality.csv", index=False)

# selecionar todas as medalhas (colunas: Medal) e salvar em uma tabela sem repeticao
medals_df = df[['Medal', 'ID', 'Sport', 'Event', 'Year', 'Season', 'City', ]]
medals_df = pd.read_csv("csv/medals.csv")
# remover linhas onde medalha está vazia
medals_df = medals_df.dropna(subset=['Medal'])
# add id column que auto incrementa
medals_df['id'] = range(1, len(medals_df) + 1)
medals_df = medals_df.rename(columns={"ID": "athlete_id"})
modality_df = pd.read_csv("csv/modality.csv")
# encontrar modality_id por Sport e Event
medals_df = pd.merge(medals_df, modality_df, on=['Sport', 'Event'], how='left', suffixes=('', '_modality'))
print(athlete_modality_df.head())
print(medals_df.head())
medals_df = medals_df.drop(columns=['Sport', 'Event'])
medals_df = medals_df.rename(columns={"id": "id_modality"})
olympic_df = pd.read_csv("csv/olympic.csv")
medals_df = pd.merge(medals_df, olympic_df, on=['Year', 'Season', 'City'], how='left', suffixes=('', '_olympic'))
medals_df = medals_df.drop(columns=['Year', 'Season', 'City', 'Games'])
medals_df = medals_df.rename(columns={"id": "id_olympic"})
atlhete_modality_df = pd.read_csv("csv/athlete_modality.csv")
medals_df = pd.merge(atlhete_modality_df, medals_df, on=['athlete_id', 'id_modality', 'id_olympic'], how='left')
medals_df = medals_df.dropna(subset=['Medal'])
medals_df = medals_df.rename(columns={"id": "id_atlhete_modality"})

medals_df = medals_df.drop(columns=['athlete_id', 'id_modality', 'id_olympic', 'Age', 'Height', 'Weight'])
medals_df = medals_df.drop(columns=['id'])
medals_df = medals_df.dropna(subset=['Medal'])
medals_df['id'] = range(1, len(medals_df) + 1)
medals_df.to_csv("csv/medals.csv", index=False)

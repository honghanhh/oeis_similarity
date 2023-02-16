import os
import re
import json
import glob
import pandas as pd

def join_start_end(lst):
    result = []
    i = 0
    while i < len(lst):
        if "(Start)" in lst[i]:
            temp = [lst[i]]
            i += 1
            while i < len(lst) and "(End)" not in lst[i]:
                temp.append(lst[i])
                i += 1
            if i < len(lst):
                temp.append(lst[i])
            result.append(" ".join(temp))
        else:
            result.append(lst[i])
            i += 1
    return result

def enumerate_func(x):
    x['premise_id'] = x['query'].argsort() + 1 
    return x
    
path = r'../crawl/fetched/' # use your path
all_files = glob.glob(os.path.join(path , "*.json"))
premise = ['comment', 'formula', 'mathematica']

li = []
count = 0
for filename in all_files:
    if count % 500 == 0:
        print(filename)
    with open(filename) as f:
        file = json.load(f)
    df = pd.DataFrame()
    if file['results'] != []:
        for x in ['data', 'name', premise[2]]:
            if x not in list(file['results'][0].keys()):
                file['results'][0][x] = []
        df = pd.DataFrame({'query': filename.split('/')[-1].split('.')[0].lower(),
                           'data':file['results'][0]['data'],
                           'name': file['results'][0]['name'],
                           'premise': join_start_end(file['results'][0][premise[2]])
                          })
    li.append(df)
    count+=1

final_df = pd.concat(li, axis=0, ignore_index=True)
final_df = final_df.groupby('query', group_keys=False).apply(enumerate_func)
final_df['premise_id'] = [str(x)  + '_' + str(y) for x, y in zip(final_df['query'], final_df['premise_id'])]

with open("./data/knowledge_base_mathematica_.json", "w") as outfile:
    json.dump(dict(zip(final_df['premise_id'],final_df['premise'])), outfile)

statements = final_df.groupby(["query"]).agg({"data": "first", "name":"first", "premise_id": ",".join}).reset_index()
statements['premise_id'] = [x.split(',') for x in statements['premise_id']]
statements['length'] = [len(x) if len(x) < 40 else 500 for x in statements.premise_id]
statements_ = statements[statements['length'] < 500]

statements_dict = dict()
for i in range(len(statements_)):
    statements_dict[statements_['query'].iloc[i]] = dict(statements_[['data','name','premise_id']].iloc[i])

with open("./data/statements_mathematica_.json", "w") as outfile:
    json.dump(statements_dict, outfile)

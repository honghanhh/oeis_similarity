#!/usr/bin/env python3

import os
import json
import warnings
import argparse
from typing import List, Tuple, Iterable

import numpy as np
import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import manhattan_distances, cosine_distances, euclidean_distances


try:
    from tqdm import tqdm
except ImportError:
    def tqdm(iterable: Iterable, **kwargs) -> Iterable:
        return iterable


def read_premises_kb(path: str) -> List[Tuple[str, str]]:
    premises_kb = []

    with open(path, "rb") as f:
        kb_file = json.load(f)

    for premise_id in kb_file:
        premise_text = kb_file[premise_id]
        premises_kb.append((premise_id, premise_text))

    return premises_kb

def read_test_statements(path: str)-> List[Tuple[str,str]]:
    statements_list = []

    with open(path, "rb") as f:
        statements_file = json.load(f)

    for statement_id in statements_file:
        statement_eq = statements_file[statement_id]["data"]
        statement_text = statements_file[statement_id]["name"]
        statements_list.append((statement_id, statement_eq, statement_text))

    return statements_list


if '__main__' == __name__:
    parser = argparse.ArgumentParser()
    parser.add_argument('-n', '--nearest', type=int, default=40)
    parser.add_argument('-kb', '--kb', type=str, default = 'knowledge_base_mathematica.json')
    parser.add_argument('-statements', '--statements', type=str, default = 'statements_mathematica.json')
    parser.add_argument('-metric', '--metric', type=str, default='cosine')
    args = parser.parse_args()

    premises_kb = read_premises_kb(args.kb)    
    statements_list = read_test_statements(args.statements)

    df_p = pd.DataFrame(premises_kb, columns=('pid', 'premise'))
    df_s = pd.DataFrame(statements_list, columns=('sid', 'equation', 'text'))
    
    vectorizer = TfidfVectorizer().fit(list(df_p['premise']))
    X_s = vectorizer.transform(list(df_s['text']))
    X_p = vectorizer.transform(list(df_p['premise']))
    
    if args.metric == 'cosine':
        X_dist = cosine_distances(X_s, X_p)
    elif args.metric == 'manhattan':
        X_dist = manhattan_distances(X_s, X_p)
    else:
        X_dist = euclidean_distances(X_s, X_p)

    for i_statement, distances in tqdm(enumerate(X_dist), desc=args.statements, total=X_s.shape[0]):
        for i_premise in np.argsort(distances)[:args.nearest]:
            print('{}\t{}'.format(df_s.loc[i_statement]['sid'], df_p.loc[i_premise]['pid']))

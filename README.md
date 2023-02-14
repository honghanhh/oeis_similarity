# Premise Selection

This repository is an extended version from the paper [IJS at TextGraphs-16 Natural Language Premise Selection Task: Will Contextual Information Improve Natural Language Premise Selection?](https://aclanthology.org/2022.textgraphs-1.12.pdf).

## Datasets

We crawled 3,600,000 statements from [The On-Line Encyclopedia of Integer Sequences](http://oeis.org/A001477). For each statements (based on the query in form of Axxxxxx where x is the integer). Check out the sample of the output in [./data](./data/).

## Preresequisite

Install the necessary libaries by the following command:

```
pip install -r requirements.txt
```

## Implemetation

To re-crawl, please run the following command:

```
python crawling.py --output [output_dir]
```
Or check the notebook [./notebook/test_crawling.ipynb](./notebook/test_crawling.ipynb).

To preprocess the crawled data into format of training set and the knowledge base, run the following command:

```
python preprocess.py --input [input_dir] --output [output_dir]
```

To train the similarity model, run the following command:

```
./model.py --knowledge_base data/knowledge_base.json --statements data/statements.json > predict.txt
```

To evaluate the performance, run the following command:
```
./evaluate.py --gold_standard data/statements.json predict.txt
```

If you are too lazy to run all the above command separately, run the following command and waiting for the result =)).

```
chmod +x user run.sh
./run.sh
```

## Reference

Tran, Thi Hong Hanh, et al. "IJS at TextGraphs-16 Natural Language Premise Selection Task: Will Contextual Information Improve Natural Language Premise Selection?." Proceedings of TextGraphs-16: Graph-based Methods for Natural Language Processing. 2022.

## Contributor

- [@honghanhh](https://github.com/honghanhh/)

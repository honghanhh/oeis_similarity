# Calculate similarity
python model.py -kb ./data/knowledge_base_comment.json -statements  ./data/statements_comment.json -model sentence-transformers/sentence-t5-large -metric cosine > pred_sentence_t5_cosine.txt

python model.py -kb ./data/knowledge_base_comment.json -statements  ./data/statements_comment.json -model sentence-transformers/gtr-t5-large -metric cosine > pred_gtr_t5_cosine.txt

python model.py -kb ./data/knowledge_base_comment.json -statements  ./data/statements_comment.json -model AI-Growth-Lab/PatentSBERTa -metric cosine > pred_patentSberta_cosine.txt

python model.py -kb ./data/knowledge_base_comment.json -statements  ./data/statements_comment.json -model sentence-transformers/all-MiniLM-L6-v2 -metric cosine > pred_milm_l6_v2_cosine.txt

python model.py -kb ./data/knowledge_base_comment.json -statements  ./data/statements_comment.json -model sentence-transformers/all-mpnet-base-v2 -metric cosine > pred_mpnet_cosine.txt

python model.py -kb ./data/knowledge_base_comment.json -statements  ./data/statements_comment.json -model sentence-transformers/all-MiniLM-L12-v2 -metric cosine > pred_milm_l12_v2_cosine.txt

python model.py -kb ./data/knowledge_base_comment.json -statements  ./data/statements_comment.json -model flax-sentence-embeddings/all_datasets_v3_roberta-large -metric cosine > pred_roberta_cosine.txt



python model.py -kb ./data/knowledge_base_comment.json -statements  ./data/statements_comment.json -model sentence-transformers/sentence-t5-large -metric manhattan > pred_sentence_t5_manhattan.txt

python model.py -kb ./data/knowledge_base_comment.json -statements  ./data/statements_comment.json -model sentence-transformers/gtr-t5-large -metric manhattan > pred_gtr_t5_manhattan.txt

python model.py -kb ./data/knowledge_base_comment.json -statements  ./data/statements_comment.json -model AI-Growth-Lab/PatentSBERTa -metric manhattan > pred_patentSberta_manhattan.txt

python model.py -kb ./data/knowledge_base_comment.json -statements  ./data/statements_comment.json -model sentence-transformers/all-MiniLM-L6-v2 -metric manhattan > pred_milm_l6_v2_manhattan.txt

python model.py -kb ./data/knowledge_base_comment.json -statements  ./data/statements_comment.json -model sentence-transformers/all-mpnet-base-v2 -metric manhattan > pred_mpnet_manhattan.txt

python model.py -kb ./data/knowledge_base_comment.json -statements  ./data/statements_comment.json -model sentence-transformers/all-MiniLM-L12-v2 -metric manhattan > pred_milm_l12_v2_manhattan.txt

python model.py -kb ./data/knowledge_base_comment.json -statements  ./data/statements_comment.json -model flax-sentence-embeddings/all_datasets_v3_roberta-large -metric manhattan > pred_roberta_manhattan.txt



python model.py -kb ./data/knowledge_base_comment.json -statements  ./data/statements_comment.json -model sentence-transformers/sentence-t5-large -metric euclidean > pred_sentence_t5_euclidean.txt

python model.py -kb ./data/knowledge_base_comment.json -statements  ./data/statements_comment.json -model sentence-transformers/gtr-t5-large -metric euclidean > pred_gtr_t5_euclidean.txt

python model.py -kb ./data/knowledge_base_comment.json -statements  ./data/statements_comment.json -model AI-Growth-Lab/PatentSBERTa -metric euclidean > pred_patentSberta_euclidean.txt

python model.py -kb ./data/knowledge_base_comment.json -statements  ./data/statements_comment.json -model sentence-transformers/all-MiniLM-L6-v2 -metric euclidean > pred_milm_l6_v2_euclidean.txt

python model.py -kb ./data/knowledge_base_comment.json -statements  ./data/statements_comment.json -model sentence-transformers/all-mpnet-base-v2 -metric euclidean > pred_mpnet_euclidean.txt

python model.py -kb ./data/knowledge_base_comment.json -statements  ./data/statements_comment.json -model sentence-transformers/all-MiniLM-L12-v2 -metric euclidean > pred_milm_l12_v2_euclidean.txt

python model.py -kb ./data/knowledge_base_comment.json -statements  ./data/statements_comment.json -model flax-sentence-embeddings/all_datasets_v3_roberta-large -metric euclidean > pred_roberta_euclidean.txt


# Evaluate
python evaluate.py --gold ./data/statements_comment.json pred_sentence_t5_cosine.txt
python evaluate.py --gold ./data/statements_comment.json pred_gtr_t5_cosine.txt
python evaluate.py --gold ./data/statements_comment.json pred_patentSberta_cosine.txt
python evaluate.py --gold ./data/statements_comment.json pred_milm_l6_v2_cosine.txt
python evaluate.py --gold ./data/statements_comment.json pred_mpnet_cosine.txt
python evaluate.py --gold ./data/statements_comment.json pred_milm_l12_v2_cosine.txt
python evaluate.py --gold ./data/statements_comment.json pred_roberta_cosine.txt


python evaluate.py --gold ./data/statements_comment.json pred_sentence_t5_manhattan.txt
python evaluate.py --gold ./data/statements_comment.json pred_gtr_t5_manhattan.txt
python evaluate.py --gold ./data/statements_comment.json pred_patentSberta_manhattan.txt
python evaluate.py --gold ./data/statements_comment.json pred_milm_l6_v2_manhattan.txt
python evaluate.py --gold ./data/statements_comment.json pred_mpnet_manhattan.txt
python evaluate.py --gold ./data/statements_comment.json pred_milm_l12_v2_manhattan.txt
python evaluate.py --gold ./data/statements_comment.json pred_roberta_manhattan.txt


python evaluate.py --gold ./data/statements_comment.json pred_sentence_t5_euclidean.txt
python evaluate.py --gold ./data/statements_comment.json pred_gtr_t5_euclidean.txt
python evaluate.py --gold ./data/statements_comment.json pred_patentSberta_euclidean.txt
python evaluate.py --gold ./data/statements_comment.json pred_milm_l6_v2_euclidean.txt
python evaluate.py --gold ./data/statements_comment.json pred_mpnet_euclidean.txt
python evaluate.py --gold ./data/statements_comment.json pred_milm_l12_v2_euclidean.txt
python evaluate.py --gold ./data/statements_comment.json pred_roberta_euclidean.txt

# # Scenario 2: S: data/name P: formula

# Calculate similarity
# python model.py -kb ./data/knowledge_base_formula.json -statements  ./data/statements_formula.json -model sentence-transformers/sentence-t5-large -metric cosine > pred_sentence_t5_cosine.txt

# python model.py -kb ./data/knowledge_base_formula.json -statements  ./data/statements_formula.json -model sentence-transformers/gtr-t5-large -metric cosine > pred_gtr_t5_cosine.txt

# python model.py -kb ./data/knowledge_base_formula.json -statements  ./data/statements_formula.json -model AI-Growth-Lab/PatentSBERTa -metric cosine > pred_patentSberta_cosine.txt

# python model.py -kb ./data/knowledge_base_formula.json -statements  ./data/statements_formula.json -model sentence-transformers/all-MiniLM-L6-v2 -metric cosine > pred_milm_l6_v2_cosine.txt

# python model.py -kb ./data/knowledge_base_formula.json -statements  ./data/statements_formula.json -model sentence-transformers/all-mpnet-base-v2 -metric cosine > pred_mpnet_cosine.txt

# python model.py -kb ./data/knowledge_base_formula.json -statements  ./data/statements_formula.json -model sentence-transformers/all-MiniLM-L12-v2 -metric cosine > pred_milm_l12_v2_cosine.txt

# python model.py -kb ./data/knowledge_base_formula.json -statements  ./data/statements_formula.json -model flax-sentence-embeddings/all_datasets_v3_roberta-large -metric cosine > pred_roberta_cosine.txt



# python model.py -kb ./data/knowledge_base_formula.json -statements  ./data/statements_formula.json -model sentence-transformers/sentence-t5-large -metric manhattan > pred_sentence_t5_manhattan.txt

# python model.py -kb ./data/knowledge_base_formula.json -statements  ./data/statements_formula.json -model sentence-transformers/gtr-t5-large -metric manhattan > pred_gtr_t5_manhattan.txt

# python model.py -kb ./data/knowledge_base_formula.json -statements  ./data/statements_formula.json -model AI-Growth-Lab/PatentSBERTa -metric manhattan > pred_patentSberta_manhattan.txt

# python model.py -kb ./data/knowledge_base_formula.json -statements  ./data/statements_formula.json -model sentence-transformers/all-MiniLM-L6-v2 -metric manhattan > pred_milm_l6_v2_manhattan.txt

# python model.py -kb ./data/knowledge_base_formula.json -statements  ./data/statements_formula.json -model sentence-transformers/all-mpnet-base-v2 -metric manhattan > pred_mpnet_manhattan.txt

# python model.py -kb ./data/knowledge_base_formula.json -statements  ./data/statements_formula.json -model sentence-transformers/all-MiniLM-L12-v2 -metric manhattan > pred_milm_l12_v2_manhattan.txt

# python model.py -kb ./data/knowledge_base_formula.json -statements  ./data/statements_formula.json -model flax-sentence-embeddings/all_datasets_v3_roberta-large -metric manhattan > pred_roberta_manhattan.txt



# python model.py -kb ./data/knowledge_base_formula.json -statements  ./data/statements_formula.json -model sentence-transformers/sentence-t5-large -metric euclidean > pred_sentence_t5_euclidean.txt

# python model.py -kb ./data/knowledge_base_formula.json -statements  ./data/statements_formula.json -model sentence-transformers/gtr-t5-large -metric euclidean > pred_gtr_t5_euclidean.txt

# python model.py -kb ./data/knowledge_base_formula.json -statements  ./data/statements_formula.json -model AI-Growth-Lab/PatentSBERTa -metric euclidean > pred_patentSberta_euclidean.txt

# python model.py -kb ./data/knowledge_base_formula.json -statements  ./data/statements_formula.json -model sentence-transformers/all-MiniLM-L6-v2 -metric euclidean > pred_milm_l6_v2_euclidean.txt

# python model.py -kb ./data/knowledge_base_formula.json -statements  ./data/statements_formula.json -model sentence-transformers/all-mpnet-base-v2 -metric euclidean > pred_mpnet_euclidean.txt

# python model.py -kb ./data/knowledge_base_formula.json -statements  ./data/statements_formula.json -model sentence-transformers/all-MiniLM-L12-v2 -metric euclidean > pred_milm_l12_v2_euclidean.txt

# python model.py -kb ./data/knowledge_base_formula.json -statements  ./data/statements_formula.json -model flax-sentence-embeddings/all_datasets_v3_roberta-large -metric euclidean > pred_roberta_euclidean.txt


# # Evaluate
# python evaluate.py --gold ./data/statements_formula.json pred_sentence_t5_cosine.txt
# python evaluate.py --gold ./data/statements_formula.json pred_gtr_t5_cosine.txt
# python evaluate.py --gold ./data/statements_formula.json pred_patentSberta_cosine.txt
# python evaluate.py --gold ./data/statements_formula.json pred_milm_l6_v2_cosine.txt
# python evaluate.py --gold ./data/statements_formula.json pred_mpnet_cosine.txt
# python evaluate.py --gold ./data/statements_formula.json pred_milm_l12_v2_cosine.txt
# python evaluate.py --gold ./data/statements_formula.json pred_roberta_cosine.txt


# python evaluate.py --gold ./data/statements_formula.json pred_sentence_t5_manhattan.txt
# python evaluate.py --gold ./data/statements_formula.json pred_gtr_t5_manhattan.txt
# python evaluate.py --gold ./data/statements_formula.json pred_patentSberta_manhattan.txt
# python evaluate.py --gold ./data/statements_formula.json pred_milm_l6_v2_manhattan.txt
# python evaluate.py --gold ./data/statements_formula.json pred_mpnet_manhattan.txt
# python evaluate.py --gold ./data/statements_formula.json pred_milm_l12_v2_manhattan.txt
# python evaluate.py --gold ./data/statements_formula.json pred_roberta_manhattan.txt


# python evaluate.py --gold ./data/statements_formula.json pred_sentence_t5_euclidean.txt
# python evaluate.py --gold ./data/statements_formula.json pred_gtr_t5_euclidean.txt
# python evaluate.py --gold ./data/statements_formula.json pred_patentSberta_euclidean.txt
# python evaluate.py --gold ./data/statements_formula.json pred_milm_l6_v2_euclidean.txt
# python evaluate.py --gold ./data/statements_formula.json pred_mpnet_euclidean.txt
# python evaluate.py --gold ./data/statements_formula.json pred_milm_l12_v2_euclidean.txt
# python evaluate.py --gold ./data/statements_formula.json pred_roberta_euclidean.txt

# # Scenario 3: S: data/name P: mathematica

# # Calculate similarity
# python model.py -kb ./data/knowledge_base_mathematica.json -statements  ./data/statements_mathematica.json -model sentence-transformers/sentence-t5-large -metric cosine > pred_sentence_t5_cosine.txt

# python model.py -kb ./data/knowledge_base_mathematica.json -statements  ./data/statements_mathematica.json -model sentence-transformers/gtr-t5-large -metric cosine > pred_gtr_t5_cosine.txt

# python model.py -kb ./data/knowledge_base_mathematica.json -statements  ./data/statements_mathematica.json -model AI-Growth-Lab/PatentSBERTa -metric cosine > pred_patentSberta_cosine.txt

# python model.py -kb ./data/knowledge_base_mathematica.json -statements  ./data/statements_mathematica.json -model sentence-transformers/all-MiniLM-L6-v2 -metric cosine > pred_milm_l6_v2_cosine.txt

# python model.py -kb ./data/knowledge_base_mathematica.json -statements  ./data/statements_mathematica.json -model sentence-transformers/all-mpnet-base-v2 -metric cosine > pred_mpnet_cosine.txt

# python model.py -kb ./data/knowledge_base_mathematica.json -statements  ./data/statements_mathematica.json -model sentence-transformers/all-MiniLM-L12-v2 -metric cosine > pred_milm_l12_v2_cosine.txt

# python model.py -kb ./data/knowledge_base_mathematica.json -statements  ./data/statements_mathematica.json -model flax-sentence-embeddings/all_datasets_v3_roberta-large -metric cosine > pred_roberta_cosine.txt



# python model.py -kb ./data/knowledge_base_mathematica.json -statements  ./data/statements_mathematica.json -model sentence-transformers/sentence-t5-large -metric manhattan > pred_sentence_t5_manhattan.txt

# python model.py -kb ./data/knowledge_base_mathematica.json -statements  ./data/statements_mathematica.json -model sentence-transformers/gtr-t5-large -metric manhattan > pred_gtr_t5_manhattan.txt

# python model.py -kb ./data/knowledge_base_mathematica.json -statements  ./data/statements_mathematica.json -model AI-Growth-Lab/PatentSBERTa -metric manhattan > pred_patentSberta_manhattan.txt

# python model.py -kb ./data/knowledge_base_mathematica.json -statements  ./data/statements_mathematica.json -model sentence-transformers/all-MiniLM-L6-v2 -metric manhattan > pred_milm_l6_v2_manhattan.txt

# python model.py -kb ./data/knowledge_base_mathematica.json -statements  ./data/statements_mathematica.json -model sentence-transformers/all-mpnet-base-v2 -metric manhattan > pred_mpnet_manhattan.txt

# python model.py -kb ./data/knowledge_base_mathematica.json -statements  ./data/statements_mathematica.json -model sentence-transformers/all-MiniLM-L12-v2 -metric manhattan > pred_milm_l12_v2_manhattan.txt

# python model.py -kb ./data/knowledge_base_mathematica.json -statements  ./data/statements_mathematica.json -model flax-sentence-embeddings/all_datasets_v3_roberta-large -metric manhattan > pred_roberta_manhattan.txt



# python model.py -kb ./data/knowledge_base_mathematica.json -statements  ./data/statements_mathematica.json -model sentence-transformers/sentence-t5-large -metric euclidean > pred_sentence_t5_euclidean.txt

# python model.py -kb ./data/knowledge_base_mathematica.json -statements  ./data/statements_mathematica.json -model sentence-transformers/gtr-t5-large -metric euclidean > pred_gtr_t5_euclidean.txt

# python model.py -kb ./data/knowledge_base_mathematica.json -statements  ./data/statements_mathematica.json -model AI-Growth-Lab/PatentSBERTa -metric euclidean > pred_patentSberta_euclidean.txt

# python model.py -kb ./data/knowledge_base_mathematica.json -statements  ./data/statements_mathematica.json -model sentence-transformers/all-MiniLM-L6-v2 -metric euclidean > pred_milm_l6_v2_euclidean.txt

# python model.py -kb ./data/knowledge_base_mathematica.json -statements  ./data/statements_mathematica.json -model sentence-transformers/all-mpnet-base-v2 -metric euclidean > pred_mpnet_euclidean.txt

# python model.py -kb ./data/knowledge_base_mathematica.json -statements  ./data/statements_mathematica.json -model sentence-transformers/all-MiniLM-L12-v2 -metric euclidean > pred_milm_l12_v2_euclidean.txt

# python model.py -kb ./data/knowledge_base_mathematica.json -statements  ./data/statements_mathematica.json -model flax-sentence-embeddings/all_datasets_v3_roberta-large -metric euclidean > pred_roberta_euclidean.txt


# # # Evaluate
# python evaluate.py --gold ./data/statements_mathematica.json ./preds/preds_data_math/pred_sentence_t5_cosine.txt
# python evaluate.py --gold ./data/statements_mathematica.json ./preds/preds_data_math/pred_gtr_t5_cosine.txt
# python evaluate.py --gold ./data/statements_mathematica.json ./preds/preds_data_math/pred_patentSberta_cosine.txt
# python evaluate.py --gold ./data/statements_mathematica.json ./preds/preds_data_math/pred_milm_l6_v2_cosine.txt
# python evaluate.py --gold ./data/statements_mathematica.json ./preds/preds_data_math/pred_mpnet_cosine.txt
# python evaluate.py --gold ./data/statements_mathematica.json ./preds/preds_data_math/pred_milm_l12_v2_cosine.txt
# python evaluate.py --gold ./data/statements_mathematica.json ./preds/preds_data_math/pred_roberta_cosine.txt


# python evaluate.py --gold ./data/statements_mathematica.json ./preds/preds_data_math/pred_sentence_t5_manhattan.txt
# python evaluate.py --gold ./data/statements_mathematica.json ./preds/preds_data_math/pred_gtr_t5_manhattan.txt
# python evaluate.py --gold ./data/statements_mathematica.json ./preds/preds_data_math/pred_patentSberta_manhattan.txt
# python evaluate.py --gold ./data/statements_mathematica.json ./preds/preds_data_math/pred_milm_l6_v2_manhattan.txt
# python evaluate.py --gold ./data/statements_mathematica.json ./preds/preds_data_math/pred_mpnet_manhattan.txt
# python evaluate.py --gold ./data/statements_mathematica.json ./preds/preds_data_math/pred_milm_l12_v2_manhattan.txt
# python evaluate.py --gold ./data/statements_mathematica.json ./preds/preds_data_math/pred_roberta_manhattan.txt


# python evaluate.py --gold ./data/statements_mathematica.json ./preds/preds_data_math/pred_sentence_t5_euclidean.txt
# python evaluate.py --gold ./data/statements_mathematica.json ./preds/preds_data_math/pred_gtr_t5_euclidean.txt
# python evaluate.py --gold ./data/statements_mathematica.json ./preds/preds_data_math/pred_patentSberta_euclidean.txt
# python evaluate.py --gold ./data/statements_mathematica.json ./preds/preds_data_math/pred_milm_l6_v2_euclidean.txt
# python evaluate.py --gold ./data/statements_mathematica.json ./preds/preds_data_math/pred_mpnet_euclidean.txt
# python evaluate.py --gold ./data/statements_mathematica.json ./preds/preds_data_math/pred_milm_l12_v2_euclidean.txt
# python evaluate.py --gold ./data/statements_mathematica.json ./preds/preds_data_math/pred_roberta_euclidean.txt


# # Basline

# # Calculate similarity
# python baseline.py -kb ./data/knowledge_base_mathematica.json -statements  ./data/statements_mathematica.json -metric cosine > pred_tfidf_cosine_eq_math.txt

# python baseline.py -kb ./data/knowledge_base_mathematica.json -statements  ./data/statements_mathematica.json -metric manhattan > pred_tfidf_manhattan_eq_math.txt

# python baseline.py -kb ./data/knowledge_base_mathematica.json -statements  ./data/statements_mathematica.json -metric euclidean > pred_tfidf_euclidean_eq_math.txt


# python baseline.py -kb ./data/knowledge_base_formula.json -statements  ./data/statements_formula.json -metric cosine > pred_tfidf_cosine_eq_formula.txt

# python baseline.py -kb ./data/knowledge_base_formula.json -statements  ./data/statements_formula.json -metric manhattan > pred_tfidf_manhattan_eq_formula.txt

# python baseline.py -kb ./data/knowledge_base_formula.json -statements  ./data/statements_formula.json -metric euclidean > pred_tfidf_euclidean_eq_formula.txt


# python baseline.py -kb ./data/knowledge_base_comment.json -statements  ./data/statements_comment.json -metric cosine > pred_tfidf_cosine_eq_comment.txt

# python baseline.py -kb ./data/knowledge_base_comment.json -statements  ./data/statements_comment.json -metric manhattan > pred_tfidf_manhattan_eq_comment.txt

# python baseline.py -kb ./data/knowledge_base_comment.json -statements  ./data/statements_comment.json -metric euclidean > pred_tfidf_euclidean_eq_comment.txt


# # Evaluate


# python evaluate.py --gold ./data/statements_comment.json pred_tfidf_cosine_eq_comment.txt
# python evaluate.py --gold ./data/statements_comment.json pred_tfidf_manhattan_eq_comment.txt
# python evaluate.py --gold ./data/statements_comment.json pred_tfidf_euclidean_eq_comment.txt


# python evaluate.py --gold ./data/statements_formula.json pred_tfidf_cosine_eq_formula.txt
# python evaluate.py --gold ./data/statements_formula.json pred_tfidf_manhattan_eq_formula.txt
# python evaluate.py --gold ./data/statements_formula.json pred_tfidf_euclidean_eq_formula.txt


# python evaluate.py --gold ./data/statements_mathematica.json pred_tfidf_cosine_eq_math.txt
# python evaluate.py --gold ./data/statements_mathematica.json pred_tfidf_manhattan_eq_math.txt
# python evaluate.py --gold ./data/statements_mathematica.json pred_tfidf_euclidean_eq_math.txt

# # Basline

# # Calculate similarity
# python baseline.py -kb ./data/knowledge_base_mathematica.json -statements  ./data/statements_mathematica.json -metric cosine > pred_tfidf_cosine_data_math.txt

# python baseline.py -kb ./data/knowledge_base_mathematica.json -statements  ./data/statements_mathematica.json -metric manhattan > pred_tfidf_manhattan_data_math.txt

# python baseline.py -kb ./data/knowledge_base_mathematica.json -statements  ./data/statements_mathematica.json -metric euclidean > pred_tfidf_euclidean_data_math.txt


# python baseline.py -kb ./data/knowledge_base_formula.json -statements  ./data/statements_formula.json -metric cosine > pred_tfidf_cosine_data_formula.txt

# python baseline.py -kb ./data/knowledge_base_formula.json -statements  ./data/statements_formula.json -metric manhattan > pred_tfidf_manhattan_data_formula.txt

# python baseline.py -kb ./data/knowledge_base_formula.json -statements  ./data/statements_formula.json -metric euclidean > pred_tfidf_euclidean_data_formula.txt


# python baseline.py -kb ./data/knowledge_base_comment.json -statements  ./data/statements_comment.json -metric cosine > pred_tfidf_cosine_data_comment.txt

# python baseline.py -kb ./data/knowledge_base_comment.json -statements  ./data/statements_comment.json -metric manhattan > pred_tfidf_manhattan_data_comment.txt

# python baseline.py -kb ./data/knowledge_base_comment.json -statements  ./data/statements_comment.json -metric euclidean > pred_tfidf_euclidean_data_comment.txt


# Evaluate


# python evaluate.py --gold ./data/statements_comment.json pred_tfidf_cosine_data_comment.txt
# python evaluate.py --gold ./data/statements_comment.json pred_tfidf_manhattan_data_comment.txt
# python evaluate.py --gold ./data/statements_comment.json pred_tfidf_euclidean_data_comment.txt


# python evaluate.py --gold ./data/statements_formula.json pred_tfidf_cosine_data_formula.txt
# python evaluate.py --gold ./data/statements_formula.json pred_tfidf_manhattan_data_formula.txt
# python evaluate.py --gold ./data/statements_formula.json pred_tfidf_euclidean_data_formula.txt


# python evaluate.py --gold ./data/statements_mathematica.json pred_tfidf_cosine_data_math.txt
# python evaluate.py --gold ./data/statements_mathematica.json pred_tfidf_manhattan_data_math.txt


# python evaluate.py --gold ./data/statements_mathematica.json pred_tfidf_euclidean_data_math.txt --nearest 40
# python evaluate.py --gold ./data/statements_mathematica.json pred_tfidf_euclidean_data_math.txt --nearest 10
# python evaluate.py --gold ./data/statements_mathematica.json pred_tfidf_euclidean_data_math.txt --nearest 15
# python evaluate.py --gold ./data/statements_mathematica.json pred_tfidf_euclidean_data_math.txt --nearest 20
# python evaluate.py --gold ./data/statements_mathematica.json pred_tfidf_euclidean_data_math.txt --nearest 25 -> ok
# python evaluate.py --gold ./data/statements_mathematica.json pred_tfidf_euclidean_data_math.txt --nearest 30

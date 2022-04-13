# Reading list

## Text mining

### IBM introduction to text mining

- [article](https://www.ibm.com/cloud/learn/text-mining)
- [referenced paper](https://www.cs.utexas.edu/~ml/papers/discotex-melm-03.pdf)
- Feature selection
- Feature extraction
- Named-entity recognition

### MonkeyLearn introduction to text mining

- [article](https://monkeylearn.com/text-mining/)
- [list of analysis tool
  platforms](https://monkeylearn.com/blog/text-analysis-tools/)
- Method overview
  - Basic: word frequency, collocation (common bi-/trigrams), concordance
    (preceding/following context)
  - Advanced
    - Classification: topic, sentiment, intent analysis
    - **Extraction**: keyword extraction, named-entity recognition, **feature
      extraction**

#### Evaluation of models

- Accuracy
  - correct predictions / total predictions
  - can be off if really good in most frequent category and bad in minority
    categories or reverse
- Precision
  - same as accuracy but local to one category
  - looks at false positives
- Recall
  - correct predictions / total number of this prediction that should have been
    made
  - looks at false negatives  
- F1 score: combines precision & recall over all categories
- If need to look at partial matches, check out
  [ROUGE](https://en.wikipedia.org/wiki/ROUGE_(metric))

#### Text extraction

- Rule-based, e.g. regular expressions
- **Conditional Random Fields**

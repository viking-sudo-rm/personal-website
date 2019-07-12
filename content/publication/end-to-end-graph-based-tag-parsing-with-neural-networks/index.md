---
title: "End-to-End Graph-Based TAG Parsing with Neural Networks"
authors:
- Jungo Kasai
- Robert Frank
- Pauli Xu
- admin
- Owen Rambow
date: "2018-06-06T00:00:00Z"
doi: ""

# Schedule page publish date (NOT publication's date).
publishDate: "2017-01-01T00:00:00Z"

# Publication type.
# Legend: 0 = Uncategorized; 1 = Conference paper; 2 = Journal article;
# 3 = Preprint / Working Paper; 4 = Report; 5 = Book; 6 = Book section;
# 7 = Thesis; 8 = Patent
publication_types: ["1", "3"]

# Publication name and optional abbreviated publication name.
publication: In *NAACL* 2018
publication_short: In *NAACL* 2018

abstract: We present a graph-based Tree Adjoining Grammar (TAG) parser that uses BiLSTMs, highway connections, and character-level CNNs. Our best end-to-end parser, which jointly performs supertagging, POS tagging, and parsing, outperforms the previously reported best results by more than 2.2 LAS and UAS points. The graph-based parsing architecture allows for global inference and rich feature representations for TAG parsing, alleviating the fundamental trade-off between transition-based and graph-based parsing systems. We also demonstrate that the proposed parser achieves state-of-the-art performance in the downstream tasks of Parsing Evaluation using Textual Entailments (PETE) and Unbounded Dependency Recovery. This provides further support for the claim that TAG is a viable formalism for problems that require rich structural analysis of sentences.

# Summary. An optional shortened abstract.
summary: We present a graph-based Tree Adjoining Grammar parser that uses BiLSTMs, highway connections, and character-level CNNs.

tags:
- Source Themes
featured: false

# links:
# - name: ""
#   url: ""
url_pdf: https://arxiv.org/abs/1804.06610
url_code: https://github.com/jungokasai/graph_parser
url_dataset: ''
url_poster: ''
url_project: ''
url_slides: ''
url_source: ''
url_video: ''

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder. 
image:
  caption: ""
  focal_point: ""
  preview_only: false

# Associated Projects (optional).
#   Associate this publication with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `internal-project` references `content/project/internal-project/index.md`.
#   Otherwise, set `projects: []`.
projects: []

# Slides (optional).
#   Associate this publication with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides: "example"` references `content/slides/example/index.md`.
#   Otherwise, set `slides: ""`.
slides: ""
---


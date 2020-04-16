---
title: "A Formal Hierarchy of RNN Architectures"
subtitle: "Summary of the ACL 2020 paper."
summary: "Summary of the ACL 2020 paper."
authors:
- admin
categories: ["NLP"]
date: "2020-04-16T00:00:00Z"
featured: false
draft: false
math: true

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder. 
image:
  caption: "A diagram of the hierarchy derived in the paper."
  focal_point: ""

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references 
#   `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects: []
---

This is a blog post introducing our recent paper *A Formal Hierarchy of RNN Architectures*, which is joint work with Gail Weiss, Yoav Goldberg, Roy Schwartz, Noah Smith, and Eran Yahav. Compared to the original paper, this post is more of a summary, and will attempt to explain the significance of the results assuming less familiarity with formal language theory.

Understanding the practical capacity of neural network architectures is an important question for both the design of new architectures and the interpretability of current ones. By "practical capacity", we mean the classes of tasks that an architecture can discover solutions to via standard training methods. Since we are mostly interested in NLP here, another way to describe this is the types of grammars that a trained neural network can learn to implement. It has been known since [Siegelmann and Sontag (1992)](https://dl.acm.org/doi/10.1145/130385.130432) that RNNs with infinite time and precision are Turing-complete; however, these unrealistic assumptions make this a bad formal model for practical learnable capacity.

Over the last year or two, several works have addressed this by relating deep NLP architectures like RNNs to existing formal models in automata theory. [Weiss et al. (2018)](https://arxiv.org/abs/1805.04908) showed a connection between LSTMs and counter machines (CMs), and demonstrated how LSTMs learn to count to solve certain formal tasks that other RNNs cannot solve. Building on this, [Merrill (2019)](https://arxiv.org/abs/1906.01615) formalized the notion of a saturated network (a finite-precision approximation of a continuous RNN) and related the capacity of different saturated RNNs to different classes of formal languages. [Peng et al. (2019)](https://arxiv.org/abs/1808.09357) explored RNN capacity along a different axis: whether or not their internal computation can be simulated by a weighted finite state machine (WFA).

The goal of this paper is to unify these independent threads of research by further exploring the connection between formal models like saturated RNNs, CMs, and WFAs. We place all of these models into a two dimensional hierarchy defined by two formal properties: rational recurrence and space complexity. As defined by [Peng et al. (2019)](https://arxiv.org/abs/1808.09357), an RNN is *rationally recurrent* if its recurrent state can be computed by a WFA. *Space complexity*, related to the concept in analysis of algorithms, measures how much memory is available to a model.

We present new results characterizing models in terms of these properties. For example, we prove the saturated LSTM is not rationally recurrent, which was previously an open question. We also show that general CMs are not rationally recurrent. However, we explore restricted classes of counter machines that are. While the main focus of the paper is on RNNs, we also present results analyzing memory networks and **transformers** in the same terms.

Once we have derived these characterizations, we use them to demonstrate functions and languages that formally separate the capacities of different architectures. For example, we prove that the QRNN with a one-layer pooler cannot recognize $a^nb^n$, whereas the LSTM can. Let $D_k$ denote the capacity of an RNN with a $k$-layer pooler, and let s-$X$ denote the saturated version of architecture $X$. Here are some of the other results in this vein, stated more formally:

$$ a^nb^n \in D_1(\textrm{WFA}) $$
$$ a^nb^n \in D_1(\textrm{s-LSTM}) $$
$$ a^nb^n \not\in D_1(\textrm{s-QRNN}) $$
$$ a^nb^n \in D_1(\textrm{s-QRNN $\circ$ s-QRNN}) $$
$$ a^nb^n \in D_2(\textrm{s-QRNN}) $$
$$ a^nb^n\Sigma^* \in D_1(\textrm{s-LSTM}) $$
$$ a^nb^n\Sigma^* \not\in D(\textrm{s-QRNN}) \textrm{for any $D$} $$
$$ a^nb^n\Sigma^* \cup \{ \epsilon \} \in D_1(\textrm{s-QRNN $\circ$ s-QRNN}) $$

Finally, we run experiments testing whether unsaturated networks trained by gradient descent can learn these languages. In every case, we find that the capacity of the saturated networks correctly predicts the outcome of the experiments.

---
title: "Theory of Saturated Neural Networks"
subtitle: "Post based on *Sequential Neural Networks as Automata*."
summary: "Post based on Sequential Neural Networks as Automata."
authors:
- admin
categories: ["NLP"]
date: "2019-10-26T00:00:00Z"
featured: false
draft: false
math: true

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder. 
image:
  caption: ""
  focal_point: ""

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references 
#   `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects: []
---

In this post, my goal is to explain the key ideas from my paper [Sequential Neural Networks as Automata](https://arxiv.org/abs/1906.01615). The main idea is that, if we making some simplifying assumptions about how neural networks work, we can derive a theory of network expressiveness (what formal languages can different architectures model?) that seems to agree with the classes of formal languages that different networks can learn when trained by gradient descent. Thus, this restricted theoretical capacity seems to be (potentially) a good proxy for the empirical learnable capacity of various networks.

## Saturated Networks

In the paper, I referred to the simplified network whose capacity we can analyze as an *asymptotic* network. However, after talking with Gail Weiss, I now believe the term *saturated* is more descriptive, and plan to use this term going forward.

A neural network is a function $f(x, \theta)$ that is almost-everywhere differentiable with respect to the parameters $\theta$. Given such a function, we derive the saturated network $f'$ as

$$ f'(x, \theta) = \lim_{N \rightarrow \infty} f(x, N\theta) . $$

We define $f'$ over the domain $\{(x, \theta) \Vert \textrm{the limit above exists\}$. Since $f$ is almost-everwhere differentiable, the set of points excluded from the domain is measure-zero.

In a neural network, the effect of this transformation is to discretize all of the activations. For example, consider a neuron:

$$ \sigma(wx + b) $$

where $\sigma$ is the sigmoid function. When we take the limit of $\sigma(Nwx + Nb)$, the output of the neuron approaches either $0$ or $1$. This is what I mean by *discretization*.

After applying this discretization to the full network, we can analyze the computational capacity of the resulting discrete automaton. We also define a notion of space complexity associated with these saturated networks in the paper. Intuitively, this measure of complexity is just the number of configurations that the saturated network can have after reading a sequence of length $n$. For more details on this, consult [the paper](https://arxiv.org/abs/1906.01615).

## Summary of Results

By $L(M)$, we denote the set of formal languages that a machine $M$ can accept. Some key capacity results from the paper are as follows:

* $L(\textrm{ConvNet})$ is a proper subset of the regular languages
* $L(\textrm{RNN})$ is exactly the regular languages
* $L(\textrm{GRU})$ is exactly the regular languages
* $L(\textrm{LSTM})$ is a superset of the regular languages, and a subset of the real-time counter languages

The core results about the configuration complexity, some of which are analogous, are:
* ConvNet has $O(1)$ configurations
* RNN has $O(1)$ configurations
* GRU has $O(1)$ configurations
* LSTM has $O(n^k)$ configurations for hidden size $k$
* Attention has $2^{O(n)}$ configurations
* [StackNN](https://github.com/viking-sudo-rm/stacknn-core) has $2^{O(n)}$ configurations

There are some other results about attention/transformers that I'm not going to get into here, since they're not so neat. If you're interested though, I refer you to Section 4 of [the paper](https://arxiv.org/abs/1906.01615).

## Proof Sketches

### RNN Capacity and Complexity

To show that $L(\textrm{RNN})$ is the regular languages, we show two directions of containment. 

First, we prove that the the regular languages are an upper bound. We do this by showing that the configuration complexity of the RNN is finite, i.e. $O(1)$. Since each neuron has 2 possible values (-1 and 1), and there are $k$ neurons, the number of configurations of the state vector is $O(1)$.

The other direction is a little more complicated. We need to construct an RNN to simulate an arbitrary finite state machine. The construction for this is provided in Lemma B.1.

### LSTM Capacity and Complexity

In the LSTM case, even when we discretize the network, we get a model with more than finite state. This is because the LSTM's gating architecture is capable of counting ([Weiss et al.](https://arxiv.org/abs/1805.04908), 2018).

To show that the counter languages are an upper bound, we write the saturated gate network for a particular counter state neuron $c$ as follows:

$$ \lim_{N \rightarrow \infty}  c_t = \lim_{N \rightarrow \infty} f_t c_{t-1} + i_t {\tilde c}_t $$

$$ = \lim_{N \rightarrow \infty} a c_{t-1} + b $$

where $a \in \{0, 1\}$ and $b \in \{-1, 0, 1\}$.

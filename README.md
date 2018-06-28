# Lexicon-Based Polarity Classification for Bulgarian Language

## Description
This is a very basic classifier that gives a polarity (positive, negative, neutral) given a text and a polarity lexicon.
It uses [Tree-Tagger](http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/) by Helmut Schmid for Bulgarian language. Please, pay attention to the private [license](http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/Tagger-Licence) of Tree-Tagger which only allows you to use the system for research purposes.

## Requirements
* Perl interpreter (in Linux)

## How to use

```echo брат ми е много щастлив | ./classif.sh```

## Modules
The system consists of two modules:

* the PoS tagger Tree-Tagger for Bulgarian
* a basic lexicon-based classifier in Perl that just counts positive and negative lemmas by looking up a polarity lexicon

The two modules are connected by means of the following pipeline:

```./cmd/tree-tagger-bulgarian |./classif.perl ./resources/dico-bl.csv```

## Resources
The system makes uses of a polarity lexicon, `dico-bl.csv`, with more than 2,000 lemmas, built by Velyana Patzova.
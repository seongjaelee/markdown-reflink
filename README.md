# markdown-reflink for Atom

An Atom package that helps reference-style links in Markdown documents.

## Shortcuts

- `cmd-k` pops up a modal to put the link url. It automatically labels the links in the document with an integer id which is lower as its link comes ahead. Link urls are written at the bottom of the document as a form of footnotes.
- `cmd-shift-k` reorders and checks numbered reference style links. Dangling link references at the bottom are removed. If there is a link that does not have a corresponding label, a warning will pop up.

## Why we need it?

Long links in raw markdown documents distract the readers indeed. John Gruber himself also mentions about [the readability for the reference-style links][1]:

> The point of reference-style links is not that they’re easier to write. The point is that with reference-style links, your document source is vastly more readable.

For example, see how the long reference link in the paragraph harms its readability.

```
[Reference-style links](http://daringfireball.net/projects/markdown/syntax#link)
use a second set of square brackets, inside which you place a label of your
choosing to identify the link. You can access the raw markdown document for
this page from [here](https://raw.githubusercontent.com/seongjaelee/markdown-reflink/master/README.md).
You can optionally use a space to separate the sets of brackets. Then, anywhere
in the document, you define your link label like this, on a line by itself.
```

Not surprisingly, Markdown syntax already has a solution for this - [reference-style links][1]. By just adding a short label after the linked text and adding the actual link at the end of the document, we can enhance the readability, while still keeping the link in the document.

```
[Reference-style links][1] use a second set of square brackets, inside which
you place a label of your choosing to identify the link. You can access the raw
markdown document for this page from [here][2] You can optionally use a space
to separate the sets of brackets. Then, anywhere in the document, you define
your link label like this, on a line by itself.

[1]: http://daringfireball.net/projects/markdown/syntax#link
[2]: https://raw.githubusercontent.com/seongjaelee/markdown-reflink/master/README.md
```

[1]: http://daringfireball.net/projects/markdown/syntax#link

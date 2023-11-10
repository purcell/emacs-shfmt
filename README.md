[![Melpa Status](http://melpa.org/packages/shfmt-badge.svg)](http://melpa.org/#/shfmt)
[![Melpa Stable Status](http://stable.melpa.org/packages/shfmt-badge.svg)](http://stable.melpa.org/#/shfmt)
[![Build Status](https://github.com/purcell/emacs-shfmt/actions/workflows/test.yml/badge.svg)](https://github.com/purcell/emacs-shfmt/actions/workflows/test.yml)
<a href="https://www.patreon.com/sanityinc"><img alt="Support me" src="https://img.shields.io/badge/Support%20Me-%F0%9F%92%97-ff69b4.svg"></a>

shfmt.el
==============

This Emacs library provides commands and a minor mode for easily reformatting
shell script source code using the [shfmt][shfmt] program.

Installation
=============

If you choose not to use one of the convenient
packages in [MELPA][melpa], you'll need to
add the directory containing `shfmt.el` to your `load-path`, and
then `(require 'shfmt)`.

Usage
=====

Customise the `shfmt-command` variable as desired, then call
`shfmt-buffer` or `shfmt-region` as convenient.

Enable `shfmt-on-save-mode` in Shell Mode buffers like this:

```el
(add-hook 'sh-mode-hook 'shfmt-on-save-mode)
```

or locally to your project with a form in your .dir-locals.el like
this:

```el
((sh-mode
   (mode . shfmt-on-save)))
```

You might like to bind `shfmt` or `shfmt-buffer` to a key,
e.g. with:

```el
(define-key 'sh-mode-map (kbd "C-c C-f") 'shfmt)
```

[melpa]: http://melpa.org
[shfmt]: https://github.com/mvdan/sh

<hr>

[💝 Support this project and my other Open Source work](https://www.patreon.com/sanityinc)

[💼 LinkedIn profile](https://uk.linkedin.com/in/stevepurcell)

[✍ sanityinc.com](http://www.sanityinc.com/)

[🐦 @sanityinc](https://twitter.com/sanityinc)
